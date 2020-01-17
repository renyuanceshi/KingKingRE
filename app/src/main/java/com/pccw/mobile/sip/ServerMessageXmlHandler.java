package com.pccw.mobile.sip;

import java.util.HashMap;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class ServerMessageXmlHandler extends DefaultHandler {
    private String currentCode = null;
    private String currentType = null;
    private HashMap<String, HashMap<String, HashMap<Integer, String>>> messageList = null;
    private StringBuilder sb;

    public ServerMessageXmlHandler(HashMap<String, HashMap<String, HashMap<Integer, String>>> hashMap) {
        this.messageList = hashMap;
    }

    public void characters(char[] cArr, int i, int i2) throws SAXException {
        if (this.sb == null) {
            this.sb = new StringBuilder(20);
        }
        this.sb.append(cArr, i, i2);
    }

    public void endElement(String str, String str2, String str3) throws SAXException {
        int i;
        if (this.sb != null && this.currentType != null && this.currentCode != null) {
            if (str2.equals(ServerMessageController.TAG_MESSAGE_EN)) {
                i = 0;
            } else if (str2.equals(ServerMessageController.TAG_MESSAGE_CH)) {
                i = 1;
            } else {
                return;
            }
            if (!this.messageList.containsKey(this.currentType)) {
                this.messageList.put(this.currentType, new HashMap());
            }
            HashMap hashMap = this.messageList.get(this.currentType);
            if (!hashMap.containsKey(this.currentCode)) {
                hashMap.put(this.currentCode, new HashMap());
            }
            HashMap hashMap2 = (HashMap) hashMap.get(this.currentCode);
            if (!hashMap2.containsKey(Integer.valueOf(i))) {
                hashMap2.put(Integer.valueOf(i), this.sb.toString().trim());
            }
            this.sb = null;
        }
    }

    public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
        if (str2.equals(ServerMessageController.TAG_RESPONSE) && attributes != null) {
            int length = attributes.getLength();
            for (int i = 0; i < length; i++) {
                String localName = attributes.getLocalName(i);
                String value = attributes.getValue(i);
                if (localName.equals(ServerMessageController.ATTR_RESPONSE_FUNCTION)) {
                    this.currentType = value;
                } else if (localName.equals(ServerMessageController.ATTR_RESPONSE_RESULTCODE)) {
                    this.currentCode = value;
                }
            }
        }
        this.sb = null;
    }
}
