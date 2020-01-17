package com.pccw.sms.bean;

public class Product {
    String name;

    public Product(String str) {
        this.name = str;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public String toString() {
        return this.name;
    }
}
