package com.pccw.mobile.sip;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v4.app.LoaderManager;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.support.v7.app.ActionBar;
import android.telephony.PhoneNumberUtils;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.provider.KingKingContentProvider;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.IntentUtils;
import com.pccw.mobile.sip.util.NumberMappingUtil;
import com.pccw.mobile.sip.util.RelativeDateUtils;
import com.pccw.mobile.sip02.R;
import com.pccw.sms.service.ConversationParticipantItemService;
import java.util.Locale;
import org.linphone.CallerInfo;

public class CallLogGroupedActivity extends BaseActionBarActivity implements LoaderManager.LoaderCallbacks<Cursor> {
    private static final int FORMATTING_TYPE_INVALID = -1;
    private static final String SHOW_IDD_CHARGE_MESSAGE = "SHOW_IDD_CHARGE_MESSAGE";
    private static int sFormattingType = -1;
    ActionBar actionBar;
    private String contactName;
    private TextView contactNameView;
    private String contactNumber;
    private Bitmap contactPhoto;
    private ImageView contactPhotoView;
    ConversationParticipantItemService conversationParticipantItemService;
    private boolean hasContact = false;
    ListView mCalllogList;
    private CalllogListCursorAdapter mCalllogListCursorAdapter;
    LoaderManager mLoaderManager;
    private String targetNumber;

    public static final class CallLogGroupedItemViews {
        ImageView callTypeImageView;
        TextView callTypeTextView;
        TextView dateView;
        TextView numberTypeView;
        TextView numberView;
    }

    public class CalllogListCursorAdapter extends CursorAdapter {
        public CalllogListCursorAdapter(Context context, Cursor cursor, boolean z) {
            super(context, cursor, z);
        }

