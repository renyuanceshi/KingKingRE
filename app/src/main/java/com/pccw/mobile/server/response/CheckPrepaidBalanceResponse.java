package com.pccw.mobile.server.response;

import com.pccw.mobile.server.api.ApiResponse;

public class CheckPrepaidBalanceResponse extends ApiResponse {
    public String balance = "";
    public String current_date_time = "";
    public String lower_than_threshold = "";
    public String resultcode = "";
}
