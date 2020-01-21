package com.pccw.mobile.sip;

import android.annotation.TargetApi;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.support.v4.app.LoaderManager;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.support.v7.app.ActionBar;
import android.telephony.PhoneNumberUtils;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.util.UserPhotoUtil;
import com.pccw.sms.service.ConversationParticipantItemService;
import com.pccw.sms.service.PhoneListService;
import java.io.IOException;
import java.io.InputStream;
import org.linphone.LinphoneService;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCore;
import org.linphone.mediastream.Version;

public class AddCallContactDetailsActivity extends BaseActionBarActivity implements LoaderManager.LoaderCallbacks<Cursor> {
    private static final String SHOW_IDD_CHARGE_MESSAGE = "SHOW_IDD_CHARGE_MESSAGE";
    private static AddCallContactDetailsActivity activity;
    ActionBar actionBar;
    private String contactId;
    private String contactName;
    private ImageView contactPhoto;
    ConversationParticipantItemService conversationParticipantItemService;
    private String lookUpKey;
    ListView mPhoneList;
    private PhoneListCursorAdapter mPhoneListCursorAdapter;
    private TextView name;
    private String targerNumber;

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

    public class PhoneListCursorAdapter extends CursorAdapter {
        public PhoneListCursorAdapter(Context context, Cursor cursor, boolean z) {
            super(context, cursor, z);
        }

        public void bindView(View view, Context context, Cursor cursor) {
            TextView textView = (TextView) view.findViewById(R.id.addcall_contact_detail_item_phone_number);
            TextView textView2 = (TextView) view.findViewById(R.id.addcall_contact_detail_item_phone_type);
            TextView textView3 = (TextView) view.findViewById(R.id.addcall_contact_detail_item_im_status);
            TextView textView4 = (TextView) view.findViewById(R.id.addcall_contact_detail_item_im_last_online_time);
            ImageView imageView = (ImageView) view.findViewById(R.id.addcall_call_imgbtn);
            ImageView imageView2 = (ImageView) view.findViewById(R.id.addcall_sms_imgbtn);
            ImageView imageView3 = (ImageView) view.findViewById(R.id.addcall_contact_photo);
            LinearLayout linearLayout = (LinearLayout) view.findViewById(R.id.addcall_contact_detail_im_layout);
            final String string = cursor.getString(1);
            PhoneListService.normalizeContactNumber(string);
            PhoneNumberUtils.formatNumber(PhoneNumberUtils.extractNetworkPortion(PhoneNumberUtils.convertKeypadLettersToDigits(string)));
            if (cursor.getInt(2) != 0 || cursor.getString(3) == null) {
                textView2.setText(AddCallContactDetailsActivity.this.getString(ContactsContract.CommonDataKinds.Phone.getTypeLabelResource(cursor.getInt(2))));
            } else {
                textView2.setText(cursor.getString(3));
            }
            textView.setText(string);
            imageView.setVisibility(View.GONE);
            view.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    Uri fromParts = Uri.fromParts("tel", string, (String) null);
                    Intent intent = new Intent(AddCallContactDetailsActivity.this, AddCallActivity.class);
                    intent.setAction(Constants.INTENT_DIAL_ACTION);
                    intent.setData(fromParts);
                    AddCallContactDetailsActivity.this.startActivity(intent);
                }
            });
            linearLayout.setVisibility(View.GONE);
            imageView3.setVisibility(4);
        }

        public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
            return LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.addcall_contact_details_list_item, viewGroup, false);
        }
    }

    private void addCall(String str) {
        if (str == null) {
            str = this.targerNumber;
        }
        MobileSipService.getInstance().addCall(str, this);
    }

    private void editContact() {
        Uri lookupUri = ContactsContract.Contacts.getLookupUri(Long.parseLong(this.contactId), this.lookUpKey);
        Intent intent = new Intent("android.intent.action.EDIT");
        intent.setDataAndType(lookupUri, "vnd.android.cursor.item/contact");
        intent.putExtra("finishActivityOnSaveCompleted", true);
        startActivity(intent);
    }

    public static AddCallContactDetailsActivity getActivity() {
        if (activity == null) {
            return null;
        }
        return activity;
    }

    @TargetApi(14)
    private Bitmap retrieveContactPhoto(String str) {
        try {
            InputStream openContactPhotoInputStream = Version.sdkAboveOrEqual(14) ? ContactsContract.Contacts.openContactPhotoInputStream(getContentResolver(), ContentUris.withAppendedId(ContactsContract.Contacts.CONTENT_URI, Long.valueOf(str).longValue()), true) : ContactsContract.Contacts.openContactPhotoInputStream(getContentResolver(), ContentUris.withAppendedId(ContactsContract.Contacts.CONTENT_URI, Long.valueOf(str).longValue()));
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

    public void callState(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneCall.State state, String str) {
        try {
            if (LinphoneService.instance().getLinphoneCore().getCallsNb() != 1) {
                finish();
            }
        } catch (Exception e) {
            finish();
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
        this.actionBar.setTitle((CharSequence) getString(R.string.actionbar_tab_addcall_title_contacts));
        setContentView((int) R.layout.addcall_contact_details);
        this.conversationParticipantItemService = new ConversationParticipantItemService(this);
        this.contactPhoto = (ImageView) findViewById(R.id.addcall_contact_photo);
        this.name = (TextView) findViewById(R.id.addcall_name);
        this.mPhoneList = (ListView) findViewById(R.id.addcall_phone_list);
        this.mPhoneListCursorAdapter = new PhoneListCursorAdapter(this, (Cursor) null, true);
        this.mPhoneList.setAdapter(this.mPhoneListCursorAdapter);
        this.name.setText(this.contactName);
        activity = this;
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

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        activity = null;
    }

    public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
        switch (loader.getId()) {
            case 2:
                cursor.moveToFirst();
                this.lookUpKey = cursor.getString(4);
                this.name.setText(cursor.getString(5));
                this.mPhoneListCursorAdapter.swapCursor(cursor);
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
                finish();
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
            this.contactPhoto.setImageBitmap(UserPhotoUtil.getRectangularBitmap(largeContactPhoto, 600, 600));
        }
        super.onResume();
        try {
            if (LinphoneService.instance().getLinphoneCore().getCallsNb() != 1) {
                finish();
            }
        } catch (Exception e) {
            finish();
        }
    }
}
