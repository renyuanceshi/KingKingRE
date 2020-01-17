package org.linphone.core;

import com.pccw.mobile.server.response.CheckSMSDeliveryStatusResponse;
import java.util.Vector;

public interface LinphoneXmlRpcRequest {

    public static class ArgType {
        public static final ArgType Int = new ArgType(1, "Int");
        public static final ArgType None = new ArgType(0, "None");
        public static final ArgType String = new ArgType(2, "String");
        private static Vector<ArgType> values = new Vector<>();
        private final String mStringValue;
        private final int mValue;

        private ArgType(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static ArgType fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    ArgType elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("ArgType not found [" + i + "]");
                }
            }
        }

        public int toInt() {
            return this.mValue;
        }

        public String toString() {
            return this.mStringValue;
        }

        public final int value() {
            return this.mValue;
        }
    }

    public interface LinphoneXmlRpcRequestListener {
        void onXmlRpcRequestResponse(LinphoneXmlRpcRequest linphoneXmlRpcRequest);
    }

    public static class Status {
        public static final Status Failed = new Status(2, "Failed");
        public static final Status Ok = new Status(1, "Ok");
        public static final Status Pending = new Status(0, CheckSMSDeliveryStatusResponse.PENDING);
        private static Vector<Status> values = new Vector<>();
        private final String mStringValue;
        private final int mValue;

        private Status(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static Status fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    Status elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("Status not found [" + i + "]");
                }
            }
        }

        public int toInt() {
            return this.mValue;
        }

        public String toString() {
            return this.mStringValue;
        }

        public final int value() {
            return this.mValue;
        }
    }

    void addIntArg(int i);

    void addStringArg(String str);

    String getContent();

    int getIntResponse();

    Status getStatus();

    String getStringResponse();

    void setListener(LinphoneXmlRpcRequestListener linphoneXmlRpcRequestListener);
}
