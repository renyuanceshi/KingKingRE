package org.apache.commons.lang3.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.ParsePosition;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.SortedMap;
import java.util.TimeZone;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FastDateParser implements DateParser, Serializable {
    private static final Strategy ABBREVIATED_YEAR_STRATEGY = new NumberStrategy(1) {
        /* access modifiers changed from: package-private */
        public void setCalendar(FastDateParser fastDateParser, Calendar calendar, String str) {
            int parseInt = Integer.parseInt(str);
            if (parseInt < 100) {
                parseInt = fastDateParser.adjustYear(parseInt);
            }
            calendar.set(1, parseInt);
        }
    };
    private static final Strategy DAY_OF_MONTH_STRATEGY = new NumberStrategy(5);
    private static final Strategy DAY_OF_WEEK_IN_MONTH_STRATEGY = new NumberStrategy(8);
    private static final Strategy DAY_OF_YEAR_STRATEGY = new NumberStrategy(6);
    private static final Strategy HOUR_OF_DAY_STRATEGY = new NumberStrategy(11);
    private static final Strategy HOUR_STRATEGY = new NumberStrategy(10);
    static final Locale JAPANESE_IMPERIAL = new Locale("ja", "JP", "JP");
    private static final Strategy LITERAL_YEAR_STRATEGY = new NumberStrategy(1);
    private static final Strategy MILLISECOND_STRATEGY = new NumberStrategy(14);
    private static final Strategy MINUTE_STRATEGY = new NumberStrategy(12);
    private static final Strategy MODULO_HOUR_OF_DAY_STRATEGY = new NumberStrategy(11) {
        /* access modifiers changed from: package-private */
        public int modify(int i) {
            return i % 24;
        }
    };
    private static final Strategy MODULO_HOUR_STRATEGY = new NumberStrategy(10) {
        /* access modifiers changed from: package-private */
        public int modify(int i) {
            return i % 12;
        }
    };
    private static final Strategy NUMBER_MONTH_STRATEGY = new NumberStrategy(2) {
        /* access modifiers changed from: package-private */
        public int modify(int i) {
            return i - 1;
        }
    };
    private static final Strategy SECOND_STRATEGY = new NumberStrategy(13);
    private static final Strategy WEEK_OF_MONTH_STRATEGY = new NumberStrategy(4);
    private static final Strategy WEEK_OF_YEAR_STRATEGY = new NumberStrategy(3);
    private static ConcurrentMap<Locale, Strategy>[] caches = new ConcurrentMap[17];
    private static final Pattern formatPattern = Pattern.compile("D+|E+|F+|G+|H+|K+|M+|S+|W+|Z+|a+|d+|h+|k+|m+|s+|w+|y+|z+|''|'[^']++(''[^']*+)*+'|[^'A-Za-z]++");
    private static final long serialVersionUID = 1;
    private transient String currentFormatField;
    private final Locale locale;
    private transient Strategy nextStrategy;
    private transient Pattern parsePattern;
    private final String pattern;
    private transient Strategy[] strategies;
    private transient int thisYear;
    private final TimeZone timeZone;

    private static class CopyQuotedStrategy extends Strategy {
        private final String formatField;

        CopyQuotedStrategy(String str) {
            super();
            this.formatField = str;
        }

        /* access modifiers changed from: package-private */
        public boolean addRegex(FastDateParser fastDateParser, StringBuilder sb) {
            StringBuilder unused = FastDateParser.escapeRegex(sb, this.formatField, true);
            return false;
        }

        /* access modifiers changed from: package-private */
        public boolean isNumber() {
            char charAt = this.formatField.charAt(0);
            if (charAt == '\'') {
                charAt = this.formatField.charAt(1);
            }
            return Character.isDigit(charAt);
        }
    }

    private static class NumberStrategy extends Strategy {
        private final int field;

        NumberStrategy(int i) {
            super();
            this.field = i;
        }

        /* access modifiers changed from: package-private */
        public boolean addRegex(FastDateParser fastDateParser, StringBuilder sb) {
            if (fastDateParser.isNextNumber()) {
                sb.append("(\\p{IsNd}{").append(fastDateParser.getFieldWidth()).append("}+)");
                return true;
            }
            sb.append("(\\p{IsNd}++)");
            return true;
        }

        /* access modifiers changed from: package-private */
        public boolean isNumber() {
            return true;
        }

        /* access modifiers changed from: package-private */
        public int modify(int i) {
            return i;
        }

        /* access modifiers changed from: package-private */
        public void setCalendar(FastDateParser fastDateParser, Calendar calendar, String str) {
            calendar.set(this.field, modify(Integer.parseInt(str)));
        }
    }

    private static abstract class Strategy {
        private Strategy() {
        }

        /* access modifiers changed from: package-private */
        public abstract boolean addRegex(FastDateParser fastDateParser, StringBuilder sb);

        /* access modifiers changed from: package-private */
        public boolean isNumber() {
            return false;
        }

        /* access modifiers changed from: package-private */
        public void setCalendar(FastDateParser fastDateParser, Calendar calendar, String str) {
        }
    }

    private static class TextStrategy extends Strategy {
        private final int field;
        private final Map<String, Integer> keyValues;

        TextStrategy(int i, Calendar calendar, Locale locale) {
            super();
            this.field = i;
            this.keyValues = FastDateParser.getDisplayNames(i, calendar, locale);
        }

        /* access modifiers changed from: package-private */
        public boolean addRegex(FastDateParser fastDateParser, StringBuilder sb) {
            sb.append('(');
            for (String access$100 : this.keyValues.keySet()) {
                FastDateParser.escapeRegex(sb, access$100, false).append('|');
            }
            sb.setCharAt(sb.length() - 1, ')');
            return true;
        }

        /* access modifiers changed from: package-private */
        public void setCalendar(FastDateParser fastDateParser, Calendar calendar, String str) {
            Integer num = this.keyValues.get(str);
            if (num == null) {
                StringBuilder sb = new StringBuilder(str);
                sb.append(" not in (");
                for (String append : this.keyValues.keySet()) {
                    sb.append(append).append(' ');
                }
                sb.setCharAt(sb.length() - 1, ')');
                throw new IllegalArgumentException(sb.toString());
            }
            calendar.set(this.field, num.intValue());
        }
    }

    private static class TimeZoneStrategy extends Strategy {
        private static final int ID = 0;
        private static final int LONG_DST = 3;
        private static final int LONG_STD = 1;
        private static final int SHORT_DST = 4;
        private static final int SHORT_STD = 2;
        private final SortedMap<String, TimeZone> tzNames = new TreeMap(String.CASE_INSENSITIVE_ORDER);
        private final String validTimeZoneChars;

        TimeZoneStrategy(Locale locale) {
            super();
            for (String[] strArr : DateFormatSymbols.getInstance(locale).getZoneStrings()) {
                if (!strArr[0].startsWith("GMT")) {
                    TimeZone timeZone = TimeZone.getTimeZone(strArr[0]);
                    if (!this.tzNames.containsKey(strArr[1])) {
                        this.tzNames.put(strArr[1], timeZone);
                    }
                    if (!this.tzNames.containsKey(strArr[2])) {
                        this.tzNames.put(strArr[2], timeZone);
                    }
                    if (timeZone.useDaylightTime()) {
                        if (!this.tzNames.containsKey(strArr[3])) {
                            this.tzNames.put(strArr[3], timeZone);
                        }
                        if (!this.tzNames.containsKey(strArr[4])) {
                            this.tzNames.put(strArr[4], timeZone);
                        }
                    }
                }
            }
            StringBuilder sb = new StringBuilder();
            sb.append("(GMT[+\\-]\\d{0,1}\\d{2}|[+\\-]\\d{2}:?\\d{2}|");
            for (String access$100 : this.tzNames.keySet()) {
                FastDateParser.escapeRegex(sb, access$100, false).append('|');
            }
            sb.setCharAt(sb.length() - 1, ')');
            this.validTimeZoneChars = sb.toString();
        }

        /* access modifiers changed from: package-private */
        public boolean addRegex(FastDateParser fastDateParser, StringBuilder sb) {
            sb.append(this.validTimeZoneChars);
            return true;
        }

        /* access modifiers changed from: package-private */
        public void setCalendar(FastDateParser fastDateParser, Calendar calendar, String str) {
            TimeZone timeZone;
            if (str.charAt(0) == '+' || str.charAt(0) == '-') {
                timeZone = TimeZone.getTimeZone("GMT" + str);
            } else if (str.startsWith("GMT")) {
                timeZone = TimeZone.getTimeZone(str);
            } else {
                timeZone = (TimeZone) this.tzNames.get(str);
                if (timeZone == null) {
                    throw new IllegalArgumentException(str + " is not a supported timezone name");
                }
            }
            calendar.setTimeZone(timeZone);
        }
    }

    protected FastDateParser(String str, TimeZone timeZone2, Locale locale2) {
        this.pattern = str;
        this.timeZone = timeZone2;
        this.locale = locale2;
        init();
    }

    /* access modifiers changed from: private */
    public static StringBuilder escapeRegex(StringBuilder sb, String str, boolean z) {
        char charAt;
        int i;
        sb.append("\\Q");
        int i2 = 0;
        while (true) {
            if (i2 < str.length()) {
                charAt = str.charAt(i2);
                switch (charAt) {
                    case '\'':
                        if (!z) {
                            i = i2;
                            break;
                        } else {
                            i = i2 + 1;
                            if (i == str.length()) {
                                break;
                            } else {
                                charAt = str.charAt(i);
                                continue;
                            }
                        }
                    case '\\':
                        i = i2 + 1;
                        if (i != str.length()) {
                            sb.append(charAt);
                            char charAt2 = str.charAt(i);
                            if (charAt2 != 'E') {
                                charAt = charAt2;
                                break;
                            } else {
                                sb.append("E\\\\E\\");
                                charAt = 'Q';
                                break;
                            }
                        } else {
                            continue;
                        }
                    default:
                        i = i2;
                        continue;
                }
            } else {
                sb.append("\\E");
            }
            sb.append(charAt);
            i2 = i + 1;
        }
        return sb;
    }

    private static ConcurrentMap<Locale, Strategy> getCache(int i) {
        ConcurrentMap<Locale, Strategy> concurrentMap;
        synchronized (caches) {
            if (caches[i] == null) {
                caches[i] = new ConcurrentHashMap(3);
            }
            concurrentMap = caches[i];
        }
        return concurrentMap;
    }

    /* access modifiers changed from: private */
    public static Map<String, Integer> getDisplayNames(int i, Calendar calendar, Locale locale2) {
        return calendar.getDisplayNames(i, 0, locale2);
    }

    private Strategy getLocaleSpecificStrategy(int i, Calendar calendar) {
        TimeZoneStrategy timeZoneStrategy;
        ConcurrentMap<Locale, Strategy> cache = getCache(i);
        Strategy strategy = (Strategy) cache.get(this.locale);
        if (strategy == null) {
            timeZoneStrategy = i == 15 ? new TimeZoneStrategy(this.locale) : new TextStrategy(i, calendar, this.locale);
            Strategy putIfAbsent = cache.putIfAbsent(this.locale, timeZoneStrategy);
            if (putIfAbsent != null) {
                return putIfAbsent;
            }
        } else {
            timeZoneStrategy = strategy;
        }
        return timeZoneStrategy;
    }

    private Strategy getStrategy(String str, Calendar calendar) {
        switch (str.charAt(0)) {
            case '\'':
                if (str.length() > 2) {
                    str = str.substring(1, str.length() - 1);
                    break;
                }
                break;
            case 'D':
                return DAY_OF_YEAR_STRATEGY;
            case 'E':
                return getLocaleSpecificStrategy(7, calendar);
            case 'F':
                return DAY_OF_WEEK_IN_MONTH_STRATEGY;
            case 'G':
                return getLocaleSpecificStrategy(0, calendar);
            case 'H':
                return MODULO_HOUR_OF_DAY_STRATEGY;
            case 'K':
                return HOUR_STRATEGY;
            case 'M':
                return str.length() >= 3 ? getLocaleSpecificStrategy(2, calendar) : NUMBER_MONTH_STRATEGY;
            case 'S':
                return MILLISECOND_STRATEGY;
            case 'W':
                return WEEK_OF_MONTH_STRATEGY;
            case 'Z':
            case 'z':
                return getLocaleSpecificStrategy(15, calendar);
            case 'a':
                return getLocaleSpecificStrategy(9, calendar);
            case 'd':
                return DAY_OF_MONTH_STRATEGY;
            case 'h':
                return MODULO_HOUR_STRATEGY;
            case 'k':
                return HOUR_OF_DAY_STRATEGY;
            case 'm':
                return MINUTE_STRATEGY;
            case 's':
                return SECOND_STRATEGY;
            case 'w':
                return WEEK_OF_YEAR_STRATEGY;
            case 'y':
                return str.length() > 2 ? LITERAL_YEAR_STRATEGY : ABBREVIATED_YEAR_STRATEGY;
        }
        return new CopyQuotedStrategy(str);
    }

    private void init() {
        Calendar instance = Calendar.getInstance(this.timeZone, this.locale);
        this.thisYear = instance.get(1);
        StringBuilder sb = new StringBuilder();
        ArrayList arrayList = new ArrayList();
        Matcher matcher = formatPattern.matcher(this.pattern);
        if (!matcher.lookingAt()) {
            throw new IllegalArgumentException("Illegal pattern character '" + this.pattern.charAt(matcher.regionStart()) + "'");
        }
        this.currentFormatField = matcher.group();
        Strategy strategy = getStrategy(this.currentFormatField, instance);
        while (true) {
            matcher.region(matcher.end(), matcher.regionEnd());
            if (!matcher.lookingAt()) {
                break;
            }
            String group = matcher.group();
            this.nextStrategy = getStrategy(group, instance);
            if (strategy.addRegex(this, sb)) {
                arrayList.add(strategy);
            }
            this.currentFormatField = group;
            strategy = this.nextStrategy;
        }
        this.nextStrategy = null;
        if (matcher.regionStart() != matcher.regionEnd()) {
            throw new IllegalArgumentException("Failed to parse \"" + this.pattern + "\" ; gave up at index " + matcher.regionStart());
        }
        if (strategy.addRegex(this, sb)) {
            arrayList.add(strategy);
        }
        this.currentFormatField = null;
        this.strategies = (Strategy[]) arrayList.toArray(new Strategy[arrayList.size()]);
        this.parsePattern = Pattern.compile(sb.toString());
    }

    private void readObject(ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        objectInputStream.defaultReadObject();
        init();
    }

    /* access modifiers changed from: package-private */
    public int adjustYear(int i) {
        int i2 = (this.thisYear + i) - (this.thisYear % 100);
        return i2 < this.thisYear + 20 ? i2 : i2 - 100;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof FastDateParser)) {
            return false;
        }
        FastDateParser fastDateParser = (FastDateParser) obj;
        return this.pattern.equals(fastDateParser.pattern) && this.timeZone.equals(fastDateParser.timeZone) && this.locale.equals(fastDateParser.locale);
    }

    /* access modifiers changed from: package-private */
    public int getFieldWidth() {
        return this.currentFormatField.length();
    }

    public Locale getLocale() {
        return this.locale;
    }

    /* access modifiers changed from: package-private */
    public Pattern getParsePattern() {
        return this.parsePattern;
    }

    public String getPattern() {
        return this.pattern;
    }

    public TimeZone getTimeZone() {
        return this.timeZone;
    }

    public int hashCode() {
        return this.pattern.hashCode() + ((this.timeZone.hashCode() + (this.locale.hashCode() * 13)) * 13);
    }

    /* access modifiers changed from: package-private */
    public boolean isNextNumber() {
        return this.nextStrategy != null && this.nextStrategy.isNumber();
    }

    public Date parse(String str) throws ParseException {
        Date parse = parse(str, new ParsePosition(0));
        if (parse != null) {
            return parse;
        }
        if (this.locale.equals(JAPANESE_IMPERIAL)) {
            throw new ParseException("(The " + this.locale + " locale does not support dates before 1868 AD)\n" + "Unparseable date: \"" + str + "\" does not match " + this.parsePattern.pattern(), 0);
        }
        throw new ParseException("Unparseable date: \"" + str + "\" does not match " + this.parsePattern.pattern(), 0);
    }

    public Date parse(String str, ParsePosition parsePosition) {
        int index = parsePosition.getIndex();
        Matcher matcher = this.parsePattern.matcher(str.substring(index));
        if (!matcher.lookingAt()) {
            return null;
        }
        Calendar instance = Calendar.getInstance(this.timeZone, this.locale);
        instance.clear();
        int i = 0;
        while (i < this.strategies.length) {
            int i2 = i + 1;
            this.strategies[i].setCalendar(this, instance, matcher.group(i2));
            i = i2;
        }
        parsePosition.setIndex(matcher.end() + index);
        return instance.getTime();
    }

    public Object parseObject(String str) throws ParseException {
        return parse(str);
    }

    public Object parseObject(String str, ParsePosition parsePosition) {
        return parse(str, parsePosition);
    }

    public String toString() {
        return "FastDateParser[" + this.pattern + "," + this.locale + "," + this.timeZone.getID() + "]";
    }
}
