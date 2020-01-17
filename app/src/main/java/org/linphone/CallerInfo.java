package org.linphone;

import android.content.Context;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.provider.Contacts;
import com.pccw.database.helper.DBHelper;

public class CallerInfo {
    public static final String CONFERENCE_NUMBER = "-3";
    public static final String PRIVATE_NUMBER = "-2";
    private static final String TAG = "CallerInfo";
    public static final String UNKNOWN_NUMBER = "-1";
    public Drawable cachedPhoto;
    public Uri contactRefUri;
    public Uri contactRingtoneUri;
    public boolean isCachedPhotoCurrent;
    public String name;
    public boolean needUpdate;
    public String numberLabel;
    public int numberType;
    public long person_id;
    public String phoneLabel;
    public String phoneNumber;
    public int photoResource;
    public boolean shouldSendToVoicemail;

    public static CallerInfo getCallerInfo(Context context, Uri uri) {
        return getCallerInfo(context, uri, context.getContentResolver().query(uri, (String[]) null, (String) null, (String[]) null, (String) null));
    }

    public static CallerInfo getCallerInfo(Context context, Uri uri, Cursor cursor) {
        int columnIndex;
        boolean z = true;
        CallerInfo callerInfo = new CallerInfo();
        callerInfo.photoResource = 0;
        callerInfo.phoneLabel = null;
        callerInfo.numberType = 0;
        callerInfo.numberLabel = null;
        callerInfo.cachedPhoto = null;
        callerInfo.isCachedPhotoCurrent = false;
        if (cursor != null) {
            if (cursor.moveToFirst()) {
                int columnIndex2 = cursor.getColumnIndex("name");
                if (columnIndex2 != -1) {
                    callerInfo.name = cursor.getString(columnIndex2);
                }
                int columnIndex3 = cursor.getColumnIndex(DBHelper.NUMBER);
                if (columnIndex3 != -1) {
                    callerInfo.phoneNumber = cursor.getString(columnIndex3);
                }
                int columnIndex4 = cursor.getColumnIndex("label");
                if (!(columnIndex4 == -1 || (columnIndex = cursor.getColumnIndex("type")) == -1)) {
                    callerInfo.numberType = cursor.getInt(columnIndex);
                    callerInfo.numberLabel = cursor.getString(columnIndex4);
                    callerInfo.phoneLabel = Contacts.Phones.getDisplayLabel(context, callerInfo.numberType, callerInfo.numberLabel).toString();
                }
                int columnIndex5 = cursor.getColumnIndex("person");
                if (columnIndex5 != -1) {
                    callerInfo.person_id = cursor.getLong(columnIndex5);
                } else {
                    int columnIndex6 = cursor.getColumnIndex("_id");
                    if (columnIndex6 != -1) {
                        callerInfo.person_id = cursor.getLong(columnIndex6);
                    }
                }
                int columnIndex7 = cursor.getColumnIndex("custom_ringtone");
                if (columnIndex7 == -1 || cursor.getString(columnIndex7) == null) {
                    callerInfo.contactRingtoneUri = null;
                } else {
                    callerInfo.contactRingtoneUri = Uri.parse(cursor.getString(columnIndex7));
                }
                int columnIndex8 = cursor.getColumnIndex("send_to_voicemail");
                if (columnIndex8 == -1 || cursor.getInt(columnIndex8) != 1) {
                    z = false;
                }
                callerInfo.shouldSendToVoicemail = z;
            }
            cursor.close();
        }
        callerInfo.needUpdate = false;
        callerInfo.name = normalize(callerInfo.name);
        callerInfo.contactRefUri = uri;
        return callerInfo;
    }

    private static String normalize(String str) {
        if (str == null || str.length() > 0) {
            return str;
        }
        return null;
    }
}
