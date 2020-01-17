package de.timroes.axmlrpc.serializer;

import de.timroes.axmlrpc.XMLRPCException;
import de.timroes.axmlrpc.XMLRPCRuntimeException;
import de.timroes.axmlrpc.xmlcreator.XmlElement;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import org.w3c.dom.Element;

public class SerializerHandler {
    public static final String TYPE_ARRAY = "array";
    public static final String TYPE_BASE64 = "base64";
    public static final String TYPE_BOOLEAN = "boolean";
    public static final String TYPE_DATETIME = "dateTime.iso8601";
    public static final String TYPE_DOUBLE = "double";
    public static final String TYPE_INT = "int";
    public static final String TYPE_INT2 = "i4";
    public static final String TYPE_LONG = "i8";
    public static final String TYPE_NULL = "nil";
    public static final String TYPE_STRING = "string";
    public static final String TYPE_STRUCT = "struct";
    private static SerializerHandler instance;
    private ArraySerializer array = new ArraySerializer();
    private Base64Serializer base64 = new Base64Serializer();
    private BooleanSerializer bool = new BooleanSerializer();
    private DateTimeSerializer datetime = new DateTimeSerializer();
    private int flags;
    private DoubleSerializer floating = new DoubleSerializer();
    private IntSerializer integer = new IntSerializer();
    private LongSerializer long8 = new LongSerializer();
    private NullSerializer nil = new NullSerializer();
    private StringSerializer string = new StringSerializer();
    private StructSerializer struct = new StructSerializer();

    private SerializerHandler(int i) {
        this.flags = i;
    }

    public static SerializerHandler getDefault() {
        if (instance != null) {
            return instance;
        }
        throw new XMLRPCRuntimeException("The SerializerHandler has not been initialized.");
    }

    public static void initialize(int i) {
        instance = new SerializerHandler(i);
    }

    public Object deserialize(Element element) throws XMLRPCException {
        Serializer serializer;
        String nodeName = element.getNodeName();
        if ((this.flags & 8) != 0 && TYPE_NULL.equals(nodeName)) {
            serializer = this.nil;
        } else if (TYPE_STRING.equals(nodeName)) {
            serializer = this.string;
        } else if (TYPE_BOOLEAN.equals(nodeName)) {
            serializer = this.bool;
        } else if (TYPE_DOUBLE.equals(nodeName)) {
            serializer = this.floating;
        } else if (TYPE_INT.equals(nodeName) || TYPE_INT2.equals(nodeName)) {
            serializer = this.integer;
        } else if (TYPE_DATETIME.equals(nodeName)) {
            serializer = this.datetime;
        } else if (TYPE_LONG.equals(nodeName)) {
            if ((this.flags & 2) != 0) {
                serializer = this.long8;
            } else {
                throw new XMLRPCException("8 byte integer is not in the specification. You must use FLAGS_8BYTE_INT to enable the i8 tag.");
            }
        } else if (TYPE_STRUCT.equals(nodeName)) {
            serializer = this.struct;
        } else if (TYPE_ARRAY.equals(nodeName)) {
            serializer = this.array;
        } else if (TYPE_BASE64.equals(nodeName)) {
            serializer = this.base64;
        } else {
            throw new XMLRPCException("No deserializer found for type '" + nodeName + "'.");
        }
        return serializer.deserialize(element);
    }

    public XmlElement serialize(Object obj) throws XMLRPCException {
        Serializer serializer;
        if ((this.flags & 8) != 0 && obj == null) {
            serializer = this.nil;
        } else if (obj instanceof String) {
            serializer = this.string;
        } else if (obj instanceof Boolean) {
            serializer = this.bool;
        } else if ((obj instanceof Double) || (obj instanceof Float)) {
            serializer = this.floating;
        } else if ((obj instanceof Integer) || (obj instanceof Short) || (obj instanceof Byte)) {
            serializer = this.integer;
        } else if (obj instanceof Long) {
            if ((this.flags & 2) != 0) {
                serializer = this.long8;
            } else {
                long longValue = ((Long) obj).longValue();
                if (longValue > 2147483647L || longValue < -2147483648L) {
                    throw new XMLRPCException("FLAGS_8BYTE_INT must be set, if values outside the 4 byte integer range should be transfered.");
                }
                serializer = this.integer;
            }
        } else if (obj instanceof Date) {
            serializer = this.datetime;
        } else if (obj instanceof Calendar) {
            obj = ((Calendar) obj).getTime();
            serializer = this.datetime;
        } else if (obj instanceof Map) {
            serializer = this.struct;
        } else if (obj instanceof Object[]) {
            serializer = this.array;
        } else if (obj instanceof byte[]) {
            byte[] bArr = (byte[]) obj;
            Byte[] bArr2 = new Byte[bArr.length];
            for (int i = 0; i < bArr2.length; i++) {
                bArr2[i] = new Byte(bArr[i]);
            }
            serializer = this.base64;
            obj = bArr2;
        } else if (obj instanceof Byte[]) {
            serializer = this.base64;
        } else {
            throw new XMLRPCException("No serializer found for type '" + obj.getClass().getName() + "'.");
        }
        return serializer.serialize(obj);
    }
}
