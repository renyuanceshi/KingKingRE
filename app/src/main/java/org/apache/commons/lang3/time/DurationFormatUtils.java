package org.apache.commons.lang3.time;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import org.apache.commons.lang3.StringUtils;

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
        private final Object value;

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
                return this.value instanceof StringBuilder ? this.value.toString().equals(token.value.toString()) : this.value instanceof Number ? this.value.equals(token.value) : this.value == token.value;
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
        int i8;
        StringBuilder sb = new StringBuilder();
        boolean z2 = false;
        int length = tokenArr.length;
        int i9 = i7;
        int i10 = 0;
        while (i10 < length) {
            Token token = tokenArr[i10];
            Object value = token.getValue();
            int count = token.getCount();
            if (value instanceof StringBuilder) {
                sb.append(value.toString());
                i8 = i9;
            } else if (value == y) {
                sb.append(z ? StringUtils.leftPad(Integer.toString(i), count, '0') : Integer.toString(i));
                z2 = false;
                i8 = i9;
            } else if (value == M) {
                sb.append(z ? StringUtils.leftPad(Integer.toString(i2), count, '0') : Integer.toString(i2));
                z2 = false;
                i8 = i9;
            } else if (value == d) {
                sb.append(z ? StringUtils.leftPad(Integer.toString(i3), count, '0') : Integer.toString(i3));
                z2 = false;
                i8 = i9;
            } else if (value == H) {
                sb.append(z ? StringUtils.leftPad(Integer.toString(i4), count, '0') : Integer.toString(i4));
                z2 = false;
                i8 = i9;
            } else if (value == m) {
                sb.append(z ? StringUtils.leftPad(Integer.toString(i5), count, '0') : Integer.toString(i5));
                z2 = false;
                i8 = i9;
            } else if (value == s) {
                sb.append(z ? StringUtils.leftPad(Integer.toString(i6), count, '0') : Integer.toString(i6));
                z2 = true;
                i8 = i9;
            } else if (value == S) {
                if (z2) {
                    int i11 = i9 + 1000;
                    sb.append((z ? StringUtils.leftPad(Integer.toString(i11), count, '0') : Integer.toString(i11)).substring(1));
                    i8 = i11;
                } else {
                    sb.append(z ? StringUtils.leftPad(Integer.toString(i9), count, '0') : Integer.toString(i9));
                    i8 = i9;
                }
                z2 = false;
            } else {
                i8 = i9;
            }
            i10++;
            i9 = i8;
        }
        return sb.toString();
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
            String str = StringUtils.SPACE + formatDuration;
            formatDuration = StringUtils.replaceOnce(str, " 0 days", "");
            if (formatDuration.length() != str.length()) {
                String replaceOnce = StringUtils.replaceOnce(formatDuration, " 0 hours", "");
                if (replaceOnce.length() != formatDuration.length()) {
                    formatDuration = StringUtils.replaceOnce(replaceOnce, " 0 minutes", "");
                    if (formatDuration.length() != formatDuration.length()) {
                        formatDuration = StringUtils.replaceOnce(formatDuration, " 0 seconds", "");
                    }
                }
            } else {
                formatDuration = str;
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
        return StringUtils.replaceOnce(StringUtils.replaceOnce(StringUtils.replaceOnce(StringUtils.replaceOnce(StringUtils.SPACE + formatDuration, " 1 seconds", " 1 second"), " 1 minutes", " 1 minute"), " 1 hours", " 1 hour"), " 1 days", " 1 day").trim();
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
        int i7;
        int i8;
        Token[] lexx = lexx(str);
        Calendar instance = Calendar.getInstance(timeZone);
        instance.setTime(new Date(j));
        Calendar instance2 = Calendar.getInstance(timeZone);
        instance2.setTime(new Date(j2));
        int i9 = instance2.get(14) - instance.get(14);
        int i10 = instance2.get(13) - instance.get(13);
        int i11 = instance2.get(12) - instance.get(12);
        int i12 = instance2.get(11) - instance.get(11);
        int i13 = instance2.get(5) - instance.get(5);
        int i14 = instance2.get(2) - instance.get(2);
        int i15 = instance2.get(1) - instance.get(1);
        while (i9 < 0) {
            i9 += 1000;
            i10--;
        }
        while (i10 < 0) {
            i10 += 60;
            i11--;
        }
        while (i11 < 0) {
            i11 += 60;
            i12--;
        }
        while (i12 < 0) {
            i12 += 24;
            i13--;
        }
        if (Token.containsTokenWithValue(lexx, M)) {
            int i16 = i13;
            while (i16 < 0) {
                i16 += instance.getActualMaximum(5);
                i14--;
                instance.add(2, 1);
            }
            i2 = i14;
            while (i2 < 0) {
                i2 += 12;
                i15--;
            }
            if (!Token.containsTokenWithValue(lexx, y) && i15 != 0) {
                while (i15 != 0) {
                    i2 += i15 * 12;
                    i15 = 0;
                }
            }
            i = i16;
        } else {
            if (!Token.containsTokenWithValue(lexx, y)) {
                int i17 = instance2.get(1);
                if (i14 < 0) {
                    i17--;
                }
                while (instance.get(1) != i17) {
                    int actualMaximum = i13 + (instance.getActualMaximum(6) - instance.get(6));
                    if ((instance instanceof GregorianCalendar) && instance.get(2) == 1 && instance.get(5) == 29) {
                        actualMaximum++;
                    }
                    instance.add(1, 1);
                    i13 = actualMaximum + instance.get(6);
                }
                i15 = 0;
            }
            while (instance.get(2) != instance2.get(2)) {
                i13 += instance.getActualMaximum(5);
                instance.add(2, 1);
            }
            int i18 = 0;
            i = i13;
            while (i < 0) {
                i += instance.getActualMaximum(5);
                i18--;
                instance.add(2, 1);
            }
            i2 = i18;
        }
        if (!Token.containsTokenWithValue(lexx, d)) {
            i3 = 0;
            i12 += i * 24;
        } else {
            i3 = i;
        }
        if (!Token.containsTokenWithValue(lexx, H)) {
            i4 = 0;
            i11 += i12 * 60;
        } else {
            i4 = i12;
        }
        if (!Token.containsTokenWithValue(lexx, m)) {
            i6 = 0;
            i5 = i10 + (i11 * 60);
        } else {
            i5 = i10;
            i6 = i11;
        }
        if (!Token.containsTokenWithValue(lexx, s)) {
            i8 = i9 + (i5 * 1000);
            i7 = 0;
        } else {
            i7 = i5;
            i8 = i9;
        }
        return format(lexx, i15, i2, i3, i4, i6, i7, i8, z);
    }

    public static String formatPeriodISO(long j, long j2) {
        return formatPeriod(j, j2, "'P'yyyy'Y'M'M'd'DT'H'H'm'M's.S'S'", false, TimeZone.getDefault());
    }

    static Token[] lexx(String str) {
        Object obj;
        char[] charArray = str.toCharArray();
        ArrayList arrayList = new ArrayList(charArray.length);
        Token token = null;
        StringBuilder sb = null;
        boolean z = false;
        for (char c : charArray) {
            if (!z || c == '\'') {
                switch (c) {
                    case '\'':
                        if (!z) {
                            sb = new StringBuilder();
                            arrayList.add(new Token(sb));
                            z = true;
                            obj = null;
                            break;
                        } else {
                            sb = null;
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
                        if (sb == null) {
                            sb = new StringBuilder();
                            arrayList.add(new Token(sb));
                        }
                        sb.append(c);
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
                    sb = null;
                }
            } else {
                sb.append(c);
            }
        }
        return (Token[]) arrayList.toArray(new Token[arrayList.size()]);
    }
}
