package de.timroes.axmlrpc.serializer;

import de.timroes.axmlrpc.XMLRPCException;
import de.timroes.axmlrpc.XMLRPCRuntimeException;
import de.timroes.axmlrpc.XMLUtil;
import de.timroes.axmlrpc.xmlcreator.XmlElement;
import java.util.HashMap;
import java.util.Map;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

public class StructSerializer implements Serializer {
    private static final String STRUCT_MEMBER = "member";
    private static final String STRUCT_NAME = "name";
    private static final String STRUCT_VALUE = "value";

    public Object deserialize(Element element) throws XMLRPCException {
        HashMap hashMap = new HashMap();
        for (int i = 0; i < element.getChildNodes().getLength(); i++) {
            Node item = element.getChildNodes().item(i);
            if ((item.getNodeType() != 3 || item.getNodeValue().trim().length() > 0) && item.getNodeType() != 8) {
                if (item.getNodeType() != 1 || !STRUCT_MEMBER.equals(item.getNodeName())) {
                    throw new XMLRPCException("Only struct members allowed within a struct.");
                }
                Object obj = null;
                String str = null;
                for (int i2 = 0; i2 < item.getChildNodes().getLength(); i2++) {
                    Node item2 = item.getChildNodes().item(i2);
                    if ((item2.getNodeType() != 3 || item2.getNodeValue().trim().length() > 0) && item2.getNodeType() != 8) {
                        if ("name".equals(item2.getNodeName())) {
                            if (str != null) {
                                throw new XMLRPCException("Name of a struct member cannot be set twice.");
                            }
                            str = XMLUtil.getOnlyTextContent(item2.getChildNodes());
                        } else if (!STRUCT_VALUE.equals(item2.getNodeName())) {
                            throw new XMLRPCException("A struct member must only contain one name and one value.");
                        } else if (obj != null) {
                            throw new XMLRPCException("Value of a struct member cannot be set twice.");
                        } else {
                            obj = SerializerHandler.getDefault().deserialize(XMLUtil.getOnlyChildElement(item2.getChildNodes()));
                        }
                    }
                }
                hashMap.put(str, obj);
            }
        }
        return hashMap;
    }

    public XmlElement serialize(Object obj) {
        XmlElement xmlElement = new XmlElement(SerializerHandler.TYPE_STRUCT);
        try {
            for (Map.Entry entry : ((Map) obj).entrySet()) {
                XmlElement xmlElement2 = new XmlElement(STRUCT_MEMBER);
                XmlElement xmlElement3 = new XmlElement("name");
                XmlElement xmlElement4 = new XmlElement(STRUCT_VALUE);
                xmlElement3.addChildren(SerializerHandler.getDefault().serialize(entry.getKey()));
                xmlElement4.addChildren(SerializerHandler.getDefault().serialize(entry.getValue()));
                xmlElement2.addChildren(xmlElement3);
                xmlElement2.addChildren(xmlElement4);
                xmlElement.addChildren(xmlElement2);
            }
            return xmlElement;
        } catch (XMLRPCException e) {
            throw new XMLRPCRuntimeException((Exception) e);
        }
    }
}
