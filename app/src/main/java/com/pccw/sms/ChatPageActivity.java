package com.pccw.sms;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.app.LoaderManager;
import android.support.v4.app.NavUtils;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v7.app.ActionBar;
import android.telephony.PhoneNumberUtils;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.inputmethod.InputMethodManager;
import android.widget.AbsListView;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.pccw.database.entity.ChatListUserInfo;
import com.pccw.database.entity.ChatPageInfo;
import com.pccw.database.helper.DBHelper;
import com.pccw.dialog.EnumKKDialogType;
import com.pccw.dialog.KKDialog;
import com.pccw.dialog.KKDialogBuilder;
import com.pccw.dialog.KKDialogProvider;
import com.pccw.dialog.listener.IKKDialogOnClickListener;
import com.pccw.exception.NoNetworkException;
import com.pccw.mobile.provider.KingKingContentProvider;
import com.pccw.mobile.sip.BaseActionBarActivity;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.SMSType;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.IntentUtils;
import com.pccw.mobile.sip.util.NetworkUtils;
import com.pccw.mobile.sip.util.NumberMappingUtil;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.FormatUtil;
import com.pccw.sms.adapter.MessageAdapter;
import com.pccw.sms.bean.ChatPageListView;
import com.pccw.sms.bean.Emojicon;
import com.pccw.sms.bean.MessageItem;
import com.pccw.sms.emoji.EmojiKeyboardFragment;
import com.pccw.sms.emoji.EmojiconGridFragment;
import com.pccw.sms.service.CallLogIMService;
import com.pccw.sms.service.ChatRecordService;
import com.pccw.sms.service.CheckSMSDeliveryStatusService;
import com.pccw.sms.service.CheckSMSTypeService;
import com.pccw.sms.service.MessageItemService;
import com.pccw.sms.service.SendSMSService;
import com.pccw.sms.service.listener.ICheckSMSDeliveryStatusServiceListener;
import com.pccw.sms.service.listener.ICheckSMSTypeServiceListener;
import com.pccw.sms.service.listener.ISendSMSServiceListener;
import com.pccw.sms.singleton.ChatPageLayoutInstance;
import com.pccw.sms.util.ConcatUtil;
import com.pccw.sms.util.SMSFormatUtil;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;
import org.apache.http.HttpStatus;

public class ChatPageActivity extends BaseActionBarActivity implements EmojiconGridFragment.OnEmojiconClickedListener, EmojiKeyboardFragment.OnEmojiconBackspaceClickedListener, EmojiKeyboardFragment.OnKeyboardDialogDismissListener, LoaderManager.LoaderCallbacks<Cursor>, AbsListView.OnScrollListener, MessageAdapter.MessageAdapterActionResponse, IKKDialogOnClickListener {
    private static final int CHECK_SMS_DELIVERY_STATUS_INTERVAL = 10000;
    private static final int LOADER_TYPE_CALLLOG = 0;
    private static final int LOADER_TYPE_GET_INTENT = 1;
    private static final String SHOW_IDD_CHARGE_MESSAGE = "SHOW_IDD_CHARGE_MESSAGE";
    private static final int promptConsumeDialog = 2;
    private static final int promptKingKingNotOnDialog = 3;
    private static final int promptNoWifiDialog = 1;
    public String LOG_TAG = "ChatPageActivity";
    private RelativeLayout btnLoadMore;
    ImageButton btn_emoji;
    /* access modifiers changed from: private */
    public CallLogIMService callLogIMService;
    TextView charCountTv;
    ChatPageInfo chatPageInfo;
    private ChatPageListView chatPageListView;
    Handler checkSMSDeliveryServiceHandler;
    private Runnable checkSMSDeliveryServiceRunnable = new Runnable() {
        public void run() {
            Log.i("KKSMS", "Call CheckSMSDeliveryStatusService");
            ChatPageActivity.this.checkSMSDeliveryStatusService.checkDeliveryStatus();
        }
    };
    CheckSMSDeliveryStatusService checkSMSDeliveryStatusService;
    ICheckSMSDeliveryStatusServiceListener checkSMSDeliveryStatusServiceListener = new ICheckSMSDeliveryStatusServiceListener() {
        public void onCheckStatusFail() {
        }

        public void onStatusUpdated() {
            boolean unused = ChatPageActivity.this.isUpdateSentStatus = true;
            if (ChatPageActivity.this.getChatPageLayoutInstance() != null) {
                ChatPageActivity.this.refreshList();
            }
        }
    };
    ICheckSMSTypeServiceListener checkSMSTypeServiceListener = new ICheckSMSTypeServiceListener() {
        public void onCheckFail() {
            ChatPageActivity.this.smsTypeImg.setVisibility(8);
        }

        public void onCheckSuccess(List<SMSType> list) {
            if (list != null) {
                String str = list.get(0).type;
                if (str.equals("intra")) {
                    ChatPageActivity.this.smsTypeImg.setVisibility(0);
                    ChatPageActivity.this.smsTypeImg.setImageResource(R.drawable.sms_intra);
                } else if (str.equals("intl")) {
                    ChatPageActivity.this.smsTypeImg.setVisibility(0);
                    ChatPageActivity.this.smsTypeImg.setImageResource(R.drawable.sms_intnl);
                } else if (str.equals("inter")) {
                    ChatPageActivity.this.smsTypeImg.setVisibility(0);
                    ChatPageActivity.this.smsTypeImg.setImageResource(R.drawable.sms_inter);
                } else {
                    ChatPageActivity.this.smsTypeImg.setVisibility(8);
                }
            } else {
                ChatPageActivity.this.smsTypeImg.setVisibility(8);
            }
        }
    };
    private boolean checkStackFromBottom = false;
    TextView concatCountTv;
    /* access modifiers changed from: private */
    public Context ctx;
    /* access modifiers changed from: private */
    public int currentScrollState = 0;
    /* access modifiers changed from: private */
    public FrameLayout emojiCover;
    final Runnable endAnimation = new Runnable() {
        public void run() {
            boolean unused = ChatPageActivity.this.onScroll = true;
            ChatPageActivity.this.autoScrollDown();
        }
    };
    String failedMessageId = null;
    /* access modifiers changed from: private */
    public int firstUnreadMessageId = -1;
    private LinearLayout footer;
    private int groupCheckCnt = 0;
    /* access modifiers changed from: private */
    public Handler handler;
    boolean isAllRead = false;
    /* access modifiers changed from: private */
    public boolean isEmojiKeyboardVisible = false;
    boolean isHeaderAdded = false;
    /* access modifiers changed from: private */
    public boolean isKeyBoardVisible;
    private boolean isMediaTransfer = false;
    private boolean isRemovedByOthers = false;
    /* access modifiers changed from: private */
    public boolean isSendMessage = true;
    boolean isTempSet = false;
    /* access modifiers changed from: private */
    public boolean isUpdateSentStatus = false;
    /* access modifiers changed from: private */
    public boolean isUpdatedByUser = false;
    ArrayList<MessageItem> items;
    /* access modifiers changed from: private */
    public int keyboardHeight;
    InputMethodManager mInputMethodManager;
    ListView mListView;
    MessageAdapter messageAdapter;
    /* access modifiers changed from: private */
    public MessageItemService messageItemService;
    int msgId = -1;
    private AlertDialog noWiFiDialog;
    private CheckBox notShowSMSConsumeWarmingAgainCkeckBox;
    /* access modifiers changed from: private */
    public boolean onScroll = false;
    /* access modifiers changed from: private */
    public boolean openEmojiKeyboard = false;
    /* access modifiers changed from: private */
    public LinearLayout parentLayout;
    private View popUpView;
    /* access modifiers changed from: private */
    public PopupWindow popupWindow;
    int previousHeightDiffrence = 0;
    ImageView profilePic;
    /* access modifiers changed from: private */
    public ProgressBar progressBar;
    final Runnable removeListAnimation = new Runnable() {
        public void run() {
            ChatPageActivity.this.view_notice.setVisibility(4);
            ChatPageActivity.this.setFadingAnimation(true, ChatPageActivity.this.progressBar, HttpStatus.SC_MULTIPLE_CHOICES);
        }
    };
    private SeekBar seekbar = null;
    ImageButton sendMsgBtn;
    ISendSMSServiceListener sendSMSListener = new ISendSMSServiceListener() {
        public void onBeforeSend(int i) {
        }

        public void onSendFail() {
            boolean unused = ChatPageActivity.this.isUpdateSentStatus = true;
            if (ChatPageActivity.this.getChatPageLayoutInstance() != null) {
                ChatPageActivity.this.refreshList();
            }
        }

        public void onSendSuccess(int i) {
            boolean unused = ChatPageActivity.this.isUpdateSentStatus = true;
            if (ChatPageActivity.this.getChatPageLayoutInstance() != null) {
                ChatPageActivity.this.refreshList();
            }
        }

        public void onSending(int i) {
            boolean unused = ChatPageActivity.this.isUpdateSentStatus = true;
            if (ChatPageActivity.this.getChatPageLayoutInstance() != null) {
                ChatPageActivity.this.refreshList();
            }
        }
    };
    SendSMSService sendSMSService;
    /* access modifiers changed from: private */
    public boolean showCallLog = false;
    ImageView smsTypeImg;
    /* access modifiers changed from: private */
    public boolean suggestiveWordsOn = false;
    RelativeLayout sysMsgFooter;
    TextView systemMessage;
    private String targetNumber;
    LinearLayout topUnreadNotice;
    EditText txt_messageSearch;
    EditText txt_msg;
    TextView txt_send;
    TextView userNameTV;
    RelativeLayout userProfileBtn;
    private RelativeLayout viewLoadMoreMessage;
    /* access modifiers changed from: private */
    public RelativeLayout view_notice;
    RelativeLayout voiceCallBtn;

