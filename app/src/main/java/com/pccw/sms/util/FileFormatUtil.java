package com.pccw.sms.util;

import java.text.SimpleDateFormat;

public class FileFormatUtil {
    public static String getExtractDbFileName(int i) {
        return "IM_v" + Integer.toString(i) + "_" + new SimpleDateFormat("yyyyMMdd_kkmmss").format(Long.valueOf(System.currentTimeMillis()));
    }
}
