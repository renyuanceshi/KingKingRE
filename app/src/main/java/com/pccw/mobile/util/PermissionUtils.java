package com.pccw.mobile.util;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import java.util.ArrayList;
import java.util.List;

public class PermissionUtils {

    public interface PermissionCheckCallBack {
        void onHasPermission();

        void onUserHasAlreadyTurnedDown(String... strArr);

        void onUserHasAlreadyTurnedDownAndDontAsk(String... strArr);
    }

    public interface PermissionRequestSuccessCallBack {
        void onHasPermission();
    }

    public static void checkAndRequestMorePermissions(Context context, String[] strArr, int i) {
        requestMorePermissions(context, (List) checkMorePermissions(context, strArr), i);
    }

    public static void checkAndRequestMorePermissions(Context context, String[] strArr, int i, PermissionRequestSuccessCallBack permissionRequestSuccessCallBack) {
        List<String> checkMorePermissions = checkMorePermissions(context, strArr);
        if (checkMorePermissions.size() == 0) {
            permissionRequestSuccessCallBack.onHasPermission();
        } else {
            requestMorePermissions(context, (List) checkMorePermissions, i);
        }
    }

    public static void checkAndRequestPermission(Context context, String str, int i) {
        if (!checkPermission(context, str)) {
            requestPermission(context, str, i);
        }
    }

    public static void checkAndRequestPermission(Context context, String str, int i, PermissionRequestSuccessCallBack permissionRequestSuccessCallBack) {
        if (checkPermission(context, str)) {
            permissionRequestSuccessCallBack.onHasPermission();
        } else {
            requestPermission(context, str, i);
        }
    }

    public static List<String> checkMorePermissions(Context context, String[] strArr) {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < strArr.length; i++) {
            if (!checkPermission(context, strArr[i])) {
                arrayList.add(strArr[i]);
            }
        }
        return arrayList;
    }

    public static void checkMorePermissions(Context context, String[] strArr, PermissionCheckCallBack permissionCheckCallBack) {
        boolean z = false;
        List<String> checkMorePermissions = checkMorePermissions(context, strArr);
        if (checkMorePermissions.size() == 0) {
            permissionCheckCallBack.onHasPermission();
            return;
        }
        int i = 0;
        while (true) {
            if (i >= checkMorePermissions.size()) {
                z = true;
                break;
            } else if (judgePermission(context, checkMorePermissions.get(i))) {
                break;
            } else {
                i++;
            }
        }
        String[] strArr2 = (String[]) checkMorePermissions.toArray(new String[checkMorePermissions.size()]);
        if (z) {
            permissionCheckCallBack.onUserHasAlreadyTurnedDownAndDontAsk(strArr2);
        } else {
            permissionCheckCallBack.onUserHasAlreadyTurnedDown(strArr2);
        }
    }

    public static void checkPermission(Context context, String str, PermissionCheckCallBack permissionCheckCallBack) {
        if (checkPermission(context, str)) {
            permissionCheckCallBack.onHasPermission();
        } else if (judgePermission(context, str)) {
            permissionCheckCallBack.onUserHasAlreadyTurnedDown(str);
        } else {
            permissionCheckCallBack.onUserHasAlreadyTurnedDownAndDontAsk(str);
        }
    }

    public static boolean checkPermission(Context context, String str) {
        return ContextCompat.checkSelfPermission(context, str) == 0;
    }

    public static boolean isPermissionRequestSuccess(int[] iArr) {
        return iArr.length > 0 && iArr[0] == 0;
    }

    public static boolean judgePermission(Context context, String str) {
        return ActivityCompat.shouldShowRequestPermissionRationale((Activity) context, str);
    }

    public static void onRequestMorePermissionsResult(Context context, String[] strArr, PermissionCheckCallBack permissionCheckCallBack) {
        boolean z = false;
        List<String> checkMorePermissions = checkMorePermissions(context, strArr);
        if (checkMorePermissions.size() == 0) {
            permissionCheckCallBack.onHasPermission();
            return;
        }
        int i = 0;
        while (true) {
            if (i >= checkMorePermissions.size()) {
                break;
            } else if (!judgePermission(context, checkMorePermissions.get(i))) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        if (z) {
            permissionCheckCallBack.onUserHasAlreadyTurnedDownAndDontAsk(strArr);
        } else {
            permissionCheckCallBack.onUserHasAlreadyTurnedDown(strArr);
        }
    }

    public static void onRequestPermissionResult(Context context, String str, int[] iArr, PermissionCheckCallBack permissionCheckCallBack) {
        if (isPermissionRequestSuccess(iArr)) {
            permissionCheckCallBack.onHasPermission();
        } else if (judgePermission(context, str)) {
            permissionCheckCallBack.onUserHasAlreadyTurnedDown(str);
        } else {
            permissionCheckCallBack.onUserHasAlreadyTurnedDownAndDontAsk(str);
        }
    }

    public static void requestMorePermissions(Context context, List list, int i) {
        if (list != null && list.size() != 0) {
            requestMorePermissions(context, (String[]) list.toArray(new String[list.size()]), i);
        }
    }

    public static void requestMorePermissions(Context context, String[] strArr, int i) {
        ActivityCompat.requestPermissions((Activity) context, strArr, i);
    }

    public static void requestPermission(Context context, String str, int i) {
        ActivityCompat.requestPermissions((Activity) context, new String[]{str}, i);
    }

    public static void toAppSetting(Context context) {
        Intent intent = new Intent();
        intent.addFlags(268435456);
        if (Build.VERSION.SDK_INT >= 9) {
            intent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
            intent.setData(Uri.fromParts("package", context.getPackageName(), (String) null));
        } else if (Build.VERSION.SDK_INT <= 8) {
            intent.setAction("android.intent.action.VIEW");
            intent.setClassName("com.android.settings", "com.android.settings.InstalledAppDetails");
            intent.putExtra("com.android.settings.ApplicationPkgName", context.getPackageName());
        }
        context.startActivity(intent);
    }
}
