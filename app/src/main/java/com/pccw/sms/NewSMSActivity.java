package com.pccw.sms;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.CursorIndexOutOfBoundsException;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.support.v4.app.LoaderManager;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.SimpleCursorAdapter;
import android.support.v7.app.ActionBar;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.AlphabetIndexer;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.SectionIndexer;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.pccw.android.common.widget.AddRecipientsScrollView;
import com.pccw.dialog.EnumKKDialogType;
import com.pccw.dialog.KKDialog;
import com.pccw.dialog.KKDialogBuilder;
import com.pccw.dialog.KKDialogProvider;
import com.pccw.dialog.listener.IKKDialogOnClickListener;
import com.pccw.exception.NoNetworkException;
import com.pccw.mobile.sip.BaseActionBarActivity;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.ContactFragment;
import com.pccw.mobile.sip.SMSType;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.IntentUtils;
import com.pccw.mobile.sip.util.NetworkUtils;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.sms.helper.ContactsHelper;
import com.pccw.mobile.sms.util.SMSProfileUtil;
import com.pccw.mobile.util.UserPhotoUtil;
import com.pccw.sms.emoji.EmojiEditText;
import com.pccw.sms.emoji.EmojiFlowLayout;
import com.pccw.sms.emoji.EmojiLinearLayout;
import com.pccw.sms.service.CheckSMSTypeService;
import com.pccw.sms.service.CreateChatService;
import com.pccw.sms.service.SendSMSService;
import com.pccw.sms.service.listener.ICheckSMSTypeServiceListener;
import com.pccw.sms.util.ConcatUtil;
import com.pccw.sms.util.SMSFormatUtil;
import com.pccw.sms.util.SMSNumberUtil;
import com.pccwmobile.common.utilities.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;

@SuppressLint({"NewApi"})
public class NewSMSActivity extends BaseActionBarActivity implements LoaderManager.LoaderCallbacks<Cursor>, IKKDialogOnClickListener {
    private static final int promptInvalidNumberDialog = 4;
    private static final int promptNotSupportUserDialog = 3;
    private static final int promptOverLengthDialog = 5;
    private static final int promptOverNumberLengthLimitDialog = 6;
    private static final int promptRemoveDialog = 2;
    String TAG = "NewSMS";
    ImageButton addBtn;
    EmojiEditText addEt;
    TextView addTextView;
    AlertDialog.Builder builder;
    TextView charCountTv;
    TextView concatCountTv;
    boolean isComeFromEditParticipant;
    EmojiLinearLayout layoutParent;
    LinearLayout layoutSecond;
    View linkView;
    ListView list;
    ContactAdapter mContactAdapter;
    int mHeight;
    int mWidth;
    InputMethodManager manager;
    /* access modifiers changed from: private */
    public Map<Integer, String> numbers = new HashMap();
    private int recipientId = 0;
    LinearLayout recipientLayout;
    AddRecipientsScrollView recipientScroll;
    TextView removeTextView;
    boolean scrollTag;
    LinearLayout searchLayout;
    ImageButton sendBtn;
    EmojiEditText sendEt;
    RelativeLayout sendLayout;
    /* access modifiers changed from: private */
    public String titleStr;
    RelativeLayout topBar;
    LinearLayout txtCont;
    EmojiFlowLayout viewGroup;

    class CheckSMSTypeServiceListener implements ICheckSMSTypeServiceListener {
        private TextView textView;

        public CheckSMSTypeServiceListener(TextView textView2) {
            this.textView = textView2;
        }

        public void onCheckFail() {
        }

