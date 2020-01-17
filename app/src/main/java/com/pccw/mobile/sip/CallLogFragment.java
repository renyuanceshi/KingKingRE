package com.pccw.mobile.sip;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.AsyncQueryHandler;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabaseCorruptException;
import android.database.sqlite.SQLiteDiskIOException;
import android.database.sqlite.SQLiteFullException;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.provider.ContactsContract;
import android.support.v4.app.Fragment;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.telephony.PhoneNumberUtils;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ResourceCursorAdapter;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.pccw.android.common.widget.CenteredRadioImageButton;
import com.pccw.android.common.widget.ImageLoader;
import com.pccw.android.common.widget.SegmentedRadioGroup;
import com.pccw.android.common.widget.TypefacedTextView;
import com.pccw.database.dao.UserInfoDAOImpl;
import com.pccw.database.entity.UserInfo;
import com.pccw.database.helper.DBHelper;
import com.pccw.dialog.EnumKKDialogType;
import com.pccw.dialog.KKDialog;
import com.pccw.dialog.KKDialogBuilder;
import com.pccw.dialog.KKDialogProvider;
import com.pccw.dialog.listener.IKKDialogOnClickListener;
import com.pccw.mobile.provider.KingKingContentProvider;
import com.pccw.mobile.service.CombineHistoryService;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.IntentUtils;
import com.pccw.mobile.sip.util.NetworkUtils;
import com.pccw.mobile.sip.util.RelativeDateUtils;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.sms.helper.ContactsHelper;
import com.pccw.mobile.sms.util.SMSProfileUtil;
import com.pccw.mobile.util.FormatUtil;
import com.pccw.sms.ChatPageActivity;
import com.pccw.sms.NewSMSActivity;
import com.pccw.sms.bean.SMSConstants;
import com.pccw.sms.service.AllHistoryIMServer;
import com.pccw.sms.service.ChatRecordService;
import com.pccw.sms.service.ClearGroupService;
import com.pccw.sms.service.ConversationParticipantItemService;
import com.pccw.sms.service.MessageItemService;
import com.pccw.sms.util.SMSFormatUtil;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Locale;
import org.linphone.CallerInfo;
import org.linphone.LinphoneActivity;
import org.linphone.mediastream.Version;

public class CallLogFragment extends Fragment implements Runnable, ViewTreeObserver.OnPreDrawListener, IKKDialogOnClickListener {
    static final int ALL_HISTORY_CHATID_COLUMN_INDEX = 10;
    static final int ALL_HISTORY_CHATNUMBER_COLUMN_INDEX = 8;
    static final int ALL_HISTORY_ENTRYTYPE_COLUMN_INDEX = 11;
    static final int ALL_HISTORY_ISIMUSER_COLUMN_INDEX = 13;
    static final int ALL_HISTORY_MESSAGETYPE_COLUMN_INDEX = 14;
    static final int ALL_HISTORY_TEXTMESSAGE_COLUMN_INDEX = 9;
    static final int ALL_HISTORY_UNREADCOUNT_COLUMN_INDEX = 12;
    static final int CALLER_NAME_COLUMN_INDEX = 5;
    static final int CALLER_NUMBERLABEL_COLUMN_INDEX = 7;
    static final int CALLER_NUMBERTYPE_COLUMN_INDEX = 6;
    static final String[] CALL_LOG_PROJECTION = {"_id", DBHelper.NUMBER, DBHelper.DATE, "duration", "type", "name", DBHelper.CACHED_NUMBER_TYPE, DBHelper.CACHED_NUMBER_LABEL};
    static final int CALL_TYPE_COLUMN_INDEX = 4;
    static final String[] CHAT_RECORD_PROJECTION = {CombineHistoryService.CHAT_ID, CombineHistoryService.CHAT_TYPE, CombineHistoryService.CHAT_NAME, CombineHistoryService.LAST_MESSAGE, CombineHistoryService.LAST_MESSAGE_TIME};
    static final String[] CONTACT_PHOTO_PROJECTION = {"_id", "photo_thumb_uri"};
    static final String[] CONTACT_PHOTO_PROJECTION_LOWER_API11 = {"_id", "_id"};
    static final int DATE_COLUMN_INDEX = 2;
    static final int DURATION_COLUMN_INDEX = 3;
    public static final int EXIT_MENU_ITEM = 2;
    public static final int FIRST_MENU_ID = 1;
    private static final int FORMATTING_TYPE_INVALID = -1;
    static final int ID_COLUMN_INDEX = 0;
    static final int LABEL_COLUMN_INDEX = 3;
    static final int MATCHED_NUMBER_COLUMN_INDEX = 4;
    static final int NAME_COLUMN_INDEX = 1;
    static final int NUMBER_COLUMN_INDEX = 1;
    static final int PERSON_ID_COLUMN_INDEX = 0;
    @SuppressLint({"InlinedApi"})
    static final String[] PHONES_PROJECTION = {"_id", "display_name", "type", "label", DBHelper.NUMBER, "photo_thumb_uri"};
    static final String[] PHONES_PROJECTION_LOWER_API11 = {"_id", "display_name", "type", "label", DBHelper.NUMBER, "_id"};
    static final int PHONE_TYPE_COLUMN_INDEX = 2;
    static final int PHOTO_THUMBNAIL_URI_INDEX = 5;
    private static final int QUERY_TOKEN = 53;
    private static final int QUERY_TYPE_ALL = 2;
    private static final int QUERY_TYPE_CALLLOG = 0;
    private static final int QUERY_TYPE_SMS = 1;
    private static final int REDRAW_ALL = 2;
    private static final int REDRAW_TEXTVIEW = 4;
    private static final int REDRAW_THUMB = 3;
    private static final String SHOW_IDD_CHARGE_MESSAGE = "SHOW_IDD_CHARGE_MESSAGE";
    private static final int START_THREAD = 1;
    private static final String TAG = "PCCW_MOBILE_SIP";
    private static final int UPDATE_TOKEN = 56;
    /* access modifiers changed from: private */
    public static Activity activity;
    /* access modifiers changed from: private */
    public static Context ctx;
    /* access modifiers changed from: private */
    public static CallLogAdapter mAdapter;
    static AllHistoryIMServer mAllHistoryIMServer;
    private static Thread mCallerIdThread;
    private static volatile boolean mDone;
    private static final SpannableStringBuilder sEditable = new SpannableStringBuilder();
    private static int sFormattingType = -1;
    CenteredRadioImageButton allTextView;
    CenteredRadioImageButton callLogsTextView;
    /* access modifiers changed from: private */
    public HashMap<String, ContactInfo> contactHashMap;
    ConversationParticipantItemService conversationParticipantItemService;
    /* access modifiers changed from: private */
    public int currentQuery = 1;
    ListView historyList;
    SegmentedRadioGroup historySelectLayout;
    private boolean mFirst;
    private ContactCheckingHandler mHandler;
    private ViewTreeObserver.OnPreDrawListener mPreDrawListener;
    private QueryHandler mQueryHandler;
    private LinkedList<CallerInfoQuery> mRequests;
    CenteredRadioImageButton messageTextView;
    String targerNumber;
    private HashMap<String, ArrayList<CallLogItemPendingViews>> updatePendingHashMap;

    private class CallLogAdapter extends ResourceCursorAdapter {
        private ImageLoader mImageLoader;
        private boolean mLoading = true;

        public CallLogAdapter(Context context, int i, Cursor cursor, boolean z) {
            super(context, i, cursor, z);
            this.mImageLoader = new ImageLoader(context);
        }

