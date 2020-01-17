package org.linphone.core;

import com.facebook.internal.AnalyticsEvents;
import java.util.Vector;

public class Reason {
    public static Reason AddressIncomplete = new Reason(16, "AddressIncomplete");
    public static Reason BadCredentials = new Reason(2, "BadCredentials");
    public static Reason BadGateway = new Reason(18, "BadGateway");
    public static Reason Busy = new Reason(6, "Busy");
    public static Reason Declined = new Reason(3, "Declined");
    public static Reason DoNotDisturb = new Reason(9, "DoNotDisturb");
    public static Reason Gone = new Reason(14, "Gone");
    public static Reason IOError = new Reason(8, "IOError");
    public static Reason Media = new Reason(7, "Media");
    public static Reason MovedPermanently = new Reason(13, "MovedPermanently");
    public static Reason NoMatch = new Reason(12, "NoMatch");
    public static Reason NoResponse = new Reason(1, "NoResponse");
    public static Reason None = new Reason(0, "None");
    public static Reason NotAcceptable = new Reason(11, "NotAcceptable");
    public static Reason NotAnswered = new Reason(5, "NotAnswered");
    public static Reason NotFound = new Reason(4, "NotFound");
    public static Reason NotImplemented = new Reason(17, "NotImplemented");
    public static Reason ServerTimeout = new Reason(19, "ServerTimeout");
    public static Reason TemporarilyUnavailable = new Reason(15, "TemporarilyUnavailable");
    public static Reason Unauthorized = new Reason(10, "Unauthorized");
    public static Reason Unknown = new Reason(20, AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN);
    private static Vector<Reason> values = new Vector<>();
    private final String mStringValue;
    protected final int mValue;

    private Reason(int i, String str) {
        this.mValue = i;
        values.addElement(this);
        this.mStringValue = str;
    }

    public static Reason fromInt(int i) {
        int i2 = 0;
        while (true) {
            int i3 = i2;
            if (i3 < values.size()) {
                Reason elementAt = values.elementAt(i3);
                if (elementAt.mValue == i) {
                    return elementAt;
                }
                i2 = i3 + 1;
            } else {
                throw new RuntimeException("Reason not found [" + i + "]");
            }
        }
    }

    public String toString() {
        return this.mStringValue;
    }
}
