package de.timroes.axmlrpc.serializer;

import de.timroes.axmlrpc.XMLRPCException;
import de.timroes.axmlrpc.XMLRPCRuntimeException;
import de.timroes.axmlrpc.XMLUtil;
import de.timroes.axmlrpc.xmlcreator.XmlElement;
import java.util.ArrayList;
import org.w3c.dom.Element;

public class ArraySerializer implements Serializer {
    private static final String ARRAY_DATA = "data";
    private static final String ARRAY_VALUE = "value";

    public Object deserialize(Element element) throws XMLRPCException {
        ArrayList arrayList = new ArrayList();
        Element onlyChildElement = XMLUtil.getOnlyChildElement(element.getChildNodes());
        if (!"data".equals(onlyChildElement.getNodeName())) {
            throw new XMLRPCException("The array must contain one data tag.");
        }
        for (int i = 0; i < onlyChildElement.getChildNodes().getLength(); i++) {
            Element onlyChildElement2 = XMLUtil.getOnlyChildElement(onlyChildElement.getChildNodes().item(i).getChildNodes());
            if (onlyChildElement2 != null && ((onlyChildElement2.getNodeType() != 3 || onlyChildElement2.getNodeValue().trim().length() > 0) && onlyChildElement2.getNodeType() != 8)) {
                if (onlyChildElement2.getNodeType() != 1) {
                    throw new XMLRPCException("An array can only contain value tags.");
                }
                arrayList.add(SerializerHandler.getDefault().deserialize(onlyChildElement2));
            }
        }
        return arrayList.toArray();
    }

    public XmlElement serialize(Object obj) {
        Object[] objArr = (Object[]) obj;
        XmlElement xmlElement = new XmlElement(SerializerHandler.TYPE_ARRAY);
        XmlElement xmlElement2 = new XmlElement("data");
        xmlElement.addChildren(xmlElement2);
        try {
            for (Object obj2 : objArr) {
                XmlElement xmlElement3 = new XmlElement(ARRAY_VALUE);
                xmlElement3.addChildren(SerializerHandler.getDefault().serialize(obj2));
                xmlElement2.addChildren(xmlElement3);
            }
            return xmlElement;
        } catch (XMLRPCException e) {
            throw new XMLRPCRuntimeException((Exception) e);
        }
    }
}
