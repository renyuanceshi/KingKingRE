package org.apache.commons.lang.time;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.TimeZone;
import org.apache.commons.lang.StringUtils;

public class DateUtils {
    public static final int MILLIS_IN_DAY = 86400000;
    public static final int MILLIS_IN_HOUR = 3600000;
    public static final int MILLIS_IN_MINUTE = 60000;
    public static final int MILLIS_IN_SECOND = 1000;
    public static final long MILLIS_PER_DAY = 86400000;
    public static final long MILLIS_PER_HOUR = 3600000;
    public static final long MILLIS_PER_MINUTE = 60000;
    public static final long MILLIS_PER_SECOND = 1000;
    private static final int MODIFY_CEILING = 2;
    private static final int MODIFY_ROUND = 1;
    private static final int MODIFY_TRUNCATE = 0;
    public static final int RANGE_MONTH_MONDAY = 6;
    public static final int RANGE_MONTH_SUNDAY = 5;
    public static final int RANGE_WEEK_CENTER = 4;
    public static final int RANGE_WEEK_MONDAY = 2;
    public static final int RANGE_WEEK_RELATIVE = 3;
    public static final int RANGE_WEEK_SUNDAY = 1;
    public static final int SEMI_MONTH = 1001;
    public static final TimeZone UTC_TIME_ZONE = TimeZone.getTimeZone("GMT");
    private static final int[][] fields = {new int[]{14}, new int[]{13}, new int[]{12}, new int[]{11, 10}, new int[]{5, 5, 9}, new int[]{2, 1001}, new int[]{1}, new int[]{0}};

    static class DateIterator implements Iterator {
        private final Calendar endFinal;
        private final Calendar spot;

        DateIterator(Calendar calendar, Calendar calendar2) {
            this.endFinal = calendar2;
            this.spot = calendar;
            this.spot.add(5, -1);
        }

        public boolean hasNext() {
            return this.spot.before(this.endFinal);
        }

        public Object next() {
            if (this.spot.equals(this.endFinal)) {
                throw new NoSuchElementException();
            }
            this.spot.add(5, 1);
            return this.spot.clone();
        }

        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    public static Date add(Date date, int i, int i2) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        instance.add(i, i2);
        return instance.getTime();
    }

    public static Date addDays(Date date, int i) {
        return add(date, 5, i);
    }

    public static Date addHours(Date date, int i) {
        return add(date, 11, i);
    }

    public static Date addMilliseconds(Date date, int i) {
        return add(date, 14, i);
    }

    public static Date addMinutes(Date date, int i) {
        return add(date, 12, i);
    }

    public static Date addMonths(Date date, int i) {
        return add(date, 2, i);
    }

    public static Date addSeconds(Date date, int i) {
        return add(date, 13, i);
    }

    public static Date addWeeks(Date date, int i) {
        return add(date, 3, i);
    }

    public static Date addYears(Date date, int i) {
        return add(date, 1, i);
    }

