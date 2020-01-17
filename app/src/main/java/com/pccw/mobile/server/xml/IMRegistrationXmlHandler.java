package com.pccw.mobile.server.xml;

import com.pccw.mobile.server.response.IMRegistrationResponse;
import org.apache.http.cookie.ClientCookie;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

public class IMRegistrationXmlHandler extends ApiXmlDefaultHandler {
    private IMRegistrationResponse resp = new IMRegistrationResponse();
    private StringBuilder sb;

    public void characters(char[] cArr, int i, int i2) throws SAXException {
        if (this.sb == null) {
            this.sb = new StringBuilder(20);
        }
        this.sb.append(cArr, i, i2);
    }

    public void endDocument() throws SAXException {
        setResponse(this.resp);
        super.endDocument();
    }

    public void endElement(String str, String str2, String str3) throws SAXException {
        if (this.sb != null) {
            if ("resultCode".equals(str2)) {
                this.resp.resultCode = this.sb.toString().trim();
            } else if ("resultDescription".equals(str2)) {
                this.resp.resultDescription = this.sb.toString().trim();
            } else if ("loginID".equals(str2)) {
                this.resp.loginID = this.sb.toString().trim();
            } else if ("password".equals(str2)) {
                this.resp.password = this.sb.toString().trim();
            } else if ("host".equals(str2)) {
                this.resp.host = this.sb.toString().trim();
            } else if (ClientCookie.PORT_ATTR.equals(str2)) {
                this.resp.port = this.sb.toString().trim();
            } else if ("xmppDomain".equals(str2)) {
                this.resp.xmppDomain = this.sb.toString().trim();
            }
            this.sb = null;
        }
    }

    public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
        super.startElement(str, str2, str3, attributes);
    }
}