    public interface CallLogQuery {
        public static final String[] CALL_LOG_PROJECTION = {"_id", DBHelper.DATE, "duration", "type", DBHelper.NUMBER};
        public static final int DATE = 1;
        public static final int DURATION = 2;
        public static final int NUMBER = 4;
        public static final int QUERY_ID = 0;
        public static final int TYPE = 3;
        public static final Uri URI = KingKingContentProvider.CALL_LOG_URI;
        public static final int _ID = 0;
    }

    private void addListViewHeader() {
        this.viewLoadMoreMessage = (RelativeLayout) getLayoutInflater().inflate(R.layout.list_item_reload_button, (ViewGroup) null);
        this.footer = (LinearLayout) getLayoutInflater().inflate(R.layout.list_item_footer_view, (ViewGroup) null);
        this.btnLoadMore = (RelativeLayout) this.viewLoadMoreMessage.findViewById(R.id.btn_load);
        this.view_notice = (RelativeLayout) this.viewLoadMoreMessage.findViewById(R.id.txt_notice);
        this.progressBar = (ProgressBar) this.viewLoadMoreMessage.findViewById(R.id.indicator_loading);
        this.mListView.addHeaderView(this.viewLoadMoreMessage);
    }

    /* access modifiers changed from: private */
    public void autoScrollDown() {
        this.mListView.post(new Runnable() {
            public void run() {
                View childAt = ChatPageActivity.this.mListView.getChildAt(0);
                if (childAt != null) {
                    ChatPageActivity.this.mListView.smoothScrollBy(childAt.getBottom(), HttpStatus.SC_INTERNAL_SERVER_ERROR);
                    boolean unused = ChatPageActivity.this.onScroll = false;
                }
            }
        });
    }

    /* access modifiers changed from: private */
    public void call(String str) {
        if (str == null) {
            str = this.targetNumber;
        }
        MobileSipService.getInstance().call(str, this, false);
    }

    /* access modifiers changed from: private */
    public void changeKeyboardHeight(int i) {
        if (i > 100) {
            this.keyboardHeight = i;
            this.emojiCover.setLayoutParams(new LinearLayout.LayoutParams(-1, this.keyboardHeight));
        }
    }