        public void bindView(View view, Context context, Cursor cursor) {
            CallLogGroupedItemViews callLogGroupedItemViews = (CallLogGroupedItemViews) view.getTag();
            final String string = cursor.getString(1);
            String string2 = cursor.getString(7);
            Log.v("KKIM", "bindView number=" + string);
            callLogGroupedItemViews.numberView.setText(CallLogGroupedActivity.this.formatPhoneNumber(string));
            callLogGroupedItemViews.numberTypeView.setText(string2);
            view.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    if (!string.equals(CallerInfo.PRIVATE_NUMBER) && !string.equals(CallerInfo.UNKNOWN_NUMBER)) {
                        CallLogGroupedActivity.this.pasteNumberToDialer(string);
                    }
                }
            });
            callLogGroupedItemViews.dateView.setText(RelativeDateUtils.getRelativeTimeSpanString(context, cursor.getLong(2), System.currentTimeMillis(), 60000, 262144));
            CallLogGroupedActivity.this.setCallTypeLabel(callLogGroupedItemViews, cursor.getInt(4));
        }

        public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
            View inflate = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.calllog_grouped_item, viewGroup, false);
            CallLogGroupedItemViews callLogGroupedItemViews = new CallLogGroupedItemViews();
            callLogGroupedItemViews.callTypeTextView = (TextView) inflate.findViewById(R.id.calllog_grouped_call_type_text);
            callLogGroupedItemViews.numberView = (TextView) inflate.findViewById(R.id.calllog_grouped_number);
            callLogGroupedItemViews.numberTypeView = (TextView) inflate.findViewById(R.id.calllog_grouped_number_type);
            callLogGroupedItemViews.dateView = (TextView) inflate.findViewById(R.id.calllog_grouped_date);
            callLogGroupedItemViews.callTypeImageView = (ImageView) inflate.findViewById(R.id.calllog_grouped_call_type_icon);
            inflate.setTag(callLogGroupedItemViews);
            return inflate;
        }
    }

    public interface QueryByName {
        public static final int CACHED_NAME = 5;
        public static final int CACHED_NUMBER_LABEL = 7;
        public static final int CACHED_NUMBER_TYPE = 6;
        public static final int DATE = 2;
        public static final int DURATION = 3;
        public static final int ID = 0;
        public static final int NUMBER = 1;
        public static final String[] PROJECTION = {"_id", DBHelper.NUMBER, DBHelper.DATE, "duration", "type", "name", DBHelper.CACHED_NUMBER_TYPE, DBHelper.CACHED_NUMBER_LABEL};
        public static final int QUERY_ID = 0;
        public static final String SELECTION = "name = ?";
        public static final String SORT_ORDER = "date DESC";
        public static final int TYPE = 4;
        public static final Uri URI = KingKingContentProvider.CALL_LOG_URI;
    }

    public interface QueryByNumber {
        public static final int CACHED_NAME = 5;
        public static final int CACHED_NUMBER_LABEL = 7;
        public static final int CACHED_NUMBER_TYPE = 6;
        public static final int DATE = 2;
        public static final int DURATION = 3;
        public static final int ID = 0;
        public static final int NUMBER = 1;
        public static final String[] PROJECTION = {"_id", DBHelper.NUMBER, DBHelper.DATE, "duration", "type", "name", DBHelper.CACHED_NUMBER_TYPE, DBHelper.CACHED_NUMBER_LABEL};
        public static final int QUERY_ID = 1;
        public static final String SELECTION = "number = ?";
        public static final String SORT_ORDER = "date DESC";
        public static final int TYPE = 4;
        public static final Uri URI = KingKingContentProvider.CALL_LOG_URI;
    }

    /* access modifiers changed from: private */
    public void call(String str) {
        if (str == null) {
            str = this.targetNumber;
        }
        MobileSipService.getInstance().call(str, this, false);
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
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        spannableStringBuilder.append(extractNetworkPortion);
        PhoneNumberUtils.formatNumber(spannableStringBuilder, sFormattingType);
        return spannableStringBuilder.toString();
    }

    @Deprecated
    private void makeVoiceCall(String str) {
        if (MobileSipService.getInstance().loginStatus == 0) {
            String str2 = PhoneNumberUtils.stripSeparators(str).toString();
            if (!MobileSipService.getInstance().startCallChecking(str2, this)) {
                return;
            }
            if (!NumberMappingUtil.hasIDDPrefix(str2, getApplicationContext()) || !PreferenceManager.getDefaultSharedPreferences(getApplicationContext()).getBoolean(SHOW_IDD_CHARGE_MESSAGE, true)) {
                call(str2);
                return;
            }
            try {
                this.targetNumber = str2;
                final CheckBox checkBox = new CheckBox(getApplicationContext());
                checkBox.setChecked(false);
                checkBox.setText(R.string.do_not_show_this_again);
                new AlertDialog.Builder(getApplicationContext()).setIcon(R.drawable.ic_logo).setTitle(2131165290).setMessage(R.string.idd_charge_message).setView(checkBox).setNegativeButton(17039360, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.cancel();
                    }
                }).setPositiveButton(17039370, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        if (checkBox.isChecked()) {
                            PreferenceManager.getDefaultSharedPreferences(CallLogGroupedActivity.this.getApplicationContext()).edit().putBoolean(CallLogGroupedActivity.SHOW_IDD_CHARGE_MESSAGE, false).commit();
                        }
                        dialogInterface.cancel();
                        CallLogGroupedActivity.this.call((String) null);
                    }
                }).show();
            } catch (Exception e) {
            }
        } else {
            Intent intent = new Intent("android.intent.action.CALL");
            intent.setData(Uri.parse("tel:" + str));
            startActivity(intent);
        }
    }

    /* access modifiers changed from: private */
    public void pasteNumberToDialer(String str) {
        if (str == null) {
            str = this.targetNumber;
        }
        startActivity(IntentUtils.genDialScreenIntent(str, this));
    }

    /* access modifiers changed from: private */
    public void setCallTypeLabel(CallLogGroupedItemViews callLogGroupedItemViews, int i) {
        callLogGroupedItemViews.callTypeImageView.setVisibility(0);
        switch (i) {
            case 1:
                callLogGroupedItemViews.callTypeTextView.setText(R.string.call_log_grouped_incoming_call);
                callLogGroupedItemViews.callTypeImageView.setImageResource(R.drawable.ic_incoming_call);
                return;
            case 2:
                callLogGroupedItemViews.callTypeTextView.setText(R.string.call_log_grouped_outgoing_call);
                callLogGroupedItemViews.callTypeImageView.setImageResource(R.drawable.ic_outgoing_call);
                return;
            case 3:
                callLogGroupedItemViews.callTypeTextView.setText(R.string.call_log_grouped_missed_call);
                callLogGroupedItemViews.callTypeImageView.setImageResource(R.drawable.ic_missed_call);
                return;
            default:
                callLogGroupedItemViews.callTypeTextView.setText(R.string.call_log_grouped_unknown_call);
                callLogGroupedItemViews.callTypeImageView.setVisibility(8);
                return;
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        this.contactNumber = intent.getStringExtra("contactNumber");
        this.contactName = intent.getStringExtra("contactName");
        this.contactPhoto = (Bitmap) intent.getParcelableExtra("contactPhoto");
        Log.v("KKIM", String.format("contactNumber=%s contactName=%s, contactPhotoByte=%s", new Object[]{this.contactNumber, this.contactName, this.contactPhoto}));
        this.hasContact = this.contactName != null;
        this.actionBar = getSupportActionBar();
        this.actionBar.setDisplayHomeAsUpEnabled(true);
        this.actionBar.setTitle((int) R.string.call_log_grouped_title);
        setContentView((int) R.layout.calllog_grouped);
        this.conversationParticipantItemService = new ConversationParticipantItemService(this);
        this.contactNameView = (TextView) findViewById(R.id.calllog_grouped_contact_name);
        this.contactPhotoView = (ImageView) findViewById(R.id.calllog_grouped_profile_pic);
        this.mCalllogList = (ListView) findViewById(R.id.calllog_grouped_list);
        if (this.contactName != null) {
            this.contactNameView.setText(this.contactName);
        } else {
            this.contactNameView.setText(formatPhoneNumber(this.contactNumber));
        }
        if (this.contactPhoto != null) {
            this.contactPhotoView.setImageBitmap(this.contactPhoto);
        }
        this.mCalllogListCursorAdapter = new CalllogListCursorAdapter(this, (Cursor) null, true);
        this.mCalllogList.setAdapter(this.mCalllogListCursorAdapter);
        this.mLoaderManager = getSupportLoaderManager();
        sFormattingType = -1;
    }

    public CharSequence onCreateDescription() {
        return super.onCreateDescription();
    }

    public Loader<Cursor> onCreateLoader(int i, Bundle bundle) {
        switch (i) {
            case 0:
                return new CursorLoader(this, QueryByName.URI, QueryByName.PROJECTION, QueryByName.SELECTION, new String[]{this.contactName}, "date DESC");
            case 1:
                return new CursorLoader(this, QueryByNumber.URI, QueryByNumber.PROJECTION, QueryByNumber.SELECTION, new String[]{this.contactNumber}, "date DESC");
            default:
                return null;
        }
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
    }

    public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
        switch (loader.getId()) {
            case 0:
            case 1:
                this.mCalllogListCursorAdapter.swapCursor(cursor);
                return;
            default:
                return;
        }
    }

    public void onLoaderReset(Loader<Cursor> loader) {
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        if (this.hasContact) {
            this.mLoaderManager.restartLoader(0, (Bundle) null, this);
        } else {
            this.mLoaderManager.restartLoader(1, (Bundle) null, this);
        }
        super.onResume();
    }
}
