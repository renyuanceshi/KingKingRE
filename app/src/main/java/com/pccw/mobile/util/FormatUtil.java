package com.pccw.mobile.util;

import android.util.Log;
import android.webkit.MimeTypeMap;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public class FormatUtil {
    public static String convertDateToCalendarStr(Date date) {
        return new SimpleDateFormat("yyyyMMddHHmm").format(date);
    }

    public static String convertDateToStr(Date date, String str) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(str, Locale.ENGLISH);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT+0000"));
        return date != null ? simpleDateFormat.format(date) : simpleDateFormat.format(new Date());
    }

    public static String convertDateToStrForAudioFileName() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss", Locale.ENGLISH);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT+0000"));
        return simpleDateFormat.format(new Date());
    }

    public static String convertDateToStrOnPhoneTimeZone(Date date, String str) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(str, Locale.ENGLISH);
        simpleDateFormat.setTimeZone(TimeZone.getDefault());
        return date != null ? simpleDateFormat.format(date) : simpleDateFormat.format(new Date());
    }

    public static String convertDurationSecondsToTimeStr(long j) {
        int i = ((int) j) % 60;
        int i2 = (int) ((j / 60) % 60);
        int i3 = (int) ((j / 3600) % 24);
        String num = Integer.toString(i);
        String num2 = Integer.toString(i2);
        String num3 = Integer.toString(i3);
        if (i < 10) {
            num = "0" + num;
        }
        if (i2 < 10) {
            num2 = "0" + num2;
        }
        if (i3 < 10) {
            num3 = "0" + num3;
        }
        return num3 + ":" + num2 + ":" + num;
    }

    public static String convertLongToCalendar(long j) {
        return new SimpleDateFormat("yyyyMMddHHmm").format(new Date(j));
    }

    public static String convertLongToStr(long j) {
        Date date = new Date(j);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT+0000"));
        return simpleDateFormat.format(date);
    }

    public static Date convertStrToDate(String str) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT+0000"));
        try {
            return simpleDateFormat.parse(str);
        } catch (Exception e) {
            return null;
        }
    }

    public static String getAudioMimeType(String str) {
        String fileExtensionFromUrl = MimeTypeMap.getFileExtensionFromUrl(str);
        Log.w("KKIM", " Sending File Extension = " + fileExtensionFromUrl);
        if (fileExtensionFromUrl == null) {
            return null;
        }
        String mimeTypeFromExtension = (fileExtensionFromUrl.equalsIgnoreCase("3gp") || fileExtensionFromUrl.equalsIgnoreCase("3gpp")) ? is3gpFileAudio(str) ? "audio/3gpp" : MimeTypeMap.getSingleton().getMimeTypeFromExtension(fileExtensionFromUrl) : MimeTypeMap.getSingleton().getMimeTypeFromExtension(fileExtensionFromUrl);
        if (!mimeTypeFromExtension.equalsIgnoreCase("application/ogg")) {
            return mimeTypeFromExtension;
        }
        Log.d("KKIM", "Formatting Audio File Type from application/ogg to audio/ogg");
        return "audio/ogg";
    }

    public static String getMimeType(String str) {
        String fileExtensionFromUrl = MimeTypeMap.getFileExtensionFromUrl(str);
        if (fileExtensionFromUrl != null) {
            return MimeTypeMap.getSingleton().getMimeTypeFromExtension(fileExtensionFromUrl);
        }
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0047  */
    /* JADX WARNING: Removed duplicated region for block: B:7:0x003b A[ORIG_RETURN, RETURN, SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean is3gpFileAudio(java.lang.String r5) {
        /*
            r1 = 0
            java.io.File r0 = new java.io.File
            r0.<init>(r5)
            android.media.MediaPlayer r2 = new android.media.MediaPlayer     // Catch:{ Exception -> 0x003d }
            r2.<init>()     // Catch:{ Exception -> 0x003d }
            java.io.FileInputStream r3 = new java.io.FileInputStream     // Catch:{ Exception -> 0x003d }
            r3.<init>(r0)     // Catch:{ Exception -> 0x003d }
            java.io.FileDescriptor r0 = r3.getFD()     // Catch:{ Exception -> 0x003d }
            r2.setDataSource(r0)     // Catch:{ Exception -> 0x003d }
            r2.prepare()     // Catch:{ Exception -> 0x003d }
            int r0 = r2.getVideoHeight()     // Catch:{ Exception -> 0x003d }
            r2.release()     // Catch:{ Exception -> 0x0049 }
        L_0x0021:
            java.lang.String r2 = "KKIM"
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r4 = "The height of the file is "
            java.lang.StringBuilder r3 = r3.append(r4)
            java.lang.StringBuilder r3 = r3.append(r0)
            java.lang.String r3 = r3.toString()
            android.util.Log.i(r2, r3)
            if (r0 != 0) goto L_0x0047
            r0 = 1
        L_0x003c:
            return r0
        L_0x003d:
            r2 = move-exception
            r0 = r1
        L_0x003f:
            java.lang.String r3 = "KKIM"
            java.lang.String r4 = "Exception trying to determine if 3gp file is video."
            android.util.Log.e(r3, r4, r2)
            goto L_0x0021
        L_0x0047:
            r0 = r1
            goto L_0x003c
        L_0x0049:
            r2 = move-exception
            goto L_0x003f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.pccw.mobile.util.FormatUtil.is3gpFileAudio(java.lang.String):boolean");
    }
}
