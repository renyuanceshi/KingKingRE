package org.linphone.core;

public class DialPlanImpl implements DialPlan {
    private final String countryCallingCode;
    private final String countryCode;
    private final String countryName;
    private final int numberLength;
    private final String usualPrefix;

    public DialPlanImpl(String str, String str2, String str3, int i, String str4) {
        this.countryName = str;
        this.countryCode = str2;
        this.countryCallingCode = str3;
        this.numberLength = i;
        this.usualPrefix = str4;
    }

    public final String getCountryCallingCode() {
        return this.countryCallingCode;
    }

    public final String getCountryCode() {
        return this.countryCode;
    }

    public final String getCountryName() {
        return this.countryName;
    }

    public final int getNumberLength() {
        return this.numberLength;
    }

    public final String getUsualPrefix() {
        return this.usualPrefix;
    }
}
