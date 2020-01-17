package com.pccw.mobile.sip;

import com.facebook.share.internal.ShareConstants;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class FacebookShareXmlHandler extends DefaultHandler {
    private FacebookShareXmlResponse res = new FacebookShareXmlResponse();
    private StringBuilder sb;

    public void characters(char[] cArr, int i, int i2) throws SAXException {
        if (this.sb == null) {
            this.sb = new StringBuilder(20);
        }
        this.sb.append(cArr, i, i2);
    }

    public void endElement(String str, String str2, String str3) throws SAXException {
        if (this.sb != null) {
            if (ShareConstants.WEB_DIALOG_PARAM_TITLE.equals(str2)) {
                this.res.title = this.sb.toString().trim();
            } else if (ShareConstants.FEED_CAPTION_PARAM.equals(str2)) {
                this.res.caption = this.sb.toString().trim();
            } else if ("description".equals(str2)) {
                this.res.description = this.sb.toString().trim();
            } else if ("url".equals(str2)) {
                this.res.url = this.sb.toString().trim();
            } else if ("imageurl".equals(str2)) {
                this.res.imageurl = this.sb.toString().trim();
            } else if ("dayDiff".equals(str2)) {
                this.res.dayDiff = this.sb.toString().trim();
            }
            this.sb = null;
        }
    }

    public FacebookShareXmlResponse response() {
        return this.res;
    }

    public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
        super.startElement(str, str2, str3, attributes);
    }
}
