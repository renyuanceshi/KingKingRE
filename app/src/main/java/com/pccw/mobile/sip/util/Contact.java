package com.pccw.mobile.sip.util;

import android.graphics.drawable.Drawable;

public class Contact {
    public String displayName;
    public String label;
    public Drawable photo;

    public Contact(String str, Drawable drawable, String str2) {
        this.displayName = str;
        this.photo = drawable;
        this.label = str2;
    }
}
