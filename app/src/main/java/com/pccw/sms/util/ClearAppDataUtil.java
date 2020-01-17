package com.pccw.sms.util;

import android.content.Context;
import android.preference.PreferenceManager;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.sip.Constants;
import com.pccw.sms.bean.SMSConstants;
import java.io.File;

public class ClearAppDataUtil {
    public static Context context;
    public final String LOG_TAG = "ClearAppDataUtil";

    public ClearAppDataUtil(Context context2) {
        context = context2;
    }

    public static void clearAppDataUtil(Context context2) {
        DBHelper.deleteWholeDatabase(context2);
        for (String sharedPreferences : new String[]{"com.pccw.im", Constants.NETWORK_SHARE_PREF, "RemovedShortcut", SMSConstants.mainPref, "FacebookShare"}) {
            context2.getSharedPreferences(sharedPreferences, 0).edit().clear().commit();
        }
        PreferenceManager.getDefaultSharedPreferences(context2).edit().clear().commit();
        deleteDir(new File(SMSConstants.INTERNAL_FILES_DIR(context2) + SMSConstants.STORAGE_ROOT_FOLDER + SMSConstants.STORAGE_MEDIA_FOLDER));
        deleteDir(new File(SMSConstants.INTERNAL_FILES_DIR(context2) + SMSConstants.STORAGE_ROOT_FOLDER + SMSConstants.STORAGE_PROFILE_FOLDER));
    }

    public static boolean deleteDir(File file) {
        if (file == null || !file.isDirectory()) {
            return false;
        }
        String[] list = file.list();
        for (String file2 : list) {
            if (!deleteDir(new File(file, file2))) {
                return false;
            }
        }
        return file.delete();
    }
}
