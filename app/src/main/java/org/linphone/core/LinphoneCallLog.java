package org.linphone.core;

import java.util.Vector;

public interface LinphoneCallLog {

    public static class CallStatus {
        public static final CallStatus Aborted = new CallStatus(1, "Aborted");
        public static final CallStatus AcceptedElsewhere = new CallStatus(5, "Accepted Elsewhere");
        public static final CallStatus Declined = new CallStatus(3, "Declined");
        public static final CallStatus DeclinedElsewhere = new CallStatus(6, "Declined Elsewhere");
        public static final CallStatus EarlyAborted = new CallStatus(4, "Early Aborted");
        public static final CallStatus Missed = new CallStatus(2, "Missed");
        public static final CallStatus Success = new CallStatus(0, "Success");
        private static Vector<CallStatus> values = new Vector<>();
        private final String mStringValue;
        private final int mValue;

        private CallStatus(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static CallStatus fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    CallStatus elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("CallStatus not found [" + i + "]");
                }
            }
        }

        public int toInt() {
            return this.mValue;
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    int getCallDuration();

    String getCallId();

    CallDirection getDirection();

    LinphoneAddress getFrom();

    String getStartDate();

    CallStatus getStatus();

    long getTimestamp();

    LinphoneAddress getTo();

    boolean wasConference();
}
