package org.apache.commons.lang3.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.text.DateFormatSymbols;
import java.text.FieldPosition;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import org.apache.commons.lang.time.DateUtils;
import org.apache.commons.lang3.Validate;

public class FastDatePrinter implements DatePrinter, Serializable {
    public static final int FULL = 0;
    public static final int LONG = 1;
    public static final int MEDIUM = 2;
    public static final int SHORT = 3;
    private static ConcurrentMap<TimeZoneDisplayKey, String> cTimeZoneDisplayCache = new ConcurrentHashMap(7);
    private static final long serialVersionUID = 1;
    private final Locale mLocale;
    private transient int mMaxLengthEstimate;
    private final String mPattern;
    private transient Rule[] mRules;
    private final TimeZone mTimeZone;

    private static class CharacterLiteral implements Rule {
        private final char mValue;

        CharacterLiteral(char c) {
            this.mValue = (char) c;
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            stringBuffer.append(this.mValue);
        }

        public int estimateLength() {
            return 1;
        }
    }

    private interface NumberRule extends Rule {
        void appendTo(StringBuffer stringBuffer, int i);
    }

    private static class PaddedNumberField implements NumberRule {
        private final int mField;
        private final int mSize;

        PaddedNumberField(int i, int i2) {
            if (i2 < 3) {
                throw new IllegalArgumentException();
            }
            this.mField = i;
            this.mSize = i2;
        }

        public final void appendTo(StringBuffer stringBuffer, int i) {
            int length;
            if (i < 100) {
                int i2 = this.mSize;
                while (true) {
                    i2--;
                    if (i2 >= 2) {
                        stringBuffer.append('0');
                    } else {
                        stringBuffer.append((char) ((i / 10) + 48));
                        stringBuffer.append((char) ((i % 10) + 48));
                        return;
                    }
                }
            } else {
                if (i < 1000) {
                    length = 3;
                } else {
                    Validate.isTrue(i > -1, "Negative values should not be possible", (long) i);
                    length = Integer.toString(i).length();
                }
                int i3 = this.mSize;
                while (true) {
                    i3--;
                    if (i3 >= length) {
                        stringBuffer.append('0');
                    } else {
                        stringBuffer.append(Integer.toString(i));
                        return;
                    }
                }
            }
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            appendTo(stringBuffer, calendar.get(this.mField));
        }

        public int estimateLength() {
            return 4;
        }
    }

    private interface Rule {
        void appendTo(StringBuffer stringBuffer, Calendar calendar);

        int estimateLength();
    }

    private static class StringLiteral implements Rule {
        private final String mValue;

        StringLiteral(String str) {
            this.mValue = str;
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            stringBuffer.append(this.mValue);
        }

        public int estimateLength() {
            return this.mValue.length();
        }
    }

    private static class TextField implements Rule {
        private final int mField;
        private final String[] mValues;

        TextField(int i, String[] strArr) {
            this.mField = i;
            this.mValues = strArr;
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            stringBuffer.append(this.mValues[calendar.get(this.mField)]);
        }

        public int estimateLength() {
            int i = 0;
            int length = this.mValues.length;
            while (true) {
                length--;
                if (length < 0) {
                    return i;
                }
                int length2 = this.mValues[length].length();
                if (length2 > i) {
                    i = length2;
                }
            }
        }
    }

    private static class TimeZoneDisplayKey {
        private final Locale mLocale;
        private final int mStyle;
        private final TimeZone mTimeZone;

