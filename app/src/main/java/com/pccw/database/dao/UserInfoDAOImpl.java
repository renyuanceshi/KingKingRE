package com.pccw.database.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.provider.ContactsContract;
import android.util.Log;
import com.pccw.database.entity.UserInfo;
import com.pccw.database.helper.DBHelper;
import com.pccw.sms.bean.SMSConstants;
import com.pccw.sms.service.PhoneListService;
import java.util.ArrayList;

public class UserInfoDAOImpl implements GenericDAO<UserInfo, String> {
    public String LOG_TAG = "UserInfoImpl";
    protected String[] USERINFO_TABLE_COLUMNS = {DBHelper.USERINFO_KEY_NICKNAME, DBHelper.USERINFO_KEY_USERNAME, DBHelper.USERINFO_KEY_PHOTO};
    protected SQLiteDatabase db = null;
    protected Context mContext;

    public class ContactDetail {
        public String nickname;
        public String profilePicPath;

        public ContactDetail(String str, String str2) {
            this.nickname = str;
            this.profilePicPath = str2;
        }
    }

    public UserInfoDAOImpl(Context context) {
        this.mContext = context;
    }

    public void add(UserInfo userInfo) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(DBHelper.USERINFO_KEY_NICKNAME, userInfo.getNickName() == null ? "" : userInfo.getNickName());
        contentValues.put(DBHelper.USERINFO_KEY_USERNAME, userInfo.getUserName());
        contentValues.put(DBHelper.USERINFO_KEY_PHOTO, userInfo.getPhoto());
        try {
            open();
            Log.i(this.LOG_TAG, "UserInfoImpl, add, added ID=" + this.db.insert(DBHelper.TABLE_USERINFO, (String) null, contentValues));
        } catch (Exception e) {
        } finally {
            close();
        }
    }

    public void close() {
    }

    public UserInfo find(String str) {
        UserInfo userInfo;
        Log.v(this.LOG_TAG, "UserInfoImpl, find, starts");
        try {
            open();
            if (str != null) {
                Cursor query = this.db.query(DBHelper.TABLE_USERINFO, this.USERINFO_TABLE_COLUMNS, "USERNAME=?", new String[]{str}, (String) null, (String) null, (String) null);
                if (query == null || query.getCount() == 0) {
                    userInfo = null;
                } else {
                    query.moveToFirst();
                    try {
                        userInfo = parseModel(query);
                    } catch (Exception e) {
                        Log.e(this.LOG_TAG, "UserInfoImpl, find, exception=" + e.toString());
                        userInfo = null;
                    }
                    try {
                        query.close();
                    } catch (Exception e2) {
                        e = e2;
                        try {
                            Log.e(this.LOG_TAG, "UserInfoImpl, find, exception=" + e.toString());
                            return userInfo;
                        } finally {
                            close();
                        }
                    }
                }
            } else {
                Log.e(this.LOG_TAG, "UserInfoImpl, find, key is null");
                userInfo = null;
            }
            close();
        } catch (Exception e3) {
            e = e3;
            userInfo = null;
            Log.e(this.LOG_TAG, "UserInfoImpl, find, exception=" + e.toString());
            return userInfo;
        }
        return userInfo;
    }

    public UserInfo findOwnerProfile(String str) {
        String str2;
        String str3;
        String str4;
        UserInfo find = find(str);
        if (find != null) {
            str2 = find.getUserName();
            str4 = find.getNickName();
            str3 = find.getPhoto();
        } else {
            str2 = null;
            str3 = null;
            str4 = null;
        }
        return new UserInfo(str2, str4, str3);
    }

    public ContactDetail findUserContactDetail(String str) {
        boolean z = false;
        String str2 = null;
        String str3 = null;
        Cursor query = this.mContext.getContentResolver().query(ContactFragment.ContactIMQuery.URI, ContactFragment.ContactIMQuery.PROJECTION, ContactFragment.ContactIMQuery.SELECTION + SMSConstants.getPhoneNumberLookUpKey(this.mContext, str), (String[]) null, "display_name");
        query.moveToFirst();
        while (!query.isAfterLast()) {
            Cursor query2 = this.mContext.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[]{"_id", "data1", "lookup"}, "contact_id = ?", new String[]{query.getString(0)}, (String) null);
            if (query2 != null) {
                query2.moveToFirst();
                String str4 = str3;
                String str5 = str2;
                boolean z2 = z;
                while (!query2.isAfterLast() && !z2) {
                    String normalizeContactNumber = PhoneListService.normalizeContactNumber(query2.getString(query2.getColumnIndex("data1")));
                    if (normalizeContactNumber != null && normalizeContactNumber.equals(str)) {
                        String string = query.getString(1);
                        if (!"".equals(string) && string != null) {
                            z2 = true;
                            str4 = string;
                        }
                        String string2 = query.getString(2) == null ? "" : query.getString(2);
                        if (!"".equals(string2) && string2 != null) {
                            str5 = string2;
                        }
                    }
                    query2.moveToNext();
                }
                query2.close();
                query.moveToNext();
                str3 = str4;
                str2 = str5;
                z = z2;
            }
        }
        query.close();
        return new ContactDetail(str3, str2);
    }

    public UserInfo findUserProfile(String str) {
        String str2;
        String str3;
        String str4;
        ContactDetail findUserContactDetail = findUserContactDetail(str);
        UserInfo find = find(str);
        if (find != null) {
            str2 = find.getUserName();
            String nickName = find.getNickName();
            str4 = find.getPhoto();
            str3 = nickName;
        } else {
            str2 = null;
            str3 = null;
            str4 = null;
        }
        if (!"".equals(findUserContactDetail.nickname) && findUserContactDetail.nickname != null) {
            str3 = findUserContactDetail.nickname;
        }
        if (!"".equals(findUserContactDetail.profilePicPath) && findUserContactDetail.profilePicPath != null) {
            str4 = findUserContactDetail.profilePicPath;
        }
        return new UserInfo(str2, str3, str4);
    }

    public ArrayList<UserInfo> list() {
        Log.v(this.LOG_TAG, "UserInfoImpl, list, starts");
        ArrayList<UserInfo> arrayList = new ArrayList<>();
        try {
            open();
            Cursor query = this.db.query(DBHelper.TABLE_USERINFO, this.USERINFO_TABLE_COLUMNS, (String) null, (String[]) null, (String) null, (String) null, "NICKNAME ASC");
            query.moveToFirst();
            Log.v(this.LOG_TAG, "UserInfoImpl, list, count=" + query.getCount());
            while (!query.isAfterLast()) {
                try {
                    arrayList.add(parseModel(query));
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "list, fail to add exception=" + e.toString());
                }
                query.moveToNext();
            }
            query.close();
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "UserInfoImpl, list, exception=" + e2.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public ArrayList<String> listIMNumberWithoutOwner(String str) {
        ArrayList<String> arrayList = new ArrayList<>();
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("SELECT * FROM userinfo where USERNAME != ? order by USERNAME asc", new String[]{str});
            rawQuery.moveToFirst();
            while (!rawQuery.isAfterLast()) {
                try {
                    rawQuery.getString(rawQuery.getColumnIndexOrThrow(DBHelper.USERINFO_KEY_USERNAME));
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "list, fail to add exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "UserInfoImpl, listIMNumberWithoutOwner, exception=" + e2.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public ArrayList<UserInfo> listIMUsersNotInGroup(String str) {
        ArrayList<UserInfo> arrayList = new ArrayList<>();
        Log.d(this.LOG_TAG, "UserInfoImpl, query=" + "select * from userinfo A LEFT JOIN (select * from groupmember where GROUPID = ?) B ON A.USERNAME = B.MEMBERUSERNAME where B.MEMBERUSERNAME IS NULL");
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("select * from userinfo A LEFT JOIN (select * from groupmember where GROUPID = ?) B ON A.USERNAME = B.MEMBERUSERNAME where B.MEMBERUSERNAME IS NULL", new String[]{str});
            rawQuery.moveToFirst();
            Log.v(this.LOG_TAG, "UserInfoImpl, list, count=" + rawQuery.getCount());
            while (!rawQuery.isAfterLast()) {
                try {
                    arrayList.add(parseModel(rawQuery));
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "list, fail to add exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "UserInfoImpl, findByChatID, exception=" + e2.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public ArrayList<UserInfo> listUserInfoWithoutOwner(String str) {
        Log.v(this.LOG_TAG, "UserInfoImpl, filter out the owner, " + str);
        ArrayList<UserInfo> arrayList = new ArrayList<>();
        Log.d(this.LOG_TAG, "UserInfoImpl, query=" + "SELECT * FROM userinfo where USERNAME != ? order by USERNAME asc");
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("SELECT * FROM userinfo where USERNAME != ? order by USERNAME asc", new String[]{str});
            rawQuery.moveToFirst();
            Log.v(this.LOG_TAG, "UserInfoImpl, list, count=" + rawQuery.getCount());
            while (!rawQuery.isAfterLast()) {
                try {
                    arrayList.add(parseModel(rawQuery));
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "list, fail to add exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "UserInfoImpl, findByChatID, exception=" + e2.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public void open() {
        this.db = DBHelper.getDBInstance(this.mContext);
    }

    /* access modifiers changed from: protected */
    public UserInfo parseModel(Cursor cursor) {
        Log.v(this.LOG_TAG, "UserInfoImpl started");
        return new UserInfo(cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.USERINFO_KEY_USERNAME)), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.USERINFO_KEY_NICKNAME)), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.USERINFO_KEY_PHOTO)));
    }

    public void remove(UserInfo userInfo) {
    }

    public int update(UserInfo userInfo) {
        int i;
        ContentValues contentValues = new ContentValues();
        contentValues.put(DBHelper.USERINFO_KEY_NICKNAME, userInfo.getNickName() == null ? "" : userInfo.getNickName());
        contentValues.put(DBHelper.USERINFO_KEY_USERNAME, userInfo.getUserName());
        contentValues.put(DBHelper.USERINFO_KEY_PHOTO, userInfo.getPhoto());
        try {
            open();
            i = this.db.update(DBHelper.TABLE_USERINFO, contentValues, "USERNAME=?", new String[]{userInfo.getUserName()});
            try {
                Log.i(this.LOG_TAG, "UserInfoImpl, update, updated number of row=" + i);
                close();
            } catch (Exception e) {
                e = e;
                try {
                    Log.e(this.LOG_TAG, "UserInfoImpl, update, exception=" + e.toString());
                    return i;
                } finally {
                    close();
                }
            }
        } catch (Exception e2) {
            e = e2;
            i = 0;
        }
        return i;
    }
}
