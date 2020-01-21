package com.pccw.mobile.sip;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.AsyncQueryHandler;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabaseCorruptException;
import android.database.sqlite.SQLiteDiskIOException;
import android.database.sqlite.SQLiteFullException;
import android.graphics.Bitmap;
import android.net.Uri;
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
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ResourceCursorAdapter;
import android.widget.TextView;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.provider.KingKingContentProvider;
import com.pccw.mobile.sip.service.MobileSipService;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Locale;
import org.linphone.mediastream.Version;

public class AddCallCallLogFragment extends Fragment {
    static final int CALLER_NAME_COLUMN_INDEX = 5;
    static final int CALLER_NUMBERLABEL_COLUMN_INDEX = 7;
    static final int CALLER_NUMBERTYPE_COLUMN_INDEX = 6;
    static final String[] CALL_LOG_PROJECTION = {"_id", DBHelper.NUMBER, DBHelper.DATE, "duration", "type", "name", DBHelper.CACHED_NUMBER_TYPE, DBHelper.CACHED_NUMBER_LABEL};
    static final int CALL_TYPE_COLUMN_INDEX = 4;
    static final int DATE_COLUMN_INDEX = 2;
    static final int DURATION_COLUMN_INDEX = 3;
    private static final int FORMATTING_TYPE_INVALID = -1;
    static final int ID_COLUMN_INDEX = 0;
    static final int LABEL_COLUMN_INDEX = 3;
    static final int MATCHED_NUMBER_COLUMN_INDEX = 4;
    static final int NAME_COLUMN_INDEX = 1;
    static final int NUMBER_COLUMN_INDEX = 1;
    static final int PERSON_ID_COLUMN_INDEX = 0;
    static final String[] PHONES_PROJECTION = {"_id", "display_name", "type", "label", DBHelper.NUMBER, "photo_thumb_uri"};
    static final String[] PHONES_PROJECTION_LOWER_API11 = {"_id", "display_name", "type", "label", DBHelper.NUMBER, "_id"};
    static final int PHONE_TYPE_COLUMN_INDEX = 2;
    static final int PHOTO_THUMBNAIL_URI_INDEX = 5;
    private static final int QUERY_TOKEN = 53;
    private static final int QUERY_TYPE_CALLLOG = 0;
    private static final String SHOW_IDD_CHARGE_MESSAGE = "SHOW_IDD_CHARGE_MESSAGE";
    private static final String TAG = "PCCW_MOBILE_SIP";
    private static final int UPDATE_TOKEN = 56;
    /* access modifiers changed from: private */
    public static Context ctx;
    private static final SpannableStringBuilder sEditable = new SpannableStringBuilder();
    private static int sFormattingType = -1;
    /* access modifiers changed from: private */
    public Activity activity;
    /* access modifiers changed from: private */
    public int currentQuery = 0;
    ListView historyList;
    CallLogAdapter mAdapter;
    private QueryHandler mQueryHandler;
    private AlertDialog m_AlertDlg;
    private SharedPreferences sp;
    String targerNumber;

    private class CallLogAdapter extends ResourceCursorAdapter implements Runnable, ViewTreeObserver.OnPreDrawListener {
        private static final int REDRAW = 1;
        private static final int START_THREAD = 2;
        HashMap<String, ContactInfo> contactHashMap = new HashMap<>();
        private Thread mCallerIdThread;
        private volatile boolean mDone;
        private boolean mFirst;
        private Handler mHandler = new Handler() {
            public void handleMessage(Message message) {
                switch (message.what) {
                    case 1:
                        CallLogAdapter.this.notifyDataSetChanged();
                        return;
                    case 2:
                        CallLogAdapter.this.startRequestProcessing();
                        return;
                    default:
                        return;
                }
            }
        };
        private boolean mLoading = true;
        ViewTreeObserver.OnPreDrawListener mPreDrawListener = null;
        private final LinkedList<CallerInfoQuery> mRequests = new LinkedList<>();

