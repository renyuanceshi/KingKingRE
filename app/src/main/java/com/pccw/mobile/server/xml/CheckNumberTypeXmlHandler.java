package com.pccw.mobile.server.xml;

import com.pccw.mobile.server.response.CheckNumberTypeResponse;
import com.pccw.mobile.sip.ServerMessageController;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

public class CheckNumberTypeXmlHandler extends ApiXmlDefaultHandler {
    CheckNumberTypeResponse resp = new CheckNumberTypeResponse();
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
            } else if ("simType".equals(str2)) {
                this.resp.simType = this.sb.toString().trim();
            } else if ("operator".equals(str2)) {
                this.resp.operator = this.sb.toString().trim();
            } else if ("brand".equals(str2)) {
                this.resp.brand = this.sb.toString().trim();
            } else if ("class".equals(str2)) {
                this.resp.simClass = this.sb.toString().trim();
            } else if ("status".equals(str2)) {
                this.resp.status = this.sb.toString().trim();
            } else if ("allow_kk".equals(str2)) {
                this.resp.allowkk = this.sb.toString().trim();
            } else if ("allow_RS".equals(str2)) {
                this.resp.allowRS = this.sb.toString().trim();
            } else if ("message".equals(str2)) {
                this.resp.message = this.sb.toString().trim();
            } else if ("allow_IDD".equals(str2)) {
                this.resp.allow_IDD = this.sb.toString().trim();
            } else if ("isFreeTrialNum".equals(str2)) {
                this.resp.isFreeTrial = this.sb.toString().trim();
            } else if ("registeredFreeTrial".equals(str2)) {
                this.resp.registeredFreeTrial = this.sb.toString().trim();
            } else if ("freeTrialVirtualNum".equals(str2)) {
                this.resp.freeTrialVirtualNum = this.sb.toString().trim();
            } else if ("freeTrialVirtualNumStatus".equals(str2)) {
                this.resp.freeTrialNumberStatus = this.sb.toString().trim();
            } else if ("freeTrialPromotionStatus".equals(str2)) {
                this.resp.freeTrialPromotionStatus = this.sb.toString().trim();
            } else if ("freeTrialRegistrationURL_en".equals(str2)) {
                this.resp.freeTrialUrl_en = this.sb.toString().trim();
            } else if ("purchaseNumberURL_en".equals(str2)) {
                this.resp.purchaseUrl_en = this.sb.toString().trim();
            } else if ("freeTrialRegistrationURL_ch".equals(str2)) {
                this.resp.freeTrialUrl_ch = this.sb.toString().trim();
            } else if ("purchaseNumberURL_ch".equals(str2)) {
                this.resp.purchaseUrl_ch = this.sb.toString().trim();
            } else if ("purchasedVirtualNumber".equals(str2)) {
                this.resp.purchasedVirtualNumber = this.sb.toString().trim();
            }
            this.sb = null;
            setResponse(this.resp);
        }
    }

    public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
        super.startElement(str, str2, str3, attributes);
    }
}
