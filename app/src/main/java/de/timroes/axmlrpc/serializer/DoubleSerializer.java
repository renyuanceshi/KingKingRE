package de.timroes.axmlrpc.serializer;

import de.timroes.axmlrpc.XMLRPCException;
import de.timroes.axmlrpc.XMLUtil;
import de.timroes.axmlrpc.xmlcreator.XmlElement;
import java.text.DecimalFormat;
import org.w3c.dom.Element;

public class DoubleSerializer implements Serializer {
    public Object deserialize(Element element) throws XMLRPCException {
        return Double.valueOf(Double.parseDouble(XMLUtil.getOnlyTextContent(element.getChildNodes())));
    }

    public XmlElement serialize(Object obj) {
        return XMLUtil.makeXmlTag(SerializerHandler.TYPE_DOUBLE, new DecimalFormat("#0.0#").format(((Double) obj).doubleValue()));
    }
}
