package de.timroes.axmlrpc;

import com.facebook.internal.NativeProtocol;
import de.timroes.axmlrpc.serializer.SerializerHandler;
import java.io.InputStream;
import java.util.Map;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Element;

class ResponseParser {
    private static final String FAULT_CODE = "faultCode";
    private static final String FAULT_STRING = "faultString";

    ResponseParser() {
    }

    private Object getReturnValueFromElement(Element element) throws XMLRPCException {
        Element onlyChildElement = XMLUtil.getOnlyChildElement(element.getChildNodes());
        if (!onlyChildElement.getNodeName().equals("value")) {
            throw new XMLRPCException("The param tag must contain a value tag.");
        }
        return SerializerHandler.getDefault().deserialize(XMLUtil.getOnlyChildElement(onlyChildElement.getChildNodes()));
    }

    public Object parse(InputStream inputStream) throws XMLRPCException {
        try {
            Element documentElement = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(inputStream).getDocumentElement();
            if (!documentElement.getNodeName().equals("methodResponse")) {
                throw new XMLRPCException("MethodResponse root tag is missing.");
            }
            Element onlyChildElement = XMLUtil.getOnlyChildElement(documentElement.getChildNodes());
            if (onlyChildElement.getNodeName().equals(NativeProtocol.WEB_DIALOG_PARAMS)) {
                Element onlyChildElement2 = XMLUtil.getOnlyChildElement(onlyChildElement.getChildNodes());
                if (onlyChildElement2.getNodeName().equals("param")) {
                    return getReturnValueFromElement(onlyChildElement2);
                }
                throw new XMLRPCException("The params tag must contain a param tag.");
            } else if (onlyChildElement.getNodeName().equals("fault")) {
                Map map = (Map) getReturnValueFromElement(onlyChildElement);
                throw new XMLRPCServerException((String) map.get(FAULT_STRING), ((Integer) map.get(FAULT_CODE)).intValue());
            } else {
                throw new XMLRPCException("The methodResponse tag must contain a fault or params tag.");
            }
        } catch (Exception e) {
            if (e instanceof XMLRPCServerException) {
                throw ((XMLRPCServerException) e);
            }
            throw new XMLRPCException("Error getting result from server.", e);
        }
    }
}
