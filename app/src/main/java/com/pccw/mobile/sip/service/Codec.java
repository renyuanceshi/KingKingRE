package com.pccw.mobile.sip.service;

public class Codec {
    public String codecName;
    public int key;
    public int rate;

    public Codec(String str, int i, int i2) {
        this.codecName = str;
        this.rate = i;
        this.key = i2;
    }
}
