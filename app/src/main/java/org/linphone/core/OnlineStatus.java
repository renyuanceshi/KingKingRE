package org.linphone.core;

import com.pccw.mobile.server.response.CheckSMSDeliveryStatusResponse;
import java.util.Vector;

@Deprecated
public class OnlineStatus {
    public static OnlineStatus Away = new OnlineStatus(4, "Away");
    public static OnlineStatus BeRightBack = new OnlineStatus(3, "BeRightBack");
    public static OnlineStatus Busy = new OnlineStatus(2, "Busy");
    public static OnlineStatus DoNotDisturb = new OnlineStatus(7, "DoNotDisturb");
    public static OnlineStatus Offline = new OnlineStatus(0, "Offline");
    public static OnlineStatus OnThePhone = new OnlineStatus(5, "OnThePhone");
    public static OnlineStatus Online = new OnlineStatus(1, "Online");
    public static OnlineStatus OutToLunch = new OnlineStatus(6, "OutToLunch ");
    public static OnlineStatus Pending = new OnlineStatus(10, CheckSMSDeliveryStatusResponse.PENDING);
    public static OnlineStatus StatusAltService = new OnlineStatus(9, "StatusAltService");
    public static OnlineStatus StatusMoved = new OnlineStatus(8, "StatusMoved");
    private static Vector<OnlineStatus> values = new Vector<>();
    private final String mStringValue;
    protected final int mValue;

    private OnlineStatus(int i, String str) {
        this.mValue = i;
        values.addElement(this);
        this.mStringValue = str;
    }

    public static OnlineStatus fromInt(int i) {
        int i2 = 0;
        while (true) {
            int i3 = i2;
            if (i3 < values.size()) {
                OnlineStatus elementAt = values.elementAt(i3);
                if (elementAt.mValue == i) {
                    return elementAt;
                }
                i2 = i3 + 1;
            } else {
                throw new RuntimeException("state not found [" + i + "]");
            }
        }
    }

    public String toString() {
        return this.mStringValue;
    }
}