        private String getUserContactPhotoURL(String str) {
            Cursor query = CallLogFragment.ctx.getContentResolver().query(Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(str)), Version.sdkAboveOrEqual(11) ? CallLogFragment.CONTACT_PHOTO_PROJECTION : CallLogFragment.CONTACT_PHOTO_PROJECTION_LOWER_API11, (String) null, (String[]) null, (String) null);
            if (!query.moveToFirst() || Build.VERSION.SDK_INT < 11) {
                return null;
            }
            try {
                return query.getString(query.getColumnIndexOrThrow("photo_thumb_uri"));
            } catch (IllegalArgumentException e) {
                return null;
            }
        }

        private String parseGroupSystemMessage(Context context, String str, String str2) {
            String str3;
            String str4;
            String[] split = str.split(SMSConstants.MESSAGE_SYSTEM_SEPARATOR);
            UserInfoDAOImpl userInfoDAOImpl = new UserInfoDAOImpl(CallLogFragment.ctx);
            String registeredNumber = ClientStateManager.getRegisteredNumber(CallLogFragment.ctx);
            String str5 = "";
            if (split.length == 2) {
                String string = str2.equals(SMSConstants.MESSAGE_TYPE_SYSTEM_ADD) ? (!registeredNumber.equals(split[0]) || !split[0].equals(split[1])) ? CallLogFragment.this.getResources().getString(R.string.group_chat_system_add_member) : CallLogFragment.this.getResources().getString(R.string.group_chat_system_you_have_joined) : registeredNumber.equals(split[0]) ? split[0].equals(split[1]) ? CallLogFragment.this.getResources().getString(R.string.group_chat_system_you_have_left) : CallLogFragment.this.getResources().getString(R.string.group_chat_system_remove_member) : split[0].equals(split[1]) ? CallLogFragment.this.getResources().getString(R.string.group_chat_system_member_left) : CallLogFragment.this.getResources().getString(R.string.group_chat_system_remove_member);
                String str6 = split[0];
                String str7 = split[1];
                UserInfoDAOImpl.ContactDetail findUserContactDetail = userInfoDAOImpl.findUserContactDetail(str6);
                if (!split[0].equals(split[1])) {
                    String string2 = str6.equals(registeredNumber) ? CallLogFragment.this.getResources().getString(R.string.group_chat_system_you) : ("".equals(findUserContactDetail.nickname) || findUserContactDetail.nickname == null) ? SMSConstants.formatPhoneNumber(str6) : findUserContactDetail.nickname;
                    UserInfoDAOImpl.ContactDetail findUserContactDetail2 = userInfoDAOImpl.findUserContactDetail(split[1]);
                    str3 = "" + string;
                    if (str7.equals(registeredNumber)) {
                        str5 = string2;
                        str4 = CallLogFragment.ctx.getResources().getString(R.string.group_chat_system_you);
                    } else {
                        String formatPhoneNumber = ("".equals(findUserContactDetail2.nickname) || findUserContactDetail2.nickname == null) ? SMSConstants.formatPhoneNumber(str7) : findUserContactDetail2.nickname;
                        str5 = string2;
                        str4 = formatPhoneNumber;
                    }
                } else {
                    str4 = "";
                    if (str7.equals(registeredNumber)) {
                        str3 = string;
                        str5 = CallLogFragment.this.getResources().getString(R.string.group_chat_system_you);
                    } else {
                        String formatPhoneNumber2 = ("".equals(findUserContactDetail.nickname) || findUserContactDetail.nickname == null) ? SMSConstants.formatPhoneNumber(str7) : findUserContactDetail.nickname;
                        userInfoDAOImpl.findUserContactDetail(split[1]);
                        str3 = string;
                        str5 = formatPhoneNumber2;
                    }
                }
            } else {
                String string3 = str2.equals(SMSConstants.MESSAGE_TYPE_SYSTEM_ADD) ? CallLogFragment.this.getResources().getString(R.string.group_chat_system_add_member) : CallLogFragment.this.getResources().getString(R.string.group_chat_system_remove_member);
                UserInfoDAOImpl.ContactDetail findUserContactDetail3 = userInfoDAOImpl.findUserContactDetail(split[0]);
                String formatPhoneNumber3 = ("".equals(findUserContactDetail3.nickname) || findUserContactDetail3.nickname == null) ? SMSConstants.formatPhoneNumber(split[0]) : findUserContactDetail3.nickname;
                str3 = string3;
                str4 = formatPhoneNumber3;
            }
            return str5 + str3 + str4;
        }

        private void setCallTypeLabel(CallLogItemViews callLogItemViews, int i) {
            callLogItemViews.calltypeimageView.setVisibility(0);
            switch (i) {
                case 1:
                case 4:
                case 5:
                case 6:
                    callLogItemViews.calltypeimageView.setImageResource(R.drawable.ic_incoming_call);
                    return;
                case 2:
                    callLogItemViews.calltypeimageView.setImageResource(R.drawable.ic_outgoing_call);
                    return;
                case 3:
                    callLogItemViews.calltypeimageView.setImageResource(R.drawable.ic_missed_call);
                    return;
                case 21:
                    callLogItemViews.labelView.setText("");
                    callLogItemViews.calltypeimageView.setImageResource(R.drawable.ic_message);
                    return;
                default:
                    callLogItemViews.calltypeimageView.setVisibility(8);
                    return;
            }
        }

        private void setImageViewPhoto(String str, String str2, ImageView imageView) {
            int i = 0;
            switch (CallLogFragment.this.currentQuery) {
                case 0:
                    if (str == null) {
                        str = null;
                        break;
                    } else {
                        i = -1;
                        break;
                    }
                case 1:
                case 2:
                    if (!"group".equals(str2)) {
                        if (str == null) {
                            i = R.drawable.default_profile_pic;
                            str = null;
                            break;
                        } else {
                            i = -1;
                            break;
                        }
                    } else {
                        i = R.drawable.default_group_pic;
                        str = null;
                        break;
                    }
                default:
                    str = null;
                    break;
            }
            this.mImageLoader.loadBitmap(str, imageView, i);
        }

        /* access modifiers changed from: private */
        public void setLoading(boolean z) {
            this.mLoading = z;
        }

