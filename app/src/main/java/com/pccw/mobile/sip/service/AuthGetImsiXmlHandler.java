package com.pccw.mobile.sip.service;

import com.pccw.mobile.sip.ServerMessageController;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class AuthGetImsiXmlHandler extends DefaultHandler {
    public AuthGetImsiResponse res = new AuthGetImsiResponse();
    private StringBuilder sb;

    public void characters(char[] cArr, int i, int i2) throws SAXException {
        if (this.sb == null) {
            this.sb = new StringBuilder(20);
        }
        this.sb.append(cArr, i, i2);
    }

    public void endElement(String str, String str2, String str3) throws SAXException {
        if (this.sb != null) {
            if (ServerMessageController.ATTR_RESPONSE_RESULTCODE.equals(str2)) {
                this.res.resultcode = this.sb.toString().trim();
            } else if ("message".equals(str2)) {
                this.res.message = this.sb.toString().trim();
            } else if ("encryptedimsi".equals(str2)) {
                this.res.encryptedImsi = this.sb.toString().trim();
            }
            this.sb = null;
        }
    }

    public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
        super.startElement(str, str2, str3, attributes);
    }
}
