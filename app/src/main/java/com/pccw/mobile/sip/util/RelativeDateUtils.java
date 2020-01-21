package com.pccw.mobile.sip.util;

import android.content.Context;
import android.content.res.Resources;

import java.util.Date;
import org.apache.commons.lang3.StringUtils;

public class RelativeDateUtils {
    public static final String ABBREV_MONTH_FORMAT = "%b";
    public static final String ABBREV_WEEKDAY_FORMAT = "%a";
    public static final long DAY_IN_MILLIS = 86400000;
    public static final int FORMAT_12HOUR = 64;
    public static final int FORMAT_24HOUR = 128;
    public static final int FORMAT_ABBREV_ALL = 524288;
    public static final int FORMAT_ABBREV_MONTH = 65536;
    public static final int FORMAT_ABBREV_RELATIVE = 262144;
    public static final int FORMAT_ABBREV_TIME = 16384;
    public static final int FORMAT_ABBREV_WEEKDAY = 32768;
    public static final int FORMAT_CAP_AMPM = 256;
    public static final int FORMAT_CAP_MIDNIGHT = 4096;
    public static final int FORMAT_CAP_NOON = 1024;
    public static final int FORMAT_CAP_NOON_MIDNIGHT = 5120;
    public static final int FORMAT_NO_MIDNIGHT = 2048;
    public static final int FORMAT_NO_MONTH_DAY = 32;
    public static final int FORMAT_NO_NOON = 512;
    public static final int FORMAT_NO_NOON_MIDNIGHT = 2560;
    public static final int FORMAT_NO_YEAR = 8;
    public static final int FORMAT_NUMERIC_DATE = 131072;
    public static final int FORMAT_SHOW_DATE = 16;
    public static final int FORMAT_SHOW_TIME = 1;
    public static final int FORMAT_SHOW_WEEKDAY = 2;
    public static final int FORMAT_SHOW_YEAR = 4;
    public static final int FORMAT_UTC = 8192;
    public static final long HOUR_IN_MILLIS = 3600000;
    public static final String HOUR_MINUTE_24 = "%H:%M";
    public static final int LENGTH_LONG = 10;
    public static final int LENGTH_MEDIUM = 20;
    public static final int LENGTH_SHORT = 30;
    public static final int LENGTH_SHORTER = 40;
    public static final int LENGTH_SHORTEST = 50;
    public static final long MINUTE_IN_MILLIS = 60000;
    public static final String MONTH_DAY_FORMAT = "%-d";
    public static final String MONTH_FORMAT = "%B";
    public static final String NUMERIC_MONTH_FORMAT = "%m";
    public static final long SECOND_IN_MILLIS = 1000;
    public static final String WEEKDAY_FORMAT = "%A";
    public static final long WEEK_IN_MILLIS = 604800000;
    public static final String YEAR_FORMAT = "%Y";
    public static final String YEAR_FORMAT_TWO_DIGITS = "%g";
    public static final long YEAR_IN_MILLIS = 31449600000L;
    private static final int[] sDays = {R.string.day_of_month_1, R.string.day_of_month_2, R.string.day_of_month_3, R.string.day_of_month_4, R.string.day_of_month_5, R.string.day_of_month_6, R.string.day_of_month_7, R.string.day_of_month_8, R.string.day_of_month_9, R.string.day_of_month_10, R.string.day_of_month_11, R.string.day_of_month_12, R.string.day_of_month_13, R.string.day_of_month_14, R.string.day_of_month_15, R.string.day_of_month_16, R.string.day_of_month_17, R.string.day_of_month_18, R.string.day_of_month_19, R.string.day_of_month_20, R.string.day_of_month_21, R.string.day_of_month_22, R.string.day_of_month_23, R.string.day_of_month_24, R.string.day_of_month_25, R.string.day_of_month_26, R.string.day_of_month_27, R.string.day_of_month_28, R.string.day_of_month_29, R.string.day_of_month_30, R.string.day_of_month_31};
    private static final int[] sMonthsLong = {R.string.month_long_january, R.string.month_long_february, R.string.month_long_march, R.string.month_long_april, R.string.month_long_may, R.string.month_long_june, R.string.month_long_july, R.string.month_long_august, R.string.month_long_september, R.string.month_long_october, R.string.month_long_november, R.string.month_long_december};
    private static final int[] sMonthsMedium = {R.string.month_medium_january, R.string.month_medium_february, R.string.month_medium_march, R.string.month_medium_april, R.string.month_medium_may, R.string.month_medium_june, R.string.month_medium_july, R.string.month_medium_august, R.string.month_medium_september, R.string.month_medium_october, R.string.month_medium_november, R.string.month_medium_december};
    private static final int[] sMonthsShortest = {R.string.month_shortest_january, R.string.month_shortest_february, R.string.month_shortest_march, R.string.month_shortest_april, R.string.month_shortest_may, R.string.month_shortest_june, R.string.month_shortest_july, R.string.month_shortest_august, R.string.month_shortest_september, R.string.month_shortest_october, R.string.month_shortest_november, R.string.month_shortest_december};
    public static final int[] sameMonthTable = {R.string.same_month_md1_md2, R.string.same_month_wday1_md1_wday2_md2, R.string.same_month_mdy1_mdy2, R.string.same_month_wday1_mdy1_wday2_mdy2, R.string.same_month_md1_time1_md2_time2, R.string.same_month_wday1_md1_time1_wday2_md2_time2, R.string.same_month_mdy1_time1_mdy2_time2, R.string.same_month_wday1_mdy1_time1_wday2_mdy2_time2, R.string.numeric_md1_md2, R.string.numeric_wday1_md1_wday2_md2, R.string.numeric_mdy1_mdy2, R.string.numeric_wday1_mdy1_wday2_mdy2, R.string.numeric_md1_time1_md2_time2, R.string.numeric_wday1_md1_time1_wday2_md2_time2, R.string.numeric_mdy1_time1_mdy2_time2, R.string.numeric_wday1_mdy1_time1_wday2_mdy2_time2};
    public static final int[] sameYearTable = {R.string.same_year_md1_md2, R.string.same_year_wday1_md1_wday2_md2, R.string.same_year_mdy1_mdy2, R.string.same_year_wday1_mdy1_wday2_mdy2, R.string.same_year_md1_time1_md2_time2, R.string.same_year_wday1_md1_time1_wday2_md2_time2, R.string.same_year_mdy1_time1_mdy2_time2, R.string.same_year_wday1_mdy1_time1_wday2_mdy2_time2, R.string.numeric_md1_md2, R.string.numeric_wday1_md1_wday2_md2, R.string.numeric_mdy1_mdy2, R.string.numeric_wday1_mdy1_wday2_mdy2, R.string.numeric_md1_time1_md2_time2, R.string.numeric_wday1_md1_time1_wday2_md2_time2, R.string.numeric_mdy1_time1_mdy2_time2, R.string.numeric_wday1_mdy1_time1_wday2_mdy2_time2};

