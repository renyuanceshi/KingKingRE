package com.pccw.sms.service;

import android.content.Context;
import android.database.Cursor;
import android.provider.ContactsContract;
import android.util.Log;
import java.util.ArrayList;

public class PhoneListService {
    protected Context context;

    public PhoneListService(Context context2) {
        this.context = context2;
    }

    public static String normalizeContactNumber(String str) {
        String replace = str.trim().replaceAll("\\s+", "").replace("-", "").replace("+", "");
        return (replace.startsWith("852") || replace.length() != 8) ? replace : "852" + replace;
    }

    public ArrayList<String> getNormalizedContactPhoneNumberList() {
        ArrayList<String> arrayList = new ArrayList<>();
        Cursor query = this.context.getContentResolver().query(ContactsContract.Contacts.CONTENT_URI, (String[]) null, (String) null, (String[]) null, (String) null);
        if (query.moveToFirst()) {
            do {
                String string = query.getString(query.getColumnIndex("_id"));
                if (Integer.parseInt(query.getString(query.getColumnIndex("has_phone_number"))) > 0) {
                    Cursor query2 = this.context.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, (String[]) null, "contact_id = ?", new String[]{string}, (String) null);
                    while (query2.moveToNext()) {
                        arrayList.add(normalizeContactNumber(query2.getString(query2.getColumnIndex("data1"))));
                    }
                    query2.close();
                }
            } while (query.moveToNext());
            Log.i("ConversationParticipant", "-->alContacts=" + arrayList.size());
        }
        return arrayList;
    }
}
