package com.pccw.sms.bean;

import java.io.Serializable;

public class Emojicon implements Serializable {
    private static final long serialVersionUID = 1;
    private String emoji;
    private char icon_char;
    private int icon_unicode;

    private Emojicon() {
    }

    public Emojicon(String str) {
        this.emoji = str;
    }

    public static Emojicon fromChar(char c) {
        Emojicon emojicon = new Emojicon();
        emojicon.emoji = Character.toString(c);
        return emojicon;
    }

    public static Emojicon fromChars(String str) {
        Emojicon emojicon = new Emojicon();
        emojicon.emoji = str;
        return emojicon;
    }

    public static Emojicon fromCodePoint(int i) {
        Emojicon emojicon = new Emojicon();
        emojicon.emoji = newString(i);
        return emojicon;
    }

    public static Emojicon fromResource(int i, int i2) {
        Emojicon emojicon = new Emojicon();
        emojicon.icon_unicode = i;
        emojicon.icon_char = (char) ((char) i2);
        return emojicon;
    }

    public static final String newString(int i) {
        return Character.charCount(i) == 1 ? String.valueOf(i) : new String(Character.toChars(i));
    }

    public String getEmoji() {
        return this.emoji;
    }

    public int getIcon() {
        return this.icon_unicode;
    }

    public char getValue() {
        return this.icon_char;
    }
}