        public void onCheckSuccess(List<SMSType> list) {
            Drawable drawable;
            if (list != null) {
                String str = list.get(0).type;
                if (str.equals(NewSMSActivity.this.getResources().getString(R.string.new_sms_intra))) {
                    Log.v(NewSMSActivity.this.TAG, "the number is intra");
                    drawable = NewSMSActivity.this.getResources().getDrawable(R.drawable.sms_intra);
                } else if (str.equals(NewSMSActivity.this.getResources().getString(R.string.new_sms_inter))) {
                    Log.v(NewSMSActivity.this.TAG, "the number is inter");
                    drawable = NewSMSActivity.this.getResources().getDrawable(R.drawable.sms_inter);
                } else {
                    drawable = str.equals("intl") ? NewSMSActivity.this.getResources().getDrawable(R.drawable.sms_intnl) : null;
                }
                if (drawable != null) {
                    this.textView.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, drawable, (Drawable) null);
                    return;
                }
                return;
            }
            Log.e(NewSMSActivity.this.TAG, "getSMSType return error");
            Log.v(NewSMSActivity.this.TAG, "the user is not support");
            NewSMSActivity.this.viewGroup.removeView(this.textView);
            NewSMSActivity.this.numbers.remove(Integer.valueOf(this.textView.getId()));
            if (NewSMSActivity.this.viewGroup.getChildCount() == 0) {
                NewSMSActivity.this.recipientScroll.setVisibility(8);
            }
            NewSMSActivity.this.promptDialog(3);
        }
    }

    private class ContactAdapter extends SimpleCursorAdapter implements SectionIndexer {
        private AlphabetIndexer mAlphabetIndexer;

        public ContactAdapter(Context context, int i, Cursor cursor, String[] strArr, int[] iArr, int i2) {
            super(context, i, cursor, strArr, iArr, i2);
            this.mAlphabetIndexer = new AlphabetIndexer(cursor, 1, context.getString(R.string.view_contacts_alphabet));
            this.mAlphabetIndexer.setCursor(cursor);
        }

        private Bitmap getUserContactPhoto(Cursor cursor, String str) {
            Bitmap bitmap = null;
            if (Build.VERSION.SDK_INT >= 11) {
                try {
                    str = cursor.getString(cursor.getColumnIndexOrThrow("photo_thumb_uri"));
                } catch (IllegalArgumentException e) {
                    str = null;
                }
            }
            if (str != null) {
                bitmap = loadContactPhotoThumbnail(str);
            }
            return UserPhotoUtil.getCircularBitmap(bitmap, 70, 70);
        }

        /* JADX WARNING: Removed duplicated region for block: B:33:0x0054 A[SYNTHETIC, Splitter:B:33:0x0054] */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        private android.graphics.Bitmap loadContactPhotoThumbnail(java.lang.String r4) {
            /*
                r3 = this;
                r1 = 0
                r0 = 11
                boolean r0 = org.linphone.mediastream.Version.sdkAboveOrEqual(r0)     // Catch:{ FileNotFoundException -> 0x0041, all -> 0x0051 }
                if (r0 == 0) goto L_0x0023
                android.net.Uri r0 = android.net.Uri.parse(r4)     // Catch:{ FileNotFoundException -> 0x0041, all -> 0x0051 }
            L_0x000d:
                com.pccw.sms.NewSMSActivity r2 = com.pccw.sms.NewSMSActivity.this     // Catch:{ FileNotFoundException -> 0x0041, all -> 0x0051 }
                android.content.ContentResolver r2 = r2.getContentResolver()     // Catch:{ FileNotFoundException -> 0x0041, all -> 0x0051 }
                java.io.InputStream r2 = r2.openInputStream(r0)     // Catch:{ FileNotFoundException -> 0x0041, all -> 0x0051 }
                if (r2 == 0) goto L_0x0035
                android.graphics.Bitmap r0 = android.graphics.BitmapFactory.decodeStream(r2)     // Catch:{ FileNotFoundException -> 0x0060 }
                if (r2 == 0) goto L_0x0022
                r2.close()     // Catch:{ IOException -> 0x0030 }
            L_0x0022:
                return r0
            L_0x0023:
                android.net.Uri r0 = android.provider.ContactsContract.Contacts.CONTENT_URI     // Catch:{ FileNotFoundException -> 0x0041, all -> 0x0051 }
                android.net.Uri r0 = android.net.Uri.withAppendedPath(r0, r4)     // Catch:{ FileNotFoundException -> 0x0041, all -> 0x0051 }
                java.lang.String r2 = "photo"
                android.net.Uri r0 = android.net.Uri.withAppendedPath(r0, r2)     // Catch:{ FileNotFoundException -> 0x0041, all -> 0x0051 }
                goto L_0x000d
            L_0x0030:
                r1 = move-exception
                r1.printStackTrace()
                goto L_0x0022
            L_0x0035:
                if (r2 == 0) goto L_0x003a
                r2.close()     // Catch:{ IOException -> 0x003c }
            L_0x003a:
                r0 = r1
                goto L_0x0022
            L_0x003c:
                r0 = move-exception
                r0.printStackTrace()
                goto L_0x003a
            L_0x0041:
                r0 = move-exception
                r2 = r1
            L_0x0043:
                r0.printStackTrace()     // Catch:{ all -> 0x005d }
                if (r2 == 0) goto L_0x003a
                r2.close()     // Catch:{ IOException -> 0x004c }
                goto L_0x003a
            L_0x004c:
                r0 = move-exception
                r0.printStackTrace()
                goto L_0x003a
            L_0x0051:
                r0 = move-exception
            L_0x0052:
                if (r1 == 0) goto L_0x0057
                r1.close()     // Catch:{ IOException -> 0x0058 }
            L_0x0057:
                throw r0
            L_0x0058:
                r1 = move-exception
                r1.printStackTrace()
                goto L_0x0057
            L_0x005d:
                r0 = move-exception
                r1 = r2
                goto L_0x0052
            L_0x0060:
                r0 = move-exception
                goto L_0x0043
            */
            throw new UnsupportedOperationException("Method not decompiled: com.pccw.sms.NewSMSActivity.ContactAdapter.loadContactPhotoThumbnail(java.lang.String):android.graphics.Bitmap");
        }

        @SuppressLint({"InlinedApi"})
        public void bindView(View view, Context context, Cursor cursor) {
            String string = cursor.getString(cursor.getColumnIndex("display_name"));
            final String string2 = cursor.getString(cursor.getColumnIndex("data1"));
            String string3 = cursor.getString(cursor.getColumnIndex("data2"));
            ImageView imageView = (ImageView) view.findViewById(R.id.contact_thumbnail);
            TextView textView = (TextView) view.findViewById(R.id.phone_type);
            ((TextView) view.findViewById(R.id.contact_name)).setText(string);
            ((TextView) view.findViewById(R.id.phone_number)).setText(string2.replace(StringUtils.SPACE, ""));
            if (!TextUtils.isEmpty(string3)) {
                textView.setText(NewSMSActivity.this.getString(ContactsContract.CommonDataKinds.Phone.getTypeLabelResource(Integer.parseInt(string3))));
            } else {
                textView.setText("");
            }
            Bitmap userContactPhoto = getUserContactPhoto(cursor, cursor.getString(cursor.getColumnIndexOrThrow("_id")));
            if (userContactPhoto != null) {
                imageView.setImageBitmap(userContactPhoto);
            } else {
                imageView.setImageResource(R.drawable.default_profile_pic);
            }
            view.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    NewSMSActivity.this.recipientLayout.setVisibility(0);
                    NewSMSActivity.this.hideSoftInput();
                    NewSMSActivity.this.addRecipientTextView(string2);
                    NewSMSActivity.this.clearListView();
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
            if (cursor == null || cursor.getCount() <= 0) {
                if (NewSMSActivity.this.list != null) {
                    NewSMSActivity.this.list.setVisibility(8);
                }
            } else if (NewSMSActivity.this.list != null) {
                NewSMSActivity.this.list.setVisibility(0);
            }
            this.mAlphabetIndexer.setCursor(cursor);
            return super.swapCursor(cursor);
        }
    }

    public interface ContactQuery {
        public static final int DISPLAY_NAME = 1;
        public static final int LOOKUP_KEY = 3;
        public static final int NUMBER = 4;
        public static final int PHOTO_THUMBNAIL_URI = 2;
        public static final String[] PROJECTION = (Build.VERSION.SDK_INT >= 11 ? PROJECTION_HONEYCOMB : PROJECTION_OLD);
        public static final String[] PROJECTION_HONEYCOMB = {"_id", "display_name", "photo_thumb_uri", "lookup", "data1", "data2"};
        public static final String[] PROJECTION_OLD = {"_id", "display_name", "_id", "lookup", "data1", "data2"};
        public static final int QUERY_ID = 0;
        public static final String SELECTION_SEARCH = "(Replace(data1, ' ','') LIKE ? or display_name LIKE ?)";
        public static final String SELECTION_SEARCH_BY_PHONE_NUMBER = "Replace(data1, ' ','') = ?";
        public static final String SORT_ORDER = "display_name";
        public static final Uri URI = ContactsContract.CommonDataKinds.Phone.CONTENT_URI;
        public static final int _ID = 0;
    }

    private void checkSmsType(String str) {
        try {
            new CheckSMSTypeService(new CheckSMSTypeServiceListener(this.addTextView), getApplicationContext()).checkSMSType(str);
        } catch (NoNetworkException e) {
            e.printStackTrace();
        }
    }

    /* access modifiers changed from: private */
    public void clearListView() {
        this.mContactAdapter.changeCursor((Cursor) null);
        synchronized (this.mContactAdapter) {
            this.mContactAdapter.notifyAll();
        }
    }

    /* access modifiers changed from: private */
    public void createChatAndSendSMS(String str) {
        int createSingleChat;
        String str2;
        ArrayList arrayList = new ArrayList(this.numbers.values());
        String convertListToSortedSplittingString = SMSFormatUtil.convertListToSortedSplittingString(arrayList);
        CreateChatService createChatService = new CreateChatService(getApplicationContext());
        if (arrayList.size() > 1) {
            createSingleChat = createChatService.createMultipleChat(arrayList);
            str2 = "group";
        } else if (arrayList.size() == 1) {
            createSingleChat = createChatService.createSingleChat((String) arrayList.get(0));
            str2 = "individual";
        } else {
            Toast.makeText(getApplicationContext(), getString(R.string.new_sms_no_recipients), 1).show();
            return;
        }
        if (createSingleChat != 0) {
            sendMessage(createSingleChat, str, convertListToSortedSplittingString, str2);
            goToChatPage(createSingleChat, convertListToSortedSplittingString, str2);
            return;
        }
        Toast.makeText(getApplicationContext(), "Create Chat failed", 1).show();
    }

    private String getContactNameByPhoneNumber(String str) {
        return new ContactsHelper(str, getApplicationContext()).getName();
    }

    private void getInfoFromIntent() {
        this.isComeFromEditParticipant = getIntent().getBooleanExtra("isComeFromEditParticipant", false);
    }

    @SuppressLint({"NewApi"})
    private void getViews() {
        this.addEt = (EmojiEditText) findViewById(R.id.txt_add_msg);
        this.sendEt = (EmojiEditText) findViewById(R.id.txt_send_msg);
        this.addBtn = (ImageButton) findViewById(R.id.btn_add);
        this.sendBtn = (ImageButton) findViewById(R.id.btn_send);
        this.viewGroup = (EmojiFlowLayout) findViewById(R.id.recipient);
        this.topBar = (RelativeLayout) findViewById(R.id.top_bar);
        this.layoutParent = (EmojiLinearLayout) findViewById(R.id.layoutParent);
        this.recipientLayout = (LinearLayout) findViewById(R.id.recipientLayout);
        this.layoutSecond = (LinearLayout) findViewById(R.id.layoutSecond);
        this.txtCont = (LinearLayout) findViewById(R.id.txt_cont);
        this.searchLayout = (LinearLayout) findViewById(R.id.search_layout);
        this.sendLayout = (RelativeLayout) findViewById(R.id.included_send_sms_layout);
        this.recipientScroll = (AddRecipientsScrollView) findViewById(R.id.recipientScroll);
        this.list = (ListView) findViewById(R.id.listview_contact);
        DisplayMetrics displayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        this.mWidth = displayMetrics.widthPixels;
        this.mHeight = displayMetrics.heightPixels;
        this.charCountTv = (TextView) findViewById(R.id.char_count);
        this.concatCountTv = (TextView) findViewById(R.id.concat_count);
        this.linkView = findViewById(R.id.link_view);
    }

    private void goToChatPage(int i, String str, String str2) {
        Intent intent = new Intent(getApplicationContext(), ChatPageActivity.class);
        intent.putExtra("chatId", i);
        intent.putExtra("chatType", str2);
        intent.putExtra("recipient", str);
        if (str2.equals("group")) {
            intent.putExtra(ShareConstants.WEB_DIALOG_PARAM_TITLE, SMSProfileUtil.getMultipleSMSProfileTitle(SMSFormatUtil.convertSplittingStringToSortedArrayList(str), getApplicationContext()));
            intent.putExtra("photo", SMSProfileUtil.getMultipleSMSProfilePic(getApplicationContext()));
        } else if (str2.equals("individual")) {
            intent.putExtra(ShareConstants.WEB_DIALOG_PARAM_TITLE, SMSProfileUtil.getSingleSMSProfileTitle(str, getApplicationContext()));
            intent.putExtra("photo", SMSProfileUtil.getSingleSMSProfilePic(str, getApplicationContext()));
        }
        startActivity(intent);
        finish();
    }

    /* access modifiers changed from: private */
    public void hideSoftInput() {
        if (this.manager != null && getCurrentFocus() != null) {
            this.manager.hideSoftInputFromWindow(getCurrentFocus().getWindowToken(), 2);
        }
    }

    private void initContent() {
        String[] stringArrayExtra = getIntent().getStringArrayExtra("numbers");
        if (stringArrayExtra == null || stringArrayExtra.length == 0) {
            this.recipientScroll.setVisibility(8);
        } else {
            for (String addRecipientTextView : stringArrayExtra) {
                addRecipientTextView(addRecipientTextView);
            }
        }
        this.mContactAdapter = new ContactAdapter(this, R.layout.new_sms_contacts_list_item, (Cursor) null, ContactFragment.ContactAllQuery.PROJECTION, new int[]{2131624231}, 2);
        this.list.setAdapter(this.mContactAdapter);
        this.list.setVisibility(8);
        this.manager = (InputMethodManager) getSystemService("input_method");
        this.sendBtn.setEnabled(false);
    }

    private boolean isWifiAvailable() {
        return MobileSipService.getInstance().isNetworkAvailable(this);
    }

    /* access modifiers changed from: private */
    public void promptDialog(int i) {
        switch (i) {
            case 2:
                this.builder = new AlertDialog.Builder(this);
                this.builder.setMessage(this.titleStr).setCancelable(false).setNeutralButton(getResources().getString(R.string.cancel), new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.cancel();
                    }
                }).setPositiveButton(getResources().getString(R.string.new_sms_remove_recipient), new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        if (NewSMSActivity.this.removeTextView != null) {
                            NewSMSActivity.this.removeTextView.getMeasuredHeight();
                            NewSMSActivity.this.recipientLayout.getMeasuredHeight();
                            int id = NewSMSActivity.this.removeTextView.getId();
                            NewSMSActivity.this.viewGroup.removeView(NewSMSActivity.this.removeTextView);
                            NewSMSActivity.this.numbers.remove(Integer.valueOf(id));
                            Log.v(NewSMSActivity.this.TAG, "remove numbers size = " + NewSMSActivity.this.numbers.size());
                            if (NewSMSActivity.this.viewGroup.getChildCount() == 0) {
                                NewSMSActivity.this.recipientScroll.setVisibility(8);
                            }
                        }
                    }
                });
                this.builder.create().show();
                return;
            case 3:
                this.builder = new AlertDialog.Builder(this);
                this.builder.setMessage(getResources().getString(R.string.new_sms_not_support)).setCancelable(false).setNeutralButton(getString(17039370), new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.cancel();
                    }
                });
                this.builder.create().show();
                return;
            case 4:
                this.builder = new AlertDialog.Builder(this);
                this.builder.setMessage(getResources().getString(R.string.new_sms_incorrect_number)).setCancelable(false).setNeutralButton(getString(17039370), new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.cancel();
                    }
                });
                this.builder.create().show();
                return;
            case 5:
                this.builder = new AlertDialog.Builder(this);
                this.builder.setMessage(getResources().getString(R.string.new_sms_over_lenght)).setCancelable(false).setNeutralButton(getString(17039370), new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.cancel();
                    }
                });
                this.builder.create().show();
                return;
            case 6:
                this.builder = new AlertDialog.Builder(this);
                this.builder.setMessage(getResources().getString(R.string.new_sms_number_length_over_limit)).setCancelable(false).setNeutralButton(getString(17039370), new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.cancel();
                    }
                });
                this.builder.create().show();
                return;
            default:
                throw new IllegalArgumentException("unkown dialog id " + i);
        }
    }

    private void promptDialogWithArgumentsAndTag(EnumKKDialogType enumKKDialogType, Bundle bundle) {
        KKDialog requestDialog = new KKDialogProvider(new KKDialogBuilder(), this).requestDialog(enumKKDialogType, this);
        requestDialog.setArguments(bundle);
        requestDialog.show();
    }

    /* access modifiers changed from: private */
    public void promptKKDialog(EnumKKDialogType enumKKDialogType) {
        new KKDialogProvider(new KKDialogBuilder(), this).requestDialog(enumKKDialogType, this).show();
    }

    private void sendMessage(int i, String str, String str2, String str3) {
        try {
            SendSMSService.getInstance().sendMessage(str, i, getApplicationContext());
        } catch (NoNetworkException e) {
            e.printStackTrace();
        }
    }

    private void setViewAction() {
        this.addEt.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                NewSMSActivity.this.recipientScroll.setVisibility(8);
            }
        });
        this.addEt.addTextChangedListener(new TextWatcher() {
            public void afterTextChanged(Editable editable) {
            }

            public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }

            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                if (i + i3 > 0) {
                    NewSMSActivity.this.recipientScroll.setVisibility(8);
                } else if (NewSMSActivity.this.viewGroup.getChildCount() != 0) {
                    NewSMSActivity.this.recipientScroll.setVisibility(0);
                }
                Bundle bundle = new Bundle();
                bundle.putString("SEARCH_KEY", "%" + NewSMSActivity.this.addEt.getText().toString() + "%");
                NewSMSActivity.this.getSupportLoaderManager().restartLoader(0, bundle, NewSMSActivity.this);
            }
        });
        this.addEt.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            public void onFocusChange(View view, boolean z) {
                if (!z) {
                    NewSMSActivity.this.clearListView();
                    if (NewSMSActivity.this.numbers.size() > 0) {
                        NewSMSActivity.this.recipientScroll.setVisibility(0);
                    } else {
                        NewSMSActivity.this.recipientScroll.setVisibility(8);
                    }
                } else {
                    NewSMSActivity.this.recipientScroll.setVisibility(8);
                }
            }
        });
        this.addEt.setOnKeyListener(new View.OnKeyListener() {
            public boolean onKey(View view, int i, KeyEvent keyEvent) {
                if (i == 66) {
                    NewSMSActivity.this.addRecipientTextView(((TextView) view).getText().toString());
                    return true;
                } else if (i != 4) {
                    return false;
                } else {
                    if (NewSMSActivity.this.mContactAdapter.getCount() <= 0) {
                        return false;
                    }
                    NewSMSActivity.this.clearListView();
                    return true;
                }
            }
        });
        this.addBtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                NewSMSActivity.this.addRecipientTextView(NewSMSActivity.this.addEt.getText().toString());
            }
        });
        this.sendEt.addTextChangedListener(new TextWatcher() {
            String addStr;
            String beforeStr;
            int currentCharCount;
            int currentConcatCount;
            int maxConcatCount;
            int maxLength;
            int oldCharCount = ConcatUtil.getMaxCharCountEn(NewSMSActivity.this.getApplicationContext());
            int oldConcatCount = 1;

            public void afterTextChanged(Editable editable) {
                NewSMSActivity.this.sendBtn.setEnabled(editable.toString().trim().trim().length() != 0);
                if (this.currentConcatCount > this.maxConcatCount) {
                    editable.delete(ConcatUtil.getDeleteIndex(this.beforeStr, editable, this.addStr, this.oldConcatCount, this.oldCharCount), editable.length());
                    Toast.makeText(NewSMSActivity.this.getApplicationContext(), NewSMSActivity.this.getString(R.string.chat_view_toast_message_too_long), 1).show();
                }
                this.oldCharCount = this.currentCharCount;
                this.oldConcatCount = this.currentConcatCount;
            }

            public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                this.beforeStr = charSequence.toString();
            }

            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                synchronized (this) {
                    if (this.beforeStr.length() < charSequence.toString().length()) {
                        this.addStr = charSequence.toString().substring(this.beforeStr.length());
                    }
                    Integer[] charAndConcatCount = ConcatUtil.getCharAndConcatCount(NewSMSActivity.this.getApplicationContext(), NewSMSActivity.this.sendEt.getText().toString());
                    this.currentCharCount = charAndConcatCount[0].intValue();
                    this.currentConcatCount = charAndConcatCount[1].intValue();
                    this.maxLength = charAndConcatCount[2].intValue();
                    this.maxConcatCount = charAndConcatCount[3].intValue();
                    NewSMSActivity.this.charCountTv.setText(String.valueOf(this.currentCharCount));
                    NewSMSActivity.this.concatCountTv.setText(String.valueOf(this.currentConcatCount));
                    NewSMSActivity.this.sendEt.setFilters(new InputFilter[]{new InputFilter.LengthFilter(this.maxLength)});
                }
            }
        });
        this.sendEt.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            public void onFocusChange(View view, boolean z) {
                if (z && !MobileSipService.getInstance().isLoginSuccress()) {
                    NewSMSActivity.this.promptKKDialog(EnumKKDialogType.AlertKKisOffDialog);
                }
            }
        });
        this.sendBtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                String trim = NewSMSActivity.this.sendEt.getText().toString().trim();
                if (!TextUtils.isEmpty(trim)) {
                    if (!NetworkUtils.isWifiAvailable(NewSMSActivity.this.getApplicationContext())) {
                        NewSMSActivity.this.promptKKDialog(EnumKKDialogType.AlertNoWifiDialog);
                    } else if (!MobileSipService.getInstance().isLoginSuccress()) {
                        NewSMSActivity.this.promptKKDialog(EnumKKDialogType.AlertKKisOffDialog);
                    } else if (!NewSMSActivity.this.isComeFromEditParticipant || ClientStateManager.isNotShowSMSConsumeWarmingCheckBox(NewSMSActivity.this.getApplicationContext())) {
                        NewSMSActivity.this.createChatAndSendSMS(trim);
                    } else {
                        NewSMSActivity.this.promptKKDialog(EnumKKDialogType.AlertSMSConsumeDialog);
                    }
                }
            }
        });
    }

    public void addRecipientTextView(String str) {
        String trimSymbol = SMSNumberUtil.trimSymbol(str);
        Log.v(this.TAG, "input number : " + trimSymbol);
        if (!"".equals(trimSymbol)) {
            Log.v(this.TAG, "numbers.size : " + this.numbers.size());
            if (trimSymbol.length() > 25) {
                Log.v(this.TAG, "number length over limit:25");
                hideSoftInput();
                promptDialog(4);
                return;
            }
            boolean z = false;
            for (Integer num : this.numbers.keySet()) {
                if (this.numbers.get(num).equals(SMSNumberUtil.formatNumber(trimSymbol))) {
                    z = true;
                }
            }
            if (z) {
                Log.v(this.TAG, "number already exist");
                this.addEt.setText("");
                hideSoftInput();
            } else if (!SMSNumberUtil.isValidRecipient(trimSymbol)) {
                Log.v(this.TAG, "number is invalid");
                hideSoftInput();
                promptDialog(4);
            } else if (this.viewGroup.getChildCount() < 11) {
                this.recipientScroll.setVisibility(0);
                hideSoftInput();
                String formatNumber = SMSNumberUtil.formatNumber(trimSymbol);
                final String contactNameByPhoneNumber = getContactNameByPhoneNumber(trimSymbol);
                String str2 = contactNameByPhoneNumber != null ? contactNameByPhoneNumber : formatNumber;
                this.addTextView = new TextView(getApplicationContext());
                this.addTextView.setText(str2);
                this.addTextView.setId(this.recipientId);
                this.addTextView.setSingleLine(true);
                this.addTextView.setBackgroundResource(R.drawable.text_flag);
                this.addTextView.setTextAppearance(getApplicationContext(), R.style.text_flag);
                this.addTextView.setCompoundDrawablePadding(10);
                this.addTextView.setGravity(17);
                LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, (int) TypedValue.applyDimension(1, 36.0f, getResources().getDisplayMetrics()), 1.0f);
                layoutParams.setMargins(4, 4, 4, 4);
                this.addTextView.setLayoutParams(layoutParams);
                this.viewGroup.addView(this.addTextView);
                this.numbers.put(Integer.valueOf(this.recipientId), formatNumber);
                this.recipientId++;
                this.addEt.setText("");
                this.addTextView.setOnClickListener(new View.OnClickListener() {
                    public void onClick(View view) {
                        NewSMSActivity.this.removeTextView = (TextView) view;
                        String unused = NewSMSActivity.this.titleStr = NewSMSActivity.this.removeTextView.getText().toString();
                        if (contactNameByPhoneNumber != null) {
                            int id = NewSMSActivity.this.removeTextView.getId();
                            String unused2 = NewSMSActivity.this.titleStr = NewSMSActivity.this.titleStr + " (" + ((String) NewSMSActivity.this.numbers.get(Integer.valueOf(id))) + ")";
                        }
                        NewSMSActivity.this.promptDialog(2);
                    }
                });
            } else {
                Log.v(this.TAG, "recipient already more than 11");
                promptDialog(5);
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
            case AlertKKisOffDialog:
                startActivity(IntentUtils.genDialScreenIntent("", getApplicationContext()));
                return;
            case AlertSMSConsumeDialog:
                String trim = this.sendEt.getText().toString().trim();
                if (!TextUtils.isEmpty(trim)) {
                    createChatAndSendSMS(trim);
                    return;
                }
                return;
            default:
                return;
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        ActionBar supportActionBar = getSupportActionBar();
        supportActionBar.setDisplayHomeAsUpEnabled(true);
        supportActionBar.setDisplayOptions(16, 16);
        View inflate = LayoutInflater.from(this).inflate(R.layout.actionbar_custom_childpages, new LinearLayout(this), false);
        ((TextView) inflate.findViewById(2131624003)).setText(getResources().getString(R.string.title_activity_new_sms));
        supportActionBar.setCustomView(inflate);
        setContentView((int) R.layout.activity_new_sms);
        getInfoFromIntent();
        getViews();
        initContent();
        setViewAction();
        if (this.viewGroup.getChildCount() > 0) {
            this.sendEt.requestFocus();
        } else {
            this.addEt.requestFocus();
        }
    }

    public Loader<Cursor> onCreateLoader(int i, Bundle bundle) {
        switch (i) {
            case 0:
                if (bundle == null || !bundle.containsKey("SEARCH_KEY") || "%%".equals(bundle.getString("SEARCH_KEY"))) {
                    return new CursorLoader(this, ContactQuery.URI, ContactQuery.PROJECTION, ContactQuery.SELECTION_SEARCH, new String[]{"", ""}, "display_name");
                }
                return new CursorLoader(this, ContactQuery.URI, ContactQuery.PROJECTION, ContactQuery.SELECTION_SEARCH, new String[]{bundle.getString("SEARCH_KEY"), bundle.getString("SEARCH_KEY")}, "display_name");
            default:
                return null;
        }
    }

    public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
        if (cursor != null && !cursor.isClosed()) {
            switch (loader.getId()) {
                case 0:
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
            case 16908332:
                finish();
                return true;
            default:
                return true;
        }
    }
}
