package com.pccw.sms.adapter;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.ColorFilter;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;
import com.pccw.android.common.widget.ImageLoader;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.FormatUtil;
import com.pccw.sms.bean.MessageItem;
import com.pccw.sms.bean.SMSConstants;
import com.pccw.sms.service.ConversationParticipantItemService;
import com.pccw.sms.service.MessageItemService;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

public class MessageAdapter extends BaseAdapter implements Filterable {
    public static int audioPlayingMessageId = -1;
    public static int targetingMsgId = -1;
    public static ImageView targetingMsgStatusImg = null;
    public static ProgressBar targetingProgressBar = null;
    private String TAG = "MessageAdapter";
    /* access modifiers changed from: private */
    public MessageAdapterActionResponse adapterActionListener;
    private String chatType;
    private ImageView currentImageView = null;
    Context mContext;
    private Filter mFilter;
    /* access modifiers changed from: private */
    public List<MessageItem> mFilteredMsgList;
    private ImageLoader mImageLoader;
    private HashMap<String, String> mMemoryNameCache;
    /* access modifiers changed from: private */
    public List<MessageItem> mMsgList;
    MessageItemService messageItemService;
    private String prevDate = null;
    private int prevPosition = -1;
    private int tempUnreadMessageHeaderId = -1;
    private int todayPostNumber = -1;
    private int unreadMessageId = -1;

    public interface MessageAdapterActionResponse {
        void onAdapterItemRefresh(int i);

        void onMessageItemClicked(String str, String str2, int i);

        void onMessageItemClicked(String str, String str2, int i, SeekBar seekBar, ImageView imageView);

        void onMessageItemDeleted(int i);

        void onMessageResent(int i);
    }

    private class MessageView {
        ImageView CallImg;
        RelativeLayout Header;
        TextView LastMsgTime;
        TextView MsgContent;
        LinearLayout MsgData;
        TextView MsgDate;
        TextView MsgSender;
        ImageView MsgStatusImg;
        TextView MsgSystem;
        RelativeLayout SystemBubble;
        LinearLayout UnreadMessage;
        TextView UnreadMessageTxt;
        RelativeLayout bubble;

        private MessageView() {
        }
    }

    public MessageAdapter(Context context, List<MessageItem> list, String str, MessageAdapterActionResponse messageAdapterActionResponse) {
        this.mContext = context;
        this.mMsgList = list;
        this.mFilteredMsgList = list;
        this.chatType = str;
        this.adapterActionListener = messageAdapterActionResponse;
        this.messageItemService = new MessageItemService(this.mContext);
        this.mMemoryNameCache = new HashMap<>();
        this.mImageLoader = new ImageLoader(context);
    }

    private void cleanView(MessageView messageView) {
        messageView.MsgSender.setVisibility(8);
        messageView.MsgContent.setVisibility(8);
        messageView.CallImg.setVisibility(8);
        messageView.SystemBubble.setVisibility(8);
        messageView.bubble.setVisibility(0);
        messageView.LastMsgTime.setVisibility(0);
        messageView.MsgStatusImg.setVisibility(0);
    }

    public static ColorFilter colorFilterMap(String str) {
        return SMSConstants.colorFilterMap.get(str);
    }

    private float convertDPtoPixel(int i) {
        return TypedValue.applyDimension(1, (float) i, this.mContext.getResources().getDisplayMetrics());
    }

    /* access modifiers changed from: private */
    @TargetApi(11)
    public void copyTextMessageToClipBoard(int i) {
        ((ClipboardManager) this.mContext.getSystemService("clipboard")).setPrimaryClip(ClipData.newPlainText("KKIMText", new MessageItemService(this.mContext).getMessageStoreByMsgId(i).getTextMessage()));
        Toast.makeText(this.mContext, this.mContext.getString(R.string.chat_page_long_click_copy_ok), 0).show();
    }

    /* access modifiers changed from: private */
    public void deleteMessageWithMsgId(int i) {
        this.messageItemService.deleteMessageByMsgId(String.valueOf(i));
        this.adapterActionListener.onMessageItemDeleted(i);
    }

    private float getDimenResource(int i) {
        return this.mContext.getResources().getDimension(i);
    }

