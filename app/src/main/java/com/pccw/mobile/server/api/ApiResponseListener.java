package com.pccw.mobile.server.api;

public interface ApiResponseListener {
    void onResponseFailed();

    void onResponseSuccess(ApiResponse apiResponse);
}
