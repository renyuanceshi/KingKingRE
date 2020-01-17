package com.pccw.sms.util;

import android.content.Context;
import android.text.Editable;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.StringUtil;
import com.pccwmobile.common.utilities.Log;

public class ConcatUtil {
    public static int maxCharCountCh = 0;
    public static int maxCharCountCh2 = 0;
    public static int maxCharCountEn = 0;
    public static int maxCharCountEn2 = 0;
    public static int maxConcatCount = 0;

    public static Integer[] getCharAndConcatCount(Context context, String str) {
        int i;
        int i2;
        int i3;
        maxConcatCount = getMaxConcatCount(context);
        maxCharCountCh = getMaxCharCountCh(context);
        maxCharCountCh2 = getMaxCharCountCh2(context);
        maxCharCountEn = getMaxCharCountEn(context);
        maxCharCountEn2 = getMaxCharCountEn2(context);
        if (StringUtil.isContainChinese(str)) {
            i = maxCharCountCh;
            i2 = maxCharCountCh2;
        } else {
            i = maxCharCountEn;
            i2 = maxCharCountEn2;
        }
        if (str.length() - i > 0) {
            i3 = (str.length() / i) + 1;
            if (str.length() - (i2 * 2) > 0) {
                i3 = ((str.length() - 1) / i2) + 1;
            }
        } else {
            i3 = 1;
        }
        Log.d("test", "-------------------");
        int length = i3 == 1 ? i - str.length() : (i3 * i2) - str.length();
        Log.d("test", "$charCount = " + length);
        Log.d("test", "$concatCount = " + i3);
        return new Integer[]{Integer.valueOf(length), Integer.valueOf(i3), Integer.valueOf(i2 * maxConcatCount), Integer.valueOf(maxConcatCount)};
    }

    public static int getDeleteIndex(String str, Editable editable, String str2, int i, int i2) {
        int i3;
        int i4;
        if (StringUtil.isContainChinese(str)) {
            i3 = maxCharCountCh;
            i4 = maxCharCountCh2;
        } else {
            i3 = maxCharCountEn;
            i4 = maxCharCountEn2;
        }
        int i5 = i == 1 ? i3 - i2 : (i4 * i) - i2;
        int i6 = StringUtil.isContainChinese(editable.toString()) ? maxCharCountCh2 * maxConcatCount : maxCharCountEn2 * maxConcatCount;
        if (i5 - i6 > 0) {
            return editable.length() - str2.length();
        }
        return (i6 - i5) + (editable.length() - str2.length());
    }

    public static int getMaxCharCountCh(Context context) {
        if (maxCharCountCh == 0) {
            String string = context.getResources().getString(R.string.maxCharCount_ch);
            if ("".equals(string) || string == null) {
                maxCharCountCh = 70;
            } else {
                maxCharCountCh = Integer.valueOf(string).intValue();
            }
        }
        return maxCharCountCh;
    }

    public static int getMaxCharCountCh2(Context context) {
        if (maxCharCountCh2 == 0) {
            String string = context.getResources().getString(R.string.maxCharCount_ch2);
            if ("".equals(string) || string == null) {
                maxCharCountCh2 = 67;
            } else {
                maxCharCountCh2 = Integer.valueOf(string).intValue();
            }
        }
        return maxCharCountCh2;
    }

    public static int getMaxCharCountEn(Context context) {
        if (maxCharCountEn == 0) {
            String string = context.getResources().getString(R.string.maxCharCount_en);
            if ("".equals(string) || string == null) {
                maxCharCountEn = 160;
            } else {
                maxCharCountEn = Integer.valueOf(string).intValue();
            }
        }
        return maxCharCountEn;
    }

    public static int getMaxCharCountEn2(Context context) {
        if (maxCharCountEn2 == 0) {
            String string = context.getResources().getString(R.string.maxCharCount_en2);
            if ("".equals(string) || string == null) {
                maxCharCountEn2 = 153;
            } else {
                maxCharCountEn2 = Integer.valueOf(string).intValue();
            }
        }
        return maxCharCountEn2;
    }

    public static int getMaxConcatCount(Context context) {
        if (maxConcatCount == 0) {
            String string = context.getResources().getString(R.string.maxConcatCount);
            if ("".equals(string) || string == null) {
                maxConcatCount = 5;
            } else {
                maxConcatCount = Integer.valueOf(string).intValue();
            }
        }
        return maxConcatCount;
    }
}