        TimeZoneDisplayKey(TimeZone timeZone, boolean z, int i, Locale locale) {
            this.mTimeZone = timeZone;
            this.mStyle = z ? i | Integer.MIN_VALUE : i;
            this.mLocale = locale;
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof TimeZoneDisplayKey)) {
                return false;
            }
            TimeZoneDisplayKey timeZoneDisplayKey = (TimeZoneDisplayKey) obj;
            return this.mTimeZone.equals(timeZoneDisplayKey.mTimeZone) && this.mStyle == timeZoneDisplayKey.mStyle && this.mLocale.equals(timeZoneDisplayKey.mLocale);
        }

        public int hashCode() {
            return (((this.mStyle * 31) + this.mLocale.hashCode()) * 31) + this.mTimeZone.hashCode();
        }
    }

    private static class TimeZoneNameRule implements Rule {
        private final String mDaylight;
        private final Locale mLocale;
        private final String mStandard;
        private final int mStyle;

        TimeZoneNameRule(TimeZone timeZone, Locale locale, int i) {
            this.mLocale = locale;
            this.mStyle = i;
            this.mStandard = FastDatePrinter.getTimeZoneDisplay(timeZone, false, i, locale);
            this.mDaylight = FastDatePrinter.getTimeZoneDisplay(timeZone, true, i, locale);
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            TimeZone timeZone = calendar.getTimeZone();
            if (!timeZone.useDaylightTime() || calendar.get(16) == 0) {
                stringBuffer.append(FastDatePrinter.getTimeZoneDisplay(timeZone, false, this.mStyle, this.mLocale));
            } else {
                stringBuffer.append(FastDatePrinter.getTimeZoneDisplay(timeZone, true, this.mStyle, this.mLocale));
            }
        }

        public int estimateLength() {
            return Math.max(this.mStandard.length(), this.mDaylight.length());
        }
    }

    private static class TimeZoneNumberRule implements Rule {
        static final TimeZoneNumberRule INSTANCE_COLON = new TimeZoneNumberRule(true);
        static final TimeZoneNumberRule INSTANCE_NO_COLON = new TimeZoneNumberRule(false);
        final boolean mColon;

        TimeZoneNumberRule(boolean z) {
            this.mColon = z;
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            int i = calendar.get(15) + calendar.get(16);
            if (i < 0) {
                stringBuffer.append('-');
                i = -i;
            } else {
                stringBuffer.append('+');
            }
            int i2 = i / DateUtils.MILLIS_IN_HOUR;
            stringBuffer.append((char) ((i2 / 10) + 48));
            stringBuffer.append((char) ((i2 % 10) + 48));
            if (this.mColon) {
                stringBuffer.append(':');
            }
            int i3 = (i / DateUtils.MILLIS_IN_MINUTE) - (i2 * 60);
            stringBuffer.append((char) ((i3 / 10) + 48));
            stringBuffer.append((char) ((i3 % 10) + 48));
        }

        public int estimateLength() {
            return 5;
        }
    }

    private static class TwelveHourField implements NumberRule {
        private final NumberRule mRule;

        TwelveHourField(NumberRule numberRule) {
            this.mRule = numberRule;
        }

        public void appendTo(StringBuffer stringBuffer, int i) {
            this.mRule.appendTo(stringBuffer, i);
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            int i = calendar.get(10);
            if (i == 0) {
                i = calendar.getLeastMaximum(10) + 1;
            }
            this.mRule.appendTo(stringBuffer, i);
        }

        public int estimateLength() {
            return this.mRule.estimateLength();
        }
    }

    private static class TwentyFourHourField implements NumberRule {
        private final NumberRule mRule;

        TwentyFourHourField(NumberRule numberRule) {
            this.mRule = numberRule;
        }

        public void appendTo(StringBuffer stringBuffer, int i) {
            this.mRule.appendTo(stringBuffer, i);
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            int i = calendar.get(11);
            if (i == 0) {
                i = calendar.getMaximum(11) + 1;
            }
            this.mRule.appendTo(stringBuffer, i);
        }

        public int estimateLength() {
            return this.mRule.estimateLength();
        }
    }

    private static class TwoDigitMonthField implements NumberRule {
        static final TwoDigitMonthField INSTANCE = new TwoDigitMonthField();

        TwoDigitMonthField() {
        }

        public final void appendTo(StringBuffer stringBuffer, int i) {
            stringBuffer.append((char) ((i / 10) + 48));
            stringBuffer.append((char) ((i % 10) + 48));
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            appendTo(stringBuffer, calendar.get(2) + 1);
        }

        public int estimateLength() {
            return 2;
        }
    }

    private static class TwoDigitNumberField implements NumberRule {
        private final int mField;

        TwoDigitNumberField(int i) {
            this.mField = i;
        }

        public final void appendTo(StringBuffer stringBuffer, int i) {
            if (i < 100) {
                stringBuffer.append((char) ((i / 10) + 48));
                stringBuffer.append((char) ((i % 10) + 48));
                return;
            }
            stringBuffer.append(Integer.toString(i));
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            appendTo(stringBuffer, calendar.get(this.mField));
        }

        public int estimateLength() {
            return 2;
        }
    }

    private static class TwoDigitYearField implements NumberRule {
        static final TwoDigitYearField INSTANCE = new TwoDigitYearField();

        TwoDigitYearField() {
        }

        public final void appendTo(StringBuffer stringBuffer, int i) {
            stringBuffer.append((char) ((i / 10) + 48));
            stringBuffer.append((char) ((i % 10) + 48));
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            appendTo(stringBuffer, calendar.get(1) % 100);
        }

        public int estimateLength() {
            return 2;
        }
    }

    private static class UnpaddedMonthField implements NumberRule {
        static final UnpaddedMonthField INSTANCE = new UnpaddedMonthField();

        UnpaddedMonthField() {
        }

        public final void appendTo(StringBuffer stringBuffer, int i) {
            if (i < 10) {
                stringBuffer.append((char) (i + 48));
                return;
            }
            stringBuffer.append((char) ((i / 10) + 48));
            stringBuffer.append((char) ((i % 10) + 48));
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            appendTo(stringBuffer, calendar.get(2) + 1);
        }

        public int estimateLength() {
            return 2;
        }
    }

    private static class UnpaddedNumberField implements NumberRule {
        private final int mField;

        UnpaddedNumberField(int i) {
            this.mField = i;
        }

        public final void appendTo(StringBuffer stringBuffer, int i) {
            if (i < 10) {
                stringBuffer.append((char) (i + 48));
            } else if (i < 100) {
                stringBuffer.append((char) ((i / 10) + 48));
                stringBuffer.append((char) ((i % 10) + 48));
            } else {
                stringBuffer.append(Integer.toString(i));
            }
        }

        public void appendTo(StringBuffer stringBuffer, Calendar calendar) {
            appendTo(stringBuffer, calendar.get(this.mField));
        }

        public int estimateLength() {
            return 4;
        }
    }

    protected FastDatePrinter(String str, TimeZone timeZone, Locale locale) {
        this.mPattern = str;
        this.mTimeZone = timeZone;
        this.mLocale = locale;
        init();
    }

    private String applyRulesToString(Calendar calendar) {
        return applyRules(calendar, new StringBuffer(this.mMaxLengthEstimate)).toString();
    }

    static String getTimeZoneDisplay(TimeZone timeZone, boolean z, int i, Locale locale) {
        TimeZoneDisplayKey timeZoneDisplayKey = new TimeZoneDisplayKey(timeZone, z, i, locale);
        String str = (String) cTimeZoneDisplayCache.get(timeZoneDisplayKey);
        if (str != null) {
            return str;
        }
        String displayName = timeZone.getDisplayName(z, i, locale);
        String putIfAbsent = cTimeZoneDisplayCache.putIfAbsent(timeZoneDisplayKey, displayName);
        return putIfAbsent != null ? putIfAbsent : displayName;
    }

    private void init() {
        List<Rule> parsePattern = parsePattern();
        this.mRules = (Rule[]) parsePattern.toArray(new Rule[parsePattern.size()]);
        int i = 0;
        int length = this.mRules.length;
        while (true) {
            length--;
            if (length >= 0) {
                i += this.mRules[length].estimateLength();
            } else {
                this.mMaxLengthEstimate = i;
                return;
            }
        }
    }

    private GregorianCalendar newCalendar() {
        return new GregorianCalendar(this.mTimeZone, this.mLocale);
    }

    private void readObject(ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        objectInputStream.defaultReadObject();
        init();
    }

    /* access modifiers changed from: protected */
    public StringBuffer applyRules(Calendar calendar, StringBuffer stringBuffer) {
        for (Rule appendTo : this.mRules) {
            appendTo.appendTo(stringBuffer, calendar);
        }
        return stringBuffer;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof FastDatePrinter)) {
            return false;
        }
        FastDatePrinter fastDatePrinter = (FastDatePrinter) obj;
        return this.mPattern.equals(fastDatePrinter.mPattern) && this.mTimeZone.equals(fastDatePrinter.mTimeZone) && this.mLocale.equals(fastDatePrinter.mLocale);
    }

    public String format(long j) {
        GregorianCalendar newCalendar = newCalendar();
        newCalendar.setTimeInMillis(j);
        return applyRulesToString(newCalendar);
    }

    public String format(Calendar calendar) {
        return format(calendar, new StringBuffer(this.mMaxLengthEstimate)).toString();
    }

    public String format(Date date) {
        GregorianCalendar newCalendar = newCalendar();
        newCalendar.setTime(date);
        return applyRulesToString(newCalendar);
    }

    public StringBuffer format(long j, StringBuffer stringBuffer) {
        return format(new Date(j), stringBuffer);
    }

    public StringBuffer format(Object obj, StringBuffer stringBuffer, FieldPosition fieldPosition) {
        if (obj instanceof Date) {
            return format((Date) obj, stringBuffer);
        }
        if (obj instanceof Calendar) {
            return format((Calendar) obj, stringBuffer);
        }
        if (obj instanceof Long) {
            return format(((Long) obj).longValue(), stringBuffer);
        }
        throw new IllegalArgumentException("Unknown class: " + (obj == null ? "<null>" : obj.getClass().getName()));
    }

    public StringBuffer format(Calendar calendar, StringBuffer stringBuffer) {
        return applyRules(calendar, stringBuffer);
    }

    public StringBuffer format(Date date, StringBuffer stringBuffer) {
        GregorianCalendar newCalendar = newCalendar();
        newCalendar.setTime(date);
        return applyRules(newCalendar, stringBuffer);
    }

    public Locale getLocale() {
        return this.mLocale;
    }

    public int getMaxLengthEstimate() {
        return this.mMaxLengthEstimate;
    }

    public String getPattern() {
        return this.mPattern;
    }

    public TimeZone getTimeZone() {
        return this.mTimeZone;
    }

    public int hashCode() {
        return this.mPattern.hashCode() + ((this.mTimeZone.hashCode() + (this.mLocale.hashCode() * 13)) * 13);
    }

    /* access modifiers changed from: protected */
    public List<Rule> parsePattern() {
        Object stringLiteral;
        DateFormatSymbols dateFormatSymbols = new DateFormatSymbols(this.mLocale);
        ArrayList arrayList = new ArrayList();
        String[] eras = dateFormatSymbols.getEras();
        String[] months = dateFormatSymbols.getMonths();
        String[] shortMonths = dateFormatSymbols.getShortMonths();
        String[] weekdays = dateFormatSymbols.getWeekdays();
        String[] shortWeekdays = dateFormatSymbols.getShortWeekdays();
        String[] amPmStrings = dateFormatSymbols.getAmPmStrings();
        int length = this.mPattern.length();
        int[] iArr = new int[1];
        int i = 0;
        while (i < length) {
            iArr[0] = i;
            String parseToken = parseToken(this.mPattern, iArr);
            int i2 = iArr[0];
            int length2 = parseToken.length();
            if (length2 == 0) {
                return arrayList;
            }
            switch (parseToken.charAt(0)) {
                case '\'':
                    String substring = parseToken.substring(1);
                    if (substring.length() != 1) {
                        stringLiteral = new StringLiteral(substring);
                        break;
                    } else {
                        stringLiteral = new CharacterLiteral(substring.charAt(0));
                        break;
                    }
                case 'D':
                    stringLiteral = selectNumberRule(6, length2);
                    break;
                case 'E':
                    stringLiteral = new TextField(7, length2 < 4 ? shortWeekdays : weekdays);
                    break;
                case 'F':
                    stringLiteral = selectNumberRule(8, length2);
                    break;
                case 'G':
                    stringLiteral = new TextField(0, eras);
                    break;
                case 'H':
                    stringLiteral = selectNumberRule(11, length2);
                    break;
                case 'K':
                    stringLiteral = selectNumberRule(10, length2);
                    break;
                case 'M':
                    if (length2 < 4) {
                        if (length2 != 3) {
                            if (length2 != 2) {
                                stringLiteral = UnpaddedMonthField.INSTANCE;
                                break;
                            } else {
                                stringLiteral = TwoDigitMonthField.INSTANCE;
                                break;
                            }
                        } else {
                            stringLiteral = new TextField(2, shortMonths);
                            break;
                        }
                    } else {
                        stringLiteral = new TextField(2, months);
                        break;
                    }
                case 'S':
                    stringLiteral = selectNumberRule(14, length2);
                    break;
                case 'W':
                    stringLiteral = selectNumberRule(4, length2);
                    break;
                case 'Z':
                    if (length2 != 1) {
                        stringLiteral = TimeZoneNumberRule.INSTANCE_COLON;
                        break;
                    } else {
                        stringLiteral = TimeZoneNumberRule.INSTANCE_NO_COLON;
                        break;
                    }
                case 'a':
                    stringLiteral = new TextField(9, amPmStrings);
                    break;
                case 'd':
                    stringLiteral = selectNumberRule(5, length2);
                    break;
                case 'h':
                    stringLiteral = new TwelveHourField(selectNumberRule(10, length2));
                    break;
                case 'k':
                    stringLiteral = new TwentyFourHourField(selectNumberRule(11, length2));
                    break;
                case 'm':
                    stringLiteral = selectNumberRule(12, length2);
                    break;
                case 's':
                    stringLiteral = selectNumberRule(13, length2);
                    break;
                case 'w':
                    stringLiteral = selectNumberRule(3, length2);
                    break;
                case 'y':
                    if (length2 != 2) {
                        stringLiteral = selectNumberRule(1, length2 < 4 ? 4 : length2);
                        break;
                    } else {
                        stringLiteral = TwoDigitYearField.INSTANCE;
                        break;
                    }
                case 'z':
                    if (length2 < 4) {
                        stringLiteral = new TimeZoneNameRule(this.mTimeZone, this.mLocale, 0);
                        break;
                    } else {
                        stringLiteral = new TimeZoneNameRule(this.mTimeZone, this.mLocale, 1);
                        break;
                    }
                default:
                    throw new IllegalArgumentException("Illegal pattern component: " + parseToken);
            }
            arrayList.add(stringLiteral);
            i = i2 + 1;
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x0069, code lost:
        r1 = r1 - 1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.lang.String parseToken(java.lang.String r12, int[] r13) {
        /*
            r11 = this;
            r10 = 97
            r9 = 90
            r8 = 65
            r7 = 39
            r2 = 0
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            r1 = r13[r2]
            int r4 = r12.length()
            char r0 = r12.charAt(r1)
            if (r0 < r8) goto L_0x001c
            if (r0 <= r9) goto L_0x0022
        L_0x001c:
            if (r0 < r10) goto L_0x0037
            r5 = 122(0x7a, float:1.71E-43)
            if (r0 > r5) goto L_0x0037
        L_0x0022:
            r3.append(r0)
        L_0x0025:
            int r5 = r1 + 1
            if (r5 >= r4) goto L_0x006b
            int r5 = r1 + 1
            char r5 = r12.charAt(r5)
            if (r5 != r0) goto L_0x006b
            r3.append(r0)
            int r1 = r1 + 1
            goto L_0x0025
        L_0x0037:
            r3.append(r7)
            r0 = r2
        L_0x003b:
            if (r1 >= r4) goto L_0x006b
            char r5 = r12.charAt(r1)
            if (r5 != r7) goto L_0x005d
            int r6 = r1 + 1
            if (r6 >= r4) goto L_0x0057
            int r6 = r1 + 1
            char r6 = r12.charAt(r6)
            if (r6 != r7) goto L_0x0057
            int r1 = r1 + 1
            r3.append(r5)
        L_0x0054:
            int r1 = r1 + 1
            goto L_0x003b
        L_0x0057:
            if (r0 != 0) goto L_0x005b
            r0 = 1
            goto L_0x0054
        L_0x005b:
            r0 = r2
            goto L_0x0054
        L_0x005d:
            if (r0 != 0) goto L_0x0072
            if (r5 < r8) goto L_0x0063
            if (r5 <= r9) goto L_0x0069
        L_0x0063:
            if (r5 < r10) goto L_0x0072
            r6 = 122(0x7a, float:1.71E-43)
            if (r5 > r6) goto L_0x0072
        L_0x0069:
            int r1 = r1 + -1
        L_0x006b:
            r13[r2] = r1
            java.lang.String r0 = r3.toString()
            return r0
        L_0x0072:
            r3.append(r5)
            goto L_0x0054
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.time.FastDatePrinter.parseToken(java.lang.String, int[]):java.lang.String");
    }

    /* access modifiers changed from: protected */
    public NumberRule selectNumberRule(int i, int i2) {
        switch (i2) {
            case 1:
                return new UnpaddedNumberField(i);
            case 2:
                return new TwoDigitNumberField(i);
            default:
                return new PaddedNumberField(i, i2);
        }
    }

    public String toString() {
        return "FastDatePrinter[" + this.mPattern + "," + this.mLocale + "," + this.mTimeZone.getID() + "]";
    }
}
