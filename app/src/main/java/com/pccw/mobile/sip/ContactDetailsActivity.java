package com.pccw.mobile.sip;

import android.annotation.TargetApi;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.support.v4.app.LoaderManager;
import android.support.v4.app.NavUtils;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v7.app.ActionBar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import com.facebook.places.model.PlaceFields;
import com.facebook.share.internal.ShareConstants;
import com.pccw.database.helper.DBHelper;
import com.pccw.dialog.EnumKKDialogType;
import com.pccw.dialog.KKDialog;
import com.pccw.dialog.KKDialogBuilder;
import com.pccw.dialog.KKDialogProvider;
import com.pccw.dialog.listener.IKKDialogOnClickListener;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.IntentUtils;
import com.pccw.mobile.sip.util.NetworkUtils;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.UserPhotoUtil;
import com.pccw.sms.NewSMSActivity;
import com.pccw.sms.service.ConversationParticipantItemService;
import com.pccw.sms.service.listener.ICheckSMSTypeServiceListener;
import com.pccw.sms.util.SMSNumberUtil;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ContactDetailsActivity extends BaseActionBarActivity implements LoaderManager.LoaderCallbacks<Cursor>, IKKDialogOnClickListener {
    private static final String SHOW_IDD_CHARGE_MESSAGE = "SHOW_IDD_CHARGE_MESSAGE";
    ActionBar actionBar;
    ICheckSMSTypeServiceListener checkSMSTypeServiceListener = new ICheckSMSTypeServiceListener() {
        public void onCheckFail() {
        }

        public void onCheckSuccess(List<SMSType> list) {
            if (list != null) {
                ContactDetailsActivity.this.smsTypesList.addAll(list);
                for (int i = 0; i < ContactDetailsActivity.this.phoneViewList.size(); i++) {
                    View view = (View) ContactDetailsActivity.this.phoneViewList.get(i);
                    ImageView imageView = (ImageView) view.findViewById(R.id.sms_imgbtn);
                    String str = (String) view.getTag();
                    int i2 = 0;
                    while (true) {
                        if (i2 >= ContactDetailsActivity.this.smsTypesList.size()) {
                            break;
                        }
                        SMSType sMSType = (SMSType) ContactDetailsActivity.this.smsTypesList.get(i2);
                        if (sMSType.msisdn.equals(str)) {
                            String str2 = sMSType.type;
                            Log.i("KKSMS", "ICheckSMSTypeServiceListener type=" + str2);
                            if (str2.equals("intra")) {
                                imageView.setVisibility(0);
                                imageView.setBackgroundDrawable(ContactDetailsActivity.this.getResources().getDrawable(R.drawable.btn_sms_intra));
                            } else if (str2.equals("intl")) {
                                imageView.setVisibility(0);
                                imageView.setBackgroundDrawable(ContactDetailsActivity.this.getResources().getDrawable(R.drawable.btn_sms_intnl));
                            } else if (str2.endsWith("inter")) {
                                imageView.setVisibility(0);
                                imageView.setBackgroundDrawable(ContactDetailsActivity.this.getResources().getDrawable(R.drawable.btn_sms_inter));
                            } else {
                                imageView.setVisibility(8);
                            }
                        } else {
                            i2++;
                        }
                    }
                }
            }
        }
    };
    private TextView contactCompanyView;
    /* access modifiers changed from: private */
    public List<Map<String, Object>> contactDetails;
    private ContactDetailsListViewAdapter contactDetailsAdapter;
    private String contactId;
    private String contactName;
    private ImageView contactPhoto;
    private TextView contactPositionView;
    ConversationParticipantItemService conversationParticipantItemService;
    private String lookUpKey;
    ListView mPhoneList;
    private String msisdnlistString;
    private CheckBox notShowSMSConsumeWarmingAgainCkeckBox;
    private String owner;
    /* access modifiers changed from: private */
    public List<View> phoneViewList = new ArrayList();
    /* access modifiers changed from: private */
    public List<SMSType> smsTypesList = new ArrayList();
    private String targerNumber;
    private TextView title;

    private class ContactDetailsListViewAdapter extends BaseAdapter {
        private int layoutID;
        private List<Map<String, Object>> list;
        private LayoutInflater mInflater;

        public ContactDetailsListViewAdapter(Context context, List<Map<String, Object>> list2, int i, String[] strArr, int[] iArr) {
            this.mInflater = LayoutInflater.from(context);
            this.list = list2;
            this.layoutID = i;
        }

        public int getCount() {
            return this.list.size();
        }

        public Object getItem(int i) {
            return 0;
        }

        public long getItemId(int i) {
            return 0;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            View inflate = this.mInflater.inflate(this.layoutID, (ViewGroup) null);
            TextView textView = (TextView) inflate.findViewById(R.id.contact_detail_item_phone_number);
            TextView textView2 = (TextView) inflate.findViewById(R.id.contact_detail_item_phone_type);
            TextView textView3 = (TextView) inflate.findViewById(R.id.contact_detail_item_im_status);
            ((TextView) inflate.findViewById(R.id.contact_detail_item_im_last_online_time)).setVisibility(8);
            ImageView imageView = (ImageView) inflate.findViewById(R.id.call_imgbtn);
            ImageView imageView2 = (ImageView) inflate.findViewById(R.id.sms_imgbtn);
            ImageView imageView3 = (ImageView) inflate.findViewById(R.id.email_imgbtn);
            ImageView imageView4 = (ImageView) inflate.findViewById(R.id.contact_photo);
            LinearLayout linearLayout = (LinearLayout) inflate.findViewById(R.id.contact_detail_im_layout);
            String str = (String) ((Map) ContactDetailsActivity.this.contactDetails.get(i)).get(ShareConstants.WEB_DIALOG_PARAM_TITLE);
            final String str2 = (String) ((Map) ContactDetailsActivity.this.contactDetails.get(i)).get("contant");
            String str3 = (String) ((Map) ContactDetailsActivity.this.contactDetails.get(i)).get("type");
            if (PlaceFields.PHONE.equals(str3)) {
                inflate.setTag(SMSNumberUtil.formatNumber(str2));
                if (ContactDetailsActivity.this.phoneViewList.size() <= i) {
                    ContactDetailsActivity.this.phoneViewList.add(inflate);
                }
                imageView.setVisibility(0);
                imageView2.setOnClickListener(new View.OnClickListener() {
                    public void onClick(View view) {
                        if (!NetworkUtils.isWifiAvailable(ContactDetailsActivity.this.getApplicationContext())) {
                            ContactDetailsActivity.this.promptDialog(EnumKKDialogType.AlertNoWifiDialog);
                        } else if (!MobileSipService.getInstance().isLoginSuccress()) {
                            ContactDetailsActivity.this.promptDialog(EnumKKDialogType.AlertKKisOffDialog);
                        } else if (!ClientStateManager.isNotShowSMSConsumeWarmingCheckBox(ContactDetailsActivity.this.getApplicationContext())) {
                            Bundle bundle = new Bundle();
                            bundle.putString(DBHelper.NUMBER, str2);
                            ContactDetailsActivity.this.promptDialogWithArguments(EnumKKDialogType.AlertSMSConsumeDialog, bundle);
                        } else {
                            ContactDetailsActivity.this.startNewChatActivity(SMSNumberUtil.formatNumber(str2));
                        }
                    }
                });
                if (SMSNumberUtil.isValidRecipient(str2)) {
                    imageView2.setVisibility(0);
                    imageView2.setBackgroundDrawable(ContactDetailsActivity.this.getResources().getDrawable(R.drawable.btn_sms_gen));
                } else {
                    imageView2.setVisibility(8);
                }
            }
            if ("email".equals(str3)) {
                imageView3.setVisibility(0);
                imageView3.setOnClickListener(new View.OnClickListener() {
                    public void onClick(View view) {
                        Intent intent = new Intent("android.intent.action.SENDTO");
                        intent.setData(Uri.parse("mailto:" + str2));
                        ContactDetailsActivity.this.startActivity(intent);
                    }
                });
            }
            textView2.setText(str);
            textView.setText(str2);
            imageView.setImageResource(R.drawable.selector_contact_call_with_native_button);
            imageView.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    ContactDetailsActivity.this.pasteNumberToDialer(str2);
                }
            });
            return inflate;
        }
    }

    public interface ContactPhoneNumberQuery {
        public static final int DISPLAY_NAME = 5;
        public static final int ID = 0;
        public static final int LABEL = 3;
        public static final int LOOKUP_KEY = 4;
        public static final int NUMBER = 1;
        public static final String[] PROJECTION = {"_id", "data1", "data2", "data3", "lookup", "display_name"};
        public static final int QUERY_ID = 2;
        public static final String SELECTION = "contact_id = ";
        public static final int TYPE = 2;
    }

    private void call(String str) {
        if (str == null) {
            str = this.targerNumber;
        }
        MobileSipService.getInstance().call(str, this, false);
    }

    private void editContact() {
        Uri lookupUri = ContactsContract.Contacts.getLookupUri(Long.parseLong(this.contactId), this.lookUpKey);
        Intent intent = new Intent("android.intent.action.EDIT");
        intent.setDataAndType(lookupUri, "vnd.android.cursor.item/contact");
        intent.putExtra("finishActivityOnSaveCompleted", true);
        startActivity(intent);
    }

    /* JADX WARNING: Removed duplicated region for block: B:56:0x025f  */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x0264  */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x0269  */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x026e  */
    /* JADX WARNING: Removed duplicated region for block: B:64:0x0273  */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x0278  */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x027d  */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x0282  */
    /* JADX WARNING: Removed duplicated region for block: B:72:0x0287  */
    @android.annotation.SuppressLint({"NewApi"})
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void getAllInfo() {
        /*
            r19 = this;
            android.content.ContentResolver r1 = r19.getContentResolver()
            android.net.Uri r2 = android.provider.ContactsContract.Contacts.CONTENT_URI
            r3 = 0
            r4 = 0
            r5 = 0
            java.lang.String r6 = "display_name COLLATE LOCALIZED ASC"
            android.database.Cursor r17 = r1.query(r2, r3, r4, r5, r6)
            r14 = 0
            r9 = 0
            r13 = 0
            r12 = 0
            r6 = 0
            r16 = 0
            r5 = 0
            r11 = 0
            r4 = 0
            r10 = 0
            r3 = 0
            r15 = 0
            r2 = 0
            r8 = 0
            r1 = 0
            r7 = 0
            boolean r18 = r17.moveToFirst()     // Catch:{ all -> 0x066d }
            if (r18 == 0) goto L_0x0685
            android.content.ContentResolver r1 = r19.getContentResolver()     // Catch:{ all -> 0x066d }
            android.net.Uri r2 = android.provider.ContactsContract.CommonDataKinds.Phone.CONTENT_URI     // Catch:{ all -> 0x066d }
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ all -> 0x066d }
            r4.<init>()     // Catch:{ all -> 0x066d }
            r3 = 0
            java.lang.String r5 = "contact_id = "
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x066d }
            r0 = r19
            java.lang.String r5 = r0.contactId     // Catch:{ all -> 0x066d }
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x066d }
            java.lang.String r4 = r4.toString()     // Catch:{ all -> 0x066d }
            r5 = 0
            r6 = 0
            android.database.Cursor r14 = r1.query(r2, r3, r4, r5, r6)     // Catch:{ all -> 0x066d }
            java.util.ArrayList r1 = new java.util.ArrayList     // Catch:{ all -> 0x0257 }
            r1.<init>()     // Catch:{ all -> 0x0257 }
            boolean r2 = r14.moveToFirst()     // Catch:{ all -> 0x0257 }
            if (r2 == 0) goto L_0x00b9
        L_0x0055:
            java.lang.String r2 = "data1"
            int r2 = r14.getColumnIndex(r2)     // Catch:{ all -> 0x0257 }
            java.lang.String r2 = r14.getString(r2)     // Catch:{ all -> 0x0257 }
            java.lang.String r3 = "data2"
            int r3 = r14.getColumnIndex(r3)     // Catch:{ all -> 0x0257 }
            java.lang.String r3 = r14.getString(r3)     // Catch:{ all -> 0x0257 }
            int r3 = java.lang.Integer.parseInt(r3)     // Catch:{ all -> 0x0257 }
            int r3 = android.provider.ContactsContract.CommonDataKinds.Phone.getTypeLabelResource(r3)     // Catch:{ all -> 0x0257 }
            r0 = r19
            java.lang.String r3 = r0.getString(r3)     // Catch:{ all -> 0x0257 }
            java.util.HashMap r4 = new java.util.HashMap     // Catch:{ all -> 0x0257 }
            r4.<init>()     // Catch:{ all -> 0x0257 }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ all -> 0x0257 }
            r5.<init>()     // Catch:{ all -> 0x0257 }
            java.lang.String r6 = "KKSMS"
            java.lang.String r9 = "query phone number:"
            java.lang.StringBuilder r5 = r5.append(r9)     // Catch:{ all -> 0x0257 }
            java.lang.StringBuilder r5 = r5.append(r2)     // Catch:{ all -> 0x0257 }
            java.lang.String r9 = " trimmed="
            java.lang.StringBuilder r5 = r5.append(r9)     // Catch:{ all -> 0x0257 }
            java.lang.String r9 = com.pccw.sms.util.SMSNumberUtil.trimSpace(r2)     // Catch:{ all -> 0x0257 }
            java.lang.StringBuilder r5 = r5.append(r9)     // Catch:{ all -> 0x0257 }
            java.lang.String r5 = r5.toString()     // Catch:{ all -> 0x0257 }
            android.util.Log.v(r6, r5)     // Catch:{ all -> 0x0257 }
            java.lang.String r5 = com.pccw.sms.util.SMSNumberUtil.trimSpace(r2)     // Catch:{ all -> 0x0257 }
            boolean r5 = r1.contains(r5)     // Catch:{ all -> 0x0257 }
            if (r5 == 0) goto L_0x01ed
            java.lang.String r2 = "KKSMS"
            java.lang.String r3 = "do not add phoneNumber"
            android.util.Log.v(r2, r3)     // Catch:{ all -> 0x0257 }
        L_0x00b3:
            boolean r2 = r14.moveToNext()     // Catch:{ all -> 0x0257 }
            if (r2 != 0) goto L_0x0055
        L_0x00b9:
            android.content.ContentResolver r1 = r19.getContentResolver()     // Catch:{ all -> 0x0257 }
            android.net.Uri r2 = android.provider.ContactsContract.CommonDataKinds.Email.CONTENT_URI     // Catch:{ all -> 0x0257 }
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ all -> 0x0257 }
            r4.<init>()     // Catch:{ all -> 0x0257 }
            r3 = 0
            java.lang.String r5 = "contact_id = "
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x0257 }
            r0 = r19
            java.lang.String r5 = r0.contactId     // Catch:{ all -> 0x0257 }
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x0257 }
            java.lang.String r4 = r4.toString()     // Catch:{ all -> 0x0257 }
            r5 = 0
            r6 = 0
            android.database.Cursor r13 = r1.query(r2, r3, r4, r5, r6)     // Catch:{ all -> 0x0257 }
            java.util.ArrayList r2 = new java.util.ArrayList     // Catch:{ all -> 0x02bf }
            r2.<init>()     // Catch:{ all -> 0x02bf }
            boolean r1 = r13.moveToFirst()     // Catch:{ all -> 0x02bf }
            if (r1 == 0) goto L_0x013e
        L_0x00e8:
            java.lang.String r1 = "data2"
            int r1 = r13.getColumnIndex(r1)     // Catch:{ all -> 0x02bf }
            java.lang.String r3 = r13.getString(r1)     // Catch:{ all -> 0x02bf }
            java.lang.String r1 = "data1"
            int r1 = r13.getColumnIndex(r1)     // Catch:{ all -> 0x02bf }
            java.lang.String r4 = r13.getString(r1)     // Catch:{ all -> 0x02bf }
            android.content.res.Resources r1 = r19.getResources()     // Catch:{ all -> 0x02bf }
            r5 = 2131165372(0x7f0700bc, float:1.794496E38)
            java.lang.String r1 = r1.getString(r5)     // Catch:{ all -> 0x02bf }
            boolean r5 = android.text.TextUtils.isEmpty(r3)     // Catch:{ all -> 0x02bf }
            if (r5 != 0) goto L_0x0132
            int r3 = java.lang.Integer.parseInt(r3)     // Catch:{ all -> 0x02bf }
            int r3 = android.provider.ContactsContract.CommonDataKinds.Email.getTypeLabelResource(r3)     // Catch:{ all -> 0x02bf }
            r0 = r19
            java.lang.String r3 = r0.getString(r3)     // Catch:{ all -> 0x02bf }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ all -> 0x02bf }
            r5.<init>()     // Catch:{ all -> 0x02bf }
            java.lang.StringBuilder r1 = r5.append(r1)     // Catch:{ all -> 0x02bf }
            java.lang.String r5 = "/"
            java.lang.StringBuilder r1 = r1.append(r5)     // Catch:{ all -> 0x02bf }
            java.lang.StringBuilder r1 = r1.append(r3)     // Catch:{ all -> 0x02bf }
            java.lang.String r1 = r1.toString()     // Catch:{ all -> 0x02bf }
        L_0x0132:
            boolean r3 = r2.contains(r4)     // Catch:{ all -> 0x02bf }
            if (r3 == 0) goto L_0x029d
        L_0x0138:
            boolean r1 = r13.moveToNext()     // Catch:{ all -> 0x02bf }
            if (r1 != 0) goto L_0x00e8
        L_0x013e:
            android.content.ContentResolver r1 = r19.getContentResolver()     // Catch:{ all -> 0x02bf }
            android.net.Uri r2 = android.provider.ContactsContract.CommonDataKinds.StructuredPostal.CONTENT_URI     // Catch:{ all -> 0x02bf }
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ all -> 0x02bf }
            r4.<init>()     // Catch:{ all -> 0x02bf }
            r3 = 0
            java.lang.String r5 = "contact_id = "
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x02bf }
            r0 = r19
            java.lang.String r5 = r0.contactId     // Catch:{ all -> 0x02bf }
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x02bf }
            java.lang.String r4 = r4.toString()     // Catch:{ all -> 0x02bf }
            r5 = 0
            r6 = 0
            android.database.Cursor r12 = r1.query(r2, r3, r4, r5, r6)     // Catch:{ all -> 0x02bf }
            boolean r1 = r12.moveToFirst()     // Catch:{ all -> 0x0676 }
            if (r1 == 0) goto L_0x0322
        L_0x0168:
            java.lang.String r1 = "data4"
            int r1 = r12.getColumnIndex(r1)     // Catch:{ all -> 0x0676 }
            java.lang.String r1 = r12.getString(r1)     // Catch:{ all -> 0x0676 }
            java.lang.String r2 = "data7"
            int r2 = r12.getColumnIndex(r2)     // Catch:{ all -> 0x0676 }
            java.lang.String r3 = r12.getString(r2)     // Catch:{ all -> 0x0676 }
            java.lang.String r2 = "data8"
            int r2 = r12.getColumnIndex(r2)     // Catch:{ all -> 0x0676 }
            java.lang.String r4 = r12.getString(r2)     // Catch:{ all -> 0x0676 }
            java.lang.String r2 = "data9"
            int r2 = r12.getColumnIndex(r2)     // Catch:{ all -> 0x0676 }
            java.lang.String r5 = r12.getString(r2)     // Catch:{ all -> 0x0676 }
            java.lang.String r2 = "data1"
            int r2 = r12.getColumnIndex(r2)     // Catch:{ all -> 0x0676 }
            r12.getString(r2)     // Catch:{ all -> 0x0676 }
            java.lang.String r2 = ""
            r6 = 4
            java.lang.String[] r6 = new java.lang.String[r6]     // Catch:{ all -> 0x0676 }
            r9 = 0
            r6[r9] = r5
            r5 = 1
            r6[r5] = r1
            r1 = 2
            r6[r1] = r3
            r1 = 3
            r6[r1] = r4
            r1 = 0
            r3 = 0
        L_0x01ac:
            int r4 = r6.length     // Catch:{ all -> 0x0676 }
            if (r3 >= r4) goto L_0x02c5
            r4 = r6[r3]
            if (r4 == 0) goto L_0x01ea
            java.lang.String r4 = ""
            r5 = r6[r3]     // Catch:{ all -> 0x0676 }
            boolean r4 = r4.equals(r5)     // Catch:{ all -> 0x0676 }
            if (r4 != 0) goto L_0x01ea
            if (r1 <= 0) goto L_0x01d5
            int r4 = r6.length     // Catch:{ all -> 0x0676 }
            if (r3 >= r4) goto L_0x01d5
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ all -> 0x0676 }
            r4.<init>()     // Catch:{ all -> 0x0676 }
            java.lang.StringBuilder r2 = r4.append(r2)     // Catch:{ all -> 0x0676 }
            java.lang.String r4 = ","
            java.lang.StringBuilder r2 = r2.append(r4)     // Catch:{ all -> 0x0676 }
            java.lang.String r2 = r2.toString()     // Catch:{ all -> 0x0676 }
        L_0x01d5:
            int r1 = r1 + 1
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ all -> 0x0676 }
            r4.<init>()     // Catch:{ all -> 0x0676 }
            java.lang.StringBuilder r2 = r4.append(r2)     // Catch:{ all -> 0x0676 }
            r4 = r6[r3]     // Catch:{ all -> 0x0676 }
            java.lang.StringBuilder r2 = r2.append(r4)     // Catch:{ all -> 0x0676 }
            java.lang.String r2 = r2.toString()     // Catch:{ all -> 0x0676 }
        L_0x01ea:
            int r3 = r3 + 1
            goto L_0x01ac
        L_0x01ed:
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ all -> 0x0257 }
            r5.<init>()     // Catch:{ all -> 0x0257 }
            java.lang.String r6 = "KKSMS"
            java.lang.String r9 = "add phone number:"
            java.lang.StringBuilder r5 = r5.append(r9)     // Catch:{ all -> 0x0257 }
            java.lang.String r9 = com.pccw.sms.util.SMSNumberUtil.trimSpace(r2)     // Catch:{ all -> 0x0257 }
            java.lang.StringBuilder r5 = r5.append(r9)     // Catch:{ all -> 0x0257 }
            java.lang.String r5 = r5.toString()     // Catch:{ all -> 0x0257 }
            android.util.Log.v(r6, r5)     // Catch:{ all -> 0x0257 }
            java.lang.String r5 = com.pccw.sms.util.SMSNumberUtil.trimSpace(r2)     // Catch:{ all -> 0x0257 }
            r1.add(r5)     // Catch:{ all -> 0x0257 }
            r0 = r19
            java.lang.String r5 = r0.pretreatment(r2)     // Catch:{ all -> 0x0257 }
            java.lang.String r6 = "NotMatch"
            boolean r6 = r5.equals(r6)     // Catch:{ all -> 0x0257 }
            if (r6 != 0) goto L_0x028b
            java.lang.StringBuilder r6 = new java.lang.StringBuilder     // Catch:{ all -> 0x0257 }
            r6.<init>()     // Catch:{ all -> 0x0257 }
            r0 = r19
            java.lang.String r9 = r0.msisdnlistString     // Catch:{ all -> 0x0257 }
            java.lang.StringBuilder r6 = r6.append(r9)     // Catch:{ all -> 0x0257 }
            java.lang.StringBuilder r5 = r6.append(r5)     // Catch:{ all -> 0x0257 }
            java.lang.String r6 = ";"
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ all -> 0x0257 }
            java.lang.String r5 = r5.toString()     // Catch:{ all -> 0x0257 }
            r0 = r19
            r0.msisdnlistString = r5     // Catch:{ all -> 0x0257 }
            java.lang.String r5 = "title"
            r4.put(r5, r3)     // Catch:{ all -> 0x0257 }
            java.lang.String r3 = "contant"
            r4.put(r3, r2)     // Catch:{ all -> 0x0257 }
            java.lang.String r2 = "type"
            java.lang.String r3 = "phone"
            r4.put(r2, r3)     // Catch:{ all -> 0x0257 }
        L_0x024e:
            r0 = r19
            java.util.List<java.util.Map<java.lang.String, java.lang.Object>> r2 = r0.contactDetails     // Catch:{ all -> 0x0257 }
            r2.add(r4)     // Catch:{ all -> 0x0257 }
            goto L_0x00b3
        L_0x0257:
            r1 = move-exception
            r2 = r1
            r3 = r15
            r13 = r12
            r4 = r16
        L_0x025d:
            if (r14 == 0) goto L_0x0262
            r14.close()
        L_0x0262:
            if (r13 == 0) goto L_0x0267
            r13.close()
        L_0x0267:
            if (r4 == 0) goto L_0x026c
            r4.close()
        L_0x026c:
            if (r11 == 0) goto L_0x0271
            r11.close()
        L_0x0271:
            if (r10 == 0) goto L_0x0276
            r10.close()
        L_0x0276:
            if (r3 == 0) goto L_0x027b
            r3.close()
        L_0x027b:
            if (r8 == 0) goto L_0x0280
            r8.close()
        L_0x0280:
            if (r7 == 0) goto L_0x0285
            r7.close()
        L_0x0285:
            if (r17 == 0) goto L_0x028a
            r17.close()
        L_0x028a:
            throw r2
        L_0x028b:
            java.lang.String r5 = "title"
            r4.put(r5, r3)     // Catch:{ all -> 0x0257 }
            java.lang.String r3 = "contant"
            r4.put(r3, r2)     // Catch:{ all -> 0x0257 }
            java.lang.String r2 = "type"
            java.lang.String r3 = "phone"
            r4.put(r2, r3)     // Catch:{ all -> 0x0257 }
            goto L_0x024e
        L_0x029d:
            r2.add(r4)     // Catch:{ all -> 0x02bf }
            java.util.HashMap r3 = new java.util.HashMap     // Catch:{ all -> 0x02bf }
            r3.<init>()     // Catch:{ all -> 0x02bf }
            java.lang.String r5 = "title"
            r3.put(r5, r1)     // Catch:{ all -> 0x02bf }
            java.lang.String r1 = "contant"
            r3.put(r1, r4)     // Catch:{ all -> 0x02bf }
            java.lang.String r1 = "type"
            java.lang.String r4 = "email"
            r3.put(r1, r4)     // Catch:{ all -> 0x02bf }
            r0 = r19
            java.util.List<java.util.Map<java.lang.String, java.lang.Object>> r1 = r0.contactDetails     // Catch:{ all -> 0x02bf }
            r1.add(r3)     // Catch:{ all -> 0x02bf }
            goto L_0x0138
        L_0x02bf:
            r1 = move-exception
            r2 = r1
            r3 = r15
            r4 = r16
            goto L_0x025d
        L_0x02c5:
            java.lang.String r1 = "data2"
            int r1 = r12.getColumnIndex(r1)     // Catch:{ all -> 0x0676 }
            java.lang.String r1 = r12.getString(r1)     // Catch:{ all -> 0x0676 }
            int r1 = java.lang.Integer.parseInt(r1)     // Catch:{ all -> 0x0676 }
            int r1 = android.provider.ContactsContract.CommonDataKinds.StructuredPostal.getTypeLabelResource(r1)     // Catch:{ all -> 0x0676 }
            r0 = r19
            java.lang.String r1 = r0.getString(r1)     // Catch:{ all -> 0x0676 }
            java.util.HashMap r3 = new java.util.HashMap     // Catch:{ all -> 0x0676 }
            r3.<init>()     // Catch:{ all -> 0x0676 }
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ all -> 0x0676 }
            r4.<init>()     // Catch:{ all -> 0x0676 }
            java.lang.String r5 = "title"
            android.content.res.Resources r6 = r19.getResources()     // Catch:{ all -> 0x0676 }
            r9 = 2131165369(0x7f0700b9, float:1.7944953E38)
            java.lang.String r6 = r6.getString(r9)     // Catch:{ all -> 0x0676 }
            java.lang.StringBuilder r4 = r4.append(r6)     // Catch:{ all -> 0x0676 }
            java.lang.String r6 = "/"
            java.lang.StringBuilder r4 = r4.append(r6)     // Catch:{ all -> 0x0676 }
            java.lang.StringBuilder r1 = r4.append(r1)     // Catch:{ all -> 0x0676 }
            java.lang.String r1 = r1.toString()     // Catch:{ all -> 0x0676 }
            r3.put(r5, r1)     // Catch:{ all -> 0x0676 }
            java.lang.String r1 = "contant"
            r3.put(r1, r2)     // Catch:{ all -> 0x0676 }
            java.lang.String r1 = "type"
            java.lang.String r2 = "address"
            r3.put(r1, r2)     // Catch:{ all -> 0x0676 }
            r0 = r19
            java.util.List<java.util.Map<java.lang.String, java.lang.Object>> r1 = r0.contactDetails     // Catch:{ all -> 0x0676 }
            r1.add(r3)     // Catch:{ all -> 0x0676 }
            boolean r1 = r12.moveToNext()     // Catch:{ all -> 0x0676 }
            if (r1 != 0) goto L_0x0168
        L_0x0322:
            android.content.ContentResolver r1 = r19.getContentResolver()     // Catch:{ all -> 0x0676 }
            android.net.Uri r2 = android.provider.ContactsContract.Data.CONTENT_URI     // Catch:{ all -> 0x0676 }
            r0 = r19
            java.lang.String r6 = r0.contactId     // Catch:{ all -> 0x0676 }
            r3 = 3
            java.lang.String[] r3 = new java.lang.String[r3]     // Catch:{ all -> 0x0676 }
            r4 = 0
            java.lang.String r5 = "_id"
            r3[r4] = r5     // Catch:{ all -> 0x0676 }
            r4 = 1
            java.lang.String r5 = "data1"
            r3[r4] = r5     // Catch:{ all -> 0x0676 }
            r4 = 2
            java.lang.String r5 = "data4"
            r3[r4] = r5     // Catch:{ all -> 0x0676 }
            java.lang.String r4 = "contact_id=? AND mimetype='vnd.android.cursor.item/organization'"
            r5 = 1
            java.lang.String[] r5 = new java.lang.String[r5]     // Catch:{ all -> 0x0676 }
            r9 = 0
            r5[r9] = r6     // Catch:{ all -> 0x0676 }
            r6 = 0
            android.database.Cursor r11 = r1.query(r2, r3, r4, r5, r6)     // Catch:{ all -> 0x0676 }
            boolean r1 = r11.moveToFirst()     // Catch:{ all -> 0x0676 }
            if (r1 == 0) goto L_0x03a1
        L_0x0351:
            java.lang.String r1 = "data1"
            int r1 = r11.getColumnIndex(r1)     // Catch:{ all -> 0x0676 }
            java.lang.String r1 = r11.getString(r1)     // Catch:{ all -> 0x0676 }
            java.lang.String r2 = "data4"
            int r2 = r11.getColumnIndex(r2)     // Catch:{ all -> 0x0676 }
            java.lang.String r2 = r11.getString(r2)     // Catch:{ all -> 0x0676 }
            boolean r3 = com.pccw.mobile.util.StringUtil.isNotEmpty(r1)     // Catch:{ all -> 0x0676 }
            if (r3 == 0) goto L_0x039b
            java.lang.String r3 = r1.trim()     // Catch:{ all -> 0x0676 }
            java.lang.String r4 = " "
            java.lang.String r5 = ""
            java.lang.String r3 = r3.replaceAll(r4, r5)     // Catch:{ all -> 0x0676 }
            int r3 = r3.length()     // Catch:{ all -> 0x0676 }
            if (r3 == 0) goto L_0x039b
            r0 = r19
            android.widget.TextView r3 = r0.contactPositionView     // Catch:{ all -> 0x0676 }
            r4 = 0
            r3.setVisibility(r4)     // Catch:{ all -> 0x0676 }
            r0 = r19
            android.widget.TextView r3 = r0.contactPositionView     // Catch:{ all -> 0x0676 }
            r3.setText(r2)     // Catch:{ all -> 0x0676 }
            r0 = r19
            android.widget.TextView r2 = r0.contactCompanyView     // Catch:{ all -> 0x0676 }
            r3 = 0
            r2.setVisibility(r3)     // Catch:{ all -> 0x0676 }
            r0 = r19
            android.widget.TextView r2 = r0.contactCompanyView     // Catch:{ all -> 0x0676 }
            r2.setText(r1)     // Catch:{ all -> 0x0676 }
        L_0x039b:
            boolean r1 = r11.moveToNext()     // Catch:{ all -> 0x0676 }
            if (r1 != 0) goto L_0x0351
        L_0x03a1:
            android.content.ContentResolver r1 = r19.getContentResolver()     // Catch:{ all -> 0x0676 }
            android.net.Uri r2 = android.provider.ContactsContract.Data.CONTENT_URI     // Catch:{ all -> 0x0676 }
            r0 = r19
            java.lang.String r6 = r0.contactId     // Catch:{ all -> 0x0676 }
            r3 = 3
            java.lang.String[] r3 = new java.lang.String[r3]     // Catch:{ all -> 0x0676 }
            r4 = 0
            java.lang.String r5 = "_id"
            r3[r4] = r5     // Catch:{ all -> 0x0676 }
            r4 = 1
            java.lang.String r5 = "data1"
            r3[r4] = r5     // Catch:{ all -> 0x0676 }
            r4 = 2
            java.lang.String r5 = "mimetype"
            r3[r4] = r5     // Catch:{ all -> 0x0676 }
            java.lang.String r4 = "contact_id=? AND mimetype='vnd.android.cursor.item/note'"
            r5 = 1
            java.lang.String[] r5 = new java.lang.String[r5]     // Catch:{ all -> 0x0676 }
            r9 = 0
            r5[r9] = r6     // Catch:{ all -> 0x0676 }
            r6 = 0
            android.database.Cursor r10 = r1.query(r2, r3, r4, r5, r6)     // Catch:{ all -> 0x0676 }
            boolean r1 = r10.moveToFirst()     // Catch:{ all -> 0x0676 }
            if (r1 == 0) goto L_0x0420
        L_0x03d0:
            java.lang.String r1 = "data1"
            int r1 = r10.getColumnIndex(r1)     // Catch:{ all -> 0x0676 }
            java.lang.String r1 = r10.getString(r1)     // Catch:{ all -> 0x0676 }
            android.content.res.Resources r2 = r19.getResources()     // Catch:{ all -> 0x0676 }
            r3 = 2131165374(0x7f0700be, float:1.7944963E38)
            java.lang.String r2 = r2.getString(r3)     // Catch:{ all -> 0x0676 }
            java.util.HashMap r3 = new java.util.HashMap     // Catch:{ all -> 0x0676 }
            r3.<init>()     // Catch:{ all -> 0x0676 }
            boolean r4 = com.pccw.mobile.util.StringUtil.isNotEmpty(r1)     // Catch:{ all -> 0x0676 }
            if (r4 == 0) goto L_0x041a
            java.lang.String r4 = r1.trim()     // Catch:{ all -> 0x0676 }
            java.lang.String r5 = " "
            java.lang.String r6 = ""
            java.lang.String r4 = r4.replaceAll(r5, r6)     // Catch:{ all -> 0x0676 }
            int r4 = r4.length()     // Catch:{ all -> 0x0676 }
            if (r4 == 0) goto L_0x041a
            java.lang.String r4 = "title"
            r3.put(r4, r2)     // Catch:{ all -> 0x0676 }
            java.lang.String r2 = "contant"
            r3.put(r2, r1)     // Catch:{ all -> 0x0676 }
            java.lang.String r1 = "type"
            java.lang.String r2 = "note"
            r3.put(r1, r2)     // Catch:{ all -> 0x0676 }
            r0 = r19
            java.util.List<java.util.Map<java.lang.String, java.lang.Object>> r1 = r0.contactDetails     // Catch:{ all -> 0x0676 }
            r1.add(r3)     // Catch:{ all -> 0x0676 }
        L_0x041a:
            boolean r1 = r10.moveToNext()     // Catch:{ all -> 0x0676 }
            if (r1 != 0) goto L_0x03d0
        L_0x0420:
            android.content.ContentResolver r1 = r19.getContentResolver()     // Catch:{ all -> 0x0676 }
            android.net.Uri r2 = android.provider.ContactsContract.Data.CONTENT_URI     // Catch:{ all -> 0x0676 }
            r0 = r19
            java.lang.String r6 = r0.contactId     // Catch:{ all -> 0x0676 }
            r3 = 2
            java.lang.String[] r3 = new java.lang.String[r3]     // Catch:{ all -> 0x0676 }
            r4 = 0
            java.lang.String r5 = "_id"
            r3[r4] = r5     // Catch:{ all -> 0x0676 }
            r4 = 1
            java.lang.String r5 = "data1"
            r3[r4] = r5     // Catch:{ all -> 0x0676 }
            java.lang.String r4 = "contact_id=? AND mimetype='vnd.android.cursor.item/nickname'"
            r5 = 1
            java.lang.String[] r5 = new java.lang.String[r5]     // Catch:{ all -> 0x0676 }
            r9 = 0
            r5[r9] = r6     // Catch:{ all -> 0x0676 }
            r6 = 0
            android.database.Cursor r9 = r1.query(r2, r3, r4, r5, r6)     // Catch:{ all -> 0x0676 }
            boolean r1 = r9.moveToFirst()     // Catch:{ all -> 0x0665 }
            if (r1 == 0) goto L_0x049a
        L_0x044a:
            java.lang.String r1 = "data1"
            int r1 = r9.getColumnIndex(r1)     // Catch:{ all -> 0x0665 }
            java.lang.String r1 = r9.getString(r1)     // Catch:{ all -> 0x0665 }
            android.content.res.Resources r2 = r19.getResources()     // Catch:{ all -> 0x0665 }
            r3 = 2131165375(0x7f0700bf, float:1.7944965E38)
            java.lang.String r2 = r2.getString(r3)     // Catch:{ all -> 0x0665 }
            java.util.HashMap r3 = new java.util.HashMap     // Catch:{ all -> 0x0665 }
            r3.<init>()     // Catch:{ all -> 0x0665 }
            boolean r4 = com.pccw.mobile.util.StringUtil.isNotEmpty(r1)     // Catch:{ all -> 0x0665 }
            if (r4 == 0) goto L_0x0494
            java.lang.String r4 = r1.trim()     // Catch:{ all -> 0x0665 }
            java.lang.String r5 = " "
            java.lang.String r6 = ""
            java.lang.String r4 = r4.replaceAll(r5, r6)     // Catch:{ all -> 0x0665 }
            int r4 = r4.length()     // Catch:{ all -> 0x0665 }
            if (r4 == 0) goto L_0x0494
            java.lang.String r4 = "title"
            r3.put(r4, r2)     // Catch:{ all -> 0x0665 }
            java.lang.String r2 = "contant"
            r3.put(r2, r1)     // Catch:{ all -> 0x0665 }
            java.lang.String r1 = "type"
            java.lang.String r2 = "nickname"
            r3.put(r1, r2)     // Catch:{ all -> 0x0665 }
            r0 = r19
            java.util.List<java.util.Map<java.lang.String, java.lang.Object>> r1 = r0.contactDetails     // Catch:{ all -> 0x0665 }
            r1.add(r3)     // Catch:{ all -> 0x0665 }
        L_0x0494:
            boolean r1 = r9.moveToNext()     // Catch:{ all -> 0x0665 }
            if (r1 != 0) goto L_0x044a
        L_0x049a:
            android.content.ContentResolver r1 = r19.getContentResolver()     // Catch:{ all -> 0x0665 }
            android.net.Uri r2 = android.provider.ContactsContract.Data.CONTENT_URI     // Catch:{ all -> 0x0665 }
            r0 = r19
            java.lang.String r6 = r0.contactId     // Catch:{ all -> 0x0665 }
            r3 = 4
            java.lang.String[] r3 = new java.lang.String[r3]     // Catch:{ all -> 0x0665 }
            r4 = 0
            java.lang.String r5 = "_id"
            r3[r4] = r5     // Catch:{ all -> 0x0665 }
            r4 = 1
            java.lang.String r5 = "data1"
            r3[r4] = r5     // Catch:{ all -> 0x0665 }
            r4 = 2
            java.lang.String r5 = "data1"
            r3[r4] = r5     // Catch:{ all -> 0x0665 }
            r4 = 3
            java.lang.String r5 = "data2"
            r3[r4] = r5     // Catch:{ all -> 0x0665 }
            java.lang.String r4 = "contact_id=? AND mimetype='vnd.android.cursor.item/relation'"
            r5 = 1
            java.lang.String[] r5 = new java.lang.String[r5]     // Catch:{ all -> 0x0665 }
            r15 = 0
            r5[r15] = r6     // Catch:{ all -> 0x0665 }
            r6 = 0
            android.database.Cursor r8 = r1.query(r2, r3, r4, r5, r6)     // Catch:{ all -> 0x0665 }
            boolean r1 = r8.moveToFirst()     // Catch:{ all -> 0x0665 }
            if (r1 == 0) goto L_0x054d
        L_0x04ce:
            java.lang.String r1 = "data2"
            int r1 = r8.getColumnIndex(r1)     // Catch:{ all -> 0x0665 }
            java.lang.String r1 = r8.getString(r1)     // Catch:{ all -> 0x0665 }
            java.lang.String r2 = "data1"
            int r2 = r8.getColumnIndex(r2)     // Catch:{ all -> 0x0665 }
            java.lang.String r2 = r8.getString(r2)     // Catch:{ all -> 0x0665 }
            int r1 = java.lang.Integer.parseInt(r1)     // Catch:{ all -> 0x0665 }
            int r1 = android.provider.ContactsContract.CommonDataKinds.Relation.getTypeLabelResource(r1)     // Catch:{ all -> 0x0665 }
            r0 = r19
            java.lang.String r1 = r0.getString(r1)     // Catch:{ all -> 0x0665 }
            java.util.HashMap r3 = new java.util.HashMap     // Catch:{ all -> 0x0665 }
            r3.<init>()     // Catch:{ all -> 0x0665 }
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ all -> 0x0665 }
            r4.<init>()     // Catch:{ all -> 0x0665 }
            android.content.res.Resources r5 = r19.getResources()     // Catch:{ all -> 0x0665 }
            r6 = 2131165376(0x7f0700c0, float:1.7944967E38)
            java.lang.String r5 = r5.getString(r6)     // Catch:{ all -> 0x0665 }
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x0665 }
            java.lang.String r5 = "/"
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x0665 }
            java.lang.StringBuilder r1 = r4.append(r1)     // Catch:{ all -> 0x0665 }
            java.lang.String r1 = r1.toString()     // Catch:{ all -> 0x0665 }
            boolean r4 = com.pccw.mobile.util.StringUtil.isNotEmpty(r2)     // Catch:{ all -> 0x0665 }
            if (r4 == 0) goto L_0x0547
            java.lang.String r4 = r2.trim()     // Catch:{ all -> 0x0665 }
            java.lang.String r5 = " "
            java.lang.String r6 = ""
            java.lang.String r4 = r4.replaceAll(r5, r6)     // Catch:{ all -> 0x0665 }
            int r4 = r4.length()     // Catch:{ all -> 0x0665 }
            if (r4 == 0) goto L_0x0547
            java.lang.String r4 = "title"
            r3.put(r4, r1)     // Catch:{ all -> 0x0665 }
            java.lang.String r1 = "contant"
            r3.put(r1, r2)     // Catch:{ all -> 0x0665 }
            java.lang.String r1 = "type"
            java.lang.String r2 = "relation"
            r3.put(r1, r2)     // Catch:{ all -> 0x0665 }
            r0 = r19
            java.util.List<java.util.Map<java.lang.String, java.lang.Object>> r1 = r0.contactDetails     // Catch:{ all -> 0x0665 }
            r1.add(r3)     // Catch:{ all -> 0x0665 }
        L_0x0547:
            boolean r1 = r8.moveToNext()     // Catch:{ all -> 0x0665 }
            if (r1 != 0) goto L_0x04ce
        L_0x054d:
            android.content.ContentResolver r1 = r19.getContentResolver()     // Catch:{ all -> 0x0665 }
            android.net.Uri r2 = android.provider.ContactsContract.Data.CONTENT_URI     // Catch:{ all -> 0x0665 }
            r0 = r19
            java.lang.String r6 = r0.contactId     // Catch:{ all -> 0x0665 }
            r3 = 2
            java.lang.String[] r3 = new java.lang.String[r3]     // Catch:{ all -> 0x0665 }
            r4 = 0
            java.lang.String r5 = "_id"
            r3[r4] = r5     // Catch:{ all -> 0x0665 }
            r4 = 1
            java.lang.String r5 = "data1"
            r3[r4] = r5     // Catch:{ all -> 0x0665 }
            java.lang.String r4 = "contact_id=? AND mimetype='vnd.android.cursor.item/website'"
            r5 = 1
            java.lang.String[] r5 = new java.lang.String[r5]     // Catch:{ all -> 0x0665 }
            r15 = 0
            r5[r15] = r6     // Catch:{ all -> 0x0665 }
            r6 = 0
            android.database.Cursor r1 = r1.query(r2, r3, r4, r5, r6)     // Catch:{ all -> 0x0665 }
            boolean r2 = r1.moveToFirst()     // Catch:{ all -> 0x067c }
            if (r2 == 0) goto L_0x0682
        L_0x0577:
            java.lang.String r2 = "data1"
            int r2 = r1.getColumnIndex(r2)     // Catch:{ all -> 0x067c }
            java.lang.String r2 = r1.getString(r2)     // Catch:{ all -> 0x067c }
            java.util.HashMap r3 = new java.util.HashMap     // Catch:{ all -> 0x067c }
            r3.<init>()     // Catch:{ all -> 0x067c }
            android.content.res.Resources r4 = r19.getResources()     // Catch:{ all -> 0x067c }
            r5 = 2131165378(0x7f0700c2, float:1.7944971E38)
            java.lang.String r4 = r4.getString(r5)     // Catch:{ all -> 0x067c }
            boolean r5 = com.pccw.mobile.util.StringUtil.isNotEmpty(r2)     // Catch:{ all -> 0x067c }
            if (r5 == 0) goto L_0x05c1
            java.lang.String r5 = r2.trim()     // Catch:{ all -> 0x067c }
            java.lang.String r6 = " "
            java.lang.String r7 = ""
            java.lang.String r5 = r5.replaceAll(r6, r7)     // Catch:{ all -> 0x067c }
            int r5 = r5.length()     // Catch:{ all -> 0x067c }
            if (r5 == 0) goto L_0x05c1
            java.lang.String r5 = "title"
            r3.put(r5, r4)     // Catch:{ all -> 0x067c }
            java.lang.String r4 = "contant"
            r3.put(r4, r2)     // Catch:{ all -> 0x067c }
            java.lang.String r2 = "type"
            java.lang.String r4 = "website"
            r3.put(r2, r4)     // Catch:{ all -> 0x067c }
            r0 = r19
            java.util.List<java.util.Map<java.lang.String, java.lang.Object>> r2 = r0.contactDetails     // Catch:{ all -> 0x067c }
            r2.add(r3)     // Catch:{ all -> 0x067c }
        L_0x05c1:
            boolean r2 = r1.moveToNext()     // Catch:{ all -> 0x067c }
            if (r2 != 0) goto L_0x0577
            r7 = r1
        L_0x05c8:
            android.content.ContentResolver r1 = r19.getContentResolver()     // Catch:{ all -> 0x0665 }
            android.net.Uri r2 = android.provider.ContactsContract.Data.CONTENT_URI     // Catch:{ all -> 0x0665 }
            r15 = 0
            r0 = r19
            java.lang.String r6 = r0.contactId     // Catch:{ all -> 0x065d }
            r3 = 1
            java.lang.String[] r3 = new java.lang.String[r3]     // Catch:{ all -> 0x065d }
            r4 = 0
            java.lang.String r5 = "data1"
            r3[r4] = r5     // Catch:{ all -> 0x065d }
            java.lang.String r4 = "contact_id=? AND mimetype='vnd.android.cursor.item/contact_event' and data2='3'"
            r5 = 1
            java.lang.String[] r5 = new java.lang.String[r5]     // Catch:{ all -> 0x065d }
            r16 = 0
            r5[r16] = r6     // Catch:{ all -> 0x065d }
            r6 = 0
            android.database.Cursor r2 = r1.query(r2, r3, r4, r5, r6)     // Catch:{ all -> 0x065d }
            if (r2 == 0) goto L_0x062a
            boolean r1 = r2.moveToFirst()     // Catch:{ all -> 0x066b }
            if (r1 == 0) goto L_0x062a
        L_0x05f1:
            java.util.HashMap r1 = new java.util.HashMap     // Catch:{ all -> 0x066b }
            r1.<init>()     // Catch:{ all -> 0x066b }
            android.content.res.Resources r3 = r19.getResources()     // Catch:{ all -> 0x066b }
            r4 = 2131165370(0x7f0700ba, float:1.7944955E38)
            java.lang.String r3 = r3.getString(r4)     // Catch:{ all -> 0x066b }
            r4 = 0
            java.lang.String r4 = r2.getString(r4)     // Catch:{ all -> 0x066b }
            boolean r5 = com.pccw.mobile.util.StringUtil.isNotEmpty(r4)     // Catch:{ all -> 0x066b }
            if (r5 == 0) goto L_0x0624
            java.lang.String r5 = "title"
            r1.put(r5, r3)     // Catch:{ all -> 0x066b }
            java.lang.String r3 = "contant"
            r1.put(r3, r4)     // Catch:{ all -> 0x066b }
            java.lang.String r3 = "type"
            java.lang.String r4 = "birthday"
            r1.put(r3, r4)     // Catch:{ all -> 0x066b }
            r0 = r19
            java.util.List<java.util.Map<java.lang.String, java.lang.Object>> r3 = r0.contactDetails     // Catch:{ all -> 0x066b }
            r3.add(r1)     // Catch:{ all -> 0x066b }
        L_0x0624:
            boolean r1 = r2.moveToNext()     // Catch:{ all -> 0x066b }
            if (r1 != 0) goto L_0x05f1
        L_0x062a:
            if (r2 == 0) goto L_0x062f
            r2.close()     // Catch:{ all -> 0x0665 }
        L_0x062f:
            if (r14 == 0) goto L_0x0634
            r14.close()
        L_0x0634:
            if (r13 == 0) goto L_0x0639
            r13.close()
        L_0x0639:
            if (r12 == 0) goto L_0x063e
            r12.close()
        L_0x063e:
            if (r11 == 0) goto L_0x0643
            r11.close()
        L_0x0643:
            if (r10 == 0) goto L_0x0648
            r10.close()
        L_0x0648:
            if (r9 == 0) goto L_0x064d
            r9.close()
        L_0x064d:
            if (r8 == 0) goto L_0x0652
            r8.close()
        L_0x0652:
            if (r7 == 0) goto L_0x0657
            r7.close()
        L_0x0657:
            if (r17 == 0) goto L_0x065c
            r17.close()
        L_0x065c:
            return
        L_0x065d:
            r1 = move-exception
            r2 = r15
        L_0x065f:
            if (r2 == 0) goto L_0x0664
            r2.close()     // Catch:{ all -> 0x0665 }
        L_0x0664:
            throw r1     // Catch:{ all -> 0x0665 }
        L_0x0665:
            r1 = move-exception
            r2 = r1
            r3 = r9
            r4 = r12
            goto L_0x025d
        L_0x066b:
            r1 = move-exception
            goto L_0x065f
        L_0x066d:
            r1 = move-exception
            r2 = r1
            r14 = r9
            r3 = r15
            r13 = r12
            r4 = r16
            goto L_0x025d
        L_0x0676:
            r1 = move-exception
            r2 = r1
            r3 = r15
            r4 = r12
            goto L_0x025d
        L_0x067c:
            r2 = move-exception
            r7 = r1
            r3 = r9
            r4 = r12
            goto L_0x025d
        L_0x0682:
            r7 = r1
            goto L_0x05c8
        L_0x0685:
            r7 = r1
            r8 = r2
            r9 = r3
            r10 = r4
            r11 = r5
            r12 = r6
            goto L_0x05c8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.pccw.mobile.sip.ContactDetailsActivity.getAllInfo():void");
    }

    /* access modifiers changed from: private */
    public void pasteNumberToDialer(String str) {
        if (str == null) {
            str = this.targerNumber;
        }
        startActivity(IntentUtils.genDialScreenIntent(str, this));
    }

    private String pretreatment(String str) {
        String trimSymbol = SMSNumberUtil.trimSymbol(str);
        if (SMSNumberUtil.isValidRecipient(trimSymbol)) {
            return SMSNumberUtil.trimSymbol(trimSymbol);
        }
        this.smsTypesList.add(new SMSType(trimSymbol, "na"));
        return "NotMatch";
    }

    /* access modifiers changed from: private */
    public void promptDialog(EnumKKDialogType enumKKDialogType) {
        new KKDialogProvider(new KKDialogBuilder(), this).requestDialog(enumKKDialogType, this).show();
    }

    /* access modifiers changed from: private */
    public void promptDialogWithArguments(EnumKKDialogType enumKKDialogType, Bundle bundle) {
        KKDialog requestDialog = new KKDialogProvider(new KKDialogBuilder(), this).requestDialog(enumKKDialogType, this);
        requestDialog.setArguments(bundle);
        requestDialog.show();
    }

    @TargetApi(14)
    private Bitmap retrieveContactPhoto(String str) {
        try {
            InputStream openContactPhotoInputStream = Build.VERSION.SDK_INT >= 14 ? ContactsContract.Contacts.openContactPhotoInputStream(getContentResolver(), ContentUris.withAppendedId(ContactsContract.Contacts.CONTENT_URI, Long.valueOf(str).longValue()), true) : ContactsContract.Contacts.openContactPhotoInputStream(getContentResolver(), ContentUris.withAppendedId(ContactsContract.Contacts.CONTENT_URI, Long.valueOf(str).longValue()));
            if (openContactPhotoInputStream == null) {
                return null;
            }
            Bitmap decodeStream = BitmapFactory.decodeStream(openContactPhotoInputStream);
            openContactPhotoInputStream.close();
            return decodeStream;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    /* access modifiers changed from: private */
    public void startNewChatActivity(String str) {
        Intent intent = new Intent(this, NewSMSActivity.class);
        Bundle bundle = new Bundle();
        bundle.putStringArray("numbers", new String[]{str});
        intent.putExtras(bundle);
        startActivity(intent);
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
                startNewChatActivity(SMSNumberUtil.formatNumber(kKDialog.getArguments().getString(DBHelper.NUMBER)));
                return;
            case AlertKKisOffDialog:
                startActivity(IntentUtils.genDialScreenIntent("", getApplicationContext()));
                return;
            default:
                return;
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        this.contactId = intent.getStringExtra("contactId");
        this.contactName = intent.getStringExtra("contactName");
        this.actionBar = getSupportActionBar();
        this.actionBar.setDisplayHomeAsUpEnabled(true);
        this.actionBar.setDisplayOptions(16, 16);
        View inflate = LayoutInflater.from(this).inflate(R.layout.actionbar_custom_childpages, new LinearLayout(this), false);
        this.title = (TextView) inflate.findViewById(2131624003);
        this.title.setText(this.contactName);
        this.actionBar.setCustomView(inflate);
        setContentView((int) R.layout.contact_details);
        this.contactPositionView = (TextView) findViewById(R.id.contact_position);
        this.contactCompanyView = (TextView) findViewById(R.id.contact_company);
        this.conversationParticipantItemService = new ConversationParticipantItemService(this);
        this.contactPhoto = (ImageView) findViewById(R.id.contact_photo);
        this.mPhoneList = (ListView) findViewById(R.id.phone_list);
        this.contactDetails = new ArrayList();
        this.msisdnlistString = "";
        getAllInfo();
        this.contactDetailsAdapter = new ContactDetailsListViewAdapter(this, this.contactDetails, R.layout.contact_details_list_item, (String[]) null, (int[]) null);
        this.mPhoneList.setAdapter(this.contactDetailsAdapter);
    }

    public CharSequence onCreateDescription() {
        return super.onCreateDescription();
    }

    public Loader<Cursor> onCreateLoader(int i, Bundle bundle) {
        switch (i) {
            case 2:
                return new CursorLoader(this, ContactsContract.CommonDataKinds.Phone.CONTENT_URI, ContactPhoneNumberQuery.PROJECTION, "contact_id =  '" + this.contactId + "'", (String[]) null, (String) null);
            default:
                return null;
        }
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.contact_detail_menu, menu);
        menu.findItem(R.id.action_edit_contact).setVisible(false);
        return super.onCreateOptionsMenu(menu);
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
    }

    public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
        switch (loader.getId()) {
            case 0:
            case 2:
                if (cursor.getCount() > 0) {
                    cursor.moveToFirst();
                    this.lookUpKey = cursor.getString(4);
                    this.title.setText(cursor.getString(5));
                    return;
                }
                return;
            default:
                return;
        }
    }

    public void onLoaderReset(Loader<Cursor> loader) {
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 16908332:
                NavUtils.navigateUpFromSameTask(this);
                return true;
            case R.id.action_edit_contact /*2131624457*/:
                editContact();
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        getSupportLoaderManager().initLoader(2, (Bundle) null, this);
        Bitmap largeContactPhoto = UserPhotoUtil.getLargeContactPhoto(this, this.contactId);
        if (largeContactPhoto != null) {
            this.contactPhoto.setImageBitmap(largeContactPhoto);
        }
        super.onResume();
    }
}
