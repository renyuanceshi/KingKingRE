package com.pccw.sms;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.support.v7.app.ActionBar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import com.pccw.database.entity.GroupMember;
import com.pccw.database.helper.DBHelper;
import com.pccw.dialog.EnumKKDialogType;
import com.pccw.dialog.KKDialog;
import com.pccw.dialog.KKDialogBuilder;
import com.pccw.dialog.KKDialogProvider;
import com.pccw.dialog.listener.IKKDialogOnClickListener;
import com.pccw.mobile.sip.BaseActionBarActivity;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.SMSType;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.IntentUtils;
import com.pccw.mobile.sip.util.NetworkUtils;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.sms.helper.ContactsHelper;
import com.pccw.mobile.util.BitmapUtil;
import com.pccw.mobile.util.StringUtil;
import com.pccw.sms.adapter.GroupInfoParticipantAdapter;
import com.pccw.sms.bean.GroupInfoLayout;
import com.pccw.sms.service.listener.ICheckSMSTypeServiceListener;
import com.pccw.sms.util.SMSNumberUtil;
import java.util.ArrayList;
import java.util.List;

public class GroupInfoActivity extends BaseActionBarActivity implements AdapterView.OnItemClickListener, IKKDialogOnClickListener {
    static final int EDIT_GROUP_INFO_FAIL = 3012;
    static final int EDIT_GROUP_INFO_SUCCESS = 3011;
    static final int MAX_GROUP_PARTICIPANT_NUMBER = 50;
    private static String password;
    private static String userName;
    final int EDIT_GROUP_INFO = 3010;
    private String LOG_TAG = "GroupInfoActivity";
    ActionBar actionBar;
    ICheckSMSTypeServiceListener checkSMSTypeServiceListener = new ICheckSMSTypeServiceListener() {
        public void onCheckFail() {
        }

        public void onCheckSuccess(List<SMSType> list) {
            if (list != null) {
                GroupInfoActivity.this.participantTypes.addAll(list);
                for (int i = 0; i < GroupInfoActivity.this.participantsView.size(); i++) {
                    ImageView imageView = (ImageView) GroupInfoActivity.this.participantsView.get(i);
                    String str = (String) imageView.getTag();
                    int i2 = 0;
                    while (true) {
                        if (i2 >= GroupInfoActivity.this.participantTypes.size()) {
                            break;
                        }
                        SMSType sMSType = (SMSType) GroupInfoActivity.this.participantTypes.get(i2);
                        if (str.equals(sMSType.msisdn)) {
                            String str2 = sMSType.type;
                            if (str2.equals("intra")) {
                                imageView.setBackgroundDrawable(GroupInfoActivity.this.getResources().getDrawable(R.drawable.btn_sms_intra));
                            } else if (str2.equals("intl")) {
                                imageView.setBackgroundDrawable(GroupInfoActivity.this.getResources().getDrawable(R.drawable.btn_sms_intnl));
                            } else if (str2.endsWith("inter")) {
                                imageView.setBackgroundDrawable(GroupInfoActivity.this.getResources().getDrawable(R.drawable.btn_sms_inter));
                            } else {
                                imageView.setVisibility(4);
                            }
                            imageView.setVisibility(0);
                        } else {
                            i2++;
                        }
                    }
                }
            }
        }
    };
    private Button editParticipant;
    GroupInfoLayout groupInfoLayout;
    private GroupParticipantAdapter groupParticipantAdapter;
    private ListView mListView;
    private Menu menu;
    MenuItem muteMenuItem;
    private AlertDialog noWiFiDialog;
    /* access modifiers changed from: private */
    public List<SMSType> participantTypes;
    private List<String> participants;
    /* access modifiers changed from: private */
    public List<ImageView> participantsView;
    private String recipient;
    private String targerNumber;

    public class GroupParticipantAdapter extends BaseAdapter {
        private int layoutID;
        private List<String> list;
        private Context mContext;
        private LayoutInflater mInflater;
        public String mThumbnailUri;

