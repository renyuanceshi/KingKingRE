package com.pccw.mobile.sip;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.database.CursorIndexOutOfBoundsException;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.support.v4.app.ListFragment;
import android.support.v4.app.LoaderManager;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.view.MenuItemCompat;
import android.support.v4.widget.SimpleCursorAdapter;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.widget.SearchView;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.AlphabetIndexer;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.SectionIndexer;
import android.widget.TextView;
import com.pccw.android.common.widget.CenteredRadioImageButton;
import com.pccw.android.common.widget.SegmentedRadioGroup;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.UserPhotoUtil;
import com.pccw.sms.bean.ConversationParticipantItem;
import com.pccw.sms.service.ConversationParticipantItemService;
import com.pccw.sms.service.PhoneListService;
import java.util.ArrayList;
import org.linphone.LinphoneActivity;

public class ContactFragment extends ListFragment implements LoaderManager.LoaderCallbacks<Cursor> {
    public static final int EXIT_MENU_ITEM = 2;
    public static final int FIRST_MENU_ID = 1;
    @SuppressLint({"InlinedApi"})
    private static final String[] FROM_COLUMNS = {"display_name"};
    private static final String SHOW_IDD_CHARGE_MESSAGE = "SHOW_IDD_CHARGE_MESSAGE";
    /* access modifiers changed from: private */
    public Activity activity;
    CenteredRadioImageButton allTextView;
    SegmentedRadioGroup contactSelectLayout;
    ConversationParticipantItemService conversationParticipantItemService;
    /* access modifiers changed from: private */
    public Context ctx;
    private int currentQuery = 0;
    /* access modifiers changed from: private */
    public ArrayList<String> iMNumberList = new ArrayList<>();
    private InputMethodManager inputMethodManager;
    ArrayList<ConversationParticipantItem> items;
    CenteredRadioImageButton kkTextView;
    private ListView list;
    private ContactAdapter mContactAdapter;
    ListView mListView;
    /* access modifiers changed from: private */
    public SearchView searchView;
    private SyncIMUserReceiver syncIMUserReceiver = null;
    String targerNumber;

    public interface AllPhoneNumberQuery {
        public static final int ID = 0;
        public static final int LOOKUP_KEY = 2;
        public static final int NUMBER = 1;
        public static final String[] PROJECTION = {"_id", "data1", "lookup"};
        public static final int QUERY_ID = 2;
        public static final String SELECTION = "contact_id = ";
        public static final String SORT_ORDER = "data1";
        public static final Uri URI = ContactsContract.CommonDataKinds.Phone.CONTENT_URI;
    }

    private class ContactAdapter extends SimpleCursorAdapter implements SectionIndexer {
        private AlphabetIndexer mAlphabetIndexer;
        Cursor phoneCur;

        public ContactAdapter(Context context, int i, Cursor cursor, String[] strArr, int[] iArr, int i2) {
            super(context, i, cursor, strArr, iArr, i2);
            this.mAlphabetIndexer = new AlphabetIndexer(cursor, 1, context.getString(R.string.view_contacts_alphabet));
            this.mAlphabetIndexer.setCursor(cursor);
        }

        private boolean checkHasIMNumber(String str) {
            this.phoneCur = ContactFragment.this.ctx.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[]{"_id", "data1", "data2", "data3"}, "contact_id=?", new String[]{str}, (String) null);
            while (this.phoneCur.moveToNext()) {
                if (ContactFragment.this.iMNumberList.contains(PhoneListService.normalizeContactNumber(this.phoneCur.getString(this.phoneCur.getColumnIndex("data1")))) && !LinphoneActivity.isPhoneBookSyncRunning().booleanValue()) {
                    return true;
                }
            }
            this.phoneCur.close();
            return false;
        }

        private Bitmap getUserContactPhoto(Cursor cursor, String str) {
            if (Build.VERSION.SDK_INT >= 11) {
                try {
                    str = cursor.getString(cursor.getColumnIndexOrThrow("photo_thumb_uri"));
                } catch (IllegalArgumentException e) {
                    str = null;
                }
            }
            Bitmap loadContactPhotoThumbnail = str != null ? loadContactPhotoThumbnail(str) : null;
            if (loadContactPhotoThumbnail == null) {
                return null;
            }
            return UserPhotoUtil.getCircularBitmap(loadContactPhotoThumbnail, 70, 70);
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
                com.pccw.mobile.sip.ContactFragment r2 = com.pccw.mobile.sip.ContactFragment.this     // Catch:{ FileNotFoundException -> 0x0045, all -> 0x0055 }
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
            throw new UnsupportedOperationException("Method not decompiled: com.pccw.mobile.sip.ContactFragment.ContactAdapter.loadContactPhotoThumbnail(java.lang.String):android.graphics.Bitmap");
        }

