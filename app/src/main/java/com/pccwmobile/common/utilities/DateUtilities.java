package com.pccwmobile.common.utilities;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtilities {
    public static String convertCalendarToString(Calendar calendar, String str) {
        return new SimpleDateFormat(str).format(calendar.getTime());
    }

    public static Calendar convertStringToCalendar(String str, String str2) {
        try {
            Date parse = new SimpleDateFormat(str2).parse(str);
            Calendar instance = Calendar.getInstance();
            instance.setTime(parse);
            return instance;
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
