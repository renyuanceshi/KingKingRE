package com.pccw.mobile.sip;

import java.util.ArrayList;
import java.util.List;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetSMSTypeXmlHandler extends DefaultHandler {
    public String msisdn = "";
    public String resultCode = "";
    private StringBuilder sb;
    public List<SMSType> typeList = new ArrayList();

    public void characters(char[] cArr, int i, int i2) throws SAXException {
        if (this.sb == null) {
            this.sb = new StringBuilder(20);
        }
        this.sb.append(cArr, i, i2);
    }

    public void endElement(String str, String str2, String str3) throws SAXException {
        if (this.sb != null) {
            if (ServerMessageController.ATTR_RESPONSE_RESULTCODE.equals(str2)) {
                this.resultCode = this.sb.toString().trim();
            } else if ("msisdn".equals(str2)) {
                this.msisdn = this.sb.toString().trim();
            } else if ("type".equals(str2)) {
                SMSType sMSType = new SMSType();
                sMSType.msisdn = this.msisdn;
                sMSType.type = this.sb.toString().trim();
                this.typeList.add(sMSType);
            }
            this.sb = null;
        }
    }

    public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
        super.startElement(str, str2, str3, attributes);
    }
}
