package com.pccw.sms.service;

import android.content.Context;
import android.database.Cursor;
import android.provider.ContactsContract;
import android.util.Log;
import com.pccw.database.dao.UserInfoDAOImpl;
import com.pccw.database.entity.GroupMember;
import com.pccw.database.entity.UserInfo;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.ContactFragment;
import com.pccw.sms.bean.ConversationParticipantItem;
import com.pccw.sms.bean.SMSConstants;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class ConversationParticipantItemService {
    private static String CONTACT_IMAGE = "CONTACT_PROFILE_IMG";
    private static String CONTACT_NAME = "CONTACT_DISPLAY_NAME";
    private static String LOG_TAG = Constants.ConversationParticipantItemService;
    private static String[] PROJECTION = {"_id", "data1", "lookup"};
    protected static UserInfoDAOImpl userInfoImpl;
    protected Context context;

    public ConversationParticipantItemService(Context context2) {
        this.context = context2;
        userInfoImpl = new UserInfoDAOImpl(context2);
    }

    private HashMap<String, String> getContactDisplayNameAndImage(String str) {
        boolean z = false;
        HashMap<String, String> hashMap = new HashMap<>();
        String str2 = null;
        String str3 = null;
        Cursor query = this.context.getContentResolver().query(ContactFragment.ContactIMQuery.URI, ContactFragment.ContactIMQuery.PROJECTION, ContactFragment.ContactIMQuery.SELECTION + getPhoneNumberLookUpKey(str), (String[]) null, "display_name");
        query.moveToFirst();
        while (!query.isAfterLast() && !z) {
            Cursor query2 = this.context.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, PROJECTION, "contact_id = ?", new String[]{query.getString(0)}, (String) null);
            if (query2 != null) {
                query2.moveToFirst();
                String str4 = str3;
                String str5 = str2;
                boolean z2 = z;
                while (!query2.isAfterLast()) {
                    String normalizeContactNumber = PhoneListService.normalizeContactNumber(query2.getString(query2.getColumnIndex("data1")));
                    if (normalizeContactNumber != null && normalizeContactNumber.equals(str)) {
                        String string = query.getString(1);
                        if (!"".equals(string) && string != null) {
                            z2 = true;
                            str5 = string;
                        }
                        String string2 = query.getString(2) == null ? "" : query.getString(2);
                        if (!"".equals(string2) && string2 != null) {
                            str4 = string2;
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
        hashMap.put(CONTACT_NAME, str2);
        hashMap.put(CONTACT_IMAGE, str3);
        return hashMap;
    }

    public static ConversationParticipantItem getConversationParticipantItemByMsisdn(String str) {
        UserInfo find = userInfoImpl.find(str);
        if (find != null) {
            return new ConversationParticipantItem(str, find.getNickName(), find.getPhoto());
        }
        return null;
    }

    private String getPhoneNumberLookUpKey(String str) {
        StringBuilder sb = new StringBuilder();
        Cursor query = this.context.getContentResolver().query(ContactFragment.AllPhoneNumberQuery.URI, ContactFragment.AllPhoneNumberQuery.PROJECTION, (String) null, (String[]) null, "data1");
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

    public static boolean isIMUser(String str) {
        UserInfo find = userInfoImpl.find(str);
        Log.v(LOG_TAG, "check the record in UserInfo : " + find);
        return find != null;
    }

    public void addConversationParticipant(ConversationParticipantItem conversationParticipantItem) {
        if (conversationParticipantItem != null) {
            Log.i(LOG_TAG, "userId=" + conversationParticipantItem.getUserId());
            userInfoImpl.add(new UserInfo(conversationParticipantItem.getUserId(), conversationParticipantItem.getNickName(), conversationParticipantItem.getProfileImagePath()));
        }
    }

    public ArrayList<ConversationParticipantItem> getAddGroupParticipantItem(String str) {
        ArrayList<ConversationParticipantItem> arrayList = new ArrayList<>();
        Iterator<UserInfo> it = userInfoImpl.listIMUsersNotInGroup(str).iterator();
        while (it.hasNext()) {
            arrayList.add(getGroupParticipantItemContactDetail(it.next()));
        }
        return arrayList;
    }

    public ArrayList<ConversationParticipantItem> getContactWithIMParticipantItem(String str, ArrayList<String> arrayList, Context context2) {
        ArrayList<ConversationParticipantItem> arrayList2 = new ArrayList<>();
        ArrayList arrayList3 = new ArrayList();
        Cursor query = context2.getContentResolver().query(ContactFragment.ContactIMQuery.URI, ContactFragment.ContactIMQuery.PROJECTION, ContactFragment.ContactIMQuery.SELECTION + str, (String[]) null, "display_name");
        query.moveToFirst();
        while (!query.isAfterLast()) {
            Cursor query2 = context2.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, PROJECTION, "contact_id = ?", new String[]{query.getString(0)}, (String) null);
            if (query2 != null) {
                query2.moveToFirst();
                while (!query2.isAfterLast()) {
                    String normalizeContactNumber = PhoneListService.normalizeContactNumber(query2.getString(query2.getColumnIndex("data1")));
                    if (arrayList.contains(normalizeContactNumber) && !arrayList3.contains(normalizeContactNumber)) {
                        arrayList2.add(new ConversationParticipantItem(query2.getString(query2.getColumnIndex("data1")), query.getString(1), query.getString(2) == null ? "" : query.getString(2)));
                        arrayList3.add(normalizeContactNumber);
                    }
                    query2.moveToNext();
                }
                query2.close();
                query.moveToNext();
            }
        }
        query.close();
        return arrayList2;
    }

    public ArrayList<ConversationParticipantItem> getConversationParticipantItem() {
        ArrayList<ConversationParticipantItem> arrayList = new ArrayList<>();
        Iterator<UserInfo> it = userInfoImpl.listUserInfoWithoutOwner(ClientStateManager.getRegisteredNumber(this.context)).iterator();
        while (it.hasNext()) {
            UserInfo next = it.next();
            arrayList.add(new ConversationParticipantItem(next.getUserName(), next.getNickName(), next.getPhoto()));
        }
        return arrayList;
    }

    public GroupMember getGroupMemberViaContact(String str, String str2) {
        String str3;
        HashMap<String, String> contactDisplayNameAndImage = getContactDisplayNameAndImage(str2);
        String formatPhoneNumber = SMSConstants.formatPhoneNumber(str2);
        String str4 = null;
        UserInfo profile = new ProfileService(this.context).getProfile(str2);
        if (profile != null) {
            str4 = profile.getPhoto();
        }
        if (contactDisplayNameAndImage != null) {
            str3 = (contactDisplayNameAndImage.get(CONTACT_NAME) == null || "".equals(contactDisplayNameAndImage.get(CONTACT_NAME))) ? formatPhoneNumber : contactDisplayNameAndImage.get(CONTACT_NAME);
            if (contactDisplayNameAndImage.get(CONTACT_IMAGE) != null && !"".equals(contactDisplayNameAndImage.get(CONTACT_IMAGE))) {
                str4 = contactDisplayNameAndImage.get(CONTACT_IMAGE);
            }
        } else {
            str3 = formatPhoneNumber;
        }
        return new GroupMember(str, str2, str3, str4);
    }

    public ConversationParticipantItem getGroupParticipantItemContactDetail(UserInfo userInfo) {
        String str;
        String str2;
        String str3;
        if (userInfo != null) {
            str3 = userInfo.getUserName();
            str2 = userInfo.getNickName();
            str = userInfo.getPhoto();
        } else {
            str = null;
            str2 = null;
            str3 = null;
        }
        HashMap<String, String> contactDisplayNameAndImage = getContactDisplayNameAndImage(str3);
        if (contactDisplayNameAndImage.get(CONTACT_NAME) != null && !"".equals(contactDisplayNameAndImage.get(CONTACT_NAME))) {
            str2 = contactDisplayNameAndImage.get(CONTACT_NAME);
        }
        if (contactDisplayNameAndImage.get(CONTACT_IMAGE) != null && !"".equals(contactDisplayNameAndImage.get(CONTACT_IMAGE))) {
            str = contactDisplayNameAndImage.get(CONTACT_IMAGE);
        }
        return new ConversationParticipantItem(str3, str2, str);
    }

    public String getGroupParticipantName(String str) {
        HashMap<String, String> contactDisplayNameAndImage = getContactDisplayNameAndImage(str);
        return ("".equals(contactDisplayNameAndImage.get(CONTACT_NAME)) || contactDisplayNameAndImage.get(CONTACT_NAME) == null) ? SMSConstants.formatPhoneNumber(str) : contactDisplayNameAndImage.get(CONTACT_NAME);
    }

    public boolean isDuplicatedUsername(String str) {
        UserInfo find = userInfoImpl.find(str);
        Log.i(LOG_TAG, "check the record in UserInfo : " + find);
        return find != null;
    }

    public ArrayList<String> listIMNumber() {
        return userInfoImpl.listIMNumberWithoutOwner(ClientStateManager.getRegisteredNumber(this.context));
    }

    public void updateUserInfo(UserInfo userInfo) {
        userInfoImpl.update(userInfo);
    }
}
