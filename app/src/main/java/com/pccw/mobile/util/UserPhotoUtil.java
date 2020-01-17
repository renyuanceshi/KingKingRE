package com.pccw.mobile.util;

import android.annotation.TargetApi;
import android.content.ContentUris;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.ThumbnailUtils;
import android.os.Build;
import android.provider.ContactsContract;
import com.pccw.sms.bean.SMSConstants;
import com.pccw.sms.service.ConversationParticipantItemService;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

public class UserPhotoUtil {
    public static Bitmap getCircularBitmap(Bitmap bitmap, int i, int i2) {
        return bitmap;
    }

    public static Bitmap getIMContactPhoto(Context context, ArrayList<String> arrayList) {
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= arrayList.size()) {
                return null;
            }
            String profileImagePath = ConversationParticipantItemService.getConversationParticipantItemByMsisdn(arrayList.get(i2)).getProfileImagePath();
            if (profileImagePath != null && !profileImagePath.equals("")) {
                return BitmapFactory.decodeFile(SMSConstants.INTERNAL_PROFILE_IMAGE_FILE_DIR(context) + profileImagePath);
            }
            i = i2 + 1;
        }
    }

    public static String getIMContactPhotoPath(Context context, ArrayList<String> arrayList) {
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= arrayList.size()) {
                return null;
            }
            String profileImagePath = ConversationParticipantItemService.getConversationParticipantItemByMsisdn(arrayList.get(i2)).getProfileImagePath();
            if (profileImagePath != null && !profileImagePath.equals("")) {
                return profileImagePath;
            }
            i = i2 + 1;
        }
    }

    public static Bitmap getIMContactPhotoWithPhotoUri(Context context, String str) {
        String str2 = SMSConstants.INTERNAL_PROFILE_IMAGE_FILE_DIR(context) + str;
        if (isFileValid(str2)) {
            return str.contains(SMSConstants.groupProfilePic_thumbnail_suffix) ? BitmapUtil.getProfileImageThumbnail(context, str) : BitmapFactory.decodeFile(str2);
        }
        return null;
    }

    public static Bitmap getLargeContactPhoto(Context context, String str) {
        return retrieveContactPhoto(context, str);
    }

    public static Bitmap getRectangularBitmap(Bitmap bitmap, int i, int i2) {
        return ThumbnailUtils.extractThumbnail(bitmap, i, i2);
    }

    public static boolean isFileValid(String str) {
        File file = new File(str);
        return file != null && !file.isDirectory() && file.isFile();
    }

    @TargetApi(14)
    private static Bitmap retrieveContactPhoto(Context context, String str) {
        try {
            InputStream openContactPhotoInputStream = Build.VERSION.SDK_INT >= 14 ? ContactsContract.Contacts.openContactPhotoInputStream(context.getContentResolver(), ContentUris.withAppendedId(ContactsContract.Contacts.CONTENT_URI, Long.valueOf(str).longValue()), true) : ContactsContract.Contacts.openContactPhotoInputStream(context.getContentResolver(), ContentUris.withAppendedId(ContactsContract.Contacts.CONTENT_URI, Long.valueOf(str).longValue()));
            if (openContactPhotoInputStream == null) {
                return null;
            }
            Bitmap decodeStream = BitmapFactory.decodeStream(openContactPhotoInputStream);
            openContactPhotoInputStream.close();
            return decodeStream;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