    public static Calendar ceiling(Calendar calendar, int i) {
        if (calendar == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar calendar2 = (Calendar) calendar.clone();
        modify(calendar2, i, 2);
        return calendar2;
    }

    public static Date ceiling(Object obj, int i) {
        if (obj == null) {
            throw new IllegalArgumentException("The date must not be null");
        } else if (obj instanceof Date) {
            return ceiling((Date) obj, i);
        } else {
            if (obj instanceof Calendar) {
                return ceiling((Calendar) obj, i).getTime();
            }
            throw new ClassCastException(new StringBuffer().append("Could not find ceiling of for type: ").append(obj.getClass()).toString());
        }
    }

    public static Date ceiling(Date date, int i) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        modify(instance, i, 2);
        return instance.getTime();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0059, code lost:
        r0 = r0 + ((((long) r8.get(12)) * 60000) / r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0066, code lost:
        r0 = r0 + ((((long) r8.get(13)) * 1000) / r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:?, code lost:
        return r0 + (((long) (r8.get(14) * 1)) / r2);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static long getFragment(java.util.Calendar r8, int r9, int r10) {
        /*
            r6 = 86400000(0x5265c00, double:4.2687272E-316)
            r0 = 0
            if (r8 != 0) goto L_0x000f
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.String r1 = "The date must not be null"
            r0.<init>(r1)
            throw r0
        L_0x000f:
            long r2 = getMillisPerUnit(r10)
            switch(r9) {
                case 1: goto L_0x0038;
                case 2: goto L_0x0042;
                default: goto L_0x0016;
            }
        L_0x0016:
            switch(r9) {
                case 1: goto L_0x004c;
                case 2: goto L_0x004c;
                case 3: goto L_0x0019;
                case 4: goto L_0x0019;
                case 5: goto L_0x004c;
                case 6: goto L_0x004c;
                case 7: goto L_0x0019;
                case 8: goto L_0x0019;
                case 9: goto L_0x0019;
                case 10: goto L_0x0019;
                case 11: goto L_0x0059;
                case 12: goto L_0x0066;
                case 13: goto L_0x0072;
                case 14: goto L_0x007e;
                default: goto L_0x0019;
            }
        L_0x0019:
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.StringBuffer r1 = new java.lang.StringBuffer
            r1.<init>()
            java.lang.String r2 = "The fragment "
            java.lang.StringBuffer r1 = r1.append(r2)
            java.lang.StringBuffer r1 = r1.append(r9)
            java.lang.String r2 = " is not supported"
            java.lang.StringBuffer r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x0038:
            r4 = 6
            int r4 = r8.get(r4)
            long r4 = (long) r4
            long r4 = r4 * r6
            long r4 = r4 / r2
            long r0 = r0 + r4
            goto L_0x0016
        L_0x0042:
            r4 = 5
            int r4 = r8.get(r4)
            long r4 = (long) r4
            long r4 = r4 * r6
            long r4 = r4 / r2
            long r0 = r0 + r4
            goto L_0x0016
        L_0x004c:
            r4 = 11
            int r4 = r8.get(r4)
            long r4 = (long) r4
            r6 = 3600000(0x36ee80, double:1.7786363E-317)
            long r4 = r4 * r6
            long r4 = r4 / r2
            long r0 = r0 + r4
        L_0x0059:
            r4 = 12
            int r4 = r8.get(r4)
            long r4 = (long) r4
            r6 = 60000(0xea60, double:2.9644E-319)
            long r4 = r4 * r6
            long r4 = r4 / r2
            long r0 = r0 + r4
        L_0x0066:
            r4 = 13
            int r4 = r8.get(r4)
            long r4 = (long) r4
            r6 = 1000(0x3e8, double:4.94E-321)
            long r4 = r4 * r6
            long r4 = r4 / r2
            long r0 = r0 + r4
        L_0x0072:
            r4 = 14
            int r4 = r8.get(r4)
            int r4 = r4 * 1
            long r4 = (long) r4
            long r2 = r4 / r2
            long r0 = r0 + r2
        L_0x007e:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.time.DateUtils.getFragment(java.util.Calendar, int, int):long");
    }

    private static long getFragment(Date date, int i, int i2) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        return getFragment(instance, i, i2);
    }

    public static long getFragmentInDays(Calendar calendar, int i) {
        return getFragment(calendar, i, 6);
    }

    public static long getFragmentInDays(Date date, int i) {
        return getFragment(date, i, 6);
    }

    public static long getFragmentInHours(Calendar calendar, int i) {
        return getFragment(calendar, i, 11);
    }

    public static long getFragmentInHours(Date date, int i) {
        return getFragment(date, i, 11);
    }

    public static long getFragmentInMilliseconds(Calendar calendar, int i) {
        return getFragment(calendar, i, 14);
    }

    public static long getFragmentInMilliseconds(Date date, int i) {
        return getFragment(date, i, 14);
    }

    public static long getFragmentInMinutes(Calendar calendar, int i) {
        return getFragment(calendar, i, 12);
    }

    public static long getFragmentInMinutes(Date date, int i) {
        return getFragment(date, i, 12);
    }

    public static long getFragmentInSeconds(Calendar calendar, int i) {
        return getFragment(calendar, i, 13);
    }

    public static long getFragmentInSeconds(Date date, int i) {
        return getFragment(date, i, 13);
    }

    private static long getMillisPerUnit(int i) {
        switch (i) {
            case 5:
            case 6:
                return 86400000;
            case 11:
                return 3600000;
            case 12:
                return 60000;
            case 13:
                return 1000;
            case 14:
                return 1;
            default:
                throw new IllegalArgumentException(new StringBuffer().append("The unit ").append(i).append(" cannot be represented is milleseconds").toString());
        }
    }

    private static int indexOfSignChars(String str, int i) {
        int indexOf = StringUtils.indexOf(str, '+', i);
        return indexOf < 0 ? StringUtils.indexOf(str, '-', i) : indexOf;
    }

    public static boolean isSameDay(Calendar calendar, Calendar calendar2) {
        if (calendar != null && calendar2 != null) {
            return calendar.get(0) == calendar2.get(0) && calendar.get(1) == calendar2.get(1) && calendar.get(6) == calendar2.get(6);
        }
        throw new IllegalArgumentException("The date must not be null");
    }

    public static boolean isSameDay(Date date, Date date2) {
        if (date == null || date2 == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        Calendar instance2 = Calendar.getInstance();
        instance2.setTime(date2);
        return isSameDay(instance, instance2);
    }

    public static boolean isSameInstant(Calendar calendar, Calendar calendar2) {
        if (calendar != null && calendar2 != null) {
            return calendar.getTime().getTime() == calendar2.getTime().getTime();
        }
        throw new IllegalArgumentException("The date must not be null");
    }

    public static boolean isSameInstant(Date date, Date date2) {
        if (date != null && date2 != null) {
            return date.getTime() == date2.getTime();
        }
        throw new IllegalArgumentException("The date must not be null");
    }

    public static boolean isSameLocalTime(Calendar calendar, Calendar calendar2) {
        if (calendar != null && calendar2 != null) {
            return calendar.get(14) == calendar2.get(14) && calendar.get(13) == calendar2.get(13) && calendar.get(12) == calendar2.get(12) && calendar.get(10) == calendar2.get(10) && calendar.get(6) == calendar2.get(6) && calendar.get(1) == calendar2.get(1) && calendar.get(0) == calendar2.get(0) && calendar.getClass() == calendar2.getClass();
        }
        throw new IllegalArgumentException("The date must not be null");
    }

    public static Iterator iterator(Object obj, int i) {
        if (obj == null) {
            throw new IllegalArgumentException("The date must not be null");
        } else if (obj instanceof Date) {
            return iterator((Date) obj, i);
        } else {
            if (obj instanceof Calendar) {
                return iterator((Calendar) obj, i);
            }
            throw new ClassCastException(new StringBuffer().append("Could not iterate based on ").append(obj).toString());
        }
    }

    public static Iterator iterator(Calendar calendar, int i) {
        Calendar truncate;
        Calendar calendar2;
        int i2;
        int i3 = 2;
        if (calendar == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        switch (i) {
            case 1:
            case 2:
            case 3:
            case 4:
                Calendar truncate2 = truncate(calendar, 5);
                truncate = truncate(calendar, 5);
                switch (i) {
                    case 1:
                        i3 = 1;
                        calendar2 = truncate2;
                        i2 = 7;
                        break;
                    case 2:
                        calendar2 = truncate2;
                        i2 = 1;
                        break;
                    case 3:
                        i3 = calendar.get(7);
                        i2 = i3 - 1;
                        calendar2 = truncate2;
                        break;
                    case 4:
                        i3 = calendar.get(7) - 3;
                        i2 = calendar.get(7) + 3;
                        calendar2 = truncate2;
                        break;
                    default:
                        i3 = 1;
                        calendar2 = truncate2;
                        i2 = 7;
                        break;
                }
            case 5:
            case 6:
                calendar2 = truncate(calendar, 2);
                Calendar calendar3 = (Calendar) calendar2.clone();
                calendar3.add(2, 1);
                calendar3.add(5, -1);
                if (i != 6) {
                    i3 = 1;
                    i2 = 7;
                    truncate = calendar3;
                    break;
                } else {
                    i2 = 1;
                    truncate = calendar3;
                    break;
                }
            default:
                throw new IllegalArgumentException(new StringBuffer().append("The range style ").append(i).append(" is not valid.").toString());
        }
        int i4 = i3 < 1 ? i3 + 7 : i3;
        int i5 = i4 > 7 ? i4 - 7 : i4;
        int i6 = i2 < 1 ? i2 + 7 : i2;
        if (i6 > 7) {
            i6 -= 7;
        }
        while (calendar2.get(7) != i5) {
            calendar2.add(5, -1);
        }
        while (truncate.get(7) != i6) {
            truncate.add(5, 1);
        }
        return new DateIterator(calendar2, truncate);
    }

    public static Iterator iterator(Date date, int i) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        return iterator(instance, i);
    }

    /* JADX WARNING: Can't fix incorrect switch cases order */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void modify(java.util.Calendar r13, int r14, int r15) {
        /*
            r12 = 12
            r11 = 11
            r10 = 5
            r1 = 1
            r2 = 0
            int r0 = r13.get(r1)
            r3 = 280000000(0x10b07600, float:6.960157E-29)
            if (r0 <= r3) goto L_0x0018
            java.lang.ArithmeticException r0 = new java.lang.ArithmeticException
            java.lang.String r1 = "Calendar value too large for accurate calculations"
            r0.<init>(r1)
            throw r0
        L_0x0018:
            r0 = 14
            if (r14 != r0) goto L_0x001d
        L_0x001c:
            return
        L_0x001d:
            java.util.Date r3 = r13.getTime()
            long r4 = r3.getTime()
            r0 = 14
            int r0 = r13.get(r0)
            if (r15 == 0) goto L_0x0031
            r6 = 500(0x1f4, float:7.0E-43)
            if (r0 >= r6) goto L_0x0033
        L_0x0031:
            long r6 = (long) r0
            long r4 = r4 - r6
        L_0x0033:
            r0 = 13
            if (r14 != r0) goto L_0x0171
            r0 = r1
        L_0x0038:
            r6 = 13
            int r6 = r13.get(r6)
            if (r0 != 0) goto L_0x004b
            if (r15 == 0) goto L_0x0046
            r7 = 30
            if (r6 >= r7) goto L_0x004b
        L_0x0046:
            long r6 = (long) r6
            r8 = 1000(0x3e8, double:4.94E-321)
            long r6 = r6 * r8
            long r4 = r4 - r6
        L_0x004b:
            if (r14 != r12) goto L_0x004e
            r0 = r1
        L_0x004e:
            int r6 = r13.get(r12)
            if (r0 != 0) goto L_0x0060
            if (r15 == 0) goto L_0x005a
            r0 = 30
            if (r6 >= r0) goto L_0x0060
        L_0x005a:
            long r6 = (long) r6
            r8 = 60000(0xea60, double:2.9644E-319)
            long r6 = r6 * r8
            long r4 = r4 - r6
        L_0x0060:
            long r6 = r3.getTime()
            int r0 = (r6 > r4 ? 1 : (r6 == r4 ? 0 : -1))
            if (r0 == 0) goto L_0x006e
            r3.setTime(r4)
            r13.setTime(r3)
        L_0x006e:
            r0 = r2
            r3 = r2
        L_0x0070:
            int[][] r4 = fields
            int r4 = r4.length
            if (r0 >= r4) goto L_0x014e
            r4 = r2
        L_0x0076:
            int[][] r5 = fields
            r5 = r5[r0]
            int r5 = r5.length
            if (r4 >= r5) goto L_0x00ce
            int[][] r5 = fields
            r5 = r5[r0]
            r5 = r5[r4]
            if (r5 != r14) goto L_0x00cb
            r4 = 2
            if (r15 == r4) goto L_0x008c
            if (r15 != r1) goto L_0x001c
            if (r3 == 0) goto L_0x001c
        L_0x008c:
            r3 = 1001(0x3e9, float:1.403E-42)
            if (r14 != r3) goto L_0x00a7
            int r0 = r13.get(r10)
            if (r0 != r1) goto L_0x009c
            r0 = 15
            r13.add(r10, r0)
            goto L_0x001c
        L_0x009c:
            r0 = -15
            r13.add(r10, r0)
            r0 = 2
            r13.add(r0, r1)
            goto L_0x001c
        L_0x00a7:
            r3 = 9
            if (r14 != r3) goto L_0x00c0
            int r0 = r13.get(r11)
            if (r0 != 0) goto L_0x00b6
            r13.add(r11, r12)
            goto L_0x001c
        L_0x00b6:
            r0 = -12
            r13.add(r11, r0)
            r13.add(r10, r1)
            goto L_0x001c
        L_0x00c0:
            int[][] r3 = fields
            r0 = r3[r0]
            r0 = r0[r2]
            r13.add(r0, r1)
            goto L_0x001c
        L_0x00cb:
            int r4 = r4 + 1
            goto L_0x0076
        L_0x00ce:
            switch(r14) {
                case 9: goto L_0x0133;
                case 1001: goto L_0x0116;
                default: goto L_0x00d1;
            }
        L_0x00d1:
            r5 = r2
            r4 = r2
        L_0x00d3:
            if (r5 != 0) goto L_0x00fb
            int[][] r3 = fields
            r3 = r3[r0]
            r3 = r3[r2]
            int r3 = r13.getActualMinimum(r3)
            int[][] r4 = fields
            r4 = r4[r0]
            r4 = r4[r2]
            int r5 = r13.getActualMaximum(r4)
            int[][] r4 = fields
            r4 = r4[r0]
            r4 = r4[r2]
            int r4 = r13.get(r4)
            int r4 = r4 - r3
            int r3 = r5 - r3
            int r3 = r3 / 2
            if (r4 <= r3) goto L_0x014c
            r3 = r1
        L_0x00fb:
            if (r4 == 0) goto L_0x0112
            int[][] r5 = fields
            r5 = r5[r0]
            r5 = r5[r2]
            int[][] r6 = fields
            r6 = r6[r0]
            r6 = r6[r2]
            int r6 = r13.get(r6)
            int r4 = r6 - r4
            r13.set(r5, r4)
        L_0x0112:
            int r0 = r0 + 1
            goto L_0x0070
        L_0x0116:
            int[][] r4 = fields
            r4 = r4[r0]
            r4 = r4[r2]
            if (r4 != r10) goto L_0x00d1
            int r3 = r13.get(r10)
            int r3 = r3 + -1
            r4 = 15
            if (r3 < r4) goto L_0x016f
            int r3 = r3 + -15
            r4 = r3
        L_0x012b:
            r3 = 7
            if (r4 <= r3) goto L_0x0131
            r3 = r1
        L_0x012f:
            r5 = r1
            goto L_0x00d3
        L_0x0131:
            r3 = r2
            goto L_0x012f
        L_0x0133:
            int[][] r4 = fields
            r4 = r4[r0]
            r4 = r4[r2]
            if (r4 != r11) goto L_0x00d1
            int r3 = r13.get(r11)
            if (r3 < r12) goto L_0x016d
            int r3 = r3 + -12
            r4 = r3
        L_0x0144:
            r3 = 6
            if (r4 < r3) goto L_0x014a
            r3 = r1
        L_0x0148:
            r5 = r1
            goto L_0x00d3
        L_0x014a:
            r3 = r2
            goto L_0x0148
        L_0x014c:
            r3 = r2
            goto L_0x00fb
        L_0x014e:
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.StringBuffer r1 = new java.lang.StringBuffer
            r1.<init>()
            java.lang.String r2 = "The field "
            java.lang.StringBuffer r1 = r1.append(r2)
            java.lang.StringBuffer r1 = r1.append(r14)
            java.lang.String r2 = " is not supported"
            java.lang.StringBuffer r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x016d:
            r4 = r3
            goto L_0x0144
        L_0x016f:
            r4 = r3
            goto L_0x012b
        L_0x0171:
            r0 = r2
            goto L_0x0038
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.time.DateUtils.modify(java.util.Calendar, int, int):void");
    }

    public static Date parseDate(String str, String[] strArr) throws ParseException {
        return parseDateWithLeniency(str, strArr, true);
    }

    public static Date parseDateStrictly(String str, String[] strArr) throws ParseException {
        return parseDateWithLeniency(str, strArr, false);
    }

    private static Date parseDateWithLeniency(String str, String[] strArr, boolean z) throws ParseException {
        String str2;
        if (str == null || strArr == null) {
            throw new IllegalArgumentException("Date and Patterns must not be null");
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        simpleDateFormat.setLenient(z);
        ParsePosition parsePosition = new ParsePosition(0);
        for (int i = 0; i < strArr.length; i++) {
            String str3 = strArr[i];
            if (strArr[i].endsWith("ZZ")) {
                str3 = str3.substring(0, str3.length() - 1);
            }
            simpleDateFormat.applyPattern(str3);
            parsePosition.setIndex(0);
            if (strArr[i].endsWith("ZZ")) {
                int indexOfSignChars = indexOfSignChars(str, 0);
                str2 = str;
                while (indexOfSignChars >= 0) {
                    str2 = reformatTimezone(str2, indexOfSignChars);
                    indexOfSignChars = indexOfSignChars(str2, indexOfSignChars + 1);
                }
            } else {
                str2 = str;
            }
            Date parse = simpleDateFormat.parse(str2, parsePosition);
            if (parse != null && parsePosition.getIndex() == str2.length()) {
                return parse;
            }
        }
        throw new ParseException(new StringBuffer().append("Unable to parse the date: ").append(str).toString(), -1);
    }

    private static String reformatTimezone(String str, int i) {
        return (i < 0 || i + 5 >= str.length() || !Character.isDigit(str.charAt(i + 1)) || !Character.isDigit(str.charAt(i + 2)) || str.charAt(i + 3) != ':' || !Character.isDigit(str.charAt(i + 4)) || !Character.isDigit(str.charAt(i + 5))) ? str : new StringBuffer().append(str.substring(0, i + 3)).append(str.substring(i + 4)).toString();
    }

    public static Calendar round(Calendar calendar, int i) {
        if (calendar == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar calendar2 = (Calendar) calendar.clone();
        modify(calendar2, i, 1);
        return calendar2;
    }

    public static Date round(Object obj, int i) {
        if (obj == null) {
            throw new IllegalArgumentException("The date must not be null");
        } else if (obj instanceof Date) {
            return round((Date) obj, i);
        } else {
            if (obj instanceof Calendar) {
                return round((Calendar) obj, i).getTime();
            }
            throw new ClassCastException(new StringBuffer().append("Could not round ").append(obj).toString());
        }
    }

    public static Date round(Date date, int i) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        modify(instance, i, 1);
        return instance.getTime();
    }

    private static Date set(Date date, int i, int i2) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar instance = Calendar.getInstance();
        instance.setLenient(false);
        instance.setTime(date);
        instance.set(i, i2);
        return instance.getTime();
    }

    public static Date setDays(Date date, int i) {
        return set(date, 5, i);
    }

    public static Date setHours(Date date, int i) {
        return set(date, 11, i);
    }

    public static Date setMilliseconds(Date date, int i) {
        return set(date, 14, i);
    }

    public static Date setMinutes(Date date, int i) {
        return set(date, 12, i);
    }

    public static Date setMonths(Date date, int i) {
        return set(date, 2, i);
    }

    public static Date setSeconds(Date date, int i) {
        return set(date, 13, i);
    }

    public static Date setYears(Date date, int i) {
        return set(date, 1, i);
    }

    public static Calendar truncate(Calendar calendar, int i) {
        if (calendar == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar calendar2 = (Calendar) calendar.clone();
        modify(calendar2, i, 0);
        return calendar2;
    }

    public static Date truncate(Object obj, int i) {
        if (obj == null) {
            throw new IllegalArgumentException("The date must not be null");
        } else if (obj instanceof Date) {
            return truncate((Date) obj, i);
        } else {
            if (obj instanceof Calendar) {
                return truncate((Calendar) obj, i).getTime();
            }
            throw new ClassCastException(new StringBuffer().append("Could not truncate ").append(obj).toString());
        }
    }

    public static Date truncate(Date date, int i) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        modify(instance, i, 0);
        return instance.getTime();
    }
}