        public CallLogAdapter(Context context, int i, Cursor cursor, boolean z) {
            super(context, i, cursor, z);
        }

        private void enqueueRequest(String str, int i, String str2, int i2, String str3) {
            CallerInfoQuery callerInfoQuery = new CallerInfoQuery();
            callerInfoQuery.number = str;
            callerInfoQuery.position = i;
            callerInfoQuery.name = str2;
            callerInfoQuery.numberType = i2;
            callerInfoQuery.numberLabel = str3;
            synchronized (this.mRequests) {
                this.mRequests.add(callerInfoQuery);
                this.mRequests.notifyAll();
            }
        }

        private Bitmap getUserContactPhoto(String str, String str2, String str3) {
            if (str != null) {
                return loadContactPhotoThumbnail(str);
            }
            return null;
        }

        /* JADX WARNING: Removed duplicated region for block: B:33:0x0058 A[SYNTHETIC, Splitter:B:33:0x0058] */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        private android.graphics.Bitmap loadContactPhotoThumbnail(java.lang.String r4) {
            /*
                r3 = this;
                r1 = 0
                r0 = 11
                boolean r0 = org.linphone.mediastream.Version.sdkAboveOrEqual(r0)     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                if (r0 == 0) goto L_0x0027
                android.net.Uri r0 = android.net.Uri.parse(r4)     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
            L_0x000d:
                com.pccw.mobile.sip.AddCallCallLogFragment r2 = com.pccw.mobile.sip.AddCallCallLogFragment.this     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                android.support.v4.app.FragmentActivity r2 = r2.getActivity()     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                android.content.ContentResolver r2 = r2.getContentResolver()     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                java.io.InputStream r2 = r2.openInputStream(r0)     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                if (r2 == 0) goto L_0x0039
                android.graphics.Bitmap r0 = android.graphics.BitmapFactory.decodeStream(r2)     // Catch:{ FileNotFoundException -> 0x0064 }
                if (r2 == 0) goto L_0x0026
                r2.close()     // Catch:{ IOException -> 0x0034 }
            L_0x0026:
                return r0
            L_0x0027:
                android.net.Uri r0 = android.provider.ContactsContract.Contacts.CONTENT_URI     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                android.net.Uri r0 = android.net.Uri.withAppendedPath(r0, r4)     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                java.lang.String r2 = "photo"
                android.net.Uri r0 = android.net.Uri.withAppendedPath(r0, r2)     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
                goto L_0x000d
            L_0x0034:
                r1 = move-exception
                r1.printStackTrace()
                goto L_0x0026
            L_0x0039:
                if (r2 == 0) goto L_0x003e
                r2.close()     // Catch:{ IOException -> 0x0040 }
            L_0x003e:
                r0 = r1
                goto L_0x0026
            L_0x0040:
                r0 = move-exception
                r0.printStackTrace()
                goto L_0x003e
            L_0x0045:
                r0 = move-exception
                r2 = r1
            L_0x0047:
                r0.printStackTrace()     // Catch:{ all -> 0x0061 }
                if (r2 == 0) goto L_0x003e
                r2.close()     // Catch:{ IOException -> 0x0050 }
                goto L_0x003e
            L_0x0050:
                r0 = move-exception
                r0.printStackTrace()
                goto L_0x003e
            L_0x0055:
                r0 = move-exception
            L_0x0056:
                if (r1 == 0) goto L_0x005b
                r1.close()     // Catch:{ IOException -> 0x005c }
            L_0x005b:
                throw r0
            L_0x005c:
                r1 = move-exception
                r1.printStackTrace()
                goto L_0x005b
            L_0x0061:
                r0 = move-exception
                r1 = r2
                goto L_0x0056
            L_0x0064:
                r0 = move-exception
                goto L_0x0047
            */
            throw new UnsupportedOperationException("Method not decompiled: com.pccw.mobile.sip.AddCallCallLogFragment.CallLogAdapter.loadContactPhotoThumbnail(java.lang.String):android.graphics.Bitmap");
        }