        public void bindView(View view, Context context, Cursor cursor) {
            Log.i("KKSMS", "==========Bind View==============");
            CallLogItemViews callLogItemViews = (CallLogItemViews) view.getTag();
            String string = CallLogFragment.this.currentQuery == 0 ? null : cursor.getString(11);
            final String string2 = cursor.getString(1) != null ? cursor.getString(1) : CallerInfo.UNKNOWN_NUMBER;
            Date convertStrToDate = FormatUtil.convertStrToDate(cursor.getString(2));
            long time = convertStrToDate != null ? convertStrToDate.getTime() : cursor.getLong(2);
            String string3 = cursor.getString(5);
            int i = cursor.getInt(6);
            String string4 = cursor.getString(7);
            String str = string2 + "_" + cursor.getPosition();
            callLogItemViews.photoView.setTag(str);
            callLogItemViews.line1View.setTag(str);
            callLogItemViews.labelView.setTag(str);
            ContactInfo contactInfo = (ContactInfo) CallLogFragment.this.contactHashMap.get(string2);
            if ("group".equals(string) || string2.equals(CallerInfo.PRIVATE_NUMBER) || string2.equals(CallerInfo.UNKNOWN_NUMBER)) {
                contactInfo = ContactInfo.EMPTY;
            } else if (contactInfo == null) {
                ContactInfo contactInfo2 = ContactInfo.EMPTY;
                contactInfo2.isChecking = true;
                CallLogFragment.this.contactHashMap.put(string2, contactInfo2);
                CallLogFragment.this.enqueueRequest(string2, cursor.getPosition(), string3, i, string4, callLogItemViews.photoView, callLogItemViews.line1View, string == null ? callLogItemViews.labelView : null);
                contactInfo = contactInfo2;
            } else if (contactInfo != ContactInfo.EMPTY) {
                if (contactInfo.formattedNumber == null) {
                    contactInfo.formattedNumber = CallLogFragment.this.formatPhoneNumber(contactInfo.number);
                }
                String str2 = contactInfo.formattedNumber;
            } else if (contactInfo == ContactInfo.EMPTY && contactInfo.isChecking) {
                CallLogItemPendingViews callLogItemPendingViews = new CallLogItemPendingViews();
                callLogItemPendingViews.name = callLogItemViews.line1View;
                callLogItemPendingViews.label = string == null ? callLogItemViews.labelView : null;
                callLogItemPendingViews.profile = callLogItemViews.photoView;
                callLogItemPendingViews.position = cursor.getPosition();
                CallLogFragment.this.putPendingItemIntoHash(string2, callLogItemPendingViews);
            }
            final String str3 = contactInfo.name;
            int i2 = contactInfo.numberType;
            String str4 = contactInfo.label;
            long j = contactInfo.personId;
            callLogItemViews.numberView.setVisibility(0);
            Log.i("KKSMS", "number=" + string2);
            Log.i("KKSMS", "callerName=" + string3);
            Log.i("KKSMS", "name=" + contactInfo.name);
            Log.i("KKSMS", "numberType=" + i2);
            Log.i("KKSMS", "personId=" + j);
            if (string2.equals(CallerInfo.PRIVATE_NUMBER)) {
                Log.i("KKSMS", "private number");
                callLogItemViews.line1View.setText(CallLogFragment.this.getString(R.string.private_number));
                callLogItemViews.labelView.setVisibility(8);
                callLogItemViews.numberView.setVisibility(4);
                callLogItemViews.numberView.setText("");
                callLogItemViews.photoView.setImageResource(R.drawable.default_profile_pic);
            } else if (string2.equals(CallerInfo.UNKNOWN_NUMBER)) {
                Log.i("KKSMS", "unknown number");
                callLogItemViews.line1View.setText(CallLogFragment.this.getString(R.string.unknown));
                callLogItemViews.labelView.setVisibility(8);
                callLogItemViews.numberView.setVisibility(4);
                callLogItemViews.numberView.setText("");
                callLogItemViews.photoView.setImageResource(R.drawable.default_profile_pic);
            } else if (TextUtils.isEmpty(string2)) {
                callLogItemViews.line1View.setText(CallLogFragment.this.getString(R.string.NoCallId));
                callLogItemViews.line1View.setTextColor(CallLogFragment.this.getResources().getColor(R.color.color_red));
                callLogItemViews.line1View.setTypeface((Typeface) null);
                callLogItemViews.numberView.setText(CallLogFragment.this.getString(R.string.unknown));
                callLogItemViews.labelView.setVisibility(8);
                callLogItemViews.photoView.setVisibility(4);
            } else if (!TextUtils.isEmpty(string3) || !TextUtils.isEmpty(contactInfo.name)) {
                Log.i("KKSMS", "contact or IM number");
                ImageView imageView = callLogItemViews.photoView;
                imageView.setTag(Integer.valueOf(cursor.getPosition()));
                String str5 = contactInfo.thumbnailUri;
                if (!TextUtils.isEmpty(str3) || TextUtils.isEmpty(string3)) {
                    i = i2;
                } else {
                    str4 = string4;
                    str3 = string3;
                }
                if (string == null) {
                    Log.i("KKSMS", "mEntryType=null");
                    callLogItemViews.line1View.setText(str3);
                    if (TextUtils.isEmpty(str5)) {
                        str5 = getUserContactPhotoURL(string2);
                    }
                } else if (string.equals("group")) {
                    ArrayList<String> convertSplittingStringToSortedArrayList = SMSFormatUtil.convertSplittingStringToSortedArrayList(str3);
                    Log.i("KKSMS", "CHAT_TYPE_GROUP setText=" + SMSProfileUtil.getMultipleSMSProfileTitle(convertSplittingStringToSortedArrayList, CallLogFragment.ctx));
                    callLogItemViews.line1View.setText(SMSProfileUtil.getMultipleSMSProfileTitle(convertSplittingStringToSortedArrayList, CallLogFragment.ctx));
                } else {
                    Log.i("KKSMS", "CHAT_TYPE_INDIVIDUAL setText=" + str3);
                    callLogItemViews.line1View.setText(str3);
                    if (TextUtils.isEmpty(str5)) {
                        str5 = getUserContactPhotoURL(string2);
                    }
                }
                setImageViewPhoto(str5, string, imageView);
                callLogItemViews.numberView.setText(CallLogFragment.this.formatPhoneNumber(string2));
                String string5 = i == 0 ? str4 : CallLogFragment.this.getString(ContactsContract.CommonDataKinds.Phone.getTypeLabelResource(i));
                if (!TextUtils.isEmpty(string5)) {
                    callLogItemViews.labelView.setText(string5);
                    callLogItemViews.labelView.setVisibility(0);
                } else {
                    callLogItemViews.labelView.setVisibility(8);
                }
            } else {
                Log.i("KKSMS", "non contact number");
                String access$1200 = CallLogFragment.this.formatPhoneNumber(string2);
                callLogItemViews.line1View.setText(access$1200);
                callLogItemViews.numberView.setText(access$1200);
                callLogItemViews.labelView.setVisibility(8);
                callLogItemViews.photoView.setImageResource(R.drawable.default_profile_pic);
            }
            Log.v("KKSMS", "contactName=" + str3);
            switch (CallLogFragment.this.currentQuery) {
                case 0:
                    callLogItemViews.unreadMsgLayout.setVisibility(4);
                    view.setOnClickListener(new View.OnClickListener() {
                        public void onClick(View view) {
                            if (!string2.equals(CallerInfo.PRIVATE_NUMBER) && !string2.equals(CallerInfo.UNKNOWN_NUMBER) && !TextUtils.isEmpty(string2)) {
                                ContactsHelper contactsHelper = new ContactsHelper(string2, CallLogFragment.ctx);
                                Intent intent = new Intent(CallLogFragment.activity, CallLogGroupedActivity.class);
                                intent.putExtra("contactNumber", string2);
                                intent.putExtra("contactName", str3);
                                intent.putExtra("contactPhoto", contactsHelper.getPhoto());
                                CallLogFragment.this.startActivity(intent);
                            }
                        }
                    });
                    view.setLongClickable(false);
                    break;
                case 1:
                    int i3 = cursor.getInt(12);
                    if (i3 > 0) {
                        callLogItemViews.unreadMsgLayout.setVisibility(0);
                        callLogItemViews.unreadMsgNum.setText(Integer.toString(i3));
                    } else {
                        callLogItemViews.unreadMsgLayout.setVisibility(4);
                    }
                    try {
                        String string6 = cursor.getString(14);
                        if (string6 == null || string6.equals(SMSConstants.MESSAGE_TYPE_TEXT)) {
                            callLogItemViews.numberView.setText(cursor.getString(9) == null ? "" : cursor.getString(9));
                        } else if (string6.equals(SMSConstants.MESSAGE_TYPE_LOCATION)) {
                            callLogItemViews.numberView.setText(CallLogFragment.this.getString(R.string.push_noti_type_location));
                        } else if (string6.equals(SMSConstants.MESSAGE_TYPE_VCARD)) {
                            callLogItemViews.numberView.setText(CallLogFragment.this.getString(R.string.push_noti_type_contact));
                        } else if (string6.equals(SMSConstants.MESSAGE_TYPE_SYSTEM_ADD) || string6.equals(SMSConstants.MESSAGE_TYPE_SYSTEM_DELETE)) {
                            callLogItemViews.numberView.setText(parseGroupSystemMessage(context, cursor.getString(9) == null ? "" : cursor.getString(9), string6));
                        }
                        callLogItemViews.labelView.setText("");
                        final String string7 = cursor.getString(11);
                        final String string8 = cursor.getString(10);
                        final String str6 = string2;
                        view.setOnClickListener(new View.OnClickListener() {
                            public void onClick(View view) {
                                if (string7 != null && string8 != null) {
                                    Intent intent = new Intent(CallLogFragment.ctx, ChatPageActivity.class);
                                    intent.putExtra("chatId", Integer.parseInt(string8));
                                    intent.putExtra("chatType", string7);
                                    intent.putExtra("recipient", str6);
                                    if (string7.equals("group")) {
                                        intent.putExtra(ShareConstants.WEB_DIALOG_PARAM_TITLE, SMSProfileUtil.getMultipleSMSProfileTitle(SMSFormatUtil.convertSplittingStringToSortedArrayList(str6), CallLogFragment.ctx));
                                        intent.putExtra("photo", SMSProfileUtil.getMultipleSMSProfilePic(CallLogFragment.ctx));
                                    } else if (string7.equals("individual")) {
                                        intent.putExtra(ShareConstants.WEB_DIALOG_PARAM_TITLE, SMSProfileUtil.getSingleSMSProfileTitle(str6, CallLogFragment.ctx));
                                        intent.putExtra("photo", SMSProfileUtil.getSingleSMSProfilePic(str6, CallLogFragment.ctx));
                                    }
                                    CallLogFragment.this.startActivity(intent);
                                }
                            }
                        });
                        view.setLongClickable(true);
                        final String str7 = string7;
                        final String str8 = string2;
                        final String str9 = string8;
                        final String str10 = str3;
                        view.setOnLongClickListener(new View.OnLongClickListener() {
                            public boolean onLongClick(View view) {
                                if (str7 == null) {
                                    return true;
                                }
                                boolean isNumberWithinContact = CallLogFragment.isNumberWithinContact(str8, CallLogFragment.ctx);
                                Log.w("KKIM", "View OnLongClick: number=" + str8 + " chatid=" + str9 + " nickname=" + str10 + " chatType=" + str7 + " isContactExist=" + isNumberWithinContact);
                                CallLogFragment.this.popupChatSelection(str7, str8, str9, isNumberWithinContact);
                                return true;
                            }
                        });
                        break;
                    } catch (IllegalArgumentException e) {
                        e.printStackTrace();
                        return;
                    }
                    break;
                case 2:
                    String string9 = cursor.getString(14);
                    if (string9 == null || string9.equals(SMSConstants.MESSAGE_TYPE_TEXT) || string9.equals("call")) {
                        callLogItemViews.numberView.setText(cursor.getString(11).equals("individual") ? cursor.getString(9) == null ? string2 : cursor.getString(9) : cursor.getString(9) == null ? "" : cursor.getString(9));
                    } else if (string9.equals(SMSConstants.MESSAGE_TYPE_LOCATION)) {
                        callLogItemViews.numberView.setText(CallLogFragment.this.getString(R.string.push_noti_type_location));
                    } else if (string9.equals(SMSConstants.MESSAGE_TYPE_VCARD)) {
                        callLogItemViews.numberView.setText(CallLogFragment.this.getString(R.string.push_noti_type_contact));
                    } else if (string9.equals(SMSConstants.MESSAGE_TYPE_SYSTEM_ADD) || string9.equals(SMSConstants.MESSAGE_TYPE_SYSTEM_DELETE)) {
                        callLogItemViews.numberView.setText(parseGroupSystemMessage(context, cursor.getString(9) == null ? "" : cursor.getString(9), string9));
                    }
                    int i4 = cursor.getInt(12);
                    if (i4 > 0) {
                        callLogItemViews.unreadMsgLayout.setVisibility(0);
                        callLogItemViews.unreadMsgNum.setText(Integer.toString(i4));
                    } else {
                        callLogItemViews.unreadMsgLayout.setVisibility(4);
                    }
                    if (!cursor.getString(13).equals("Y")) {
                        view.setOnClickListener(new View.OnClickListener() {
                            public void onClick(View view) {
                                if (!string2.equals(CallerInfo.PRIVATE_NUMBER) && !string2.equals(CallerInfo.UNKNOWN_NUMBER) && !TextUtils.isEmpty(string2)) {
                                    ContactsHelper contactsHelper = new ContactsHelper(string2, CallLogFragment.ctx);
                                    Intent intent = new Intent(CallLogFragment.activity, CallLogGroupedActivity.class);
                                    intent.putExtra("contactNumber", string2);
                                    intent.putExtra("contactName", str3);
                                    intent.putExtra("contactPhoto", contactsHelper.getPhoto());
                                    CallLogFragment.this.startActivity(intent);
                                }
                            }
                        });
                        view.setLongClickable(false);
                        break;
                    } else {
                        final String string10 = cursor.getString(10);
                        final String string11 = cursor.getString(11);
                        final String string12 = cursor.getString(5);
                        final String string13 = cursor.getString(8);
                        final String str11 = string2;
                        final String str12 = str3;
                        view.setOnClickListener(new View.OnClickListener() {
                            public void onClick(View view) {
                                if (string10 == null || string11 == null) {
                                    Intent intent = new Intent(CallLogFragment.ctx, ChatPageActivity.class);
                                    intent.putExtra("chatId", -1);
                                    intent.putExtra("username", string13);
                                    intent.putExtra("nickname", str12);
                                    intent.putExtra("chatType", "individual");
                                    intent.putExtra("recipient", string13);
                                    CallLogFragment.this.startActivity(intent);
                                    return;
                                }
                                Intent intent2 = new Intent(CallLogFragment.ctx, ChatPageActivity.class);
                                intent2.putExtra("recipient", string13);
                                intent2.putExtra("chatId", Integer.parseInt(string10));
                                intent2.putExtra("chatType", string11);
                                intent2.putExtra("username", string13);
                                intent2.putExtra("nickname", str12);
                                CallLogFragment.this.startActivity(intent2);
                            }
                        });
                        view.setLongClickable(true);
                        final String str13 = string2;
                        final String str14 = string13;
                        final String str15 = string10;
                        final String str16 = string11;
                        view.setOnLongClickListener(new View.OnLongClickListener() {
                            public boolean onLongClick(View view) {
                                boolean isNumberWithinContact = CallLogFragment.isNumberWithinContact(str13, CallLogFragment.ctx);
                                Log.w("KKIM", "View OnLongClick: number=" + str14 + " chatid=" + str15 + " nickname=" + str3 + " chatType=" + str16 + " isContactExist=" + isNumberWithinContact);
                                if (str16 == null) {
                                    return true;
                                }
                                CallLogFragment.this.popupChatSelection(str16, str14, str15, isNumberWithinContact);
                                return true;
                            }
                        });
                        break;
                    }
                    break;
            }
            callLogItemViews.dateView.setText(RelativeDateUtils.getRelativeTimeSpanString(context, time, System.currentTimeMillis(), 60000, 262144));
            setCallTypeLabel(callLogItemViews, cursor.getInt(4));
        }