    private void checkKeyboardHeight(final View view) {
        view.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            public void onGlobalLayout() {
                Rect rect = new Rect();
                view.getWindowVisibleDisplayFrame(rect);
                int height = view.getRootView().getHeight() - rect.bottom;
                if (ChatPageActivity.this.isKeyBoardVisible || ChatPageActivity.this.previousHeightDiffrence - height >= 0) {
                    if (ChatPageActivity.this.isKeyBoardVisible && ChatPageActivity.this.previousHeightDiffrence - height < 0) {
                        boolean unused = ChatPageActivity.this.suggestiveWordsOn = true;
                        ChatPageActivity.this.changeKeyboardHeight(height);
                        ChatPageActivity.this.setEmojiKeyboard();
                    } else if (ChatPageActivity.this.suggestiveWordsOn && height != 0 && ChatPageActivity.this.previousHeightDiffrence - height > 50) {
                        boolean unused2 = ChatPageActivity.this.suggestiveWordsOn = false;
                        ChatPageActivity.this.changeKeyboardHeight(height);
                        ChatPageActivity.this.setEmojiKeyboard();
                    } else if (ChatPageActivity.this.suggestiveWordsOn && ChatPageActivity.this.previousHeightDiffrence - height > 50) {
                        boolean unused3 = ChatPageActivity.this.suggestiveWordsOn = false;
                    } else if (!ChatPageActivity.this.suggestiveWordsOn && ChatPageActivity.this.previousHeightDiffrence - height == 0) {
                        ChatPageActivity.this.changeKeyboardHeight(height);
                        ChatPageActivity.this.setEmojiKeyboard();
                    } else if (ChatPageActivity.this.previousHeightDiffrence - height > 50) {
                        ChatPageActivity.this.emojiCover.setVisibility(8);
                        ChatPageActivity.this.popupWindow.dismiss();
                    }
                }
                ChatPageActivity.this.previousHeightDiffrence = height;
                if (height > 100) {
                    if (ChatPageActivity.this.isKeyBoardVisible) {
                        boolean unused4 = ChatPageActivity.this.isUpdateSentStatus = true;
                    } else {
                        boolean unused5 = ChatPageActivity.this.isUpdateSentStatus = false;
                        ChatPageActivity.this.scrollMyListViewToBottom();
                    }
                    boolean unused6 = ChatPageActivity.this.isKeyBoardVisible = true;
                    return;
                }
                boolean unused7 = ChatPageActivity.this.isKeyBoardVisible = false;
            }
        });
    }

    private String convertSecToMinSec(int i) {
        return String.format("%02d:%02d", new Object[]{Integer.valueOf(i / 60), Integer.valueOf(i % 60)});
    }

    /* access modifiers changed from: private */
    public void countDisplayingMessage(int i) {
        if (i >= 20) {
            insertListViewHeader(true);
        } else {
            insertListViewHeader(false);
        }
    }

    private void displayNoNetworkSendingToast() {
        Toast.makeText(this, getString(R.string.ask_wifi), 0).show();
    }

    private void displayNotAllowSendingToast() {
        Toast.makeText(this, getString(R.string.chat_view_alert_message_not_allow_send), 0).show();
    }

    private void doResendService() {
        Calendar instance = Calendar.getInstance(TimeZone.getTimeZone("GMT+0000"));
        instance.add(5, -1);
        FormatUtil.convertDateToStr(instance.getTime(), "yyyy-MM-dd HH:mm:ss");
    }

    private void enablePopUpView() {
        this.popUpView = getLayoutInflater().inflate(R.layout.emoji_keyboard_frame, (ViewGroup) null);
        this.popupWindow = new PopupWindow(this.popUpView, -1, this.keyboardHeight, false);
        this.popupWindow.setOnDismissListener(new PopupWindow.OnDismissListener() {
            public void onDismiss() {
                ChatPageActivity.this.emojiCover.setVisibility(8);
                ChatPageActivity.this.toggleEmojiButton(false);
            }
        });
    }

    /* access modifiers changed from: private */
    public ChatPageListView getChatPageLayoutInstance() {
        ChatPageListView chatPageListView2 = ChatPageLayoutInstance.getInstance().getChatPageListView();
        if (chatPageListView2 != null) {
            return chatPageListView2;
        }
        ChatPageLayoutInstance.getInstance().init(this.chatPageListView);
        return ChatPageLayoutInstance.getInstance().getChatPageListView();
    }

    private void getInfoFromIntent() {
        Intent intent = getIntent();
        if (intent.getData() != null) {
            getSupportLoaderManager().initLoader(1, (Bundle) null, this);
            this.chatPageInfo = new ChatPageInfo((String) null, (String) null, "individual", (String) null, 0, (Bitmap) null);
            return;
        }
        int intExtra = intent.getIntExtra("chatId", 0);
        this.chatPageInfo = new ChatPageInfo((String) null, intent.getStringExtra("recipient"), intent.getStringExtra("chatType"), intent.getStringExtra(ShareConstants.WEB_DIALOG_PARAM_TITLE), intExtra, (Bitmap) intent.getParcelableExtra("photo"));
    }

    private void getViews() {
        if ("group".equals(this.chatPageInfo.getChatType())) {
            this.voiceCallBtn.setVisibility(4);
        }
        this.btn_emoji = (ImageButton) findViewById(R.id.btn_emoji);
        this.sendMsgBtn = (ImageButton) findViewById(R.id.btn_send);
        this.txt_msg = (EditText) findViewById(R.id.txt_send_msg);
        this.mListView = (ListView) findViewById(R.id.listview_msg);
        this.mListView.setOnScrollListener(this);
        this.mListView.setTranscriptMode(1);
        this.mListView.setSmoothScrollbarEnabled(false);
        this.parentLayout = (LinearLayout) findViewById(R.id.layoutParent);
        this.emojiCover = (FrameLayout) findViewById(R.id.layout_emoji);
        this.profilePic = (ImageView) findViewById(R.id.im_user_profile);
        this.topUnreadNotice = (LinearLayout) findViewById(R.id.topUnreadNotice);
        this.systemMessage = (TextView) findViewById(R.id.msg_system);
        this.smsTypeImg = (ImageView) findViewById(R.id.sms_type_image);
        if ("group".equals(this.chatPageInfo.getChatType())) {
            this.smsTypeImg.setVisibility(8);
        }
        changeKeyboardHeight((int) getResources().getDimension(R.dimen.keyboard_height));
        enablePopUpView();
        checkKeyboardHeight(this.parentLayout);
        this.txt_msg.clearFocus();
        addListViewHeader();
    }

    private void insertListViewHeader(boolean z) {
        if (this.mListView != null && this.viewLoadMoreMessage != null) {
            this.btnLoadMore.setEnabled(z);
            this.isHeaderAdded = z;
            if (z) {
                this.btnLoadMore.setVisibility(0);
            } else if (!z && this.btnLoadMore.getVisibility() == 0) {
                this.btnLoadMore.setVisibility(4);
                this.progressBar.setVisibility(0);
                if (this.handler != null) {
                    this.handler.removeCallbacks(this.endAnimation);
                    this.handler = null;
                }
                this.handler = new Handler();
                this.handler.postDelayed(this.removeListAnimation, 1000);
            }
        }
    }

    private void makeVoiceCall(String str) {
        if (str.startsWith("852") && str.length() > 8) {
            str = "+".concat(str);
        }
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
                            PreferenceManager.getDefaultSharedPreferences(ChatPageActivity.this.getApplicationContext()).edit().putBoolean(ChatPageActivity.SHOW_IDD_CHARGE_MESSAGE, false).commit();
                        }
                        dialogInterface.cancel();
                        ChatPageActivity.this.call((String) null);
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
        if (str.startsWith("852") && str.length() > 8) {
            str = "+".concat(str);
        }
        startActivity(IntentUtils.genDialScreenIntent(str, this));
    }

    /* access modifiers changed from: private */
    public void promptDialog(EnumKKDialogType enumKKDialogType) {
        new KKDialogProvider(new KKDialogBuilder(), this).requestDialog(enumKKDialogType, this).show();
    }

    /* access modifiers changed from: private */
    public void refreshList() {
        runOnUiThread(new Runnable() {
            public void run() {
                ChatPageActivity.this.refreshListAdapter();
            }
        });
    }

    /* access modifiers changed from: private */
    public void refreshListAdapter() {
        Log.v("KKIM", "refreshListAdapter");
        if (!this.chatPageInfo.isIndividualChat() || !this.showCallLog) {
            this.items = this.messageItemService.getMessageItem(this.chatPageInfo, 1);
        } else {
            Log.v("KKIM", "merge with the call log.");
            this.items = this.callLogIMService.getChatPageData(this.chatPageInfo, 1);
        }
        ChatPageListView chatPageLayoutInstance = getChatPageLayoutInstance();
        chatPageLayoutInstance.setCurrentPage(1);
        if (this.messageAdapter != null) {
            this.messageAdapter.setChatType(this.chatPageInfo.getChatType());
            this.messageAdapter.updateMessageList(this.items);
            this.messageAdapter.notifyDataSetChanged();
            chatPageLayoutInstance.setMessageAdapter(this.messageAdapter);
        }
        scrollMyListViewToBottom();
    }

    private void refreshListAdapterWithMultiplePage(int i) {
        ArrayList<MessageItem> messageItem;
        Log.v("KKIM", "refreshListAdapterWithMultiplePage");
        for (int i2 = 1; i2 <= i; i2++) {
            if (i2 != 1) {
                if (!this.chatPageInfo.isIndividualChat() || !this.showCallLog) {
                    messageItem = this.messageItemService.getMessageItem(this.chatPageInfo, i2);
                } else {
                    Log.v("KKIM", "merge with the call log. - multiple page = " + i2);
                    messageItem = this.callLogIMService.getChatPageData(this.chatPageInfo, i2);
                }
                messageItem.addAll(this.items);
                this.items = messageItem;
            } else if (!this.chatPageInfo.isIndividualChat() || !this.showCallLog) {
                this.items = this.messageItemService.getMessageItem(this.chatPageInfo, 1);
            } else {
                Log.v("KKIM", "merge with the call log. - multiple page = 1");
                this.items = this.callLogIMService.getChatPageData(this.chatPageInfo, 1);
            }
        }
        ChatPageListView chatPageLayoutInstance = getChatPageLayoutInstance();
        chatPageLayoutInstance.setCurrentPage(i);
        if (this.messageAdapter != null) {
            this.messageAdapter.setChatType(this.chatPageInfo.getChatType());
            this.messageAdapter.updateMessageList(this.items);
            this.messageAdapter.notifyDataSetChanged();
            chatPageLayoutInstance.setMessageAdapter(this.messageAdapter);
        }
    }

    private void refreshListAdapterWithSettingProgressBar(int i) {
        Log.v("KKIM", "refreshListAdapter with MsgId");
        if (!this.chatPageInfo.isIndividualChat() || !this.showCallLog) {
            this.items = this.messageItemService.getMessageItem(this.chatPageInfo, 1);
        } else {
            Log.v("KKIM", "merge with the call log.");
            this.items = this.callLogIMService.getChatPageData(this.chatPageInfo, 1);
        }
        ChatPageListView chatPageLayoutInstance = getChatPageLayoutInstance();
        chatPageLayoutInstance.setCurrentPage(1);
        if (this.messageAdapter != null) {
            MessageAdapter.targetingMsgId = i;
            this.messageAdapter.setChatType(this.chatPageInfo.getChatType());
            this.messageAdapter.updateMessageList(this.items);
            this.messageAdapter.notifyDataSetChanged();
            chatPageLayoutInstance.setMessageAdapter(this.messageAdapter);
        }
        scrollMyListViewToBottom();
    }

    /* access modifiers changed from: private */
    public void removeAllMessage() {
        new MessageItemService(this.ctx).deleteChatByChatId(Integer.toString(this.chatPageInfo.getChatId()));
    }

    /* access modifiers changed from: private */
    public void removeThisChat() {
        new ChatRecordService(this.ctx).deleteChatByChatId(Integer.toString(this.chatPageInfo.getChatId()));
    }

    private void resetButton() {
        if (this.handler != null) {
            this.handler.removeCallbacks(this.endAnimation);
            this.handler = null;
        }
        setFadingAnimation(true, this.view_notice, 30);
    }

    /* access modifiers changed from: private */
    public void scrollMyListViewToBottom() {
        if (!this.isUpdateSentStatus) {
            this.mListView.post(new Runnable() {
                public void run() {
                    int i;
                    if (ChatPageActivity.this.messageAdapter != null) {
                        int count = ChatPageActivity.this.messageAdapter.getCount();
                        if (ChatPageActivity.this.firstUnreadMessageId != -1) {
                            ChatPageActivity.this.messageAdapter.setUnreadMessageId(ChatPageActivity.this.firstUnreadMessageId);
                            ChatPageActivity.this.topUnreadNotice.setVisibility(8);
                            if (ChatPageActivity.this.firstUnreadMessageId > ChatPageActivity.this.messageAdapter.getTopMessageId()) {
                                i = ChatPageActivity.this.messageAdapter.getPositionByMessageId(ChatPageActivity.this.firstUnreadMessageId);
                                ChatPageActivity.this.isAllRead = true;
                            } else if (ChatPageActivity.this.firstUnreadMessageId == ChatPageActivity.this.messageAdapter.getTopMessageId()) {
                                ChatPageActivity.this.isAllRead = true;
                                i = -1;
                            } else {
                                ChatPageActivity.this.messageAdapter.setTemporaryMessageHeader(true);
                                i = -1;
                            }
                            ChatPageActivity.this.messageAdapter.notifyDataSetChanged();
                            ChatPageActivity.this.mListView.setSelection(i + 1);
                            int unused = ChatPageActivity.this.firstUnreadMessageId = -1;
                            return;
                        }
                        if (ChatPageActivity.this.isAllRead) {
                            ChatPageActivity.this.messageAdapter.setUnreadMessageId(-1);
                        } else if (ChatPageActivity.this.messageAdapter.getUnreadMessageId() != -1 && ChatPageActivity.this.messageAdapter.getTopMessageId() > ChatPageActivity.this.messageAdapter.getUnreadMessageId()) {
                            ChatPageActivity.this.messageAdapter.setTemporaryMessageHeader(true);
                        }
                        ChatPageActivity.this.mListView.setSelection(count + 1);
                    }
                }
            });
        }
    }

    /* access modifiers changed from: private */
    public void sendMessage() {
        if (this.isSendMessage) {
            String trim = this.txt_msg.getText().toString().trim();
            this.txt_msg.setText("");
            try {
                this.sendSMSService.sendMessage(trim, this.chatPageInfo.getChatId(), this.ctx);
            } catch (NoNetworkException e) {
                e.printStackTrace();
            }
        }
    }

    /* access modifiers changed from: private */
    public void setEmojiKeyboard() {
        if (this.openEmojiKeyboard) {
            this.popupWindow.setHeight(this.keyboardHeight);
            this.popupWindow.showAtLocation(this.parentLayout, 80, 0, 0);
            showDialog();
        }
    }

    /* access modifiers changed from: private */
    public void setFadingAnimation(final boolean z, View view, int i) {
        AlphaAnimation alphaAnimation = z ? new AlphaAnimation(1.0f, 0.0f) : new AlphaAnimation(0.0f, 1.0f);
        alphaAnimation.setInterpolator(new AccelerateInterpolator());
        alphaAnimation.setDuration((long) i);
        alphaAnimation.setFillEnabled(true);
        alphaAnimation.setFillAfter(true);
        alphaAnimation.setAnimationListener(new Animation.AnimationListener() {
            public void onAnimationEnd(Animation animation) {
                if (z) {
                    if (ChatPageActivity.this.handler != null) {
                        ChatPageActivity.this.handler.removeCallbacks(ChatPageActivity.this.removeListAnimation);
                        Handler unused = ChatPageActivity.this.handler = null;
                    }
                    Handler unused2 = ChatPageActivity.this.handler = new Handler();
                    ChatPageActivity.this.handler.postDelayed(ChatPageActivity.this.endAnimation, 200);
                }
            }

            public void onAnimationRepeat(Animation animation) {
            }

            public void onAnimationStart(Animation animation) {
            }
        });
        view.startAnimation(alphaAnimation);
    }

    private void setViewAction() {
        this.btn_emoji.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                if (!ChatPageActivity.this.popupWindow.isShowing()) {
                    ChatPageActivity.this.txt_msg.clearFocus();
                    if (ChatPageActivity.this.isKeyBoardVisible) {
                        ChatPageActivity.this.emojiCover.setVisibility(8);
                        boolean unused = ChatPageActivity.this.openEmojiKeyboard = true;
                    } else {
                        ChatPageActivity.this.emojiCover.setVisibility(0);
                        boolean unused2 = ChatPageActivity.this.isUpdateSentStatus = false;
                        ChatPageActivity.this.scrollMyListViewToBottom();
                        ChatPageActivity.this.popupWindow.setHeight(ChatPageActivity.this.keyboardHeight);
                        ChatPageActivity.this.popupWindow.showAtLocation(ChatPageActivity.this.parentLayout, 80, 0, 0);
                        ChatPageActivity.this.showDialog();
                    }
                    ChatPageActivity.this.toggleEmojiButton(true);
                    return;
                }
                ChatPageActivity.this.dismissDialog();
            }
        });
        this.sendMsgBtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                if (!NetworkUtils.isWifiAvailable(ChatPageActivity.this.ctx)) {
                    ChatPageActivity.this.promptDialog(EnumKKDialogType.AlertNoWifiDialog);
                } else if (!MobileSipService.getInstance().isLoginSuccress()) {
                    ChatPageActivity.this.promptDialog(EnumKKDialogType.AlertKKisOffDialog);
                } else if (!ClientStateManager.isNotShowSMSConsumeWarmingCheckBox(ChatPageActivity.this.ctx)) {
                    ChatPageActivity.this.promptDialog(EnumKKDialogType.AlertSMSConsumeDialog);
                } else {
                    ChatPageActivity.this.sendMessage();
                }
            }
        });
        this.txt_msg.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                if (ChatPageActivity.this.isEmojiKeyboardVisible) {
                    ChatPageActivity.this.dismissDialog();
                }
            }
        });
        this.txt_msg.addTextChangedListener(new TextWatcher() {
            String addStr;
            String beforeStr;
            int currentCharCount;
            int currentConcatCount;
            int maxConcatCount;
            int maxLength;
            int oldCharCount = ConcatUtil.getMaxCharCountEn(ChatPageActivity.this.getApplicationContext());
            int oldConcatCount = 1;

            public void afterTextChanged(Editable editable) {
                boolean z = false;
                String trim = editable.toString().trim();
                if (trim.length() > 0) {
                    boolean unused = ChatPageActivity.this.isSendMessage = true;
                    if (editable.length() == 1) {
                        Log.v(ChatPageActivity.this.LOG_TAG, "set typing status");
                    }
                } else {
                    boolean unused2 = ChatPageActivity.this.isSendMessage = false;
                }
                ImageButton imageButton = ChatPageActivity.this.sendMsgBtn;
                if (trim.trim().length() != 0) {
                    z = true;
                }
                imageButton.setEnabled(z);
                if (this.currentConcatCount > this.maxConcatCount) {
                    editable.delete(ConcatUtil.getDeleteIndex(this.beforeStr, editable, this.addStr, this.oldConcatCount, this.oldCharCount), editable.length());
                    Toast.makeText(ChatPageActivity.this.getApplicationContext(), ChatPageActivity.this.getString(R.string.chat_view_toast_message_too_long), 1).show();
                }
                this.oldCharCount = this.currentCharCount;
                this.oldConcatCount = this.currentConcatCount;
            }

            public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                this.beforeStr = charSequence.toString();
            }

            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                String obj = ChatPageActivity.this.txt_msg.getText().toString();
                if (this.beforeStr.length() < charSequence.toString().length()) {
                    this.addStr = charSequence.toString().substring(this.beforeStr.length());
                }
                Integer[] charAndConcatCount = ConcatUtil.getCharAndConcatCount(ChatPageActivity.this.getApplicationContext(), obj);
                this.currentCharCount = charAndConcatCount[0].intValue();
                this.currentConcatCount = charAndConcatCount[1].intValue();
                this.maxLength = charAndConcatCount[2].intValue();
                this.maxConcatCount = charAndConcatCount[3].intValue();
                ChatPageActivity.this.charCountTv.setText(String.valueOf(this.currentCharCount));
                ChatPageActivity.this.concatCountTv.setText(String.valueOf(this.currentConcatCount));
                ChatPageActivity.this.txt_msg.setFilters(new InputFilter[]{new InputFilter.LengthFilter(this.maxLength)});
            }
        });
        this.txt_msg.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            public void onFocusChange(View view, boolean z) {
                if (z && !MobileSipService.getInstance().isLoginSuccress()) {
                    ChatPageActivity.this.promptDialog(EnumKKDialogType.AlertKKisOffDialog);
                }
            }
        });
        this.mListView.setOnTouchListener(new View.OnTouchListener() {
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if (ChatPageActivity.this.currentScrollState != 0 || motionEvent.getAction() != 1) {
                    return false;
                }
                if (motionEvent.getAction() == 1 && ChatPageActivity.this.isKeyBoardVisible) {
                    ChatPageActivity.this.toggleKeyboard();
                    ChatPageActivity.this.txt_msg.clearFocus();
                }
                if (!ChatPageActivity.this.isEmojiKeyboardVisible) {
                    return false;
                }
                ChatPageActivity.this.dismissDialog();
                return false;
            }
        });
        this.userProfileBtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                if ("group".equals(ChatPageActivity.this.chatPageInfo.getChatType())) {
                    new Intent(ChatPageActivity.this.getApplicationContext(), GroupInfoActivity.class);
                }
                Intent intent = new Intent(ChatPageActivity.this.getApplicationContext(), GroupInfoActivity.class);
                if (intent != null) {
                    intent.putExtra("recipient", ChatPageActivity.this.chatPageInfo.getRecipient());
                    ChatPageActivity.this.startActivity(intent);
                }
            }
        });
        if (!"group".equals(this.chatPageInfo.getChatType())) {
            this.voiceCallBtn.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    ChatPageActivity.this.pasteNumberToDialer(ChatPageActivity.this.chatPageInfo.getRecipient());
                }
            });
        }
        this.btnLoadMore.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                ArrayList<MessageItem> messageItem;
                ChatPageListView access$100 = ChatPageActivity.this.getChatPageLayoutInstance();
                int currentPage = access$100.getCurrentPage();
                int i = currentPage + 1;
                Log.v(ChatPageActivity.this.LOG_TAG, "recent page=" + currentPage);
                if (!"individual".equals(ChatPageActivity.this.chatPageInfo.getChatType()) || !ChatPageActivity.this.showCallLog) {
                    Log.v("KKIM", "Only list the chat record");
                    if (currentPage == 1) {
                        ChatPageActivity.this.items = ChatPageActivity.this.messageItemService.getMessageItem(ChatPageActivity.this.chatPageInfo, 1);
                    }
                    messageItem = ChatPageActivity.this.messageItemService.getMessageItem(ChatPageActivity.this.chatPageInfo, i);
                } else {
                    Log.v("KKIM", "merge with the call log.");
                    if (currentPage == 1) {
                        ChatPageActivity.this.items = ChatPageActivity.this.callLogIMService.getChatPageData(ChatPageActivity.this.chatPageInfo, 1);
                    }
                    messageItem = ChatPageActivity.this.callLogIMService.getChatPageData(ChatPageActivity.this.chatPageInfo, i);
                }
                access$100.setCurrentPage(i);
                ChatPageLayoutInstance.getInstance().init(access$100);
                boolean unused = ChatPageActivity.this.isUpdatedByUser = true;
                ChatPageActivity.this.countDisplayingMessage(messageItem.size());
                int size = messageItem.size();
                if (size != 0) {
                    int size2 = messageItem.size() + ChatPageActivity.this.mListView.getFirstVisiblePosition();
                    View childAt = ChatPageActivity.this.mListView.getChildAt(0);
                    int top = childAt == null ? 0 : childAt.getTop();
                    messageItem.addAll(ChatPageActivity.this.items);
                    ChatPageActivity.this.items = messageItem;
                    ChatPageActivity.this.messageAdapter.setChatType(ChatPageActivity.this.chatPageInfo.getChatType());
                    ChatPageActivity.this.messageAdapter.updateMessageList(ChatPageActivity.this.items);
                    ChatPageActivity.this.messageAdapter.notifyDataSetChanged();
                    access$100.setMessageAdapter(ChatPageActivity.this.messageAdapter);
                    if (size == 20 || size > 1) {
                        ChatPageActivity.this.mListView.setSelectionFromTop(size2, top);
                        ChatPageActivity.this.messageAdapter.setTemporaryMessageHeader(false);
                        int messageIdByPosition = ChatPageActivity.this.messageAdapter.getMessageIdByPosition(size2);
                        if (ChatPageActivity.this.messageAdapter.getUnreadMessageId() != -1 && messageIdByPosition > ChatPageActivity.this.messageAdapter.getUnreadMessageId()) {
                            ChatPageActivity.this.topUnreadNotice.setVisibility(0);
                        } else if (ChatPageActivity.this.topUnreadNotice.isShown()) {
                            ChatPageActivity.this.topUnreadNotice.setVisibility(8);
                        }
                    }
                }
            }
        });
        this.sendMsgBtn.setEnabled(false);
        countDisplayingMessage(this.items.size());
        this.messageAdapter = new MessageAdapter(this, this.items, this.chatPageInfo.getChatType(), this);
        this.mListView.setAdapter(this.messageAdapter);
        this.isUpdateSentStatus = false;
        scrollMyListViewToBottom();
        this.chatPageListView = new ChatPageListView(this.mListView, 1, this.messageAdapter);
        ChatPageLayoutInstance.getInstance().init(this.chatPageListView);
    }

    private void showNotInGroupFooterMessage() {
        if (this.isRemovedByOthers) {
            Toast.makeText(this.ctx, getString(R.string.chat_group_toast_you_are_not_in_group), 0).show();
        }
    }

    private void showRemoveAllMessageAndQuitDialog() {
        new AlertDialog.Builder(this).setIcon(R.drawable.ic_logo).setTitle(2131165290).setMessage(R.string.remove_all_message_alert_message).setNegativeButton(17039360, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }
        }).setPositiveButton(17039370, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                ChatPageActivity.this.removeAllMessage();
                ChatPageActivity.this.removeThisChat();
                ChatPageActivity.this.finish();
            }
        }).show();
    }

    /* access modifiers changed from: private */
    public void toggleEmojiButton(boolean z) {
        this.btn_emoji.setSelected(z);
    }

    /* access modifiers changed from: private */
    public void toggleKeyboard() {
        ((InputMethodManager) getSystemService("input_method")).toggleSoftInput(2, 0);
        this.isKeyBoardVisible = !this.isKeyBoardVisible;
    }

    private void updateChatPageUI() {
        this.profilePic.setImageBitmap(this.chatPageInfo.getPhoto());
        this.userNameTV.setText(SMSFormatUtil.ellipsisTextWithThreeDots(this.chatPageInfo.getTitle(), 15));
    }

    private void updateSMSTypeImage() {
        try {
            new CheckSMSTypeService(this.checkSMSTypeServiceListener, this.ctx).checkSMSType(this.chatPageInfo.getRecipient());
        } catch (NoNetworkException e) {
            e.printStackTrace();
            this.smsTypeImg.setVisibility(8);
        }
    }

    public void OnKeyboardDialogDismiss() {
        if (this.popupWindow.isShowing()) {
            this.popupWindow.dismiss();
        }
    }

    public void checkTopAndBottom() {
        if (this.mListView.getCount() > 2 && this.currentScrollState == 0) {
            if (!this.checkStackFromBottom) {
                this.checkStackFromBottom = true;
                int lastVisiblePosition = this.mListView.getLastVisiblePosition();
                if (lastVisiblePosition != -1 && this.items.size() > lastVisiblePosition) {
                    this.mListView.setStackFromBottom(true);
                }
            }
            if (this.mListView.getFirstVisiblePosition() < 1 && !this.isHeaderAdded && !this.onScroll) {
                this.onScroll = true;
                autoScrollDown();
            }
        }
    }

    public void dismissDialog() {
        Fragment findFragmentByTag = getSupportFragmentManager().findFragmentByTag("dialog");
        if (findFragmentByTag != null) {
            ((EmojiKeyboardFragment) findFragmentByTag).dismiss();
        }
        this.isEmojiKeyboardVisible = false;
    }

    public String getPath(Uri uri) {
        Cursor managedQuery = managedQuery(uri, new String[]{"_data"}, (String) null, (String[]) null, (String) null);
        if (managedQuery == null) {
            return null;
        }
        int columnIndexOrThrow = managedQuery.getColumnIndexOrThrow("_data");
        managedQuery.moveToFirst();
        return managedQuery.getString(columnIndexOrThrow);
    }

    public void onAdapterItemRefresh(int i) {
        int lastVisiblePosition = this.mListView.getLastVisiblePosition() + 1;
        if (lastVisiblePosition != -1 && this.items.size() > lastVisiblePosition) {
            this.mListView.setStackFromBottom(true);
        }
        if (!this.isHeaderAdded && this.items.size() >= 20) {
            resetButton();
        }
        if (!this.isUpdatedByUser && this.chatPageListView.getCurrentPage() == 1) {
            countDisplayingMessage(i);
        }
        if (i <= 20) {
            scrollMyListViewToBottom();
        }
        this.isUpdatedByUser = false;
    }

    public void onBackPressed() {
        NavUtils.navigateUpFromSameTask(this);
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
                sendMessage();
                return;
            case AlertKKisOffDialog:
                startActivity(IntentUtils.genDialScreenIntent("", this.ctx));
                return;
            default:
                return;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.callLogIMService = new CallLogIMService(getApplicationContext());
        this.callLogIMService.clearCallLogAll();
        getSupportLoaderManager().initLoader(0, (Bundle) null, this);
        this.ctx = getApplicationContext();
        ActionBar supportActionBar = getSupportActionBar();
        supportActionBar.setDisplayHomeAsUpEnabled(true);
        supportActionBar.setDisplayOptions(16, 16);
        View inflate = LayoutInflater.from(this).inflate(R.layout.actionbar_custom_childpages, new LinearLayout(this), false);
        ((TextView) inflate.findViewById(2131624003)).setText(getResources().getString(R.string.chat_page_title));
        supportActionBar.setCustomView(inflate);
        setContentView((int) R.layout.activity_chat);
        this.userNameTV = (TextView) findViewById(R.id.im_user_name);
        this.userProfileBtn = (RelativeLayout) findViewById(R.id.im_user_detail);
        this.voiceCallBtn = (RelativeLayout) findViewById(R.id.btn_voice_call);
        this.sysMsgFooter = (RelativeLayout) findViewById(R.id.footer_system_message);
        this.charCountTv = (TextView) findViewById(R.id.char_count);
        this.concatCountTv = (TextView) findViewById(R.id.concat_count);
        getInfoFromIntent();
        Log.v(this.LOG_TAG, "recipient=" + this.chatPageInfo.getRecipient() + " ;chatId=" + this.chatPageInfo.getChatId() + " ;type=" + this.chatPageInfo.getChatType() + " ;title=" + this.chatPageInfo.getTitle());
        this.messageItemService = new MessageItemService(getApplicationContext());
        this.sendSMSService = SendSMSService.getInstance();
        this.checkSMSDeliveryStatusService = new CheckSMSDeliveryStatusService(this.checkSMSDeliveryStatusServiceListener, Integer.toString(this.chatPageInfo.getChatId()), this.ctx);
        getViews();
        this.checkSMSDeliveryServiceHandler = new Handler();
    }

    public Loader<Cursor> onCreateLoader(int i, Bundle bundle) {
        Log.v("KKIM", "bundle=" + bundle);
        switch (i) {
            case 0:
                return new CursorLoader(this, CallLogQuery.URI, CallLogQuery.CALL_LOG_PROJECTION, (String) null, (String[]) null, (String) null);
            case 1:
                return new CursorLoader(this, getIntent().getData(), (String[]) null, (String) null, (String[]) null, (String) null);
            default:
                return null;
        }
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.chat_activity_menu, menu);
        Log.v("KKIM", "onCreateOptionsMenu chat page");
        return super.onCreateOptionsMenu(menu);
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        Log.i(this.LOG_TAG, "overvide method * onDestroy");
        this.messageItemService.updateIsRead(this.chatPageInfo.getChatId() + "", "Y");
        ChatPageLayoutInstance.getInstance().destroy();
        super.onDestroy();
    }

    public void onEmojiconBackspaceClicked(View view) {
        EmojiKeyboardFragment.backspace(this.txt_msg);
    }

    public void onEmojiconClicked(Emojicon emojicon) {
        EmojiKeyboardFragment.input(this.txt_msg, emojicon);
    }

    public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
        switch (loader.getId()) {
            case 0:
                Log.v("KKIM", "chatpage - load calllog finished - A");
                if (!this.chatPageInfo.isIndividualChat() || !this.showCallLog) {
                    this.items = this.messageItemService.getMessageItem(this.chatPageInfo, 1);
                } else {
                    this.callLogIMService.addCallLogAll(cursor);
                    this.items = this.callLogIMService.getChatPageData(this.chatPageInfo, 1);
                    Log.v("KKIM", "chatpage - load calllog finished - B");
                }
                setViewAction();
                return;
            case 1:
                if (cursor.moveToNext()) {
                    String string = cursor.getString(cursor.getColumnIndex("DATA1"));
                    ChatListUserInfo chatListDetailByChatcontact = new ChatRecordService(this).getChatListDetailByChatcontact(string);
                    this.chatPageInfo.setRecipient(string);
                    if (chatListDetailByChatcontact == null) {
                        this.chatPageInfo.setChatId(-1);
                    } else {
                        this.chatPageInfo.setTitle(chatListDetailByChatcontact.getNickName());
                        this.chatPageInfo.setChatId(chatListDetailByChatcontact.getChatId());
                    }
                }
                updateChatPageUI();
                return;
            default:
                return;
        }
    }

    public void onLoaderReset(Loader<Cursor> loader) {
    }

    public void onMessageItemClicked(String str, String str2, int i) {
    }

    public void onMessageItemClicked(String str, String str2, int i, SeekBar seekBar, ImageView imageView) {
    }

    public void onMessageItemDeleted(int i) {
        if (new ChatRecordService(this.ctx).getMsgCount(this.chatPageInfo.getChatId()) > 0) {
            this.messageItemService.getLastMessage(this.chatPageInfo.getChatId());
            refreshList();
            return;
        }
        removeThisChat();
        finish();
    }

    public void onMessageResent(int i) {
        if (MobileSipService.getInstance().isLoginSuccress()) {
            try {
                this.sendSMSService.resendMessageWithId(i, this.chatPageInfo.getChatId(), this.ctx);
            } catch (NoNetworkException e) {
                e.printStackTrace();
                promptDialog(EnumKKDialogType.AlertNoWifiDialog);
            }
        } else {
            promptDialog(EnumKKDialogType.AlertKKisOffDialog);
        }
    }

    /* access modifiers changed from: protected */
    public void onNewIntent(Intent intent) {
        Log.d("KKIM", "========ChatPage onNewIntent intent null? " + (intent == null));
        if (intent == null || intent.getExtras() == null) {
            Log.d("KKIM", "========ChatPage onNewIntent intent NULL, not do restart");
            return;
        }
        finish();
        startActivity(intent);
        super.onNewIntent(intent);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 16908332:
                NavUtils.navigateUpFromSameTask(this);
                return true;
            case R.id.action_delete:
                showRemoveAllMessageAndQuitDialog();
                return true;
            default:
                return true;
        }
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        this.checkSMSDeliveryServiceHandler.removeCallbacks(this.checkSMSDeliveryServiceRunnable);
        this.sendSMSService.removeListener(this.sendSMSListener);
        Log.i(this.LOG_TAG, "overvide method * onPause");
        this.messageItemService.updateIsRead(this.chatPageInfo.getChatId() + "", "Y");
        ChatPageLayoutInstance.getInstance().destroy();
        if (this.popupWindow.isShowing()) {
            this.popupWindow.dismiss();
        }
        if (this.isKeyBoardVisible) {
            toggleKeyboard();
        }
        super.onPause();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        Log.v(this.LOG_TAG, "onResume(), resume the ChatActivity; chatId=" + this.chatPageInfo.getChatId());
        if (this.messageAdapter != null) {
            this.messageAdapter.clearAdapterCache();
        }
        this.firstUnreadMessageId = this.messageItemService.getFirstUnreadMessageId(String.valueOf(this.chatPageInfo.getChatId()));
        this.messageItemService.updateIsRead(this.chatPageInfo.getChatId() + "", "Y");
        if (ChatPageLayoutInstance.getInstance().getChatPageListView() == null && this.chatPageListView != null) {
            this.chatPageListView.setCurrentPage(this.chatPageListView.getCurrentPage());
            ChatPageLayoutInstance.getInstance().init(this.chatPageListView);
            if (this.chatPageListView.getCurrentPage() == 1) {
                refreshListAdapter();
            } else {
                refreshListAdapterWithMultiplePage(this.chatPageListView.getCurrentPage());
            }
        }
        this.sendSMSService.addListener(this.sendSMSListener);
        this.isMediaTransfer = false;
        this.groupCheckCnt = 0;
        if (this.chatPageInfo.getRecipient() != null) {
            updateChatPageUI();
        }
        doResendService();
        this.checkSMSDeliveryServiceHandler.postDelayed(this.checkSMSDeliveryServiceRunnable, 1000);
        super.onResume();
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle bundle) {
        if (this.isEmojiKeyboardVisible) {
            dismissDialog();
        }
        super.onSaveInstanceState(bundle);
    }

    public void onScroll(AbsListView absListView, int i, int i2, int i3) {
        checkTopAndBottom();
        if (i3 <= 0) {
            return;
        }
        if (i > 0) {
            int unreadMessageId = this.messageAdapter.getUnreadMessageId();
            if (unreadMessageId != -1 && !this.isAllRead) {
                int messageIdByPosition = this.messageAdapter.getMessageIdByPosition(i);
                if (messageIdByPosition == unreadMessageId) {
                    if (this.topUnreadNotice.isShown()) {
                        this.topUnreadNotice.setVisibility(8);
                    }
                    this.firstUnreadMessageId = -1;
                    this.isAllRead = true;
                } else if (!this.isAllRead && messageIdByPosition > unreadMessageId && !this.topUnreadNotice.isShown()) {
                    this.topUnreadNotice.setVisibility(0);
                }
            }
        } else {
            this.messageAdapter.getMessageIdByPosition(i);
            if (this.topUnreadNotice.isShown()) {
                this.topUnreadNotice.setVisibility(8);
            }
        }
    }

    public void onScrollStateChanged(AbsListView absListView, int i) {
        this.currentScrollState = i;
        checkTopAndBottom();
    }

    public void showDialog() {
        FragmentTransaction beginTransaction = getSupportFragmentManager().beginTransaction();
        Fragment findFragmentByTag = getSupportFragmentManager().findFragmentByTag("dialog");
        if (findFragmentByTag != null) {
            beginTransaction.remove(findFragmentByTag);
        }
        beginTransaction.addToBackStack((String) null);
        EmojiKeyboardFragment.newInstance(this.keyboardHeight).show(beginTransaction, "dialog");
        this.txt_msg.requestFocus();
        this.isEmojiKeyboardVisible = true;
        this.openEmojiKeyboard = false;
    }
}
