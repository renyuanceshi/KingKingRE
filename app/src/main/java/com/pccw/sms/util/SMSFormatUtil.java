package com.pccw.sms.util;

import com.pccwmobile.common.utilities.Log;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class SMSFormatUtil {
    public static final int MAX_NUMBER_LENGTH = 25;

    public static String convertArrayListToSortedSplittingString(ArrayList<String> arrayList) {
        Collections.sort(arrayList);
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= arrayList.size()) {
                return "";
            }
            sb.append(arrayList.get(i2));
            if (i2 == arrayList.size() - 1) {
                return sb.toString();
            }
            sb.append(";");
            i = i2 + 1;
        }
    }

    public static ArrayList<String> convertCommaSplittingStringToSortedArrayList(String str) {
        ArrayList<String> arrayList = new ArrayList<>(Arrays.asList(str.split(",")));
        Collections.sort(arrayList);
        return arrayList;
    }

    public static String convertListToSortedCommaSplittingString(List<String> list) {
        Log.v("KKSMS", "convertListToSortedCommaSplittingString list=" + list.size());
        Log.v("KKSMS", "convertListToSortedCommaSplittingString list=" + list.toString());
        Collections.sort(list);
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= list.size()) {
                return "";
            }
            sb.append(list.get(i2));
            if (i2 == list.size() - 1) {
                return sb.toString();
            }
            sb.append(",");
            i = i2 + 1;
        }
    }

    public static String convertListToSortedSplittingString(List<String> list) {
        Collections.sort(list);
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= list.size()) {
                return "";
            }
            sb.append(list.get(i2));
            if (i2 == list.size() - 1) {
                return sb.toString();
            }
            sb.append(";");
            i = i2 + 1;
        }
    }

    public static ArrayList<String> convertSplittingStringToSortedArrayList(String str) {
        ArrayList<String> arrayList = new ArrayList<>(Arrays.asList(str.split(";")));
        Collections.sort(arrayList);
        return arrayList;
    }

    public static List<String> convertSplittingStringToSortedList(String str) {
        ArrayList arrayList = new ArrayList(Arrays.asList(str.split(";")));
        Collections.sort(arrayList);
        return arrayList;
    }

    public static String ellipsisTextWithThreeDots(String str, int i) {
        return str.length() > i ? str.substring(0, i - 1) + "..." : str;
    }

    public static String getGroupIdString(ArrayList<String> arrayList) {
        return convertListToSortedSplittingString(arrayList);
    }
}
