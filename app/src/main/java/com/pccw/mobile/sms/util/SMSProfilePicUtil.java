package com.pccw.mobile.sms.util;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.provider.ContactsContract;
import android.util.Log;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.sms.helper.ContactsHelper;

public class SMSProfilePicUtil {
    public static Bitmap getMultipleSMSProfilePic(Context context) {
        return BitmapFactory.decodeResource(context.getResources(), R.drawable.default_group_pic);
    }

    public static Bitmap getSingleSMSProfilePic(String str, Context context) {
        Bitmap bitmap = null;
        if (isNumberWithinContact(str, context)) {
            bitmap = new ContactsHelper(str, context).getPhoto();
        }
        return bitmap == null ? BitmapFactory.decodeResource(context.getResources(), R.drawable.default_profile_pic) : bitmap;
    }

    private static boolean isNumberWithinContact(String str, Context context) {
        Uri withAppendedPath = Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(str));
        Cursor query = context.getContentResolver().query(withAppendedPath, new String[]{"_id", DBHelper.NUMBER, "display_name"}, (String) null, (String[]) null, (String) null);
        try {
            if (query.moveToFirst()) {
                Log.w("KKIM", " -- Number " + str + " is within Contact List");
                if (query != null) {
                    query.close();
                }
                return true;
            }
            if (query != null) {
                query.close();
            }
            Log.w("KKIM", " -- Number " + str + " is NOT within Contact List");
            return false;
        } catch (Exception e) {
            Log.w("KKIM", " -- Number " + str + " is NOT within Contact List -- ERROR");
            if (query != null) {
                query.close();
            }
            return false;
        } catch (Throwable th) {
            if (query != null) {
                query.close();
            }
            throw th;
        }
    }
}
