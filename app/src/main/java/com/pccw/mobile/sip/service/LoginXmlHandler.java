package com.pccw.mobile.sip.service;

import com.pccw.mobile.sip.ServerMessageController;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class LoginXmlHandler extends DefaultHandler {
    public LoginResponse res = new LoginResponse();
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
            } else if ("sip_domain".equals(str2)) {
                this.res.sip_domain = this.sb.toString().trim();
            } else if ("sip_server".equals(str2)) {
                this.res.sip_server = this.sb.toString().trim();
            } else if ("sip_port".equals(str2)) {
                this.res.sip_port = this.sb.toString().trim();
            } else if ("pwd".equals(str2)) {
                this.res.pwd = this.sb.toString().trim();
            } else if ("message".equals(str2)) {
                this.res.message = this.sb.toString().trim();
            } else if ("sip_number".equals(str2)) {
                this.res.sip_number = this.sb.toString().trim();
            } else if ("session_id".equals(str2)) {
                this.res.session_id = this.sb.toString().trim();
            } else if ("sip_server_ilbc".equals(str2)) {
                this.res.sip_server_ilbc = this.sb.toString().trim();
            } else if ("sip_port_ilbc".equals(str2)) {
                this.res.sip_port_ilbc = this.sb.toString().trim();
            } else if ("sip_tunnel_enable".equals(str2)) {
                this.res.tunnel_enable = "true".equals(this.sb.toString().trim());
            } else if ("sip_tunnel_server_1".equals(str2)) {
                this.res.tunnel_host_1 = this.sb.toString().trim();
            } else if ("sip_tunnel_server_2".equals(str2)) {
                this.res.tunnel_host_2 = this.sb.toString().trim();
            } else if ("dn".equals(str2)) {
                this.res.dn = this.sb.toString().trim();
            } else if ("is_HK".equals(str2)) {
                this.res.is_hk = "true".equals(this.sb.toString().trim());
            } else if ("echo_server".equals(str2)) {
                this.res.echo_server = this.sb.toString().trim();
            } else if ("is_daypass_sub".equals(str2)) {
                this.res.is_daypass_sub = "true".equals(this.sb.toString().trim());
            }
            this.sb = null;
        }
    }

    public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
        super.startElement(str, str2, str3, attributes);
    }
}