        public void clearImgCache() {
            this.mImageLoader.clearCache();
        }

        public int getItemViewType(int i) {
            return super.getItemViewType(i);
        }

        public int getViewTypeCount() {
            return 2;
        }

        public boolean isEmpty() {
            if (this.mLoading) {
                return false;
            }
            return super.isEmpty();
        }

        public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
            View newView = super.newView(context, cursor, viewGroup);
            CallLogItemViews callLogItemViews = new CallLogItemViews();
            callLogItemViews.calltypeimageView = (ImageView) newView.findViewById(R.id.call_type_icon);
            callLogItemViews.dateView = (TextView) newView.findViewById(2131624193);
            callLogItemViews.labelView = (TypefacedTextView) newView.findViewById(R.id.label);
            callLogItemViews.line1View = (TypefacedTextView) newView.findViewById(2131624190);
            callLogItemViews.numberView = (TextView) newView.findViewById(R.id.number);
            callLogItemViews.photoView = (ImageView) newView.findViewById(R.id.historyPhoto);
            callLogItemViews.unreadMsgLayout = newView.findViewById(R.id.unread_msg_layout);
            callLogItemViews.unreadMsgNum = (TextView) newView.findViewById(R.id.unread_msg_number);
            newView.setTag(callLogItemViews);
            return newView;
        }

        /* access modifiers changed from: protected */
        public void onContentChanged() {
        }

        public void updateProfileHead(ImageView imageView, String str) {
            Log.i("KKIM", "up updateProfileHead");
            this.mImageLoader.loadBitmap(str, imageView, -1);
        }
    }

    static final class CallLogItemImageview {
        public String imagePath;
        public ImageView imageView;
        public String number;
        public int position;

        public CallLogItemImageview(ImageView imageView2, String str, String str2, int i) {
            this.imageView = imageView2;
            this.imagePath = str;
            this.number = str2;
            this.position = i;
        }
    }

    static final class CallLogItemPendingViews {
        TypefacedTextView label;
        TypefacedTextView name;
        int position;
        ImageView profile;

        CallLogItemPendingViews() {
        }
    }

    static final class CallLogItemTextview {
        public String number;
        public int position;
        public String text;
        public TypefacedTextView textView;

        public CallLogItemTextview(TypefacedTextView typefacedTextView, String str, String str2, int i) {
            this.textView = typefacedTextView;
            this.text = str;
            this.number = str2;
            this.position = i;
        }
    }

    private static final class CallLogItemViews {
        ImageView calltypeimageView;
        TextView dateView;
        TypefacedTextView labelView;
        TypefacedTextView line1View;
        TextView numberView;
        ImageView photoView;
        View unreadMsgLayout;
        TextView unreadMsgNum;

        private CallLogItemViews() {
        }
    }

    static final class CallerInfoQuery {
        ImageView imageView;
        TypefacedTextView labelView;
        String name;
        String number;
        String numberLabel;
        int numberType;
        int position;
        TypefacedTextView textView;

        CallerInfoQuery() {
        }
    }

    private static class ContactCheckingHandler extends Handler {
        private final WeakReference<CallLogFragment> mTarget;

        private ContactCheckingHandler(CallLogFragment callLogFragment) {
            this.mTarget = new WeakReference<>(callLogFragment);
        }

        public void handleMessage(Message message) {
            CallLogFragment callLogFragment = (CallLogFragment) this.mTarget.get();
            if (callLogFragment != null) {
                switch (message.what) {
                    case 1:
                        callLogFragment.startRequestProcessing();
                        return;
                    case 3:
                        Iterator it = ((ArrayList) message.obj).iterator();
                        while (it.hasNext()) {
                            CallLogItemImageview callLogItemImageview = (CallLogItemImageview) it.next();
                            int i = callLogItemImageview.position;
                            ImageView imageView = callLogItemImageview.imageView;
                            if (imageView.getTag().equals(callLogItemImageview.number + "_" + i)) {
                                callLogFragment.updateProfileImage(imageView, callLogItemImageview.imagePath);
                            }
                        }
                        return;
                    case 4:
                        Iterator it2 = ((ArrayList) message.obj).iterator();
                        while (it2.hasNext()) {
                            CallLogItemTextview callLogItemTextview = (CallLogItemTextview) it2.next();
                            int i2 = callLogItemTextview.position;
                            TypefacedTextView typefacedTextView = callLogItemTextview.textView;
                            if (typefacedTextView.getTag().equals(callLogItemTextview.number + "_" + i2)) {
                                typefacedTextView.setVisibility(0);
                                typefacedTextView.setText(SMSConstants.formatPhoneNumber(callLogItemTextview.text));
                            }
                        }
                        return;
                    default:
                        return;
                }
            }
        }
    }

    private static final class ContactInfo {
        public static ContactInfo EMPTY = new ContactInfo();
        public String formattedNumber;
        public boolean isChecking;
        public String label;
        public String name;
        public String number;
        public int numberType;
        public long personId;
        public String thumbnailUri;

        private ContactInfo() {
        }
    }

    private static final class QueryHandler extends AsyncQueryHandler {
        private final WeakReference<CallLogFragment> mFragment;

        protected class CatchingWorkerHandler extends AsyncQueryHandler.WorkerHandler {
            public CatchingWorkerHandler(Looper looper) {
                super(QueryHandler.this, looper);
            }

            public void handleMessage(Message message) {
                try {
                    QueryHandler.super.handleMessage(message);
                } catch (SQLiteDatabaseCorruptException | SQLiteDiskIOException | SQLiteFullException e) {
                }
            }
        }

        public QueryHandler(CallLogFragment callLogFragment) {
            super(callLogFragment.getActivity().getContentResolver());
            this.mFragment = new WeakReference<>(callLogFragment);
        }

        /* JADX WARNING: type inference failed for: r0v0, types: [com.pccw.mobile.sip.CallLogFragment$QueryHandler$CatchingWorkerHandler, android.os.Handler] */
        /* access modifiers changed from: protected */
        public Handler createHandler(Looper looper) {
            return new CatchingWorkerHandler(looper);
        }

        /* access modifiers changed from: protected */
        public void onQueryComplete(int i, Object obj, Cursor cursor) {
            CallLogFragment callLogFragment = (CallLogFragment) this.mFragment.get();
            if (callLogFragment == null || callLogFragment.getActivity() == null || callLogFragment.getActivity().isFinishing()) {
                cursor.close();
                return;
            }
            CallLogAdapter access$000 = CallLogFragment.mAdapter;
            switch (((Integer) obj).intValue()) {
                case 0:
                    Log.i("PCCW_MOBILE_SIP", "onQueryComplete(). QUERY_TYPE_CALLLOG");
                    access$000.setLoading(false);
                    access$000.changeCursor(cursor);
                    return;
                case 1:
                    Cursor chatRecordCursor = new CombineHistoryService(CallLogFragment.ctx).getChatRecordCursor();
                    access$000.setLoading(false);
                    access$000.changeCursor(chatRecordCursor);
                    return;
                case 2:
                    Cursor access$300 = CallLogFragment.prepaidMixtureHistory();
                    Log.v("KKIM", "Mix cursor count=" + cursor.getCount());
                    access$000.setLoading(false);
                    access$000.changeCursor(access$300);
                    return;
                default:
                    return;
            }
        }
    }

    private void clearCache() {
        synchronized (this.contactHashMap) {
            this.contactHashMap.clear();
        }
        synchronized (this.updatePendingHashMap) {
            this.updatePendingHashMap.clear();
        }
    }

    private void createFailToast(String str) {
        Toast.makeText(ctx, str, 0).show();
    }

    /* access modifiers changed from: private */
    public void enqueueRequest(String str, int i, String str2, int i2, String str3, ImageView imageView, TypefacedTextView typefacedTextView, TypefacedTextView typefacedTextView2) {
        CallerInfoQuery callerInfoQuery = new CallerInfoQuery();
        callerInfoQuery.number = str;
        callerInfoQuery.position = i;
        callerInfoQuery.name = str2;
        callerInfoQuery.numberType = i2;
        callerInfoQuery.numberLabel = str3;
        callerInfoQuery.imageView = imageView;
        callerInfoQuery.textView = typefacedTextView;
        callerInfoQuery.labelView = typefacedTextView2;
        synchronized (this.mRequests) {
            this.mRequests.add(callerInfoQuery);
            this.mRequests.notifyAll();
        }
    }

    private void forceQuertContactInfo(String str, int i, String str2, int i2, String str3, ImageView imageView, TypefacedTextView typefacedTextView, TypefacedTextView typefacedTextView2) {
        CallerInfoQuery callerInfoQuery = new CallerInfoQuery();
        callerInfoQuery.number = str;
        callerInfoQuery.position = i;
        callerInfoQuery.name = str2;
        callerInfoQuery.numberType = i2;
        callerInfoQuery.numberLabel = str3;
        callerInfoQuery.imageView = imageView;
        callerInfoQuery.textView = typefacedTextView;
        callerInfoQuery.labelView = typefacedTextView2;
        queryContactInfo(callerInfoQuery);
    }

    /* access modifiers changed from: private */
    public String formatPhoneNumber(String str) {
        if (TextUtils.isEmpty(str)) {
            return "";
        }
        if (sFormattingType == -1) {
            sFormattingType = PhoneNumberUtils.getFormatTypeForLocale(Locale.getDefault());
        }
        String extractNetworkPortion = PhoneNumberUtils.extractNetworkPortion(PhoneNumberUtils.convertKeypadLettersToDigits(str));
        sEditable.clear();
        sEditable.append(extractNetworkPortion);
        PhoneNumberUtils.formatNumber(sEditable, sFormattingType);
        return SMSConstants.formatPhoneNumber(sEditable.toString());
    }

    private ArrayList<CallLogItemPendingViews> getPendingItemListFromHash(String str) {
        ArrayList<CallLogItemPendingViews> arrayList = this.updatePendingHashMap.get(str);
        return (arrayList == null || arrayList.isEmpty()) ? new ArrayList<>() : arrayList;
    }

    /* access modifiers changed from: private */
    public void historyLayoutSelector(int i) {
        stopRequestProcessing();
        if (mAdapter != null) {
            clearCache();
            mAdapter.clearImgCache();
        }
        synchronized (this.mRequests) {
            this.mRequests.clear();
        }
        this.mPreDrawListener = null;
        this.mFirst = true;
        switch (i) {
            case 0:
                this.currentQuery = 0;
                this.allTextView.setEnabled(true);
                this.messageTextView.setEnabled(true);
                this.callLogsTextView.setEnabled(false);
                this.historySelectLayout.setBackgroundResource(R.drawable.contact_filter_kingking_background);
                this.allTextView.setTextColor(getResources().getColor(R.color.mid_blue));
                this.messageTextView.setTextColor(getResources().getColor(R.color.mid_blue));
                this.callLogsTextView.setTextColor(getResources().getColor(R.color.corp_blue));
                startQuery(0);
                return;
            case 1:
                this.currentQuery = 1;
                this.allTextView.setEnabled(true);
                this.messageTextView.setEnabled(false);
                this.callLogsTextView.setEnabled(true);
                this.historySelectLayout.setBackgroundResource(R.drawable.contact_filter_all_background);
                this.allTextView.setTextColor(getResources().getColor(R.color.mid_blue));
                this.messageTextView.setTextColor(getResources().getColor(R.color.corp_blue));
                this.callLogsTextView.setTextColor(getResources().getColor(R.color.mid_blue));
                startQuery(1);
                return;
            case 2:
                this.currentQuery = 2;
                this.allTextView.setEnabled(false);
                this.messageTextView.setEnabled(true);
                this.callLogsTextView.setEnabled(true);
                this.historySelectLayout.setBackgroundResource(R.drawable.history_filter_all_background);
                this.allTextView.setTextColor(getResources().getColor(R.color.corp_blue));
                this.messageTextView.setTextColor(getResources().getColor(R.color.mid_blue));
                this.callLogsTextView.setTextColor(getResources().getColor(R.color.mid_blue));
                startQuery(2);
                return;
            default:
                return;
        }
    }

    public static boolean isNumberWithinContact(String str, Context context) {
        Uri withAppendedPath = Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(str));
        Cursor query = context.getContentResolver().query(withAppendedPath, new String[]{"_id", DBHelper.NUMBER, "display_name"}, (String) null, (String[]) null, (String) null);
        try {
            if (query.moveToFirst()) {
                Log.w("KKIM", " -- Number " + str + " is within Contact List");
                if (query != null) {
                    query.close();
                }
                return true;
            }
            if (query != null) {
                query.close();
            }
            Log.w("KKIM", " -- Number " + str + " is NOT within Contact List");
            return false;
        } catch (Exception e) {
            Log.w("KKIM", " -- Number " + str + " is NOT within Contact List -- ERROR");
            if (query != null) {
                query.close();
            }
            return false;
        } catch (Throwable th) {
            if (query != null) {
                query.close();
            }
            throw th;
        }
    }

    private static Cursor mixedAllChatRecord() {
        return new ChatRecordService(ctx).getAllChatRecordCursor();
    }

    /* access modifiers changed from: private */
    public void popupChatSelection(final String str, final String str2, final String str3, boolean z) {
        String string = getResources().getString(R.string.call_log_popup_individual_delete_chat);
        ArrayAdapter arrayAdapter = new ArrayAdapter(getActivity(), R.layout.custom_select_dialog_item, new String[]{string});
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setCancelable(true);
        builder.setAdapter(arrayAdapter, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                if (str.equals("individual")) {
                    if (i == SMSConstants.CALL_LOG_DELETE_CHAT) {
                        Log.d("KKIM", "Individual Delete Chat - Delete MessageStore");
                        new MessageItemService(CallLogFragment.ctx).deleteChatByChatId(str3);
                        Log.d("KKIM", "Individual Delete Chat - Delete ChatList");
                        new ChatRecordService(CallLogFragment.ctx).deleteChatByChatId(str3);
                        Intent intent = new Intent(CallLogFragment.ctx, LinphoneActivity.class);
                        intent.addFlags(335544320);
                        CallLogFragment.this.startActivity(intent);
                    }
                } else if (i == SMSConstants.CALL_LOG_DELETE_CHAT) {
                    Log.d("KKIM", "Group Delete Chat");
                    new ClearGroupService(CallLogFragment.ctx).clearGroupInfo(str2);
                    Intent intent2 = new Intent(CallLogFragment.ctx, LinphoneActivity.class);
                    intent2.addFlags(335544320);
                    CallLogFragment.this.startActivity(intent2);
                }
            }
        });
        AlertDialog create = builder.create();
        create.setCanceledOnTouchOutside(true);
        create.show();
    }

    /* access modifiers changed from: private */
    public static Cursor prepaidMixtureHistory() {
        return mAllHistoryIMServer.getAllHistoryCursor();
    }

    private void promptDialog(EnumKKDialogType enumKKDialogType) {
        new KKDialogProvider(new KKDialogBuilder(), activity).requestDialog(enumKKDialogType, this).show();
    }

    /* access modifiers changed from: private */
    public void putPendingItemIntoHash(String str, CallLogItemPendingViews callLogItemPendingViews) {
        if (str != null && callLogItemPendingViews != null) {
            ArrayList<CallLogItemPendingViews> pendingItemListFromHash = getPendingItemListFromHash(str);
            pendingItemListFromHash.add(callLogItemPendingViews);
            this.updatePendingHashMap.put(str, pendingItemListFromHash);
            Log.i("PCCW_MOBILE_SIP", "putPendingItemIntoHash(), updatePendingHashMap.size(): " + this.updatePendingHashMap.size());
        }
    }

    private void queryContactInfo(CallerInfoQuery callerInfoQuery) {
        callerInfoQuery.imageView.setTag(callerInfoQuery.number + "_" + callerInfoQuery.position);
        ContactInfo contactInfo = this.contactHashMap.get(callerInfoQuery.number);
        if ((contactInfo == null || contactInfo == ContactInfo.EMPTY) && !TextUtils.isEmpty(callerInfoQuery.number)) {
            Cursor query = ctx.getContentResolver().query(Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(callerInfoQuery.number)), Version.sdkAboveOrEqual(11) ? PHONES_PROJECTION : PHONES_PROJECTION_LOWER_API11, (String) null, (String[]) null, (String) null);
            if (query != null) {
                if (query.getCount() != 0 && query.moveToFirst()) {
                    contactInfo = new ContactInfo();
                    contactInfo.personId = query.getLong(0);
                    String str = contactInfo.name;
                    String str2 = str == null ? "" : str;
                    contactInfo.name = query.getString(1);
                    contactInfo.numberType = query.getInt(2);
                    contactInfo.label = query.getString(3);
                    contactInfo.number = query.getString(4);
                    String str3 = contactInfo.thumbnailUri;
                    contactInfo.thumbnailUri = query.getString(5);
                    if (str3 == null) {
                        str3 = "";
                    }
                    contactInfo.formattedNumber = null;
                    this.contactHashMap.put(callerInfoQuery.number, contactInfo);
                    contactInfo.isChecking = false;
                    synchronized (this.mRequests) {
                        if (!TextUtils.isEmpty(contactInfo.thumbnailUri) && !str3.equals(contactInfo.thumbnailUri)) {
                            ArrayList arrayList = new ArrayList();
                            arrayList.add(new CallLogItemImageview(callerInfoQuery.imageView, contactInfo.thumbnailUri, callerInfoQuery.number, callerInfoQuery.position));
                            Iterator<CallLogItemPendingViews> it = getPendingItemListFromHash(callerInfoQuery.number).iterator();
                            while (it.hasNext()) {
                                CallLogItemPendingViews next = it.next();
                                next.profile.setTag(callerInfoQuery.number + "_" + next.position);
                                arrayList.add(new CallLogItemImageview(next.profile, contactInfo.thumbnailUri, callerInfoQuery.number, next.position));
                            }
                            Message message = new Message();
                            message.what = 3;
                            message.obj = arrayList;
                            this.mHandler.sendMessage(message);
                        }
                        if (!TextUtils.isEmpty(contactInfo.name) && !str2.equals(contactInfo.name)) {
                            ArrayList arrayList2 = new ArrayList();
                            arrayList2.add(new CallLogItemTextview(callerInfoQuery.textView, contactInfo.name, callerInfoQuery.number, callerInfoQuery.position));
                            Iterator<CallLogItemPendingViews> it2 = getPendingItemListFromHash(callerInfoQuery.number).iterator();
                            while (it2.hasNext()) {
                                CallLogItemPendingViews next2 = it2.next();
                                next2.name.setTag(callerInfoQuery.number + "_" + next2.position);
                                arrayList2.add(new CallLogItemTextview(next2.name, contactInfo.name, callerInfoQuery.number, next2.position));
                            }
                            Message message2 = new Message();
                            message2.what = 4;
                            message2.obj = arrayList2;
                            this.mHandler.sendMessage(message2);
                        }
                        if (!(contactInfo.numberType == 0 || this.currentQuery != 0 || callerInfoQuery.labelView == null)) {
                            String string = contactInfo.numberType == 0 ? contactInfo.label : getString(ContactsContract.CommonDataKinds.Phone.getTypeLabelResource(contactInfo.numberType));
                            ArrayList arrayList3 = new ArrayList();
                            arrayList3.add(new CallLogItemTextview(callerInfoQuery.labelView, string.toString(), callerInfoQuery.number, callerInfoQuery.position));
                            Iterator<CallLogItemPendingViews> it3 = getPendingItemListFromHash(callerInfoQuery.number).iterator();
                            while (it3.hasNext()) {
                                CallLogItemPendingViews next3 = it3.next();
                                if (next3.label != null) {
                                    next3.label.setTag(callerInfoQuery.number + "_" + next3.position);
                                    arrayList3.add(new CallLogItemTextview(next3.label, string.toString(), callerInfoQuery.number, next3.position));
                                }
                            }
                            Message message3 = new Message();
                            message3.what = 4;
                            message3.obj = arrayList3;
                            this.mHandler.sendMessage(message3);
                        }
                    }
                }
                query.close();
            }
        }
        if (contactInfo != null) {
            updateCallLog(callerInfoQuery, contactInfo);
            updateRecipientInfo(callerInfoQuery, contactInfo);
            contactInfo.isChecking = false;
        }
    }

    private void resetNewCallsFlag() {
        ContentValues contentValues = new ContentValues(1);
        contentValues.put(DBHelper.NEW, "0");
        this.mQueryHandler.startUpdate(56, (Object) null, KingKingContentProvider.CALL_LOG_URI, contentValues, "type=" + 3 + " AND new=1", (String[]) null);
    }

    private void startQuery(int i) {
        mAdapter.setLoading(true);
        this.mQueryHandler.cancelOperation(53);
        switch (i) {
            case 0:
                this.mQueryHandler.startQuery(53, 0, KingKingContentProvider.CALL_LOG_URI, CALL_LOG_PROJECTION, (String) null, (String[]) null, "date DESC");
                break;
            case 1:
                prepaidMixtureHistory();
                Cursor mixedAllChatRecord = mixedAllChatRecord();
                mAdapter.setLoading(false);
                mAdapter.changeCursor(mixedAllChatRecord);
                break;
            case 2:
                Cursor prepaidMixtureHistory = prepaidMixtureHistory();
                Log.v("KKIM", "Mix cursor count=" + prepaidMixtureHistory.getCount());
                mAdapter.setLoading(false);
                mAdapter.changeCursor(prepaidMixtureHistory);
                break;
        }
        this.historyList.setSelectionAfterHeaderView();
    }

    /* access modifiers changed from: private */
    public void startRequestProcessing() {
        mDone = false;
        mCallerIdThread = new Thread(this);
        mCallerIdThread.setPriority(1);
        mCallerIdThread.start();
    }

    private void stopRequestProcessing() {
        mDone = true;
        if (mCallerIdThread != null) {
            mCallerIdThread.interrupt();
        }
    }

    private void updateCallLog(CallerInfoQuery callerInfoQuery, ContactInfo contactInfo) {
        if (!TextUtils.equals(callerInfoQuery.name, contactInfo.name) || !TextUtils.equals(callerInfoQuery.numberLabel, contactInfo.label) || callerInfoQuery.numberType != contactInfo.numberType) {
            ContentValues contentValues = new ContentValues(3);
            contentValues.put("name", contactInfo.name);
            contentValues.put(DBHelper.CACHED_NUMBER_TYPE, Integer.valueOf(contactInfo.numberType));
            contentValues.put(DBHelper.CACHED_NUMBER_LABEL, contactInfo.label);
            try {
                ctx.getContentResolver().update(KingKingContentProvider.CALL_LOG_URI, contentValues, "number='" + callerInfoQuery.number + "'", (String[]) null);
            } catch (SQLiteDatabaseCorruptException | SQLiteDiskIOException | SQLiteFullException e) {
            }
        }
    }

    /* access modifiers changed from: private */
    public void updateProfileImage(ImageView imageView, String str) {
        Log.i("KKIM", "up updateProfileImage");
        if (mAdapter != null) {
            mAdapter.updateProfileHead(imageView, str);
        }
    }

    private void updateRecipientInfo(CallerInfoQuery callerInfoQuery, ContactInfo contactInfo) {
        if (!TextUtils.equals(callerInfoQuery.name, contactInfo.name)) {
            if (!this.conversationParticipantItemService.isDuplicatedUsername(callerInfoQuery.number)) {
                Log.i("KKSMS", "Recipient not exist in UserInfo table, don't update");
                return;
            }
            this.conversationParticipantItemService.updateUserInfo(new UserInfo(callerInfoQuery.number, contactInfo.name, ""));
        }
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
    }

    public void onClickKKDialogNegativeButton(KKDialog kKDialog) {
    }

    public void onClickKKDialogNeutralButton(KKDialog kKDialog) {
    }

    public void onClickKKDialogPositiveButton(KKDialog kKDialog) {
        switch (kKDialog.getDialogType()) {
            case AlertNoWifiDialog:
                startActivity(new Intent("android.settings.WIFI_SETTINGS"));
                return;
            case AlertSMSConsumeDialog:
                startActivity(new Intent(activity, NewSMSActivity.class));
                return;
            case AlertKKisOffDialog:
                startActivity(IntentUtils.genDialScreenIntent("", ctx));
                return;
            default:
                return;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        activity = getActivity();
        setHasOptionsMenu(true);
        ctx = getActivity().getApplicationContext();
        this.mQueryHandler = new QueryHandler(this);
        this.conversationParticipantItemService = new ConversationParticipantItemService(ctx);
        mAllHistoryIMServer = new AllHistoryIMServer(activity);
        sFormattingType = -1;
        this.mPreDrawListener = null;
        this.contactHashMap = new HashMap<>();
        this.updatePendingHashMap = new HashMap<>();
        this.mRequests = new LinkedList<>();
        this.mHandler = new ContactCheckingHandler();
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menuInflater.inflate(R.menu.history_activity_menu, menu);
        if (!ClientStateManager.isSupportSMS(getActivity().getApplicationContext())) {
            menu.findItem(R.id.action_new_chat).setVisible(false);
        }
        super.onCreateOptionsMenu(menu, menuInflater);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        DBHelper.getDBInstance(getActivity());
        ActionBar supportActionBar = ((ActionBarActivity) getActivity()).getSupportActionBar();
        supportActionBar.setDisplayOptions(8, 24);
        supportActionBar.setTitle((CharSequence) getString(R.string.actionbar_tab_title_history));
        View inflate = layoutInflater.inflate(R.layout.calllog_fragment, viewGroup, false);
        this.historyList = (ListView) inflate.findViewById(R.id.history_list);
        this.historySelectLayout = (SegmentedRadioGroup) inflate.findViewById(R.id.history_select_linearlayout);
        this.allTextView = (CenteredRadioImageButton) inflate.findViewById(R.id.all_textview);
        this.messageTextView = (CenteredRadioImageButton) inflate.findViewById(R.id.message_textview);
        this.callLogsTextView = (CenteredRadioImageButton) inflate.findViewById(R.id.calllogs_textview);
        this.allTextView.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                CallLogFragment.this.historyLayoutSelector(2);
            }
        });
        this.messageTextView.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                CallLogFragment.this.historyLayoutSelector(1);
            }
        });
        this.callLogsTextView.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                CallLogFragment.this.historyLayoutSelector(0);
            }
        });
        return inflate;
    }

    public void onDestroy() {
        super.onDestroy();
        if (mAdapter != null) {
            stopRequestProcessing();
            Cursor cursor = mAdapter.getCursor();
            if (cursor != null && !cursor.isClosed()) {
                cursor.close();
            }
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case R.id.action_new_chat /*2131624459*/:
                if (NetworkUtils.isWifiAvailable(ctx)) {
                    if (MobileSipService.getInstance().isLoginSuccress()) {
                        if (ClientStateManager.isNotShowSMSConsumeWarmingCheckBox(ctx)) {
                            startActivity(new Intent(activity, NewSMSActivity.class));
                            break;
                        } else {
                            promptDialog(EnumKKDialogType.AlertSMSConsumeDialog);
                            break;
                        }
                    } else {
                        promptDialog(EnumKKDialogType.AlertKKisOffDialog);
                        break;
                    }
                } else {
                    promptDialog(EnumKKDialogType.AlertNoWifiDialog);
                    break;
                }
        }
        return activity.onOptionsItemSelected(menuItem);
    }

    public void onPause() {
        super.onPause();
        stopRequestProcessing();
    }

    public boolean onPreDraw() {
        if (this.mFirst) {
            this.mHandler.sendEmptyMessageDelayed(1, 1);
            this.mFirst = false;
        }
        return true;
    }

    public void onResume() {
        switch (this.currentQuery) {
            case 0:
                resetNewCallsFlag();
                break;
            case 1:
                historyLayoutSelector(1);
                break;
            case 2:
                historyLayoutSelector(2);
                break;
        }
        super.onResume();
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        mAdapter = new CallLogAdapter(ctx, R.layout.calllog_list_item, (Cursor) null, true);
        this.historyList.setAdapter(mAdapter);
        this.historyList.setOnCreateContextMenuListener(this);
        this.historyList.setItemsCanFocus(true);
        if (!ClientStateManager.isSupportSMS(ctx)) {
            this.historySelectLayout.setVisibility(8);
        }
        historyLayoutSelector(0);
        if (this.mPreDrawListener == null) {
            this.mPreDrawListener = this;
            view.getViewTreeObserver().addOnPreDrawListener(this);
        }
    }

    public void run() {
        while (!mDone) {
            CallerInfoQuery callerInfoQuery = null;
            synchronized (this.mRequests) {
                if (!this.mRequests.isEmpty()) {
                    callerInfoQuery = this.mRequests.removeFirst();
                } else {
                    try {
                        this.mRequests.wait(300);
                    } catch (InterruptedException e) {
                    }
                }
            }
            if (callerInfoQuery != null) {
                queryContactInfo(callerInfoQuery);
            }
        }
    }

    public void updateGroupList() {
        if (this.currentQuery == 1) {
            startQuery(1);
        } else if (this.currentQuery == 2) {
            startQuery(2);
        }
    }
}
