package com.pccw.mobile.sip;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class CheckVersionXmlHandler extends DefaultHandler {
    public CheckVersionResponse res = new CheckVersionResponse();
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
            } else if ("app_version".equals(str2)) {
                this.res.app_version = this.sb.toString().trim();
            } else if ("app_link".equals(str2)) {
                this.res.app_link = this.sb.toString().trim();
            } else if ("TandC_version".equals(str2)) {
                this.res.t_and_c_version = this.sb.toString().trim();
            } else if ("TandC_URL_C".equals(str2)) {
                this.res.t_and_c_url_c = this.sb.toString().trim();
            } else if ("TandC_URL_E".equals(str2)) {
                this.res.t_and_c_url_e = this.sb.toString().trim();
            } else if ("TandC_version_prepaid".equals(str2)) {
                this.res.t_and_c_version_prepaid = this.sb.toString().trim();
            } else if ("TandC_URL_C_prepaid".equals(str2)) {
                this.res.t_and_c_url_c_prepaid = this.sb.toString().trim();
            } else if ("TandC_URL_E_prepaid".equals(str2)) {
                this.res.t_and_c_url_e_prepaid = this.sb.toString().trim();
            } else if ("TandC_version_one2free".equals(str2)) {
                this.res.t_and_c_version_one2free = this.sb.toString().trim();
            } else if ("TandC_URL_C_one2free".equals(str2)) {
                this.res.t_and_c_url_c_one2free = this.sb.toString().trim();
            } else if ("TandC_URL_E_one2free".equals(str2)) {
                this.res.t_and_c_url_e_one2free = this.sb.toString().trim();
            } else if ("TandC_version_1010".equals(str2)) {
                this.res.t_and_c_version_1010 = this.sb.toString().trim();
            } else if ("TandC_URL_C_1010".equals(str2)) {
                this.res.t_and_c_url_c_1010 = this.sb.toString().trim();
            } else if ("TandC_URL_E_1010".equals(str2)) {
                this.res.t_and_c_url_e_1010 = this.sb.toString().trim();
            } else if ("TandC_version_csl_prepaid".equals(str2)) {
                this.res.t_and_c_version_csl_prepaid = this.sb.toString().trim();
            } else if ("TandC_URL_C_csl_prepaid".equals(str2)) {
                this.res.t_and_c_url_c_csl_prepaid = this.sb.toString().trim();
            } else if ("TandC_URL_E_csl_prepaid".equals(str2)) {
                this.res.t_and_c_url_e_csl_prepaid = this.sb.toString().trim();
            } else if ("Msg_version".equals(str2)) {
                this.res.msg_version = this.sb.toString().trim();
            } else if ("Msg_version_one2free".equals(str2)) {
                this.res.msg_version_one2free = this.sb.toString().trim();
            } else if ("Msg_version_1010".equals(str2)) {
                this.res.msg_version_1010 = this.sb.toString().trim();
            } else if ("Msg_version_csl_prepaid".equals(str2)) {
                this.res.msg_version_csl_prepaid = this.sb.toString().trim();
            } else if ("Msg_URL".equals(str2)) {
                this.res.msg_url = this.sb.toString().trim();
            } else if ("Msg_URL_one2free".equals(str2)) {
                this.res.msg_url_one2free = this.sb.toString().trim();
            } else if ("Msg_URL_1010".equals(str2)) {
                this.res.msg_url_1010 = this.sb.toString().trim();
            } else if ("Msg_URL_csl_prepaid".equals(str2)) {
                this.res.msg_url_csl_prepaid = this.sb.toString().trim();
            } else if ("message".equals(str2)) {
                this.res.message = this.sb.toString().trim();
            }
            this.sb = null;
        }
    }

    public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
        super.startElement(str, str2, str3, attributes);
    }
}
