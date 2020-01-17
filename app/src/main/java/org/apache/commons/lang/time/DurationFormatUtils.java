package org.apache.commons.lang.time;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import org.apache.commons.lang.StringUtils;

public class DurationFormatUtils {
    static final Object H = "H";
    public static final String ISO_EXTENDED_FORMAT_PATTERN = "'P'yyyy'Y'M'M'd'DT'H'H'm'M's.S'S'";
    static final Object M = "M";
    static final Object S = "S";
    static final Object d = "d";
    static final Object m = "m";
    static final Object s = "s";
    static final Object y = "y";

    static class Token {
        private int count;
        private Object value;

        Token(Object obj) {
            this.value = obj;
            this.count = 1;
        }

        Token(Object obj, int i) {
            this.value = obj;
            this.count = i;
        }

        static boolean containsTokenWithValue(Token[] tokenArr, Object obj) {
            for (Token value2 : tokenArr) {
                if (value2.getValue() == obj) {
                    return true;
                }
            }
            return false;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof Token)) {
                return false;
            }
            Token token = (Token) obj;
            if (this.value.getClass() == token.value.getClass() && this.count == token.count) {
                return this.value instanceof StringBuffer ? this.value.toString().equals(token.value.toString()) : this.value instanceof Number ? this.value.equals(token.value) : this.value == token.value;
            }
            return false;
        }

        /* access modifiers changed from: package-private */
        public int getCount() {
            return this.count;
        }

        /* access modifiers changed from: package-private */
        public Object getValue() {
            return this.value;
        }

        public int hashCode() {
            return this.value.hashCode();
        }

        /* access modifiers changed from: package-private */
        public void increment() {
            this.count++;
        }

        public String toString() {
            return StringUtils.repeat(this.value.toString(), this.count);
        }
    }

    static String format(Token[] tokenArr, int i, int i2, int i3, int i4, int i5, int i6, int i7, boolean z) {
        StringBuffer stringBuffer = new StringBuffer();
        boolean z2 = false;
        int i8 = i7;
        for (Token token : tokenArr) {
            Object value = token.getValue();
            int count = token.getCount();
            if (value instanceof StringBuffer) {
                stringBuffer.append(value.toString());
            } else if (value == y) {
                stringBuffer.append(z ? StringUtils.leftPad(Integer.toString(i), count, '0') : Integer.toString(i));
                z2 = false;
            } else if (value == M) {
                stringBuffer.append(z ? StringUtils.leftPad(Integer.toString(i2), count, '0') : Integer.toString(i2));
                z2 = false;
            } else if (value == d) {
                stringBuffer.append(z ? StringUtils.leftPad(Integer.toString(i3), count, '0') : Integer.toString(i3));
                z2 = false;
            } else if (value == H) {
                stringBuffer.append(z ? StringUtils.leftPad(Integer.toString(i4), count, '0') : Integer.toString(i4));
                z2 = false;
            } else if (value == m) {
                stringBuffer.append(z ? StringUtils.leftPad(Integer.toString(i5), count, '0') : Integer.toString(i5));
                z2 = false;
            } else if (value == s) {
                stringBuffer.append(z ? StringUtils.leftPad(Integer.toString(i6), count, '0') : Integer.toString(i6));
                z2 = true;
            } else if (value == S) {
                if (z2) {
                    int i9 = i8 + 1000;
                    stringBuffer.append((z ? StringUtils.leftPad(Integer.toString(i9), count, '0') : Integer.toString(i9)).substring(1));
                    i8 = i9;
                } else {
                    stringBuffer.append(z ? StringUtils.leftPad(Integer.toString(i8), count, '0') : Integer.toString(i8));
                }
                z2 = false;
            }
        }
        return stringBuffer.toString();
    }

    public static String formatDuration(long j, String str) {
        return formatDuration(j, str, true);
    }

    public static String formatDuration(long j, String str, boolean z) {
        Token[] lexx = lexx(str);
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        if (Token.containsTokenWithValue(lexx, d)) {
            i = (int) (j / 86400000);
            j -= ((long) i) * 86400000;
        }
        if (Token.containsTokenWithValue(lexx, H)) {
            i2 = (int) (j / 3600000);
            j -= ((long) i2) * 3600000;
        }
        if (Token.containsTokenWithValue(lexx, m)) {
            i3 = (int) (j / 60000);
            j -= ((long) i3) * 60000;
        }
        if (Token.containsTokenWithValue(lexx, s)) {
            i4 = (int) (j / 1000);
            j -= ((long) i4) * 1000;
        }
        if (Token.containsTokenWithValue(lexx, S)) {
            i5 = (int) j;
        }
        return format(lexx, 0, 0, i, i2, i3, i4, i5, z);
    }

    public static String formatDurationHMS(long j) {
        return formatDuration(j, "H:mm:ss.SSS");
    }

    public static String formatDurationISO(long j) {
        return formatDuration(j, "'P'yyyy'Y'M'M'd'DT'H'H'm'M's.S'S'", false);
    }

    public static String formatDurationWords(long j, boolean z, boolean z2) {
        String formatDuration = formatDuration(j, "d' days 'H' hours 'm' minutes 's' seconds'");
        if (z) {
            String stringBuffer = new StringBuffer().append(org.apache.commons.lang3.StringUtils.SPACE).append(formatDuration).toString();
            formatDuration = StringUtils.replaceOnce(stringBuffer, " 0 days", "");
            if (formatDuration.length() != stringBuffer.length()) {
                String replaceOnce = StringUtils.replaceOnce(formatDuration, " 0 hours", "");
                if (replaceOnce.length() != formatDuration.length()) {
                    formatDuration = StringUtils.replaceOnce(replaceOnce, " 0 minutes", "");
                    if (formatDuration.length() != formatDuration.length()) {
                        formatDuration = StringUtils.replaceOnce(formatDuration, " 0 seconds", "");
                    }
                }
            } else {
                formatDuration = stringBuffer;
            }
            if (formatDuration.length() != 0) {
                formatDuration = formatDuration.substring(1);
            }
        }
        if (z2) {
            String replaceOnce2 = StringUtils.replaceOnce(formatDuration, " 0 seconds", "");
            if (replaceOnce2.length() != formatDuration.length()) {
                formatDuration = StringUtils.replaceOnce(replaceOnce2, " 0 minutes", "");
                if (formatDuration.length() != replaceOnce2.length()) {
                    String replaceOnce3 = StringUtils.replaceOnce(formatDuration, " 0 hours", "");
                    if (replaceOnce3.length() != formatDuration.length()) {
                        formatDuration = StringUtils.replaceOnce(replaceOnce3, " 0 days", "");
                    }
                } else {
                    formatDuration = replaceOnce2;
                }
            }
        }
        return StringUtils.replaceOnce(StringUtils.replaceOnce(StringUtils.replaceOnce(StringUtils.replaceOnce(new StringBuffer().append(org.apache.commons.lang3.StringUtils.SPACE).append(formatDuration).toString(), " 1 seconds", " 1 second"), " 1 minutes", " 1 minute"), " 1 hours", " 1 hour"), " 1 days", " 1 day").trim();
    }

    public static String formatPeriod(long j, long j2, String str) {
        return formatPeriod(j, j2, str, true, TimeZone.getDefault());
    }

    public static String formatPeriod(long j, long j2, String str, boolean z, TimeZone timeZone) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        Token[] lexx = lexx(str);
        Calendar instance = Calendar.getInstance(timeZone);
        instance.setTime(new Date(j));
        Calendar instance2 = Calendar.getInstance(timeZone);
        instance2.setTime(new Date(j2));
        int i7 = instance2.get(14) - instance.get(14);
        int i8 = instance2.get(13) - instance.get(13);
        int i9 = instance2.get(12) - instance.get(12);
        int i10 = instance2.get(11) - instance.get(11);
        int i11 = instance2.get(5) - instance.get(5);
        int i12 = instance2.get(2) - instance.get(2);
        int i13 = instance2.get(1) - instance.get(1);
        while (i7 < 0) {
            i7 += 1000;
            i8--;
        }
        while (i8 < 0) {
            i8 += 60;
            i9--;
        }
        while (i9 < 0) {
            i9 += 60;
            i10--;
        }
        while (i10 < 0) {
            i10 += 24;
            i11--;
        }
        if (Token.containsTokenWithValue(lexx, M)) {
            i = i11;
            while (i < 0) {
                i += instance.getActualMaximum(5);
                i12--;
                instance.add(2, 1);
            }
            i2 = i12;
            while (i2 < 0) {
                i2 += 12;
                i13--;
            }
            if (!Token.containsTokenWithValue(lexx, y) && i13 != 0) {
                while (i13 != 0) {
                    i2 += i13 * 12;
                    i13 = 0;
                }
            }
        } else {
            if (!Token.containsTokenWithValue(lexx, y)) {
                int i14 = instance2.get(1);
                if (i12 < 0) {
                    i14--;
                }
                while (instance.get(1) != i14) {
                    int actualMaximum = i11 + (instance.getActualMaximum(6) - instance.get(6));
                    if ((instance instanceof GregorianCalendar) && instance.get(2) == 1 && instance.get(5) == 29) {
                        actualMaximum++;
                    }
                    instance.add(1, 1);
                    i11 = actualMaximum + instance.get(6);
                }
                i13 = 0;
            }
            while (instance.get(2) != instance2.get(2)) {
                i11 += instance.getActualMaximum(5);
                instance.add(2, 1);
            }
            int i15 = 0;
            int i16 = i11;
            while (i < 0) {
                i16 = i + instance.getActualMaximum(5);
                i15--;
                instance.add(2, 1);
            }
            i2 = i15;
        }
        if (!Token.containsTokenWithValue(lexx, d)) {
            i3 = i10 + (i * 24);
            i = 0;
        } else {
            i3 = i10;
        }
        if (!Token.containsTokenWithValue(lexx, H)) {
            i4 = i9 + (i3 * 60);
            i3 = 0;
        } else {
            i4 = i9;
        }
        if (!Token.containsTokenWithValue(lexx, m)) {
            i5 = i8 + (i4 * 60);
            i4 = 0;
        } else {
            i5 = i8;
        }
        if (!Token.containsTokenWithValue(lexx, s)) {
            i6 = i7 + (i5 * 1000);
            i5 = 0;
        } else {
            i6 = i7;
        }
        return format(lexx, i13, i2, i, i3, i4, i5, i6, z);
    }

    public static String formatPeriodISO(long j, long j2) {
        return formatPeriod(j, j2, "'P'yyyy'Y'M'M'd'DT'H'H'm'M's.S'S'", false, TimeZone.getDefault());
    }

    static Token[] lexx(String str) {
        Object obj;
        char[] charArray = str.toCharArray();
        ArrayList arrayList = new ArrayList(charArray.length);
        Token token = null;
        StringBuffer stringBuffer = null;
        boolean z = false;
        for (char c : charArray) {
            if (!z || c == '\'') {
                switch (c) {
                    case '\'':
                        if (!z) {
                            stringBuffer = new StringBuffer();
                            arrayList.add(new Token(stringBuffer));
                            z = true;
                            obj = null;
                            break;
                        } else {
                            stringBuffer = null;
                            z = false;
                            obj = null;
                            break;
                        }
                    case 'H':
                        obj = H;
                        break;
                    case 'M':
                        obj = M;
                        break;
                    case 'S':
                        obj = S;
                        break;
                    case 'd':
                        obj = d;
                        break;
                    case 'm':
                        obj = m;
                        break;
                    case 's':
                        obj = s;
                        break;
                    case 'y':
                        obj = y;
                        break;
                    default:
                        if (stringBuffer == null) {
                            stringBuffer = new StringBuffer();
                            arrayList.add(new Token(stringBuffer));
                        }
                        stringBuffer.append(c);
                        obj = null;
                        break;
                }
                if (obj != null) {
                    if (token == null || token.getValue() != obj) {
                        token = new Token(obj);
                        arrayList.add(token);
                    } else {
                        token.increment();
                    }
                    stringBuffer = null;
                }
            } else {
                stringBuffer.append(c);
            }
        }
        return (Token[]) arrayList.toArray(new Token[arrayList.size()]);
    }
}
