package com.pccw.database.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.provider.ContactsContract;
import android.util.Log;
import com.pccw.database.entity.ChatList;
import com.pccw.database.entity.ChatListUserInfo;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.sip.ContactFragment;
import com.pccw.mobile.util.FormatUtil;
import com.pccw.sms.bean.SMSConstants;
import com.pccw.sms.service.PhoneListService;
import java.util.ArrayList;
import java.util.Date;

public class ChatListDAOImpl implements GenericDAO<ChatList, Integer> {
    protected String[] CHATLIST_TABLE_COLUMNS = {"CHATID", DBHelper.CHATLIST_KEY_CHATCONTACT, "MESSAGEID"};
    public String LOG_CHATLISTDAO = "ChatListDAOImpl";
    protected SQLiteDatabase db = null;
    protected Context mContext;

    public ChatListDAOImpl(Context context) {
        this.mContext = context;
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

    public void add(ChatList chatList) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(DBHelper.CHATLIST_KEY_CHATCONTACT, chatList.getChatContact());
        contentValues.put("MESSAGEID", chatList.getMessageId());
        try {
            open();
            Log.i(this.LOG_CHATLISTDAO, "ChatListImpl, add, added ID=" + this.db.insert(DBHelper.TABLE_CHATLIST, (String) null, contentValues));
        } catch (Exception e) {
        } finally {
            close();
        }
    }

    public void close() {
    }

    public ChatList find(Integer num) {
        return null;
    }