    private boolean isCallType(String str) {
        return SMSConstants.MESSAGE_TYPE_INCOMING_CALL.equals(str) || SMSConstants.MESSAGE_TYPE_OUTGOING_CALL.equals(str) || SMSConstants.MESSAGE_TYPE_MISSING_CALL.equals(str);
    }

    private String loadSenderName(String str) {
        String str2 = this.mMemoryNameCache.get(str);
        if (str2 != null && !"".equals(str2)) {
            return str2;
        }
        String groupParticipantName = new ConversationParticipantItemService(this.mContext).getGroupParticipantName(str);
        this.mMemoryNameCache.put(str, groupParticipantName);
        return groupParticipantName;
    }

    private View.OnLongClickListener messageLongClickListner(int i, String str, String str2, String str3) {
        final int i2 = i;
        final String str4 = str;
        final String str5 = str2;
        final String str6 = str3;
        return new View.OnLongClickListener() {
            public boolean onLongClick(View view) {
                Log.d("KKIM", "Message Item OnLongClick = " + i2);
                MessageAdapter.this.popupMessageSelection(i2, str4, str5, str6);
                return true;
            }
        };
    }

    /* access modifiers changed from: private */
    public void popupMessageSelection(final int i, String str, String str2, String str3) {
        String[] strArr = str.equals(SMSConstants.MESSAGE_TYPE_TEXT) ? (str3.equals(SMSConstants.MESSAGE_STATUS_FAILED) || str3.equals(SMSConstants.MESSAGE_STATUS_FAILED_RESEND)) ? new String[]{this.mContext.getResources().getString(R.string.chat_page_long_click_delete), this.mContext.getResources().getString(R.string.chat_page_long_click_copy), this.mContext.getResources().getString(R.string.chat_page_long_click_resent)} : new String[]{this.mContext.getResources().getString(R.string.chat_page_long_click_delete), this.mContext.getResources().getString(R.string.chat_page_long_click_copy)} : new String[]{this.mContext.getResources().getString(R.string.chat_page_long_click_delete)};
        AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
        builder.setCancelable(true);
        if (str3.equals(SMSConstants.MESSAGE_STATUS_FAILED) || str3.equals(SMSConstants.MESSAGE_STATUS_FAILED_RESEND)) {
            builder.setAdapter(new ArrayAdapter(this.mContext, R.layout.custom_select_dialog_item, strArr), new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    switch (i) {
                        case 0:
                            MessageAdapter.this.deleteMessageWithMsgId(i);
                            return;
                        case 1:
                            MessageAdapter.this.copyTextMessageToClipBoard(i);
                            return;
                        case 2:
                            MessageAdapter.this.adapterActionListener.onMessageResent(i);
                            return;
                        default:
                            return;
                    }
                }
            });
        } else {
            builder.setAdapter(new ArrayAdapter(this.mContext, R.layout.custom_select_dialog_item, strArr), new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    switch (i) {
                        case 0:
                            MessageAdapter.this.deleteMessageWithMsgId(i);
                            return;
                        case 1:
                            MessageAdapter.this.copyTextMessageToClipBoard(i);
                            return;
                        default:
                            return;
                    }
                }
            });
        }
        AlertDialog create = builder.create();
        create.setCanceledOnTouchOutside(true);
        create.show();
    }

    private void removeTextBubbleView(MessageView messageView) {
        messageView.bubble.setVisibility(8);
        messageView.LastMsgTime.setVisibility(8);
        messageView.MsgStatusImg.setVisibility(8);
    }

    private String setDate(MessageView messageView, MessageItem messageItem, int i) {
        boolean z;
        String convertDateToStrOnPhoneTimeZone = FormatUtil.convertDateToStrOnPhoneTimeZone(messageItem.getLastMsgTime(), "d MMM yyyy");
        if (convertDateToStrOnPhoneTimeZone.equals(FormatUtil.convertDateToStrOnPhoneTimeZone(new Date(), "d MMM yyyy"))) {
            if (this.todayPostNumber == -1) {
                if (i != 0 && !convertDateToStrOnPhoneTimeZone.equals(FormatUtil.convertDateToStrOnPhoneTimeZone(this.mMsgList.get(i - 1).getLastMsgTime(), "d MMM yyyy"))) {
                    String string = this.mContext.getResources().getString(R.string.chat_date_today);
                    this.todayPostNumber = i;
                    z = true;
                    convertDateToStrOnPhoneTimeZone = string;
                }
                z = false;
            } else {
                if (i == this.todayPostNumber) {
                    z = true;
                    convertDateToStrOnPhoneTimeZone = this.mContext.getResources().getString(R.string.chat_date_today);
                }
                z = false;
            }
        } else if (this.prevPosition >= i) {
            if (this.prevPosition > i) {
                if (i == 0) {
                    z = true;
                } else if (!convertDateToStrOnPhoneTimeZone.equals(FormatUtil.convertDateToStrOnPhoneTimeZone(this.mMsgList.get(i - 1).getLastMsgTime(), "d MMM yyyy"))) {
                    z = true;
                }
            }
            z = false;
        } else if (this.prevDate == null || this.prevDate.equals(convertDateToStrOnPhoneTimeZone) || i - 1 != this.prevPosition) {
            if (this.prevPosition == -1 && i == 0) {
                z = true;
            }
            z = false;
        } else {
            z = true;
        }
        this.prevPosition = i;
        this.prevDate = convertDateToStrOnPhoneTimeZone;
        if (z) {
            return convertDateToStrOnPhoneTimeZone;
        }
        return null;
    }

    public void clearAdapterCache() {
        this.mImageLoader.clearCache();
        this.mMemoryNameCache.clear();
        this.unreadMessageId = -1;
    }

    public int getCount() {
        return this.mFilteredMsgList.size();
    }

    public Filter getFilter() {
        if (this.mFilter == null) {
            this.mFilter = new Filter() {
                /* access modifiers changed from: protected */
                @SuppressLint({"DefaultLocale"})
                public Filter.FilterResults performFiltering(CharSequence charSequence) {
                    Filter.FilterResults filterResults = new Filter.FilterResults();
                    if (charSequence == null || charSequence.length() == 0) {
                        filterResults.values = MessageAdapter.this.mMsgList;
                        filterResults.count = MessageAdapter.this.mMsgList.size();
                    } else {
                        ArrayList arrayList = new ArrayList();
                        for (MessageItem messageItem : MessageAdapter.this.mMsgList) {
                            if (messageItem.getContent().toLowerCase(Locale.getDefault()).contains(charSequence)) {
                                arrayList.add(messageItem);
                            }
                        }
                        filterResults.values = arrayList;
                        filterResults.count = arrayList.size();
                    }
                    return filterResults;
                }

                /* access modifiers changed from: protected */
                public void publishResults(CharSequence charSequence, Filter.FilterResults filterResults) {
                    List unused = MessageAdapter.this.mFilteredMsgList = (List) filterResults.values;
                    MessageAdapter.this.notifyDataSetChanged();
                }
            };
        }
        return this.mFilter;
    }

    public MessageItem getItem(int i) {
        return this.mFilteredMsgList.get(i);
    }

    public long getItemId(int i) {
        return this.mMsgList.get(i).getChatId();
    }

    public int getMessageIdByPosition(int i) {
        MessageItem messageItem = null;
        if (!(this.mMsgList == null || this.mMsgList.size() == 0)) {
            messageItem = this.mMsgList.get(i);
        }
        if (messageItem != null) {
            return messageItem.getMsgId();
        }
        return -1;
    }

    public int getPositionByMessageId(int i) {
        int i2 = 0;
        for (MessageItem msgId : this.mMsgList) {
            if (msgId.getMsgId() == i) {
                return i2;
            }
            i2++;
        }
        return 0;
    }

    public ImageView getTargetingMsgStatusImg() {
        Log.w("Progress", "targetingMsgStatusImg null? " + (targetingMsgStatusImg == null));
        return targetingMsgStatusImg;
    }

    public ProgressBar getTargetingProgressBar() {
        Log.w("Progress", "targetingProgressBar null? " + (targetingProgressBar == null));
        return targetingProgressBar;
    }

    public int getTempporaryMessageHeader() {
        return this.tempUnreadMessageHeaderId;
    }

    public int getTopMessageId() {
        return this.mMsgList.get(0).getMsgId();
    }

    public int getUnreadMessageId() {
        return this.unreadMessageId;
    }

    /* JADX WARNING: Can't fix incorrect switch cases order */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public android.view.View getView(int r13, android.view.View r14, android.view.ViewGroup r15) {
        /*
            r12 = this;
            r2 = 0
            r4 = 0
            java.util.List<com.pccw.sms.bean.MessageItem> r0 = r12.mMsgList
            java.lang.Object r0 = r0.get(r13)
            com.pccw.sms.bean.MessageItem r0 = (com.pccw.sms.bean.MessageItem) r0
            android.content.Context r1 = r12.mContext
            java.lang.String r3 = "layout_inflater"
            java.lang.Object r1 = r1.getSystemService(r3)
            android.view.LayoutInflater r1 = (android.view.LayoutInflater) r1
            r3 = 0
            if (r14 == 0) goto L_0x0022
            int r2 = r0.getDirection()
            switch(r2) {
                case 0: goto L_0x0256;
                case 1: goto L_0x0256;
                case 2: goto L_0x0256;
                default: goto L_0x001e;
            }
        L_0x001e:
            r2 = r4
        L_0x001f:
            if (r2 == 0) goto L_0x0022
            r3 = 1
        L_0x0022:
            if (r3 != 0) goto L_0x0423
            r2 = 2130968657(0x7f040051, float:1.7545974E38)
            r3 = 0
            android.view.View r14 = r1.inflate(r2, r15, r3)
            com.pccw.sms.adapter.MessageAdapter$MessageView r2 = new com.pccw.sms.adapter.MessageAdapter$MessageView
            r1 = 0
            r2.<init>()
            r1 = 2131624311(0x7f0e0177, float:1.8875798E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.RelativeLayout r1 = (android.widget.RelativeLayout) r1
            r2.bubble = r1
            r1 = 2131624314(0x7f0e017a, float:1.8875804E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.TextView r1 = (android.widget.TextView) r1
            r2.MsgContent = r1
            r1 = 2131624312(0x7f0e0178, float:1.88758E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.TextView r1 = (android.widget.TextView) r1
            r2.MsgSender = r1
            r1 = 2131624317(0x7f0e017d, float:1.887581E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.ImageView r1 = (android.widget.ImageView) r1
            r2.MsgStatusImg = r1
            r1 = 2131624316(0x7f0e017c, float:1.8875808E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.TextView r1 = (android.widget.TextView) r1
            r2.LastMsgTime = r1
            r1 = 2131624308(0x7f0e0174, float:1.8875792E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.RelativeLayout r1 = (android.widget.RelativeLayout) r1
            r2.Header = r1
            r1 = 2131624309(0x7f0e0175, float:1.8875794E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.TextView r1 = (android.widget.TextView) r1
            r2.MsgDate = r1
            r1 = 2131624313(0x7f0e0179, float:1.8875802E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.ImageView r1 = (android.widget.ImageView) r1
            r2.CallImg = r1
            r1 = 2131624315(0x7f0e017b, float:1.8875806E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.LinearLayout r1 = (android.widget.LinearLayout) r1
            r2.MsgData = r1
            r1 = 2131624306(0x7f0e0172, float:1.8875788E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.LinearLayout r1 = (android.widget.LinearLayout) r1
            r2.UnreadMessage = r1
            r1 = 2131624307(0x7f0e0173, float:1.887579E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.TextView r1 = (android.widget.TextView) r1
            r2.UnreadMessageTxt = r1
            r1 = 2131624310(0x7f0e0176, float:1.8875796E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.RelativeLayout r1 = (android.widget.RelativeLayout) r1
            r2.SystemBubble = r1
            r1 = 2131624062(0x7f0e007e, float:1.8875293E38)
            android.view.View r1 = r14.findViewById(r1)
            android.widget.TextView r1 = (android.widget.TextView) r1
            r2.MsgSystem = r1
            r1 = 2130968657(0x7f040051, float:1.7545974E38)
            r14.setTag(r1, r2)
            r1 = r2
        L_0x00c8:
            android.widget.RelativeLayout$LayoutParams r2 = new android.widget.RelativeLayout$LayoutParams
            r3 = -2
            r4 = -2
            r2.<init>(r3, r4)
            android.widget.RelativeLayout$LayoutParams r3 = new android.widget.RelativeLayout$LayoutParams
            r4 = -2
            r5 = -2
            r3.<init>(r4, r5)
            android.widget.RelativeLayout$LayoutParams r4 = new android.widget.RelativeLayout$LayoutParams
            r5 = -2
            r6 = -2
            r4.<init>(r5, r6)
            android.widget.RelativeLayout$LayoutParams r5 = new android.widget.RelativeLayout$LayoutParams
            int r6 = com.pccw.sms.bean.SMSConstants.MEDIA_IMAGE_THUMBNAIL_DIMENSIONS
            r7 = -2
            r5.<init>(r6, r7)
            r5 = 2131230841(0x7f080079, float:1.8077746E38)
            float r5 = r12.getDimenResource(r5)
            int r5 = (int) r5
            r6 = 2131230839(0x7f080077, float:1.8077742E38)
            float r6 = r12.getDimenResource(r6)
            int r6 = (int) r6
            r7 = 2131230838(0x7f080076, float:1.807774E38)
            float r7 = r12.getDimenResource(r7)
            int r7 = (int) r7
            r12.cleanView(r1)
            int r8 = r0.getDirection()
            if (r8 != 0) goto L_0x026a
            r6 = 0
            r8 = 0
            r9 = 50
            float r9 = r12.convertDPtoPixel(r9)
            int r9 = (int) r9
            r10 = 0
            r2.setMargins(r6, r8, r9, r10)
            r6 = 9
            r2.addRule(r6)
            android.widget.RelativeLayout r6 = r1.bubble
            r8 = 2130838728(0x7f0204c8, float:1.7282447E38)
            r6.setBackgroundResource(r8)
            android.widget.RelativeLayout r6 = r1.bubble
            r6.setLayoutParams(r2)
            android.widget.RelativeLayout r2 = r1.bubble
            r2.setPadding(r7, r5, r7, r5)
            r2 = 42
            float r2 = r12.convertDPtoPixel(r2)
            int r2 = (int) r2
            int r2 = -r2
            r5 = 0
            r6 = 0
            r7 = 0
            r3.setMargins(r2, r5, r6, r7)
            r2 = 15
            r3.addRule(r2)
            r2 = 1
            android.widget.RelativeLayout r5 = r1.bubble
            int r5 = r5.getId()
            r3.addRule(r2, r5)
            android.widget.LinearLayout r2 = r1.MsgData
            r2.setLayoutParams(r3)
            android.widget.ImageView r2 = r1.MsgStatusImg
            r3 = 8
            r2.setVisibility(r3)
            android.widget.TextView r2 = r1.MsgContent
            android.content.Context r3 = r12.mContext
            android.content.res.Resources r3 = r3.getResources()
            r5 = 2131427341(0x7f0b000d, float:1.8476296E38)
            int r3 = r3.getColor(r5)
            r2.setTextColor(r3)
            android.widget.TextView r2 = r1.MsgContent
            r3 = 6
            float r3 = r12.convertDPtoPixel(r3)
            int r3 = (int) r3
            r5 = 0
            r6 = 0
            float r6 = r12.convertDPtoPixel(r6)
            int r6 = (int) r6
            r7 = 0
            r2.setPadding(r3, r5, r6, r7)
            r2 = 6
            r3 = 0
            r5 = 0
            r6 = 0
            r4.setMargins(r2, r3, r5, r6)
        L_0x017f:
            int r2 = r12.unreadMessageId
            r3 = -1
            if (r2 == r3) goto L_0x02e6
            int r2 = r12.unreadMessageId
            int r3 = r0.getMsgId()
            if (r2 != r3) goto L_0x02e6
            android.widget.LinearLayout r2 = r1.UnreadMessage
            r3 = 0
            r2.setVisibility(r3)
            android.widget.TextView r2 = r1.UnreadMessageTxt
            android.content.Context r3 = r12.mContext
            android.content.res.Resources r3 = r3.getResources()
            r4 = 2131165763(0x7f070243, float:1.7945752E38)
            java.lang.String r3 = r3.getString(r4)
            r2.setText(r3)
        L_0x01a4:
            java.lang.String r2 = r0.getMsgType()
            java.lang.String r3 = "group"
            java.lang.String r4 = r12.chatType
            boolean r3 = r3.equals(r4)
            if (r3 == 0) goto L_0x01cb
            int r3 = r0.getDirection()
            if (r3 != 0) goto L_0x01cb
            android.widget.TextView r3 = r1.MsgSender
            r4 = 0
            r3.setVisibility(r4)
            android.widget.TextView r3 = r1.MsgSender
            java.lang.String r4 = r0.getSender()
            java.lang.String r4 = r12.loadSenderName(r4)
            r3.setText(r4)
        L_0x01cb:
            android.widget.TextView r3 = r1.LastMsgTime
            java.util.Date r4 = r0.getLastMsgTime()
            java.lang.String r5 = "HH:mm:ss"
            java.lang.String r4 = com.pccw.mobile.util.FormatUtil.convertDateToStrOnPhoneTimeZone(r4, r5)
            r3.setText(r4)
            java.lang.String r3 = r12.setDate(r1, r0, r13)
            if (r3 == 0) goto L_0x0316
            android.widget.TextView r4 = r1.MsgDate
            r4.setText(r3)
            android.widget.RelativeLayout r3 = r1.Header
            r4 = 0
            r3.setVisibility(r4)
        L_0x01eb:
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_TYPE_TEXT
            boolean r3 = r2.equals(r3)
            if (r3 == 0) goto L_0x031f
            android.widget.TextView r3 = r1.MsgContent
            r4 = 0
            r3.setVisibility(r4)
            android.widget.TextView r3 = r1.MsgContent
            java.lang.String r4 = r0.getContent()
            r3.setText(r4)
        L_0x0202:
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_TYPE_TEXT
            boolean r3 = r2.equals(r3)
            if (r3 == 0) goto L_0x03b7
            android.widget.RelativeLayout r3 = r1.bubble
            int r4 = r0.getMsgId()
            java.lang.String r5 = r0.getContent()
            java.lang.String r6 = r0.getSentStatus()
            android.view.View$OnLongClickListener r4 = r12.messageLongClickListner(r4, r2, r5, r6)
            r3.setOnLongClickListener(r4)
        L_0x021f:
            int r3 = r0.getDirection()
            r4 = 1
            if (r3 != r4) goto L_0x0255
            boolean r2 = r12.isCallType(r2)
            if (r2 != 0) goto L_0x0255
            com.pccw.sms.service.MessageItemService r2 = r12.messageItemService
            int r0 = r0.getMsgId()
            com.pccw.database.entity.MessageStore r0 = r2.getMessageStoreByMsgId(r0)
            java.lang.String r2 = r0.getSentStatus()
            r0 = 0
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_STATUS_DELIVERED
            boolean r3 = r2.equals(r3)
            if (r3 == 0) goto L_0x03bf
            android.content.Context r0 = r12.mContext
            android.content.res.Resources r0 = r0.getResources()
            r2 = 2130838593(0x7f020441, float:1.7282173E38)
            android.graphics.Bitmap r0 = android.graphics.BitmapFactory.decodeResource(r0, r2)
        L_0x0250:
            android.widget.ImageView r1 = r1.MsgStatusImg
            r1.setImageBitmap(r0)
        L_0x0255:
            return r14
        L_0x0256:
            r2 = 2130968657(0x7f040051, float:1.7545974E38)
            java.lang.Object r2 = r14.getTag(r2)
            if (r2 == 0) goto L_0x001e
            r2 = 2130968657(0x7f040051, float:1.7545974E38)
            java.lang.Object r2 = r14.getTag(r2)
            com.pccw.sms.adapter.MessageAdapter$MessageView r2 = (com.pccw.sms.adapter.MessageAdapter.MessageView) r2
            goto L_0x001f
        L_0x026a:
            int r8 = r0.getDirection()
            r9 = 1
            if (r8 != r9) goto L_0x017f
            r8 = 40
            float r8 = r12.convertDPtoPixel(r8)
            int r8 = (int) r8
            r9 = 0
            r10 = 0
            r11 = 0
            r2.setMargins(r8, r9, r10, r11)
            r8 = 11
            r2.addRule(r8)
            android.widget.RelativeLayout r8 = r1.bubble
            r9 = 2130838729(0x7f0204c9, float:1.7282449E38)
            r8.setBackgroundResource(r9)
            android.widget.RelativeLayout r8 = r1.bubble
            r8.setLayoutParams(r2)
            android.widget.RelativeLayout r2 = r1.bubble
            r2.setPadding(r7, r5, r6, r5)
            r2 = 0
            r5 = 0
            r6 = 36
            float r6 = r12.convertDPtoPixel(r6)
            int r6 = (int) r6
            int r6 = -r6
            r7 = 0
            r3.setMargins(r2, r5, r6, r7)
            r2 = 15
            r3.addRule(r2)
            r2 = 0
            android.widget.RelativeLayout r5 = r1.bubble
            int r5 = r5.getId()
            r3.addRule(r2, r5)
            android.widget.LinearLayout r2 = r1.MsgData
            r2.setLayoutParams(r3)
            android.widget.ImageView r2 = r1.MsgStatusImg
            r3 = 0
            r2.setVisibility(r3)
            android.widget.TextView r2 = r1.MsgContent
            android.content.Context r3 = r12.mContext
            android.content.res.Resources r3 = r3.getResources()
            r5 = 2131427350(0x7f0b0016, float:1.8476314E38)
            int r3 = r3.getColor(r5)
            r2.setTextColor(r3)
            android.widget.TextView r2 = r1.MsgContent
            r3 = 0
            r5 = 0
            r6 = 0
            float r6 = r12.convertDPtoPixel(r6)
            int r6 = (int) r6
            r7 = 0
            r2.setPadding(r3, r5, r6, r7)
            r2 = 0
            r3 = 0
            r5 = 4
            r6 = 0
            r4.setMargins(r2, r3, r5, r6)
            goto L_0x017f
        L_0x02e6:
            int r2 = r12.tempUnreadMessageHeaderId
            r3 = -1
            if (r2 == r3) goto L_0x030d
            int r2 = r12.tempUnreadMessageHeaderId
            int r3 = r0.getMsgId()
            if (r2 != r3) goto L_0x030d
            android.widget.LinearLayout r2 = r1.UnreadMessage
            r3 = 0
            r2.setVisibility(r3)
            android.widget.TextView r2 = r1.UnreadMessageTxt
            android.content.Context r3 = r12.mContext
            android.content.res.Resources r3 = r3.getResources()
            r4 = 2131165762(0x7f070242, float:1.794575E38)
            java.lang.String r3 = r3.getString(r4)
            r2.setText(r3)
            goto L_0x01a4
        L_0x030d:
            android.widget.LinearLayout r2 = r1.UnreadMessage
            r3 = 8
            r2.setVisibility(r3)
            goto L_0x01a4
        L_0x0316:
            android.widget.RelativeLayout r3 = r1.Header
            r4 = 8
            r3.setVisibility(r4)
            goto L_0x01eb
        L_0x031f:
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_TYPE_SYSTEM_ADD
            boolean r3 = r2.equals(r3)
            if (r3 != 0) goto L_0x032f
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_TYPE_SYSTEM_DELETE
            boolean r3 = r2.equals(r3)
            if (r3 == 0) goto L_0x0343
        L_0x032f:
            android.widget.RelativeLayout r3 = r1.SystemBubble
            r4 = 0
            r3.setVisibility(r4)
            r12.removeTextBubbleView(r1)
            android.widget.TextView r3 = r1.MsgSystem
            java.lang.String r4 = r0.getContent()
            r3.setText(r4)
            goto L_0x0202
        L_0x0343:
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_TYPE_INCOMING_CALL
            boolean r3 = r2.equals(r3)
            if (r3 != 0) goto L_0x0353
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_TYPE_OUTGOING_CALL
            boolean r3 = r2.equals(r3)
            if (r3 == 0) goto L_0x0371
        L_0x0353:
            android.widget.TextView r3 = r1.MsgContent
            r4 = 0
            r3.setVisibility(r4)
            android.widget.ImageView r3 = r1.CallImg
            r4 = 0
            r3.setVisibility(r4)
            android.widget.TextView r3 = r1.MsgContent
            java.lang.String r4 = r0.getContent()
            r3.setText(r4)
            android.widget.ImageView r3 = r1.MsgStatusImg
            r4 = 8
            r3.setVisibility(r4)
            goto L_0x0202
        L_0x0371:
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_TYPE_MISSING_CALL
            boolean r3 = r2.equals(r3)
            if (r3 == 0) goto L_0x03a7
            android.widget.TextView r3 = r1.MsgContent
            r4 = 0
            r3.setVisibility(r4)
            android.widget.ImageView r3 = r1.CallImg
            r4 = 0
            r3.setVisibility(r4)
            android.widget.TextView r3 = r1.MsgContent
            java.lang.String r4 = com.pccw.sms.bean.SMSConstants.MESSAGE_LABEL_MISSING_CALL
            r3.setText(r4)
            android.widget.ImageView r3 = r1.CallImg
            android.content.Context r4 = r12.mContext
            android.content.res.Resources r4 = r4.getResources()
            r5 = 2130838591(0x7f02043f, float:1.7282169E38)
            android.graphics.Bitmap r4 = android.graphics.BitmapFactory.decodeResource(r4, r5)
            r3.setImageBitmap(r4)
            android.widget.ImageView r3 = r1.MsgStatusImg
            r4 = 8
            r3.setVisibility(r4)
            goto L_0x0202
        L_0x03a7:
            android.widget.TextView r3 = r1.MsgContent
            r4 = 8
            r3.setVisibility(r4)
            android.widget.ImageView r3 = r1.CallImg
            r4 = 8
            r3.setVisibility(r4)
            goto L_0x0202
        L_0x03b7:
            android.widget.RelativeLayout r3 = r1.bubble
            r4 = 0
            r3.setOnLongClickListener(r4)
            goto L_0x021f
        L_0x03bf:
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_STATUS_SENT
            boolean r3 = r2.equals(r3)
            if (r3 == 0) goto L_0x03d6
            android.content.Context r0 = r12.mContext
            android.content.res.Resources r0 = r0.getResources()
            r2 = 2130838596(0x7f020444, float:1.7282179E38)
            android.graphics.Bitmap r0 = android.graphics.BitmapFactory.decodeResource(r0, r2)
            goto L_0x0250
        L_0x03d6:
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_STATUS_SENDING
            boolean r3 = r2.equals(r3)
            if (r3 == 0) goto L_0x03ed
            android.content.Context r0 = r12.mContext
            android.content.res.Resources r0 = r0.getResources()
            r2 = 2130838595(0x7f020443, float:1.7282177E38)
            android.graphics.Bitmap r0 = android.graphics.BitmapFactory.decodeResource(r0, r2)
            goto L_0x0250
        L_0x03ed:
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_STATUS_FAILED
            boolean r3 = r2.equals(r3)
            if (r3 != 0) goto L_0x03fd
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_STATUS_FAILED_RESEND
            boolean r3 = r2.equals(r3)
            if (r3 == 0) goto L_0x040c
        L_0x03fd:
            android.content.Context r0 = r12.mContext
            android.content.res.Resources r0 = r0.getResources()
            r2 = 2130838594(0x7f020442, float:1.7282175E38)
            android.graphics.Bitmap r0 = android.graphics.BitmapFactory.decodeResource(r0, r2)
            goto L_0x0250
        L_0x040c:
            java.lang.String r3 = com.pccw.sms.bean.SMSConstants.MESSAGE_STATUS_LOCAL
            boolean r2 = r2.equals(r3)
            if (r2 == 0) goto L_0x0250
            android.content.Context r0 = r12.mContext
            android.content.res.Resources r0 = r0.getResources()
            r2 = 2130838560(0x7f020420, float:1.7282106E38)
            android.graphics.Bitmap r0 = android.graphics.BitmapFactory.decodeResource(r0, r2)
            goto L_0x0250
        L_0x0423:
            r1 = r2
            goto L_0x00c8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.pccw.sms.adapter.MessageAdapter.getView(int, android.view.View, android.view.ViewGroup):android.view.View");
    }

    public void setChatType(String str) {
        this.chatType = str;
    }

    public void setImageLoadPause(boolean z) {
        this.mImageLoader.setPause(z);
    }

    public void setTemporaryMessageHeader(boolean z) {
        if (z) {
            this.tempUnreadMessageHeaderId = getTopMessageId();
        } else {
            this.tempUnreadMessageHeaderId = -1;
        }
    }

    public void setUnreadMessageId(int i) {
        this.unreadMessageId = i;
    }

    public void updateMessageList(List<MessageItem> list) {
        this.mMsgList.clear();
        this.mMsgList.addAll(list);
        this.todayPostNumber = -1;
        this.adapterActionListener.onAdapterItemRefresh(list.size());
        notifyDataSetChanged();
    }
}
