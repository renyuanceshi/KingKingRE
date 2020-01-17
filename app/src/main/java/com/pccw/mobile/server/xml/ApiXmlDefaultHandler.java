package com.pccw.mobile.server.xml;

import com.pccw.mobile.server.api.ApiResponse;
import org.xml.sax.helpers.DefaultHandler;

public abstract class ApiXmlDefaultHandler extends DefaultHandler {
    protected ApiResponse resp;

    public ApiResponse getResponse() {
        return this.resp;
    }

    public void setResponse(ApiResponse apiResponse) {
        this.resp = apiResponse;
    }
}
