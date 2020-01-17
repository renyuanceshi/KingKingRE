package com.pccw.database.entity;

public class AllHistoryTemp {
    private String cached_name;
    private String cached_number_label;
    private String cached_number_type;
    private String chatnumber;
    private String contactnumber;
    private String date;
    private String duration;
    private int type;

    public AllHistoryTemp(String str, int i, String str2, String str3, String str4, String str5, String str6, String str7) {
        this.chatnumber = str;
        this.type = i;
        this.date = str2;
        this.duration = str3;
        this.cached_name = str4;
        this.cached_number_type = str5;
        this.cached_number_label = str6;
        this.contactnumber = str7;
    }

    public String getCached_name() {
        return this.cached_name;
    }

    public String getCached_number_label() {
        return this.cached_number_label;
    }

    public String getCached_number_type() {
        return this.cached_number_type;
    }

    public String getChatnumber() {
        return this.chatnumber;
    }

    public String getContactNumber() {
        return this.contactnumber;
    }

    public String getDate() {
        return this.date;
    }

    public String getDuration() {
        return this.duration;
    }

    public int getType() {
        return this.type;
    }

    public void setCached_name(String str) {
        this.cached_name = str;
    }

    public void setCached_number_label(String str) {
        this.cached_number_label = str;
    }

    public void setCached_number_type(String str) {
        this.cached_number_type = str;
    }

    public void setChatnumber(String str) {
        this.chatnumber = str;
    }

    public void setContactNumber(String str) {
        this.contactnumber = str;
    }

    public void setDate(String str) {
        this.date = str;
    }

    public void setDuration(String str) {
        this.duration = str;
    }

    public void setType(int i) {
        this.type = i;
    }
}