    public ChatList findByChatContact(String str) {
        ChatList chatList = null;
        Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatContact, starts");
        Log.d(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatContact, query=" + "SELECT * FROM chatlist WHERE CHATCONTACT = ?" + " ;chatcontact=" + str);
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("SELECT * FROM chatlist WHERE CHATCONTACT = ?", new String[]{String.valueOf(str)});
            rawQuery.moveToFirst();
            Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatContact, count=" + rawQuery.getCount());
            if (!rawQuery.isAfterLast()) {
                try {
                    chatList = parseChatList(rawQuery);
                } catch (Exception e) {
                    Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatContact, fail to add MessageStore exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatContact, exception=" + e2.toString());
        } finally {
            close();
        }
        return chatList;
    }

    public ChatList findByChatId(int i) {
        ChatList chatList = null;
        Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatContact, starts");
        Log.d(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatContact, query=" + "SELECT * FROM chatlist WHERE CHATID = ?" + " ;chatId=" + i);
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("SELECT * FROM chatlist WHERE CHATID = ?", new String[]{Integer.toString(i)});
            rawQuery.moveToFirst();
            Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatContact, count=" + rawQuery.getCount());
            if (!rawQuery.isAfterLast()) {
                try {
                    chatList = parseChatList(rawQuery);
                } catch (Exception e) {
                    Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatContact, fail to add MessageStore exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatContact, exception=" + e2.toString());
        } finally {
            close();
        }
        return chatList;
    }

    public Cursor getAllChatRecordCursor() {
        Cursor cursor = null;
        try {
            open();
            cursor = this.db.rawQuery("SELECT NULL AS _id,chatcontact,senttime,duration,calltype,callername,callertype,callerlabel,chatnumber,textmessage,chatid,entrytype,unreadcount,isimuser,messagetype  FROM ( SELECT chatcontact,senttime,'' AS duration,21 AS calltype,nickname AS callername,1 AS callertype,'CACHED_NUMBER_LABEL' AS callerlabel,chatcontact AS chatnumber,textmessage,chatid,'individual' AS entrytype,unreadcount,'Y' AS isimuser,messagetype  FROM allchatview  LEFT OUTER JOIN (SELECT username,nickname FROM userinfo) ON username=chatcontact UNION ALL SELECT chatcontact,CASE WHEN senttime IS NULL THEN createdate ELSE senttime END AS senttime,'' AS duration,21 AS calltype,groupname,1 AS callertype,'CACHED_NUMBER_LABEL' AS callerlabel,chatcontact,textmessage,chatid,'group' AS entrytype,unreadcount,'Y' AS isimuser,messagetype  FROM allchatview INNER JOIN (SELECT groupid,groupname,createdate FROM groupinfo) ON groupid=chatcontact ORDER BY senttime ASC ) GROUP BY chatnumber ORDER BY senttime DESC", (String[]) null);
            cursor.moveToFirst();
        } catch (Exception e) {
            Log.e(this.LOG_CHATLISTDAO, "getAllChatRecordCursor, list, exception=" + e.toString());
        } finally {
            close();
        }
        return cursor;
    }

    public ChatListUserInfo getChatListDetailByChatcontact(String str) {
        ChatListUserInfo chatListUserInfo = null;
        Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatListId, starts");
        String str2 = "SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, NICKNAME, PHOTO, TYPE FROM (SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, NICKNAME, PHOTO ,'individual' as TYPE FROM (SELECT * FROM chatlist C LEFT OUTER JOIN messagestore M ON C.MESSAGEID = M.MESSAGEID) SG INNER JOIN userinfo FI ON (FI.USERNAME = SG.CHATCONTACT) order by SENTTIME desc) t1 where CHATCONTACT='" + str + "' union all select chatid, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, groupname, PHOTO, '', '" + "group" + "' as TYPE from (SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, groupname, PHOTO FROM (SELECT * FROM chatlist C LEFT OUTER JOIN messagestore M ON C.MESSAGEID = M.MESSAGEID) SG INNER JOIN groupinfo FI ON (FI.groupid = SG.CHATCONTACT) order by SENTTIME desc) t1 where " + DBHelper.CHATLIST_KEY_CHATCONTACT + "='" + str + "' order by senttime desc";
        Log.d(this.LOG_CHATLISTDAO, "ChatListImpl, query=" + str2);
        try {
            open();
            Cursor rawQuery = this.db.rawQuery(str2, (String[]) null);
            rawQuery.moveToFirst();
            Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, count=" + rawQuery.getCount());
            if (!rawQuery.isAfterLast()) {
                try {
                    chatListUserInfo = parseChatListUserInfo(rawQuery);
                } catch (Exception e) {
                    Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, fail to find scanGroupInfo exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, exception=" + e2.toString());
        } finally {
            close();
        }
        return chatListUserInfo;
    }

    public ArrayList<ChatListUserInfo> getChatListGroupInfo() {
        Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatListId, starts");
        return null;
    }

    public ArrayList<ChatListUserInfo> getChatListUserInfo() {
        Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, findByChatListId, starts");
        ArrayList<ChatListUserInfo> arrayList = new ArrayList<>();
        Log.d(this.LOG_CHATLISTDAO, "ChatListImpl, query=" + "SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, NICKNAME, PHOTO, TYPE FROM (SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, NICKNAME, PHOTO ,'individual' as TYPE FROM (SELECT * FROM chatlist C LEFT OUTER JOIN messagestore M ON C.MESSAGEID = M.MESSAGEID) SG INNER JOIN userinfo FI ON (FI.USERNAME = SG.CHATCONTACT) order by SENTTIME desc) t1 union all select chatid, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, groupname, PHOTO, '', 'group' as TYPE from (SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, groupname, PHOTO FROM (SELECT * FROM chatlist C LEFT OUTER JOIN messagestore M ON C.MESSAGEID = M.MESSAGEID) SG INNER JOIN groupinfo FI ON (FI.groupid = SG.CHATCONTACT) order by SENTTIME desc) t1 order by senttime desc");
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, NICKNAME, PHOTO, TYPE FROM (SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, NICKNAME, PHOTO ,'individual' as TYPE FROM (SELECT * FROM chatlist C LEFT OUTER JOIN messagestore M ON C.MESSAGEID = M.MESSAGEID) SG INNER JOIN userinfo FI ON (FI.USERNAME = SG.CHATCONTACT) order by SENTTIME desc) t1 union all select chatid, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, groupname, PHOTO, '', 'group' as TYPE from (SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, groupname, PHOTO FROM (SELECT * FROM chatlist C LEFT OUTER JOIN messagestore M ON C.MESSAGEID = M.MESSAGEID) SG INNER JOIN groupinfo FI ON (FI.groupid = SG.CHATCONTACT) order by SENTTIME desc) t1 order by senttime desc", (String[]) null);
            rawQuery.moveToFirst();
            Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, count=" + rawQuery.getCount());
            while (!rawQuery.isAfterLast()) {
                try {
                    arrayList.add(parseChatListUserInfo(rawQuery));
                } catch (Exception e) {
                    Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, fail to find scanGroupInfo exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, exception=" + e2.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public ArrayList<ChatList> list() {
        Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, list, starts");
        ArrayList<ChatList> arrayList = new ArrayList<>();
        try {
            open();
            Cursor query = this.db.query(DBHelper.TABLE_CHATLIST, this.CHATLIST_TABLE_COLUMNS, (String) null, (String[]) null, (String) null, (String) null, "CHATID ASC");
            query.moveToFirst();
            Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, list, count=" + query.getCount());
            while (!query.isAfterLast()) {
                try {
                    arrayList.add(parseChatList(query));
                } catch (Exception e) {
                    Log.e(this.LOG_CHATLISTDAO, "list, fail to add exception=" + e.toString());
                }
                query.moveToNext();
            }
            query.close();
        } catch (Exception e2) {
            Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, list, exception=" + e2.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public void open() {
        this.db = DBHelper.getDBInstance(this.mContext);
    }

    /* access modifiers changed from: protected */
    public ChatList parseChatList(Cursor cursor) {
        int i = cursor.getInt(cursor.getColumnIndexOrThrow("CHATID"));
        ChatList chatList = new ChatList(cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.CHATLIST_KEY_CHATCONTACT)), Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("MESSAGEID"))));
        chatList.setChatId(i);
        return chatList;
    }

    /* access modifiers changed from: protected */
    public ChatListUserInfo parseChatListUserInfo(Cursor cursor) {
        int i = cursor.getInt(cursor.getColumnIndexOrThrow("CHATID"));
        String string = cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.CHATLIST_KEY_CHATCONTACT));
        int i2 = cursor.getInt(cursor.getColumnIndexOrThrow("MESSAGEID"));
        String string2 = cursor.getString(cursor.getColumnIndexOrThrow("TEXTMESSAGE"));
        Date convertStrToDate = FormatUtil.convertStrToDate(cursor.getString(cursor.getColumnIndexOrThrow("SENTTIME")));
        String string3 = cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.USERINFO_KEY_NICKNAME));
        String string4 = cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.USERINFO_KEY_PHOTO));
        String string5 = cursor.getString(cursor.getColumnIndexOrThrow("TYPE"));
        if (string5 != null && string5.equals("individual")) {
            boolean z = false;
            string3 = SMSConstants.formatPhoneNumber(string);
            Cursor query = this.mContext.getContentResolver().query(ContactFragment.ContactIMQuery.URI, ContactFragment.ContactIMQuery.PROJECTION, ContactFragment.ContactIMQuery.SELECTION + getPhoneNumberLookUpKey(string), (String[]) null, "display_name");
            query.moveToFirst();
            while (!query.isAfterLast() && !z) {
                String string6 = query.getString(0);
                Cursor query2 = this.mContext.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[]{"_id", "data1", "lookup"}, "contact_id = ?", new String[]{string6}, (String) null);
                if (query2 != null) {
                    query2.moveToFirst();
                    boolean z2 = z;
                    String str = string3;
                    while (!query2.isAfterLast()) {
                        String normalizeContactNumber = PhoneListService.normalizeContactNumber(query2.getString(query2.getColumnIndex("data1")));
                        if (normalizeContactNumber != null && normalizeContactNumber.equals(string)) {
                            String string7 = query.getString(1);
                            if (!"".equals(string7) && string7 != null) {
                                z2 = true;
                                str = string7;
                            }
                        }
                        query2.moveToNext();
                    }
                    query2.close();
                    query.moveToNext();
                    z = z2;
                    string3 = str;
                }
            }
            query.close();
        }
        Log.i(this.LOG_CHATLISTDAO, "id=" + i + " ;chatContact=" + string + " ;messageId" + i2 + ";type=" + string5 + ";nickname=" + string3);
        ChatListUserInfo chatListUserInfo = new ChatListUserInfo();
        chatListUserInfo.setChatId(i);
        chatListUserInfo.setChatContact(string);
        chatListUserInfo.setMessageId(i2);
        chatListUserInfo.setTextMessage(string2);
        chatListUserInfo.setSentTime(convertStrToDate);
        chatListUserInfo.setNickName(string3);
        chatListUserInfo.setPhoto(string4);
        chatListUserInfo.setType(string5);
        return chatListUserInfo;
    }

    public void remove(ChatList chatList) {
        int chatId = chatList.getChatId();
        try {
            open();
            Log.i(this.LOG_CHATLISTDAO, "ChatListDAOImpl, remove, removed number of row=" + this.db.delete(DBHelper.TABLE_CHATLIST, "CHATID=?", new String[]{String.valueOf(chatId)}));
        } catch (Exception e) {
            Log.e(this.LOG_CHATLISTDAO, "ChatListDAOImpl, remove, exception=" + e.toString());
        } finally {
            close();
        }
    }

    public void removeChatRecord(String str) {
        try {
            open();
            Log.i(this.LOG_CHATLISTDAO, "ChatListDAOImpl, removeChatRecord, removed number of row=" + this.db.delete(DBHelper.TABLE_CHATLIST, "CHATID=?", new String[]{str}));
        } catch (Exception e) {
            Log.e(this.LOG_CHATLISTDAO, "ChatListDAOImpl, removeChatRecord, exception=" + e.toString());
        } finally {
            close();
        }
    }

    public int update(ChatList chatList) {
        int i = 0;
        Log.v(this.LOG_CHATLISTDAO, "ChatListDAOImpl, update, starts");
        if (chatList.getChatId() > 0) {
            ContentValues contentValues = new ContentValues();
            contentValues.put(DBHelper.CHATLIST_KEY_CHATCONTACT, chatList.getChatContact());
            contentValues.put("MESSAGEID", chatList.getMessageId());
            try {
                open();
                i = this.db.update(DBHelper.TABLE_CHATLIST, contentValues, "CHATID=?", new String[]{String.valueOf("CHATID")});
                Log.i(this.LOG_CHATLISTDAO, "ChatListImpl, update, updated number of row=" + i);
            } catch (Exception e) {
                Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, update, exception=" + e.toString());
            } finally {
                close();
            }
        } else {
            Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, update, fail: scan group id is " + chatList.getChatId());
        }
        Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, update, no of row=" + i);
        return i;
    }

    public void updateMessageIdForChatList(int i, int i2) {
        int i3 = 0;
        Log.v(this.LOG_CHATLISTDAO, "ChatListDAOImpl, update, starts");
        ContentValues contentValues = new ContentValues();
        contentValues.put("MESSAGEID", Integer.valueOf(i2));
        try {
            open();
            i3 = this.db.update(DBHelper.TABLE_CHATLIST, contentValues, "CHATID=?", new String[]{String.valueOf(i)});
            Log.i(this.LOG_CHATLISTDAO, "ChatListImpl, update, updated number of row=" + i3);
        } catch (Exception e) {
            Log.e(this.LOG_CHATLISTDAO, "ChatListImpl, update, exception=" + e.toString());
        } finally {
            close();
        }
        Log.v(this.LOG_CHATLISTDAO, "ChatListImpl, update, no of row=" + i3);
    }
}
