package com.pccw.mobile.server.xml;

import com.pccw.mobile.server.response.CheckPrepaidBalanceResponse;
import com.pccw.mobile.sip.ServerMessageController;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

public class CheckPrepaidBalanceXmlHandler extends ApiXmlDefaultHandler {
    private CheckPrepaidBalanceResponse resp = new CheckPrepaidBalanceResponse();
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
            if (ServerMessageController.ATTR_RESPONSE_RESULTCODE.equals(str2)) {
                this.resp.resultcode = this.sb.toString().trim();
            } else if ("balance".equals(str2)) {
                this.resp.balance = this.sb.toString().trim();
            } else if ("lower_than_threshold".equals(str2)) {
                this.resp.lower_than_threshold = this.sb.toString().trim();
            } else if ("current_date_time".equals(str2)) {
                this.resp.current_date_time = this.sb.toString().trim();
            }
            this.sb = null;
            setResponse(this.resp);
        }
    }

    public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
        super.startElement(str, str2, str3, attributes);
    }
}