        private void queryContactInfo(CallerInfoQuery callerInfoQuery) {
            ContactInfo contactInfo = this.contactHashMap.get(callerInfoQuery.number);
            if (contactInfo != null && contactInfo != ContactInfo.EMPTY) {
                synchronized (this.mRequests) {
                    if (this.mRequests.isEmpty()) {
                        this.mHandler.sendEmptyMessage(1);
                    }
                }
            } else if (callerInfoQuery.number != null && !TextUtils.isEmpty(callerInfoQuery.number)) {
                Cursor query = AddCallCallLogFragment.ctx.getContentResolver().query(Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(callerInfoQuery.number)), Version.sdkAboveOrEqual(11) ? AddCallCallLogFragment.PHONES_PROJECTION : AddCallCallLogFragment.PHONES_PROJECTION_LOWER_API11, (String) null, (String[]) null, (String) null);
                if (query != null) {
                    if (query.moveToFirst()) {
                        contactInfo = new ContactInfo();
                        contactInfo.personId = query.getLong(0);
                        contactInfo.name = query.getString(1);
                        contactInfo.type = query.getInt(2);
                        contactInfo.label = query.getString(3);
                        contactInfo.number = query.getString(4);
                        String str = contactInfo.thumbnailUri;
                        contactInfo.thumbnailUri = query.getString(5);
                        if (str == null) {
                            str = "";
                        }
                        contactInfo.formattedNumber = null;
                        this.contactHashMap.put(callerInfoQuery.number, contactInfo);
                        synchronized (this.mRequests) {
                            if (this.mRequests.isEmpty()) {
                                this.mHandler.sendEmptyMessage(1);
                            } else if (!TextUtils.isEmpty(contactInfo.thumbnailUri) && !str.equals(contactInfo.thumbnailUri)) {
                                this.mHandler.sendEmptyMessage(1);
                            }
                        }
                    }
                    query.close();
                }
            }
            if (contactInfo != null) {
                updateCallLog(callerInfoQuery, contactInfo);
            }
        }