        public GroupParticipantAdapter(Context context, List<String> list2, int i, String[] strArr, int[] iArr) {
            this.mInflater = LayoutInflater.from(context);
            this.list = list2;
            this.layoutID = i;
            this.mContext = context;
        }

        private Bitmap getContactImageByPhoneNumber(Context context, String str) {
            return new ContactsHelper(str, GroupInfoActivity.this.getApplicationContext()).getPhoto();
        }

        public String getContactNameByPhoneNumber(Context context, String str) {
            return new ContactsHelper(str, GroupInfoActivity.this.getApplicationContext()).getName();
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
            final String str = this.list.get(i);
            ImageView imageView = (ImageView) inflate.findViewById(R.id.participant_thumbnail);
            TextView textView = (TextView) inflate.findViewById(R.id.participant_contact_name);
            TextView textView2 = (TextView) inflate.findViewById(R.id.participant_number);
            ImageView imageView2 = (ImageView) inflate.findViewById(R.id.participant_call_btn);
            ImageView imageView3 = (ImageView) inflate.findViewById(R.id.participant_sms_type_btn);
            imageView3.setTag(str);
            if (GroupInfoActivity.this.participantsView.size() <= i) {
                GroupInfoActivity.this.participantsView.add(imageView3);
            }
            String contactNameByPhoneNumber = getContactNameByPhoneNumber(this.mContext, str);
            if (contactNameByPhoneNumber != null) {
                textView.setVisibility(0);
                textView.setText(contactNameByPhoneNumber);
            }
            textView2.setText(str);
            Bitmap contactImageByPhoneNumber = getContactImageByPhoneNumber(this.mContext, str);
            if (contactImageByPhoneNumber != null) {
                imageView.setImageBitmap(contactImageByPhoneNumber);
            } else {
                imageView.setImageResource(R.drawable.default_profile_pic);
            }
            if (SMSNumberUtil.isValidRecipient(str)) {
                imageView3.setVisibility(0);
                imageView3.setBackgroundDrawable(GroupInfoActivity.this.getResources().getDrawable(R.drawable.btn_sms_gen));
            } else {
                imageView3.setVisibility(8);
            }
            imageView3.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    if (!NetworkUtils.isWifiAvailable(GroupInfoActivity.this.getApplicationContext())) {
                        GroupInfoActivity.this.promptDialog(EnumKKDialogType.AlertNoWifiDialog);
                    } else if (!MobileSipService.getInstance().isLoginSuccress()) {
                        GroupInfoActivity.this.promptDialog(EnumKKDialogType.AlertKKisOffDialog);
                    } else if (!ClientStateManager.isNotShowSMSConsumeWarmingCheckBox(GroupInfoActivity.this.getApplicationContext())) {
                        Bundle bundle = new Bundle();
                        bundle.putStringArray("numbers", new String[]{str});
                        GroupInfoActivity.this.promptDialogWithArguments(EnumKKDialogType.AlertSMSConsumeDialog, bundle);
                    } else {
                        Intent intent = new Intent(GroupInfoActivity.this, NewSMSActivity.class);
                        Bundle bundle2 = new Bundle();
                        bundle2.putStringArray("numbers", new String[]{str});
                        intent.putExtras(bundle2);
                        GroupInfoActivity.this.startActivity(intent);
                    }
                }
            });
            imageView2.setImageResource(R.drawable.selector_contact_call_with_native_button);
            imageView2.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    GroupInfoActivity.this.pasteNumberToDialer(str);
                }
            });
            return inflate;
        }
    }

    private void call(String str) {
        if (str == null) {
            str = this.targerNumber;
        }
        MobileSipService.getInstance().call(str, this, false);
    }

    private void createFailToast(String str) {
        Toast.makeText(this, str, 0).show();
    }

    private void getViews() {
        this.mListView = (ListView) findViewById(R.id.listview_participants);
        this.editParticipant = (Button) findViewById(R.id.edit_participant);
        this.participants = new ArrayList();
        final String[] split = this.recipient.split(";");
        for (String add : split) {
            this.participants.add(add);
        }
        this.groupParticipantAdapter = new GroupParticipantAdapter(this, this.participants, R.layout.group_participant_detail_list_item, (String[]) null, (int[]) null);
        this.mListView.setAdapter(this.groupParticipantAdapter);
        this.editParticipant.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                if (!NetworkUtils.isWifiAvailable(GroupInfoActivity.this.getApplicationContext())) {
                    GroupInfoActivity.this.promptDialog(EnumKKDialogType.AlertNoWifiDialog);
                } else if (!MobileSipService.getInstance().isLoginSuccress()) {
                    GroupInfoActivity.this.promptDialog(EnumKKDialogType.AlertKKisOffDialog);
                } else {
                    Intent intent = new Intent(GroupInfoActivity.this, NewSMSActivity.class);
                    Bundle bundle = new Bundle();
                    bundle.putStringArray("numbers", split);
                    bundle.putBoolean("isComeFromEditParticipant", true);
                    intent.putExtras(bundle);
                    GroupInfoActivity.this.startActivity(intent);
                }
            }
        });
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

    /* access modifiers changed from: private */
    public void pasteNumberToDialer(String str) {
        if (str == null) {
            str = this.targerNumber;
        }
        startActivity(IntentUtils.genDialScreenIntent(str, this));
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

    /* access modifiers changed from: protected */
    public void onActivityResult(int i, int i2, Intent intent) {
        Log.d(this.LOG_TAG, "-onActivityResult");
        super.onActivityResult(i, i2, intent);
        if (i == 3010 && i2 == EDIT_GROUP_INFO_SUCCESS) {
            String unicodeUnescape = StringUtil.unicodeUnescape(intent.getStringExtra("newGroupName"));
            String stringExtra = intent.getStringExtra("picturePath");
            if (unicodeUnescape == null || !unicodeUnescape.equals("")) {
            }
            if (stringExtra != null && !stringExtra.equals("")) {
                BitmapUtil.getExternalImageThumbnail(stringExtra);
                Log.i("getGroupIcon", "try updating group icon from API");
            }
        }
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
                Intent intent = new Intent(this, NewSMSActivity.class);
                intent.putExtras(kKDialog.getArguments());
                startActivity(intent);
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
        this.recipient = getIntent().getStringExtra("recipient");
        Log.v(this.LOG_TAG, "GroupInfoActivity: onCreate(), recipient=" + this.recipient);
        this.actionBar = getSupportActionBar();
        this.actionBar.setDisplayHomeAsUpEnabled(true);
        this.actionBar.setDisplayOptions(16, 16);
        View inflate = LayoutInflater.from(this).inflate(R.layout.actionbar_custom_childpages, new LinearLayout(this), false);
        ((TextView) inflate.findViewById(2131624003)).setText(getResources().getString(R.string.chat_group_profile_actionbar_back_button_caption));
        this.actionBar.setCustomView(inflate);
        setContentView((int) R.layout.activity_groupinfo);
        this.participantsView = new ArrayList();
        this.participantTypes = new ArrayList();
        getViews();
    }

    /* access modifiers changed from: protected */
    public Dialog onCreateNoNetworkDialog(Context context) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage(context.getString(R.string.ask_wifi)).setCancelable(false).setNeutralButton(context.getString(17039360), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }
        }).setPositiveButton(getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                GroupInfoActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
            }
        });
        return builder.create();
    }

    public boolean onCreateOptionsMenu(Menu menu2) {
        super.onCreateOptionsMenu(menu2);
        this.menu = menu2;
        return true;
    }

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        GroupInfoParticipantAdapter<GroupMember> listAdapter = this.groupInfoLayout.getListAdapter();
        if (listAdapter != null) {
            GroupMember groupMember = (GroupMember) listAdapter.getItem(i);
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 16908332:
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
    }
}
