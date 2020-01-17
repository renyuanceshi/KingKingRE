package de.timroes.axmlrpc;

import de.timroes.axmlrpc.xmlcreator.XmlElement;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMLUtil {
    public static Element getOnlyChildElement(NodeList nodeList) throws XMLRPCException {
        Element element = null;
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= nodeList.getLength()) {
                return element;
            }
            Node item = nodeList.item(i2);
            if ((item.getNodeType() != 3 || item.getNodeValue().trim().length() > 0) && item.getNodeType() != 8) {
                if (item.getNodeType() != 1) {
                    throw new XMLRPCException("Only element nodes allowed.");
                } else if (element != null) {
                    throw new XMLRPCException("Element has more than one children.");
                } else {
                    element = (Element) item;
                }
            }
            i = i2 + 1;
        }
    }

    public static String getOnlyTextContent(NodeList nodeList) throws XMLRPCException {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < nodeList.getLength(); i++) {
            Node item = nodeList.item(i);
            if (item.getNodeType() != 8) {
                if (item.getNodeType() != 3) {
                    throw new XMLRPCException("Element must contain only text elements.");
                }
                sb.append(item.getNodeValue());
            }
        }
        return sb.toString();
    }

    public static XmlElement makeXmlTag(String str, String str2) {
        XmlElement xmlElement = new XmlElement(str);
        xmlElement.setContent(str2);
        return xmlElement;
    }
}
