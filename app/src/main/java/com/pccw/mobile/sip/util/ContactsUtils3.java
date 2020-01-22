package com.pccw.mobile.sip.util;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.Context;
import android.database.Cursor;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.provider.Contacts;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.sip.service.MobileSipService;
import java.io.InputStream;
import org.apache.commons.lang3.StringUtils;

public class ContactsUtils3 extends ContactsUtils {
    public Contact queryByPhoneNumber(Context context, String str) {
        if (str.contains("&")) {
            str = str.substring(0, str.indexOf("&"));
        }
        try {
            Cursor query = context.getContentResolver().query(Uri.withAppendedPath(Contacts.Phones.CONTENT_FILTER_URL, str), new String[]{"_id", "display_name", "person", "label", "type"}, (String) null, (String[]) null, (String) null);
            while (query.moveToNext()) {
                String string = query.getString(1);
                if (StringUtils.isNotBlank(string)) {
                    InputStream openContactPhotoInputStream = Contacts.People.openContactPhotoInputStream(context.getContentResolver(), ContentUris.withAppendedId(Contacts.People.CONTENT_URI, query.getLong(2)));
                    return new Contact(string, openContactPhotoInputStream != null ? new BitmapDrawable(openContactPhotoInputStream) : null, Contacts.Phones.getDisplayLabel(context, query.getInt(4), query.getString(3)).toString());
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
        return contentResolver.query(Contacts.Phones.CONTENT_URI, new String[]{"_id", DBHelper.NUMBER, "display_name", "type", "label", "type"}, (String) null, (String[]) null, "name ASC");
    }
}
