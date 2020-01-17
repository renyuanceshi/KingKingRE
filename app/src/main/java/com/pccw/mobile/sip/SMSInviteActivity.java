package com.pccw.mobile.sip;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.support.v4.app.DialogFragment;
import android.telephony.PhoneNumberUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ExpandableListView;
import android.widget.SimpleCursorTreeAdapter;
import android.widget.TextView;
import com.facebook.share.internal.ShareConstants;
import com.pccw.mobile.sip.AddCallContactFragment;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.MobileNumberUtil;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParserFactory;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public class SMSInviteActivity extends DialogFragment {
    private static final String LOCATE_EN_US = "en_US";
    private static final String LOCATE_ZH_TW = "zh_TW";
    private static final String TAG = "SMSInvite";
    /* access modifiers changed from: private */
    public static AlertDialog noWiFiDialog;
    /* access modifiers changed from: private */
    public static AlertDialog smsInviteResultDialog;
    private String Locate;
    private View containView;
    private String displayMessage = null;
    /* access modifiers changed from: private */
    public boolean isSendingSMS = false;
    /* access modifiers changed from: private */
    public boolean isShowingSMSConfirmDialog = false;
    private ExpandableListView list;
    /* access modifiers changed from: private */
    public ArrayList<Cursor> mChildCursors = new ArrayList<>();
    private Cursor mGroupCursor = null;
    private ContactAdapter mcontactAdapter;

    private class ContactAdapter extends SimpleCursorTreeAdapter {
        public ContactAdapter(Context context, Cursor cursor, int i, String[] strArr, int[] iArr, int i2, String[] strArr2, int[] iArr2) {
            super(context, cursor, i, strArr, iArr, i2, strArr2, iArr2);
        }

        /* access modifiers changed from: protected */
        public void bindChildView(View view, Context context, Cursor cursor, boolean z) {
            final String string = cursor.getString(1);
            PhoneNumberUtils.formatNumber(PhoneNumberUtils.extractNetworkPortion(PhoneNumberUtils.convertKeypadLettersToDigits(string)));
            ((TextView) view.findViewById(R.id.number)).setText(string);
            TextView textView = (TextView) view.findViewById(2131624190);
            if (cursor.getInt(2) != 0 || cursor.getString(3) == null) {
                textView.setText(SMSInviteActivity.this.getString(ContactsContract.CommonDataKinds.Phone.getTypeLabelResource(cursor.getInt(2))));
            } else {
                textView.setText(cursor.getString(3));
            }
            view.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    if (SMSInviteActivity.this.isNativeMobileNumber(string)) {
                        String access$100 = SMSInviteActivity.this.editNumber(string);
                        if (!SMSInviteActivity.this.isShowingSMSConfirmDialog) {
                            SMSInviteActivity.this.showSMSConfirmDialog(access$100);
                            return;
                        }
                        return;
                    }
                    SMSInviteActivity.this.showNotNativeNumberDialog();
                }
            });
        }

        /* access modifiers changed from: protected */
        public void bindGroupView(View view, Context context, Cursor cursor, boolean z) {
            super.bindGroupView(view, context, cursor, z);
        }

        /* access modifiers changed from: protected */
        public Cursor getChildrenCursor(Cursor cursor) {
            String string = cursor.getString(cursor.getColumnIndexOrThrow("_id"));
            Cursor query = SMSInviteActivity.this.getActivity().getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[]{"_id", "data1", "data2", "data3"}, "contact_id=?", new String[]{string}, (String) null);
            query.moveToFirst();
            synchronized (SMSInviteActivity.this.mChildCursors) {
                if (!SMSInviteActivity.this.mChildCursors.contains(query) && query != null) {
                    SMSInviteActivity.this.mChildCursors.add(query);
                }
            }
            return query;
        }
    }

    /* access modifiers changed from: private */
    public String editNumber(String str) {
        String replaceAll = str.replaceAll("-", "").replaceAll(StringUtils.SPACE, "");
        return replaceAll.startsWith("1964") ? replaceAll.substring(4) : replaceAll.startsWith("19156") ? replaceAll.substring(5) : replaceAll.startsWith("133") ? replaceAll.substring(3) : replaceAll.startsWith("1357") ? replaceAll.substring(4) : replaceAll.startsWith("+852") ? replaceAll.substring(4) : replaceAll;
    }

    /* access modifiers changed from: private */
    public boolean isNativeMobileNumber(String str) {
        String replaceAll = str.replaceAll("-", "").replaceAll(StringUtils.SPACE, "");
        if (replaceAll.startsWith("1964")) {
            replaceAll = replaceAll.substring(4);
        } else if (replaceAll.startsWith("19156")) {
            replaceAll = replaceAll.substring(5);
        } else if (replaceAll.startsWith("133")) {
            replaceAll = replaceAll.substring(3);
        } else if (replaceAll.startsWith("1357")) {
            replaceAll = replaceAll.substring(4);
        } else if (replaceAll.startsWith("+852")) {
            replaceAll = replaceAll.substring(4);
        }
        return MobileNumberUtil.isHKMobileNumberStart(replaceAll);
    }

    public static SMSInviteActivity newInstance(int i) {
        SMSInviteActivity sMSInviteActivity = new SMSInviteActivity();
        Bundle bundle = new Bundle();
        bundle.putInt(ShareConstants.WEB_DIALOG_PARAM_TITLE, i);
        sMSInviteActivity.setArguments(bundle);
        return sMSInviteActivity;
    }

    private boolean readXml() {
        try {
            URL url = this.Locate.equals(LOCATE_ZH_TW) ? new URL(Constants.SMS_INVITE_ZH_URL) : new URL(Constants.SMS_INVITE_EN_URL);
            XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            SMSInviteXmlHandler sMSInviteXmlHandler = new SMSInviteXmlHandler();
            xMLReader.setContentHandler(sMSInviteXmlHandler);
            xMLReader.parse(new InputSource(url.openStream()));
            this.displayMessage = sMSInviteXmlHandler.response().message;
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /* access modifiers changed from: private */
    public void showNoWifiDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setMessage(getActivity().getString(R.string.ask_wifi)).setCancelable(false).setNeutralButton(getActivity().getString(17039360), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }
        }).setPositiveButton(getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                SMSInviteActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
            }
        });
        noWiFiDialog = builder.create();
        noWiFiDialog.show();
    }

    /* access modifiers changed from: private */
    public void showNotNativeNumberDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setTitle(getActivity().getString(R.string.error_dialog_title));
        builder.setMessage(R.string.sms_not_native_num_dialog_message);
        builder.setPositiveButton(R.string.sms_confirm_dialog_ok, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        });
        builder.create().show();
    }

    /* access modifiers changed from: private */
    public void showSMSConfirmDialog(final String str) {
        this.isShowingSMSConfirmDialog = true;
        if (!readXml()) {
            showXmlErrorDialog();
            this.isShowingSMSConfirmDialog = false;
            return;
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setTitle(2131165290);
        builder.setIcon(R.drawable.ic_logo);
        builder.setMessage(getString(R.string.sms_confirm_dialog_message) + str + "?\n\n" + this.displayMessage + "\n\n" + getString(R.string.sms_confirm_dialog_remark));
        builder.setPositiveButton(R.string.sms_confirm_dialog_ok, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                if (!SMSInviteActivity.this.isSendingSMS) {
                    boolean unused = SMSInviteActivity.this.isSendingSMS = true;
                    if (SMSInviteActivity.noWiFiDialog != null && SMSInviteActivity.noWiFiDialog.isShowing()) {
                        SMSInviteActivity.noWiFiDialog.cancel();
                    }
                    if (MobileSipService.getInstance().isNetworkAvailable(SMSInviteActivity.this.getActivity())) {
                        AlertDialog unused2 = SMSInviteActivity.smsInviteResultDialog = (AlertDialog) SMSInviteActivity.this.showSMSInviteResultDialog(SMSInviteActivity.this.sendSMS(str));
                        SMSInviteActivity.smsInviteResultDialog.show();
                    } else if (SMSInviteActivity.noWiFiDialog != null) {
                        SMSInviteActivity.noWiFiDialog.show();
                    } else {
                        SMSInviteActivity.this.showNoWifiDialog();
                    }
                }
                boolean unused3 = SMSInviteActivity.this.isShowingSMSConfirmDialog = false;
                SMSInviteActivity.this.dismiss();
            }
        });
        builder.setNegativeButton(R.string.sms_confirm_dialog_cancel, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                boolean unused = SMSInviteActivity.this.isShowingSMSConfirmDialog = false;
            }
        });
        builder.create().show();
    }

    private void showXmlErrorDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setTitle(R.string.error_dialog_title);
        builder.setMessage(R.string.retrive_sms_xml_error);
        builder.setPositiveButton(R.string.sms_confirm_dialog_ok, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        });
        builder.create().show();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.containView = getActivity().getLayoutInflater().inflate(R.layout.sms_invite_contacts_list, (ViewGroup) null);
        this.list = (ExpandableListView) this.containView.findViewById(R.id.smsExpandableList);
        this.mcontactAdapter = new ContactAdapter(getActivity(), this.mGroupCursor, R.layout.sms_invite_contacts_list_group, new String[]{"display_name"}, new int[]{2131624151}, R.layout.sms_invite_contacts_list_item, new String[0], new int[0]);
        this.list.setAdapter(this.mcontactAdapter);
        return new AlertDialog.Builder(getActivity()).setTitle(R.string.sms_select_contact_dialog_title).setNegativeButton(R.string.sms_select_contact_dialog_cancel, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        }).setView(this.containView).create();
    }

    public void onDestroy() {
        super.onDestroy();
    }

    public void onResume() {
        if (Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.CHINESE)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.CHINA)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.PRC)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.SIMPLIFIED_CHINESE)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.TAIWAN)) || Locale.getDefault().getDisplayLanguage().equals(Locale.getDefault().getDisplayLanguage(Locale.TRADITIONAL_CHINESE))) {
            this.Locate = LOCATE_ZH_TW;
        } else {
            this.Locate = LOCATE_EN_US;
        }
        if (this.mGroupCursor != null) {
            this.mGroupCursor.close();
        }
        this.mGroupCursor = getActivity().getContentResolver().query(ContactsContract.Contacts.CONTENT_URI, new String[]{"_id", "display_name"}, AddCallContactFragment.ContactAllQuery.SELECTION, (String[]) null, "display_name");
        this.mcontactAdapter = new ContactAdapter(getActivity(), this.mGroupCursor, R.layout.sms_invite_contacts_list_group, new String[]{"display_name"}, new int[]{2131624151}, R.layout.sms_invite_contacts_list_item, new String[0], new int[0]);
        this.list.setAdapter(this.mcontactAdapter);
        super.onResume();
    }

    public boolean sendSMS(String str) {
        String str2;
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost(Constants.SMS_INVITE_API_URL);
        try {
            String registeredNumber = ClientStateManager.isRegisteredPrepaid(getActivity()) ? ClientStateManager.getRegisteredNumber(getActivity()) : ClientStateManager.obtainImsi(getActivity());
            ArrayList arrayList = new ArrayList(3);
            arrayList.add(new BasicNameValuePair("sender", registeredNumber));
            arrayList.add(new BasicNameValuePair("receiver", str));
            arrayList.add(new BasicNameValuePair("lang", this.Locate));
            httpPost.setEntity(new UrlEncodedFormEntity((List<? extends NameValuePair>) arrayList));
            HttpResponse execute = defaultHttpClient.execute(httpPost);
            try {
                XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
                SMSInviteXmlHandler sMSInviteXmlHandler = new SMSInviteXmlHandler();
                xMLReader.setContentHandler(sMSInviteXmlHandler);
                xMLReader.parse(new InputSource(execute.getEntity().getContent()));
                str2 = sMSInviteXmlHandler.response().resultcode;
            } catch (ParserConfigurationException e) {
                e.printStackTrace();
                str2 = null;
            } catch (SAXException e2) {
                e2.printStackTrace();
                str2 = null;
            }
            if (str2 != null) {
                if (str2.equals("0")) {
                    return true;
                }
            }
        } catch (ClientProtocolException e3) {
            e3.printStackTrace();
        } catch (IOException e4) {
            e4.printStackTrace();
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public Dialog showSMSInviteResultDialog(boolean z) {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        if (z) {
            builder.setIcon(R.drawable.ic_logo);
            builder.setTitle(getActivity().getString(2131165290));
            builder.setMessage(getActivity().getString(R.string.sms_invite_success));
        } else {
            builder.setTitle(getActivity().getString(R.string.error_dialog_title));
            builder.setMessage(getActivity().getString(R.string.sms_invite_error));
        }
        builder.setNeutralButton(getActivity().getString(R.string.sms_confirm_dialog_ok), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                boolean unused = SMSInviteActivity.this.isSendingSMS = false;
            }
        });
        return builder.create();
    }
}
