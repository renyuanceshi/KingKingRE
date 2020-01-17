package com.pccw.mobile.server.response;

import com.pccw.mobile.server.api.ApiResponse;

public class SendSMSResponse extends ApiResponse {
    public String message = "";
    public String resultCode = "";
    public String serverMessageId = "";

    public String getMessage() {
        return this.message;
    }

    public String getResultCode() {
        return this.resultCode;
    }

    public String getServerMessageId() {
        return this.serverMessageId;
    }

    public void setMessage(String str) {
        this.message = str;
    }

    public void setResultCode(String str) {
        this.resultCode = str;
    }

    public void setServerMessageId(String str) {
        this.serverMessageId = str;
    }
}
