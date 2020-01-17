package de.timroes.axmlrpc;

import com.facebook.internal.NativeProtocol;
import de.timroes.axmlrpc.serializer.SerializerHandler;
import de.timroes.axmlrpc.xmlcreator.SimpleXMLCreator;
import de.timroes.axmlrpc.xmlcreator.XmlElement;

public class Call {
    private String method;
    private Object[] params;

    public Call(String str) {
        this(str, (Object[]) null);
    }

    public Call(String str, Object[] objArr) {
        this.method = str;
        this.params = objArr;
    }

    private XmlElement getXMLParam(Object obj) throws XMLRPCException {
        XmlElement xmlElement = new XmlElement("param");
        XmlElement xmlElement2 = new XmlElement("value");
        xmlElement.addChildren(xmlElement2);
        xmlElement2.addChildren(SerializerHandler.getDefault().serialize(obj));
        return xmlElement;
    }

    public String getXML() throws XMLRPCException {
        SimpleXMLCreator simpleXMLCreator = new SimpleXMLCreator();
        XmlElement xmlElement = new XmlElement("methodCall");
        simpleXMLCreator.setRootElement(xmlElement);
        XmlElement xmlElement2 = new XmlElement("methodName");
        xmlElement2.setContent(this.method);
        xmlElement.addChildren(xmlElement2);
        if (this.params != null && this.params.length > 0) {
            XmlElement xmlElement3 = new XmlElement(NativeProtocol.WEB_DIALOG_PARAMS);
            xmlElement.addChildren(xmlElement3);
            for (Object xMLParam : this.params) {
                xmlElement3.addChildren(getXMLParam(xMLParam));
            }
        }
        return simpleXMLCreator.toString();
    }
}
