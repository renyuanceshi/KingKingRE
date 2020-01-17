package com.pccw.mobile.sip.util;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.Context;
import android.database.Cursor;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.provider.ContactsContract;
import com.pccw.mobile.sip.service.MobileSipService;
import java.io.InputStream;
import org.apache.commons.lang.StringUtils;

public class ContactsUtils5 extends ContactsUtils {
    public Contact queryByPhoneNumber(Context context, String str) {
        if (str.contains("&")) {
            str = str.substring(0, str.indexOf("&"));
        }
        try {
            Cursor query = context.getContentResolver().query(Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(str)), new String[]{"_id", "display_name", "photo_id", "label", "type"}, (String) null, (String[]) null, (String) null);
            while (query.moveToNext()) {
                String string = query.getString(1);
                if (StringUtils.isNotBlank(string)) {
                    InputStream openContactPhotoInputStream = ContactsContract.Contacts.openContactPhotoInputStream(context.getContentResolver(), ContentUris.withAppendedId(ContactsContract.Contacts.CONTENT_URI, query.getLong(0)));
                    return new Contact(string, openContactPhotoInputStream != null ? new BitmapDrawable(openContactPhotoInputStream) : null, ContactsContract.CommonDataKinds.Phone.getTypeLabel(context.getResources(), query.getInt(4), query.getString(3)).toString());
                }
            }
        } catch (Exception e) {
        }
        String specialPhoneName = MobileSipService.getInstance().specialPhoneName(context, str);
        if (specialPhoneName != null) {
            return new Contact(specialPhoneName, (Drawable) null, (String) null);
        }
        return null;
    }

    public Cursor queryPhoneList(ContentResolver contentResolver) {
        return contentResolver.query(ContactsContract.Data.CONTENT_URI, new String[]{"_id", "data1", "data2", "data3"}, "mimetype='vnd.android.cursor.item/phone_v2'", (String[]) null, (String) null);
    }
}