        @SuppressLint({"InlinedApi"})
        public void bindView(View view, Context context, Cursor cursor) {
            final String string = cursor.getString(cursor.getColumnIndex("display_name"));
            ImageView imageView = (ImageView) view.findViewById(R.id.contact_thumbnail);
            ((TextView) view.findViewById(R.id.contact_name)).setText(string);
            final String string2 = cursor.getString(cursor.getColumnIndexOrThrow("_id"));
            ((ImageView) view.findViewById(R.id.IMUserLogo)).setVisibility(4);
            Bitmap userContactPhoto = getUserContactPhoto(cursor, string2);
            if (userContactPhoto != null) {
                imageView.setImageBitmap(userContactPhoto);
            } else {
                imageView.setImageResource(R.drawable.default_profile_pic);
            }
            view.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    Intent intent = new Intent(ContactFragment.this.activity, ContactDetailsActivity.class);
                    intent.putExtra("contactId", string2);
                    intent.putExtra("contactName", string);
                    ContactFragment.this.startActivity(intent);
                }
            });
        }

        public int getPositionForSection(int i) {
            if (getCursor() == null || this.mAlphabetIndexer == null) {
                return 0;
            }
            try {
                return this.mAlphabetIndexer.getPositionForSection(i);
            } catch (CursorIndexOutOfBoundsException e) {
                return 0;
            }
        }

        public int getSectionForPosition(int i) {
            if (getCursor() == null || this.mAlphabetIndexer == null) {
                return 0;
            }
            try {
                return this.mAlphabetIndexer.getPositionForSection(i);
            } catch (CursorIndexOutOfBoundsException e) {
                return 0;
            }
        }

        public Object[] getSections() {
            return this.mAlphabetIndexer.getSections();
        }

        public Cursor swapCursor(Cursor cursor) {
            this.mAlphabetIndexer.setCursor(cursor);
            return super.swapCursor(cursor);
        }
    }

    public interface ContactAllQuery {
        public static final int DISPLAY_NAME = 1;
        public static final int LOOKUP_KEY = 3;
        public static final int PHOTO_THUMBNAIL_URI = 2;
        public static final String[] PROJECTION = (Build.VERSION.SDK_INT >= 11 ? PROJECTION_HONEYCOMB : PROJECTION_OLD);
        public static final String[] PROJECTION_HONEYCOMB = {"_id", "display_name", "photo_thumb_uri", "lookup"};
        public static final String[] PROJECTION_OLD = {"_id", "display_name", "_id", "lookup"};
        public static final int QUERY_ID = 0;
        public static final String SELECTION_SEARCH = "display_name LIKE ?";
        public static final String SORT_ORDER = "display_name";
        public static final Uri URI = ContactsContract.Contacts.CONTENT_URI;
        public static final int _ID = 0;
    }

    public interface ContactIMQuery {
        public static final int DISPLAY_NAME = 1;
        public static final int LOOKUP_KEY = 3;
        public static final int PHOTO_THUMBNAIL_URI = 2;
        public static final String[] PROJECTION = (Build.VERSION.SDK_INT >= 11 ? PROJECTION_HONEYCOMB : PROJECTION_OLD);
        public static final String[] PROJECTION_HONEYCOMB = {"_id", "display_name", "photo_thumb_uri", "lookup"};
        public static final String[] PROJECTION_OLD = {"_id", "display_name", "_id", "lookup"};
        public static final int QUERY_ID = 1;
        public static final String SELECTION = "lookup IN ";
        public static final String SELECTION_SEARCH = "display_name LIKE ? AND lookup IN ";
        public static final String SORT_ORDER = "display_name";
        public static final Uri URI = ContactsContract.Contacts.CONTENT_URI;
        public static final int _ID = 0;
    }

    public class SyncIMUserReceiver extends BroadcastReceiver {
        public SyncIMUserReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals(Constants.INTENT_ALERT_SYNC_IMUSER_FINISH)) {
                ContactFragment.this.updateIMNumberList();
            }
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 11) {
        }
    }

    private void call(String str) {
        if (str == null) {
            str = this.targerNumber;
        }
        MobileSipService.getInstance().call(str, this.ctx, false);
    }

    private void getIMUserList() {
        this.iMNumberList = this.conversationParticipantItemService.listIMNumber();
    }

    private String getPhoneNumberLookUpKey() {
        StringBuilder sb = new StringBuilder();
        Cursor query = this.ctx.getContentResolver().query(AllPhoneNumberQuery.URI, AllPhoneNumberQuery.PROJECTION, (String) null, (String[]) null, "data1");
        query.moveToFirst();
        sb.append(" (");
        while (!query.isAfterLast()) {
            if (this.iMNumberList.contains(PhoneListService.normalizeContactNumber(query.getString(1)))) {
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

    /* access modifiers changed from: private */
    public void searchContacts(String str) {
        if (str != null) {
            Bundle bundle = new Bundle();
            bundle.putString("SEARCH_KEY", "%" + str + "%");
            switch (this.currentQuery) {
                case 0:
                    getLoaderManager().restartLoader(0, bundle, this);
                    return;
                case 1:
                    getLoaderManager().restartLoader(1, bundle, this);
                    return;
                default:
                    return;
            }
        }
    }

    /* access modifiers changed from: private */
    public void selectContactLayout(int i) {
        switch (i) {
            case 0:
                this.currentQuery = 0;
                this.contactSelectLayout.setBackgroundResource(R.drawable.contact_filter_all_background);
                this.allTextView.setTextColor(getResources().getColor(R.color.corp_blue));
                this.kkTextView.setTextColor(getResources().getColor(R.color.mid_blue));
                if (this.searchView == null || this.searchView.isIconified()) {
                    getLoaderManager().restartLoader(0, (Bundle) null, this);
                    return;
                } else {
                    searchContacts(this.searchView.getQuery().toString());
                    return;
                }
            case 1:
                this.currentQuery = 1;
                this.contactSelectLayout.setBackgroundResource(R.drawable.contact_filter_kingking_background);
                this.allTextView.setTextColor(getResources().getColor(R.color.mid_blue));
                this.kkTextView.setTextColor(getResources().getColor(R.color.corp_blue));
                if (this.searchView == null || this.searchView.isIconified()) {
                    getLoaderManager().restartLoader(1, (Bundle) null, this);
                    return;
                } else {
                    searchContacts(this.searchView.getQuery().toString());
                    return;
                }
            default:
                return;
        }
    }

    public void onActivityCreated(Bundle bundle) {
        this.list = getListView();
        this.list.setAdapter(this.mContactAdapter);
        super.onActivityCreated(bundle);
    }

    public void onCreate(Bundle bundle) {
        this.ctx = getActivity().getApplicationContext();
        this.activity = getActivity();
        setHasOptionsMenu(true);
        this.conversationParticipantItemService = new ConversationParticipantItemService(this.ctx);
        super.onCreate(bundle);
    }

    public Loader<Cursor> onCreateLoader(int i, Bundle bundle) {
        switch (i) {
            case 0:
                if (bundle == null || !bundle.containsKey("SEARCH_KEY") || bundle.getString("SEARCH_KEY").equals("")) {
                    return new CursorLoader(this.ctx, ContactAllQuery.URI, ContactAllQuery.PROJECTION, (String) null, (String[]) null, "display_name");
                }
                return new CursorLoader(this.ctx, ContactAllQuery.URI, ContactAllQuery.PROJECTION, ContactAllQuery.SELECTION_SEARCH, new String[]{bundle.getString("SEARCH_KEY")}, "display_name");
            case 1:
                String phoneNumberLookUpKey = getPhoneNumberLookUpKey();
                if (bundle == null || !bundle.containsKey("SEARCH_KEY") || bundle.getString("SEARCH_KEY").equals("")) {
                    return new CursorLoader(this.ctx, ContactIMQuery.URI, ContactIMQuery.PROJECTION, ContactIMQuery.SELECTION + phoneNumberLookUpKey, (String[]) null, "display_name");
                }
                return new CursorLoader(this.ctx, ContactIMQuery.URI, ContactIMQuery.PROJECTION, ContactIMQuery.SELECTION_SEARCH + phoneNumberLookUpKey, new String[]{bundle.getString("SEARCH_KEY")}, "display_name");
            default:
                return null;
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menuInflater.inflate(R.menu.actionbar_contacts_menu, menu);
        MenuItem findItem = menu.findItem(R.id.action_search);
        this.searchView = (SearchView) MenuItemCompat.getActionView(findItem);
        this.searchView.setQueryHint(getString(R.string.contact_search_hint));
        this.searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            public boolean onQueryTextChange(String str) {
                ContactFragment.this.searchContacts(str);
                return true;
            }

            public boolean onQueryTextSubmit(String str) {
                ContactFragment.this.searchView.clearFocus();
                return true;
            }
        });
        this.searchView.setOnCloseListener(new SearchView.OnCloseListener() {
            public boolean onClose() {
                ContactFragment.this.searchContacts("");
                return false;
            }
        });
        MenuItemCompat.setOnActionExpandListener(findItem, new MenuItemCompat.OnActionExpandListener() {
            public boolean onMenuItemActionCollapse(MenuItem menuItem) {
                ContactFragment.this.searchContacts("");
                return true;
            }

            public boolean onMenuItemActionExpand(MenuItem menuItem) {
                return true;
            }
        });
        super.onCreateOptionsMenu(menu, menuInflater);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        ActionBar supportActionBar = ((ActionBarActivity) getActivity()).getSupportActionBar();
        supportActionBar.setDisplayOptions(8, 24);
        supportActionBar.setTitle((CharSequence) getString(R.string.actionbar_tab_title_contacts));
        supportActionBar.setHomeButtonEnabled(false);
        View inflate = layoutInflater.inflate(R.layout.contacts_list, viewGroup, false);
        this.inputMethodManager = (InputMethodManager) this.ctx.getSystemService("input_method");
        this.activity.getWindow().setSoftInputMode(3);
        this.contactSelectLayout = (SegmentedRadioGroup) inflate.findViewById(R.id.contact_select_linearlayout);
        this.allTextView = (CenteredRadioImageButton) inflate.findViewById(R.id.contact_all_textview);
        this.kkTextView = (CenteredRadioImageButton) inflate.findViewById(R.id.contact_kk_textview);
        this.allTextView.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                ContactFragment.this.selectContactLayout(0);
                ContactFragment.this.allTextView.setEnabled(false);
                ContactFragment.this.kkTextView.setEnabled(true);
            }
        });
        this.kkTextView.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                ContactFragment.this.selectContactLayout(1);
                ContactFragment.this.allTextView.setEnabled(true);
                ContactFragment.this.kkTextView.setEnabled(false);
            }
        });
        return inflate;
    }

    public void onDestroy() {
        super.onDestroy();
    }

    public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
        if (cursor != null && !cursor.isClosed()) {
            switch (loader.getId()) {
                case 0:
                case 1:
                    this.mContactAdapter.changeCursor(cursor);
                    synchronized (this.mContactAdapter) {
                        this.mContactAdapter.notifyAll();
                    }
                    return;
                default:
                    return;
            }
        }
    }

    public void onLoaderReset(Loader<Cursor> loader) {
        this.mContactAdapter.changeCursor((Cursor) null);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case R.id.action_add_new /*2131624455*/:
                startActivity(new Intent("android.intent.action.INSERT", ContactsContract.Contacts.CONTENT_URI));
                break;
        }
        return this.activity.onOptionsItemSelected(menuItem);
    }

    public void onPause() {
        super.onPause();
    }

    @SuppressLint({"InlinedApi"})
    public void onResume() {
        this.activity.getWindow().setSoftInputMode(3);
        super.onResume();
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.contactSelectLayout.setVisibility(8);
        this.mContactAdapter = new ContactAdapter(this.ctx, R.layout.contacts_list_item, (Cursor) null, ContactAllQuery.PROJECTION, new int[]{2131624231}, 2);
        selectContactLayout(0);
    }

    public void registerSyncIMUserReceiver() {
        this.syncIMUserReceiver = new SyncIMUserReceiver();
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(Constants.INTENT_ALERT_SYNC_IMUSER_FINISH);
        this.ctx.registerReceiver(this.syncIMUserReceiver, intentFilter);
    }

    public void unregisterSyncIMUserReceiver() {
        if (this.syncIMUserReceiver != null) {
            this.ctx.unregisterReceiver(this.syncIMUserReceiver);
        }
    }

    public void updateIMNumberList() {
        getIMUserList();
        getLoaderManager().restartLoader(this.currentQuery == 0 ? 0 : 1, (Bundle) null, this);
    }
}
