package com.pccw.asynctask.result;

import com.pccw.mobile.server.response.SendSMSResponse;

public class SendSMSAsyncResult {
    public int messageId;
    public SendSMSResponse resp;

    public SendSMSAsyncResult(SendSMSResponse sendSMSResponse, int i) {
        this.resp = sendSMSResponse;
        this.messageId = i;
    }

    public int getMessageId() {
        return this.messageId;
    }

    public SendSMSResponse getResp() {
        return this.resp;
    }

    public void setMessageId(int i) {
        this.messageId = i;
    }

    public void setResp(SendSMSResponse sendSMSResponse) {
        this.resp = sendSMSResponse;
    }
}
