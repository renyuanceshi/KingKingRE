package org.apache.http.client.utils;

import java.lang.ref.SoftReference;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;

@Immutable
public final class DateUtils {
    private static final String[] DEFAULT_PATTERNS = {"EEE, dd MMM yyyy HH:mm:ss zzz", "EEE, dd-MMM-yy HH:mm:ss zzz", "EEE MMM d HH:mm:ss yyyy"};
    private static final Date DEFAULT_TWO_DIGIT_YEAR_START;
    public static final TimeZone GMT = TimeZone.getTimeZone("GMT");
    public static final String PATTERN_ASCTIME = "EEE MMM d HH:mm:ss yyyy";
    public static final String PATTERN_RFC1036 = "EEE, dd-MMM-yy HH:mm:ss zzz";
    public static final String PATTERN_RFC1123 = "EEE, dd MMM yyyy HH:mm:ss zzz";

    static final class DateFormatHolder {
        private static final ThreadLocal<SoftReference<Map<String, SimpleDateFormat>>> THREADLOCAL_FORMATS = new ThreadLocal<SoftReference<Map<String, SimpleDateFormat>>>() {
            /* access modifiers changed from: protected */
            public SoftReference<Map<String, SimpleDateFormat>> initialValue() {
                return new SoftReference<>(new HashMap());
            }
        };

        DateFormatHolder() {
        }

        public static void clearThreadLocal() {
            THREADLOCAL_FORMATS.remove();
        }

        public static SimpleDateFormat formatFor(String str) {
            HashMap hashMap;
            Map map = (Map) THREADLOCAL_FORMATS.get().get();
            if (map == null) {
                HashMap hashMap2 = new HashMap();
                THREADLOCAL_FORMATS.set(new SoftReference(hashMap2));
                hashMap = hashMap2;
            } else {
                hashMap = map;
            }
            SimpleDateFormat simpleDateFormat = (SimpleDateFormat) hashMap.get(str);
            if (simpleDateFormat != null) {
                return simpleDateFormat;
            }
            SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat(str, Locale.US);
            simpleDateFormat2.setTimeZone(TimeZone.getTimeZone("GMT"));
            hashMap.put(str, simpleDateFormat2);
            return simpleDateFormat2;
        }
    }

    static {
        Calendar instance = Calendar.getInstance();
        instance.setTimeZone(GMT);
        instance.set(2000, 0, 1, 0, 0, 0);
        instance.set(14, 0);
        DEFAULT_TWO_DIGIT_YEAR_START = instance.getTime();
    }

    private DateUtils() {
    }

    public static void clearThreadLocal() {
        DateFormatHolder.clearThreadLocal();
    }

    public static String formatDate(Date date) {
        return formatDate(date, "EEE, dd MMM yyyy HH:mm:ss zzz");
    }

    public static String formatDate(Date date, String str) {
        Args.notNull(date, "Date");
        Args.notNull(str, "Pattern");
        return DateFormatHolder.formatFor(str).format(date);
    }

    public static Date parseDate(String str) {
        return parseDate(str, (String[]) null, (Date) null);
    }

    public static Date parseDate(String str, String[] strArr) {
        return parseDate(str, strArr, (Date) null);
    }

    public static Date parseDate(String str, String[] strArr, Date date) {
        Args.notNull(str, "Date value");
        if (strArr == null) {
            strArr = DEFAULT_PATTERNS;
        }
        if (date == null) {
            date = DEFAULT_TWO_DIGIT_YEAR_START;
        }
        if (str.length() > 1 && str.startsWith("'") && str.endsWith("'")) {
            str = str.substring(1, str.length() - 1);
        }
        for (String formatFor : strArr) {
            SimpleDateFormat formatFor2 = DateFormatHolder.formatFor(formatFor);
            formatFor2.set2DigitYearStart(date);
            ParsePosition parsePosition = new ParsePosition(0);
            Date parse = formatFor2.parse(str, parsePosition);
            if (parsePosition.getIndex() != 0) {
                return parse;
            }
        }
        return null;
    }
}