    public static String formatDateRange(Context context, long j) {
        Date date = new Date(j);
        return getMonthString(context, date.getMonth(), 10) + StringUtils.SPACE + getDayString(context, date.getDate());
    }

    public static String getDayString(Context context, int i) {
        return context.getResources().getString(sDays[i - 1]);
    }

    public static String getMonthString(Context context, int i, int i2) {
        int[] iArr;
        switch (i2) {
            case 10:
                iArr = sMonthsLong;
                break;
            case 20:
                iArr = sMonthsMedium;
                break;
            case 30:
                iArr = sMonthsMedium;
                break;
            case 40:
                iArr = sMonthsMedium;
                break;
            case 50:
                iArr = sMonthsShortest;
                break;
            default:
                iArr = sMonthsMedium;
                break;
        }
        return context.getResources().getString(iArr[i + 0]);
    }

    public static CharSequence getRelativeTimeSpanString(Context context, long j, long j2, long j3, int i) {
        long j4;
        int i2;
        Resources resources = context.getResources();
        boolean z = (786432 & i) != 0;
        boolean z2 = j2 >= j;
        long abs = Math.abs(j2 - j);
        if (abs < 60000 && j3 < 60000) {
            j4 = abs / 1000;
            i2 = z2 ? z ? R.plurals.abbrev_num_seconds_ago : R.plurals.num_seconds_ago : z ? R.plurals.abbrev_in_num_seconds : R.plurals.in_num_seconds;
        } else if (abs < 3600000 && j3 < 3600000) {
            j4 = abs / 60000;
            i2 = z2 ? z ? R.plurals.abbrev_num_minutes_ago : R.plurals.num_minutes_ago : z ? R.plurals.abbrev_in_num_minutes : R.plurals.in_num_minutes;
        } else if (abs < 86400000 && j3 < 86400000) {
            j4 = abs / 3600000;
            i2 = z2 ? z ? R.plurals.abbrev_num_hours_ago : R.plurals.num_hours_ago : z ? R.plurals.abbrev_in_num_hours : R.plurals.in_num_hours;
        } else if (abs >= WEEK_IN_MILLIS || j3 >= WEEK_IN_MILLIS) {
            return formatDateRange(context, j);
        } else {
            j4 = abs / 86400000;
            i2 = z2 ? z ? R.plurals.abbrev_num_days_ago : R.plurals.num_days_ago : z ? R.plurals.abbrev_in_num_days : R.plurals.in_num_days;
        }
        return String.format(resources.getQuantityString(i2, (int) j4), new Object[]{Long.valueOf(j4)});
    }
}
