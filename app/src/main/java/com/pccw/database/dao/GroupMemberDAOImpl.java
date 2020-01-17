package com.pccw.database.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.provider.ContactsContract;
import android.util.Log;
import com.pccw.database.entity.GroupMember;
import com.pccw.database.entity.UserInfo;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.sip.ContactFragment;
import com.pccw.sms.bean.SMSConstants;
import com.pccw.sms.service.PhoneListService;
import java.util.ArrayList;

public class GroupMemberDAOImpl implements GenericDAO<GroupMember, Integer> {
    protected static UserInfoDAOImpl userInfoImpl;
    protected String[] GROUPMEMBER_TABLE_COLUMNS = {"GROUPID", DBHelper.GROUPMEMBER_KEY_MEMBERID, DBHelper.GROUPMEMBER_KEY_MEMBERUSERNAME};
    public String LOG_TAG = "GroupMemberDAOImpl";
    protected SQLiteDatabase db = null;
    protected Context mContext;

    public GroupMemberDAOImpl(Context context) {
        this.mContext = context;
        userInfoImpl = new UserInfoDAOImpl(context);
    }

    private String getPhoneNumberLookUpKey(String str) {
        StringBuilder sb = new StringBuilder();
        Cursor query = this.mContext.getContentResolver().query(ContactFragment.AllPhoneNumberQuery.URI, ContactFragment.AllPhoneNumberQuery.PROJECTION, (String) null, (String[]) null, "data1");
        query.moveToFirst();
        sb.append(" (");
        while (!query.isAfterLast()) {
            if (str.contains(PhoneListService.normalizeContactNumber(query.getString(1)))) {
                if (sb.length() < 3) {
                    sb.append("'" + query.getString(2) + "'");
                } else {
                    sb.append(", '" + query.getString(2) + "'");
                }
            }
            query.moveToNext();
        }
        query.close();
        sb.append(")");
        return sb.toString();
    }

    public void add(GroupMember groupMember) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("GROUPID", groupMember.getGroupId());
        contentValues.put(DBHelper.GROUPMEMBER_KEY_MEMBERUSERNAME, groupMember.getMemberUserName());
        try {
            open();
            Log.i(this.LOG_TAG, "GroupMemberDAOImpl, add, added ID=" + this.db.insert(DBHelper.TABLE_GROUPMEMBER, (String) null, contentValues));
        } catch (Exception e) {
        } finally {
            close();
        }
    }

    public void close() {
    }

    public GroupMember find(Integer num) {
        return null;
    }

    public ArrayList<GroupMember> getGroupMemberByGroupId(String str) {
        Log.v(this.LOG_TAG, "GroupMemberDAOImpl, querying group members for group Id: " + str);
        ArrayList<GroupMember> arrayList = new ArrayList<>();
        String str2 = "SELECT MEMBERID , GROUPID ,MEMBERUSERNAME FROM groupmember WHERE GROUPID='" + str + "'";
        Log.d(this.LOG_TAG, "GroupMemberDAOImpl, query=" + str2);
        try {
            open();
            Cursor rawQuery = this.db.rawQuery(str2, (String[]) null);
            rawQuery.moveToFirst();
            Log.v(this.LOG_TAG, "GroupMemberDAOImpl, count=" + rawQuery.getCount());
            while (!rawQuery.isAfterLast()) {
                try {
                    arrayList.add(parseGroupMember(rawQuery));
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "GroupMemberDAOImpl, fail : " + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "GroupMemberDAOImpl, exception=" + e2.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public ArrayList<GroupMember> list() {
        return null;
    }

    public void open() {
        this.db = DBHelper.getDBInstance(this.mContext);
    }

    /* access modifiers changed from: protected */
    public GroupMember parseGroupMember(Cursor cursor) {
        String str;
        boolean z = false;
        int i = cursor.getInt(cursor.getColumnIndexOrThrow(DBHelper.GROUPMEMBER_KEY_MEMBERID));
        String string = cursor.getString(cursor.getColumnIndexOrThrow("GROUPID"));
        String string2 = cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.GROUPMEMBER_KEY_MEMBERUSERNAME));
        String formatPhoneNumber = SMSConstants.formatPhoneNumber(string2);
        String phoneNumberLookUpKey = getPhoneNumberLookUpKey(string2);
        Log.i(this.LOG_TAG, "id=" + i + " ;groupId=" + string + " ;memberUserName" + string2);
        UserInfo find = userInfoImpl.find(string2);
        String photo = find != null ? find.getPhoto() : null;
        Cursor query = this.mContext.getContentResolver().query(ContactFragment.ContactIMQuery.URI, ContactFragment.ContactIMQuery.PROJECTION, ContactFragment.ContactIMQuery.SELECTION + phoneNumberLookUpKey, (String[]) null, "display_name");
        query.moveToFirst();
        while (!query.isAfterLast() && !z) {
            Cursor query2 = this.mContext.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[]{"_id", "data1", "lookup"}, "contact_id = ?", new String[]{query.getString(0)}, (String) null);
            if (query2 != null) {
                query2.moveToFirst();
                String str2 = photo;
                String str3 = formatPhoneNumber;
                boolean z2 = z;
                while (!query2.isAfterLast()) {
                    String normalizeContactNumber = PhoneListService.normalizeContactNumber(query2.getString(query2.getColumnIndex("data1")));
                    if (normalizeContactNumber == null || !normalizeContactNumber.equals(string2)) {
                        str = str3;
                    } else {
                        str = query.getString(1);
                        if ("".equals(str) || str == null) {
                            str = str3;
                        } else {
                            z2 = true;
                        }
                        String string3 = query.getString(2) == null ? "" : query.getString(2);
                        if (!"".equals(string3) && string3 != null) {
                            str2 = string3;
                        }
                    }
                    query2.moveToNext();
                    str3 = str;
                }
                query2.close();
                query.moveToNext();
                formatPhoneNumber = str3;
                z = z2;
                photo = str2;
            }
        }
        query.close();
        GroupMember groupMember = new GroupMember(string, string2, formatPhoneNumber, photo);
        groupMember.setMemberId(i);
        return groupMember;
    }

    public void remove(GroupMember groupMember) {
    }

    public void removeByGroupId(String str) {
        try {
            open();
            Log.i(this.LOG_TAG, "GroupMemberDAOImpl, remove, removed number of row=" + this.db.delete(DBHelper.TABLE_GROUPMEMBER, "GROUPID=?", new String[]{String.valueOf(str)}));
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "GroupMemberDAOImpl, remove, exception=" + e.toString());
        } finally {
            close();
        }
    }

    public int update(GroupMember groupMember) {
        return 0;
    }
}
