package com.pccw.mobile.sms.helper;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.provider.ContactsContract;
import java.util.Random;

public class ContactsHelper {
    int contactId;
    Context ctx;
    String phoneNum;

    public ContactsHelper(int i, Context context) {
        this.ctx = context;
        this.contactId = i;
    }

    public ContactsHelper(String str, Context context) {
        this.ctx = context;
        this.phoneNum = str;
        this.contactId = getContactIDFromNumber(str, context);
    }

    private int getContactIDFromNumber(String str, Context context) {
        String encode = Uri.encode(str);
        int nextInt = new Random().nextInt();
        Cursor query = context.getContentResolver().query(Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, encode), new String[]{"display_name", "_id"}, (String) null, (String[]) null, (String) null);
        int i = query.moveToFirst() ? query.getInt(query.getColumnIndexOrThrow("_id")) : nextInt;
        query.close();
        return i;
    }

    public String getAddress() {
        Cursor query = this.ctx.getContentResolver().query(ContactsContract.Data.CONTENT_URI, (String[]) null, "contact_id = ? AND mimetype = ?", new String[]{String.valueOf(this.contactId), "vnd.android.cursor.item/postal-address_v2"}, (String) null);
        String string = query.moveToFirst() ? query.getString(query.getColumnIndex("data1")) : "";
        query.close();
        return string;
    }

    public Bitmap getBitmap(String str) {
        Bitmap bitmap = null;
        Cursor query = this.ctx.getContentResolver().query(ContactsContract.Data.CONTENT_URI, new String[]{"data15"}, "_id=?", new String[]{str}, (String) null);
        if (query.moveToFirst()) {
            byte[] blob = query.getBlob(query.getColumnIndex("data15"));
            bitmap = BitmapFactory.decodeByteArray(blob, 0, blob.length);
        }
        query.close();
        return bitmap;
    }

    public String getEmail() {
        String str;
        Cursor query = this.ctx.getContentResolver().query(ContactsContract.CommonDataKinds.Email.CONTENT_URI, new String[]{"data1", "data2"}, "contact_id=?", new String[]{String.valueOf(this.contactId)}, (String) null);
        if (query.moveToFirst()) {
            int columnIndex = query.getColumnIndex("data1");
            str = "";
            while (!query.isAfterLast()) {
                str = str + query.getString(columnIndex) + ";";
                query.moveToNext();
            }
        } else {
            str = "";
        }
        query.close();
        return str;
    }

    public String getName() {
        String str = null;
        Cursor query = this.ctx.getContentResolver().query(ContactsContract.Contacts.CONTENT_URI, new String[]{"display_name"}, "_id=?", new String[]{String.valueOf(this.contactId)}, (String) null);
        if (query.moveToFirst()) {
            str = query.getString(query.getColumnIndex("display_name"));
            query.close();
        }
        query.close();
        return str;
    }

    public String getPhoneNumber() {
        String str;
        Cursor query = this.ctx.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[]{"data1", "data2"}, "contact_id=?", new String[]{String.valueOf(this.contactId)}, (String) null);
        if (query.moveToFirst()) {
            int columnIndex = query.getColumnIndex("data1");
            str = "";
            while (!query.isAfterLast()) {
                str = str + query.getString(columnIndex) + ";";
                query.moveToNext();
            }
        } else {
            str = "";
        }
        query.close();
        return str;
    }

    public Bitmap getPhoto() {
        String string;
        Bitmap bitmap = null;
        Cursor query = this.ctx.getContentResolver().query(ContactsContract.Contacts.CONTENT_URI, new String[]{"photo_id"}, "_id=?", new String[]{String.valueOf(this.contactId)}, (String) null);
        if (query.moveToFirst() && (string = query.getString(query.getColumnIndex("photo_id"))) != null) {
            bitmap = getBitmap(string);
        }
        query.close();
        return bitmap;
    }
}