        private void updateCallLog(CallerInfoQuery callerInfoQuery, ContactInfo contactInfo) {
            if (!TextUtils.equals(callerInfoQuery.name, contactInfo.name) || !TextUtils.equals(callerInfoQuery.numberLabel, contactInfo.label) || callerInfoQuery.numberType != contactInfo.type) {
                ContentValues contentValues = new ContentValues(3);
                contentValues.put("name", contactInfo.name);
                contentValues.put(DBHelper.CACHED_NUMBER_TYPE, Integer.valueOf(contactInfo.type));
                contentValues.put(DBHelper.CACHED_NUMBER_LABEL, contactInfo.label);
                try {
                    AddCallCallLogFragment.ctx.getContentResolver().update(KingKingContentProvider.CALL_LOG_URI, contentValues, "number='" + callerInfoQuery.number + "'", (String[]) null);
                } catch (SQLiteDatabaseCorruptException | SQLiteDiskIOException | SQLiteFullException e) {
                }
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:14:0x006a  */
        /* JADX WARNING: Removed duplicated region for block: B:21:0x00c6  */
        /* JADX WARNING: Removed duplicated region for block: B:36:0x0109  */
        /* JADX WARNING: Removed duplicated region for block: B:59:0x01ed  */
        /* JADX WARNING: Removed duplicated region for block: B:60:0x01ff  */
        /* JADX WARNING: Removed duplicated region for block: B:61:0x0209  */
        /* JADX WARNING: Removed duplicated region for block: B:62:0x0213  */
        /* JADX WARNING: Removed duplicated region for block: B:63:0x021d  */
        /* JADX WARNING: Removed duplicated region for block: B:66:? A[RETURN, SYNTHETIC] */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void bindView(android.view.View r16, android.content.Context r17, android.database.Cursor r18) {
            /*
                r15 = this;
                java.lang.Object r2 = r16.getTag()
                r11 = r2
                com.pccw.mobile.sip.AddCallCallLogFragment$CallLogItemViews r11 = (com.pccw.mobile.sip.AddCallCallLogFragment.CallLogItemViews) r11
                r2 = 1
                r0 = r18
                java.lang.String r2 = r0.getString(r2)
                if (r2 == 0) goto L_0x00d3
                r2 = 1
                r0 = r18
                java.lang.String r3 = r0.getString(r2)
            L_0x0017:
                r9 = 0
                r2 = 5
                r0 = r18
                java.lang.String r5 = r0.getString(r2)
                r2 = 6
                r0 = r18
                int r6 = r0.getInt(r2)
                r2 = 7
                r0 = r18
                java.lang.String r7 = r0.getString(r2)
                java.util.HashMap<java.lang.String, com.pccw.mobile.sip.AddCallCallLogFragment$ContactInfo> r2 = r15.contactHashMap
                java.lang.Object r2 = r2.get(r3)
                r8 = r2
                com.pccw.mobile.sip.AddCallCallLogFragment$ContactInfo r8 = (com.pccw.mobile.sip.AddCallCallLogFragment.ContactInfo) r8
                if (r8 != 0) goto L_0x00d7
                com.pccw.mobile.sip.AddCallCallLogFragment$ContactInfo r8 = com.pccw.mobile.sip.AddCallCallLogFragment.ContactInfo.EMPTY
                java.util.HashMap<java.lang.String, com.pccw.mobile.sip.AddCallCallLogFragment$ContactInfo> r2 = r15.contactHashMap
                r2.put(r3, r8)
                int r4 = r18.getPosition()
                r2 = r15
                r2.enqueueRequest(r3, r4, r5, r6, r7)
            L_0x0047:
                r2 = r9
            L_0x0048:
                java.lang.String r9 = r8.name
                int r4 = r8.type
                java.lang.String r10 = r8.label
                long r12 = r8.personId
                boolean r14 = android.text.TextUtils.isEmpty(r9)
                if (r14 == 0) goto L_0x0227
                boolean r14 = android.text.TextUtils.isEmpty(r5)
                if (r14 != 0) goto L_0x0227
                com.pccw.mobile.sip.AddCallCallLogFragment r2 = com.pccw.mobile.sip.AddCallCallLogFragment.this
                java.lang.String r2 = r2.formatPhoneNumber(r3)
            L_0x0062:
                java.lang.String r4 = "-2"
                boolean r4 = r3.equals(r4)
                if (r4 == 0) goto L_0x0109
                com.pccw.mobile.sip.AddCallCallLogFragment r2 = com.pccw.mobile.sip.AddCallCallLogFragment.this
                r4 = 2131165670(0x7f0701e6, float:1.7945564E38)
                java.lang.String r2 = r2.getString(r4)
                android.widget.TextView r4 = r11.line1View
                r4.setText(r2)
                android.widget.TextView r2 = r11.labelView
                r4 = 8
                r2.setVisibility(r4)
                android.widget.TextView r2 = r11.numberView
                r4 = 0
                r2.setVisibility(r4)
                android.widget.TextView r2 = r11.numberView
                java.lang.String r4 = ""
                r2.setText(r4)
                android.widget.ImageView r2 = r11.photoView
                r4 = 2130837710(0x7f0200ce, float:1.7280382E38)
                r2.setImageResource(r4)
            L_0x0094:
                com.pccw.mobile.sip.AddCallCallLogFragment r2 = com.pccw.mobile.sip.AddCallCallLogFragment.this
                int r2 = r2.currentQuery
                switch(r2) {
                    case 0: goto L_0x01ed;
                    default: goto L_0x009d;
                }
            L_0x009d:
                r2 = 2
                r0 = r18
                long r4 = r0.getLong(r2)
                long r6 = java.lang.System.currentTimeMillis()
                r8 = 60000(0xea60, double:2.9644E-319)
                r10 = 262144(0x40000, float:3.67342E-40)
                r3 = r17
                java.lang.CharSequence r2 = com.pccw.mobile.sip.util.RelativeDateUtils.getRelativeTimeSpanString(r3, r4, r6, r8, r10)
                android.widget.TextView r3 = r11.dateView
                r3.setText(r2)
                r2 = 4
                r0 = r18
                int r2 = r0.getInt(r2)
                switch(r2) {
                    case 1: goto L_0x0213;
                    case 2: goto L_0x0209;
                    case 3: goto L_0x01ff;
                    case 21: goto L_0x021d;
                    default: goto L_0x00c2;
                }
            L_0x00c2:
                android.view.ViewTreeObserver$OnPreDrawListener r2 = r15.mPreDrawListener
                if (r2 != 0) goto L_0x00d2
                r2 = 1
                r15.mFirst = r2
                r15.mPreDrawListener = r15
                android.view.ViewTreeObserver r2 = r16.getViewTreeObserver()
                r2.addOnPreDrawListener(r15)
            L_0x00d2:
                return
            L_0x00d3:
                java.lang.String r3 = "-1"
                goto L_0x0017
            L_0x00d7:
                com.pccw.mobile.sip.AddCallCallLogFragment$ContactInfo r2 = com.pccw.mobile.sip.AddCallCallLogFragment.ContactInfo.EMPTY
                if (r8 == r2) goto L_0x0047
                java.lang.String r2 = r8.name
                boolean r2 = android.text.TextUtils.equals(r2, r5)
                if (r2 == 0) goto L_0x00ef
                int r2 = r8.type
                if (r2 != r6) goto L_0x00ef
                java.lang.String r2 = r8.label
                boolean r2 = android.text.TextUtils.equals(r2, r7)
                if (r2 != 0) goto L_0x00f7
            L_0x00ef:
                int r4 = r18.getPosition()
                r2 = r15
                r2.enqueueRequest(r3, r4, r5, r6, r7)
            L_0x00f7:
                java.lang.String r2 = r8.formattedNumber
                if (r2 != 0) goto L_0x0105
                com.pccw.mobile.sip.AddCallCallLogFragment r2 = com.pccw.mobile.sip.AddCallCallLogFragment.this
                java.lang.String r4 = r8.number
                java.lang.String r2 = r2.formatPhoneNumber(r4)
                r8.formattedNumber = r2
            L_0x0105:
                java.lang.String r2 = r8.formattedNumber
                goto L_0x0048
            L_0x0109:
                java.lang.String r4 = "-1"
                boolean r4 = r3.equals(r4)
                if (r4 == 0) goto L_0x013d
                com.pccw.mobile.sip.AddCallCallLogFragment r2 = com.pccw.mobile.sip.AddCallCallLogFragment.this
                r4 = 2131165739(0x7f07022b, float:1.7945704E38)
                java.lang.String r2 = r2.getString(r4)
                android.widget.TextView r4 = r11.line1View
                r4.setText(r2)
                android.widget.TextView r2 = r11.labelView
                r4 = 8
                r2.setVisibility(r4)
                android.widget.TextView r2 = r11.numberView
                r4 = 0
                r2.setVisibility(r4)
                android.widget.TextView r2 = r11.numberView
                java.lang.String r4 = ""
                r2.setText(r4)
                android.widget.ImageView r2 = r11.photoView
                r4 = 2130837710(0x7f0200ce, float:1.7280382E38)
                r2.setImageResource(r4)
                goto L_0x0094
            L_0x013d:
                boolean r4 = android.text.TextUtils.isEmpty(r5)
                if (r4 != 0) goto L_0x01a0
                android.widget.TextView r4 = r11.line1View
                r4.setText(r5)
                android.widget.TextView r4 = r11.labelView
                r5 = 0
                r4.setVisibility(r5)
                java.lang.String r4 = r8.thumbnailUri
                java.lang.String r5 = java.lang.Long.toString(r12)
                java.lang.String r8 = com.pccw.sms.service.PhoneListService.normalizeContactNumber(r3)
                android.graphics.Bitmap r4 = r15.getUserContactPhoto(r4, r5, r8)
                if (r4 == 0) goto L_0x0183
                android.widget.ImageView r5 = r11.photoView
                r5.setImageBitmap(r4)
            L_0x0163:
                if (r6 != 0) goto L_0x018c
            L_0x0165:
                android.widget.TextView r4 = r11.numberView
                r5 = 0
                r4.setVisibility(r5)
                android.widget.TextView r4 = r11.numberView
                r4.setText(r2)
                boolean r2 = android.text.TextUtils.isEmpty(r7)
                if (r2 != 0) goto L_0x0197
                android.widget.TextView r2 = r11.labelView
                r2.setText(r7)
                android.widget.TextView r2 = r11.labelView
                r4 = 0
                r2.setVisibility(r4)
                goto L_0x0094
            L_0x0183:
                android.widget.ImageView r4 = r11.photoView
                r5 = 2130837710(0x7f0200ce, float:1.7280382E38)
                r4.setImageResource(r5)
                goto L_0x0163
            L_0x018c:
                com.pccw.mobile.sip.AddCallCallLogFragment r4 = com.pccw.mobile.sip.AddCallCallLogFragment.this
                int r5 = android.provider.ContactsContract.CommonDataKinds.Phone.getTypeLabelResource(r6)
                java.lang.String r7 = r4.getString(r5)
                goto L_0x0165
            L_0x0197:
                android.widget.TextView r2 = r11.labelView
                r4 = 8
                r2.setVisibility(r4)
                goto L_0x0094
            L_0x01a0:
                java.lang.String r2 = "-1"
                boolean r2 = r3.equals(r2)
                if (r2 == 0) goto L_0x01d4
                com.pccw.mobile.sip.AddCallCallLogFragment r2 = com.pccw.mobile.sip.AddCallCallLogFragment.this
                r4 = 2131165739(0x7f07022b, float:1.7945704E38)
                java.lang.String r2 = r2.getString(r4)
            L_0x01b1:
                android.widget.TextView r4 = r11.line1View
                r4.setText(r2)
                android.widget.TextView r2 = r11.labelView
                r4 = 8
                r2.setVisibility(r4)
                android.widget.TextView r2 = r11.numberView
                r4 = 0
                r2.setVisibility(r4)
                android.widget.TextView r2 = r11.numberView
                java.lang.String r4 = ""
                r2.setText(r4)
                android.widget.ImageView r2 = r11.photoView
                r4 = 2130837710(0x7f0200ce, float:1.7280382E38)
                r2.setImageResource(r4)
                goto L_0x0094
            L_0x01d4:
                java.lang.String r2 = "-2"
                boolean r2 = r3.equals(r2)
                if (r2 == 0) goto L_0x01e6
                com.pccw.mobile.sip.AddCallCallLogFragment r2 = com.pccw.mobile.sip.AddCallCallLogFragment.this
                r4 = 2131165670(0x7f0701e6, float:1.7945564E38)
                java.lang.String r2 = r2.getString(r4)
                goto L_0x01b1
            L_0x01e6:
                com.pccw.mobile.sip.AddCallCallLogFragment r2 = com.pccw.mobile.sip.AddCallCallLogFragment.this
                java.lang.String r2 = r2.formatPhoneNumber(r3)
                goto L_0x01b1
            L_0x01ed:
                android.view.View r2 = r11.unreadMsgLayout
                r4 = 4
                r2.setVisibility(r4)
                com.pccw.mobile.sip.AddCallCallLogFragment$CallLogAdapter$2 r2 = new com.pccw.mobile.sip.AddCallCallLogFragment$CallLogAdapter$2
                r2.<init>(r3)
                r0 = r16
                r0.setOnClickListener(r2)
                goto L_0x009d
            L_0x01ff:
                android.widget.ImageView r2 = r11.calltypeimageView
                r3 = 2130838591(0x7f02043f, float:1.7282169E38)
                r2.setImageResource(r3)
                goto L_0x00c2
            L_0x0209:
                android.widget.ImageView r2 = r11.calltypeimageView
                r3 = 2130838600(0x7f020448, float:1.7282187E38)
                r2.setImageResource(r3)
                goto L_0x00c2
            L_0x0213:
                android.widget.ImageView r2 = r11.calltypeimageView
                r3 = 2130838580(0x7f020434, float:1.7282146E38)
                r2.setImageResource(r3)
                goto L_0x00c2
            L_0x021d:
                android.widget.ImageView r2 = r11.calltypeimageView
                r3 = 2130838590(0x7f02043e, float:1.7282167E38)
                r2.setImageResource(r3)
                goto L_0x00c2
            L_0x0227:
                r6 = r4
                r5 = r9
                r7 = r10
                goto L_0x0062
            */
            throw new UnsupportedOperationException("Method not decompiled: com.pccw.mobile.sip.AddCallCallLogFragment.CallLogAdapter.bindView(android.view.View, android.content.Context, android.database.Cursor):void");
        }

        public void clearCache() {
            synchronized (this.contactHashMap) {
                this.contactHashMap.clear();
            }
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
            callLogItemViews.labelView = (TextView) newView.findViewById(R.id.label);
            callLogItemViews.line1View = (TextView) newView.findViewById(2131624190);
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

        public boolean onPreDraw() {
            if (!this.mFirst) {
                return true;
            }
            this.mHandler.sendEmptyMessageDelayed(2, 1000);
            this.mFirst = false;
            return true;
        }

        public void run() {
            while (!this.mDone) {
                CallerInfoQuery callerInfoQuery = null;
                synchronized (this.mRequests) {
                    if (!this.mRequests.isEmpty()) {
                        callerInfoQuery = this.mRequests.removeFirst();
                    } else {
                        try {
                            this.mRequests.wait(1000);
                        } catch (InterruptedException e) {
                        }
                    }
                }
                if (callerInfoQuery != null) {
                    queryContactInfo(callerInfoQuery);
                }
            }
        }

        /* access modifiers changed from: package-private */
        public void setLoading(boolean z) {
            this.mLoading = z;
        }

        public void startRequestProcessing() {
            this.mDone = false;
            this.mCallerIdThread = new Thread(this);
            this.mCallerIdThread.setPriority(1);
            this.mCallerIdThread.start();
        }

        public void stopRequestProcessing() {
            this.mDone = true;
            if (this.mCallerIdThread != null) {
                this.mCallerIdThread.interrupt();
            }
        }
    }

    public static final class CallLogItemViews {
        ImageView calleditimageView;
        ImageView callimageView;
        ImageView calltypeimageView;
        TextView dateView;
        TextView labelView;
        TextView line1View;
        TextView numberView;
        ImageView photoView;
        View unreadMsgLayout;
        TextView unreadMsgNum;
    }

    static final class CallerInfoQuery {
        String name;
        String number;
        String numberLabel;
        int numberType;
        int position;

        CallerInfoQuery() {
        }
    }

    static final class ContactInfo {
        public static ContactInfo EMPTY = new ContactInfo();
        public String formattedNumber;
        public String label;
        public String name;
        public String number;
        public long personId;
        public String thumbnailUri;
        public int type;

        ContactInfo() {
        }
    }

    private static final class QueryHandler extends AsyncQueryHandler {
        private final WeakReference<AddCallCallLogFragment> mFragment;

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

        public QueryHandler(AddCallCallLogFragment addCallCallLogFragment) {
            super(addCallCallLogFragment.getActivity().getContentResolver());
            this.mFragment = new WeakReference<>(addCallCallLogFragment);
        }

        /* JADX WARNING: type inference failed for: r0v0, types: [android.os.Handler, com.pccw.mobile.sip.AddCallCallLogFragment$QueryHandler$CatchingWorkerHandler] */
        /* access modifiers changed from: protected */
        public Handler createHandler(Looper looper) {
            return new CatchingWorkerHandler(looper);
        }

        /* access modifiers changed from: protected */
        public void onQueryComplete(int i, Object obj, Cursor cursor) {
            AddCallCallLogFragment addCallCallLogFragment = (AddCallCallLogFragment) this.mFragment.get();
            if (addCallCallLogFragment == null || addCallCallLogFragment.getActivity() == null || addCallCallLogFragment.getActivity().isFinishing()) {
                cursor.close();
                return;
            }
            CallLogAdapter callLogAdapter = addCallCallLogFragment.mAdapter;
            switch (((Integer) obj).intValue()) {
                case 0:
                    callLogAdapter.setLoading(false);
                    callLogAdapter.changeCursor(cursor);
                    return;
                default:
                    return;
            }
        }
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
        return sEditable.toString();
    }

    private void historyLayoutSelector(int i) {
        switch (i) {
            case 0:
                this.currentQuery = 0;
                if (this.mAdapter != null) {
                    this.mAdapter.clearCache();
                }
                startQuery(0);
                return;
            default:
                return;
        }
    }

    private void performCall(String str) {
        if (str == null) {
            str = this.targerNumber;
        }
        MobileSipService.getInstance().addCall(str, ctx);
    }

    private void resetNewCallsFlag() {
        ContentValues contentValues = new ContentValues(1);
        contentValues.put(DBHelper.NEW, "0");
        this.mQueryHandler.startUpdate(56, (Object) null, KingKingContentProvider.CALL_LOG_URI, contentValues, "type=" + 3 + " AND new=1", (String[]) null);
    }

    private void startQuery(int i) {
        this.mAdapter.setLoading(true);
        this.mQueryHandler.cancelOperation(53);
        switch (i) {
            case 0:
                this.mQueryHandler.startQuery(53, 0, KingKingContentProvider.CALL_LOG_URI, CALL_LOG_PROJECTION, (String) null, (String[]) null, "date DESC");
                return;
            default:
                return;
        }
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.activity = getActivity();
        setHasOptionsMenu(true);
        ctx = getActivity().getApplicationContext();
        this.mQueryHandler = new QueryHandler(this);
        sFormattingType = -1;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        ActionBar supportActionBar = ((ActionBarActivity) getActivity()).getSupportActionBar();
        supportActionBar.setDisplayOptions(8, 12);
        supportActionBar.setTitle((CharSequence) getString(R.string.actionbar_tab_addcall_title_history));
        supportActionBar.setHomeButtonEnabled(true);
        supportActionBar.setDisplayHomeAsUpEnabled(true);
        View inflate = layoutInflater.inflate(R.layout.addcall_calllog_fragment, viewGroup, false);
        this.historyList = (ListView) inflate.findViewById(R.id.add_call_history_list);
        return inflate;
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mAdapter != null) {
            this.mAdapter.stopRequestProcessing();
            Cursor cursor = this.mAdapter.getCursor();
            if (cursor != null && !cursor.isClosed()) {
                cursor.close();
            }
        }
    }

    public void onPause() {
        super.onPause();
        this.mAdapter.stopRequestProcessing();
    }

    public void onResume() {
        if (this.mAdapter != null) {
            this.mAdapter.clearCache();
        }
        switch (this.currentQuery) {
            case 0:
                resetNewCallsFlag();
                break;
        }
        super.onResume();
        this.mAdapter.mPreDrawListener = null;
    }

    public void onStart() {
        super.onStart();
    }

    public void onStop() {
        super.onStop();
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mAdapter = new CallLogAdapter(ctx, R.layout.calllog_list_item, (Cursor) null, true);
        this.historyList.setAdapter(this.mAdapter);
        this.historyList.setOnCreateContextMenuListener(this);
        this.historyList.setItemsCanFocus(true);
        historyLayoutSelector(0);
    }
}
