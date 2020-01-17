package com.pccw.mobile.server.xml;

import com.pccw.mobile.server.entity.SMSDeliveryStatus;
import com.pccw.mobile.server.response.CheckSMSDeliveryStatusResponse;
import com.pccw.mobile.sip.ServerMessageController;
import java.util.ArrayList;
import java.util.List;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

public class CheckSMSDeliveryStatusXmlHandler extends ApiXmlDefaultHandler {
    boolean bMsgId = false;
    boolean bResultCode = false;
    boolean bStatus = false;
    private CheckSMSDeliveryStatusResponse resp;
    private SMSDeliveryStatus status;
    private List<SMSDeliveryStatus> statusList;

    public void characters(char[] cArr, int i, int i2) throws SAXException {
        if (this.bResultCode) {
            this.resp.setResultcode(new String(cArr, i, i2));
            this.bResultCode = false;
        } else if (this.bMsgId) {
            this.status.setMessageId(new String(cArr, i, i2));
            this.bMsgId = false;
        } else if (this.bStatus) {
            this.status.setStatus(new String(cArr, i, i2));
            this.bStatus = false;
        }
    }

    public void endDocument() throws SAXException {
        this.resp.setStatusList(this.statusList);
        setResponse(this.resp);
        super.endDocument();
    }

    public void endElement(String str, String str2, String str3) throws SAXException {
        if (str3.equalsIgnoreCase("msg")) {
            this.statusList.add(this.status);
        }
    }

    public void startDocument() throws SAXException {
        this.resp = new CheckSMSDeliveryStatusResponse();
        this.status = new SMSDeliveryStatus();
        this.statusList = new ArrayList();
        super.startDocument();
    }

    public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
        if (str3.equalsIgnoreCase(ServerMessageController.ATTR_RESPONSE_RESULTCODE)) {
            this.bResultCode = true;
        } else if (str3.equalsIgnoreCase("msg")) {
            this.status = new SMSDeliveryStatus();
        } else if (str3.equalsIgnoreCase("msgid")) {
            this.bMsgId = true;
        } else if (str3.equalsIgnoreCase("status")) {
            this.bStatus = true;
        }
    }
}
