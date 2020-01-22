package com.pccw.asynctask;

import android.content.Context;
import android.os.AsyncTask;
import android.text.TextUtils;
import android.util.Log;

import com.pccw.asynctask.listener.ISendSMSAsyncTaskListener;
import com.pccw.asynctask.result.SendSMSAsyncResult;
import com.pccw.exception.NoNetworkException;
import com.pccw.mobile.server.SendSMSSyncApi;
import com.pccw.mobile.server.response.SendSMSResponse;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.util.NetworkUtils;
import com.pccw.sms.bean.MessageItem;
import com.pccw.sms.bean.SMSConstants;
import com.pccw.sms.service.ChatListService;
import com.pccw.sms.service.ChatRecordService;
import com.pccw.sms.service.MessageItemService;
import com.pccw.sms.util.SMSFormatUtil;

import java.util.ArrayList;
import java.util.Date;

public class ResendSMSAsyncTask extends AsyncTask<Integer, Integer, SendSMSAsyncResult> {
    int chatId;
    Context ctx;
    MessageItemService messageItemService;
    ArrayList<String> recipientsList;
    ISendSMSAsyncTaskListener sendSMSAsyncTaskListener;

    public ResendSMSAsyncTask(int i, ISendSMSAsyncTaskListener iSendSMSAsyncTaskListener, Context context) {
        this.ctx = context;
        this.chatId = i;
        this.sendSMSAsyncTaskListener = iSendSMSAsyncTaskListener;
        this.messageItemService = new MessageItemService(context);
        this.recipientsList = SMSFormatUtil.convertSplittingStringToSortedArrayList(new ChatListService(context).getUserNameByChatId(i));
    }

    private SendSMSResponse callSendSMSApi(String str, int i) {
        return (SendSMSResponse) new SendSMSSyncApi(this.ctx, this.recipientsList, str).postToServer();
    }

    private int getLastMessageId(int i) {
        return this.messageItemService.getLastMessage(i).getMessageId();
    }

    private String getTextMessageByMessageId(int i) {
        return new MessageItemService(this.ctx).getMessageStoreByMsgId(i).getTextMessage();
    }

    private int insertMessageRecord(String str, String str2) {
        insertNewRecordIntoMessageStoreTable(str, str2);
        int lastMessageId = getLastMessageId(this.chatId);
        this.sendSMSAsyncTaskListener.onBeforeSend(lastMessageId);
        return lastMessageId;
    }

    private void insertNewRecordIntoMessageStoreTable(String str, String str2) {
        this.messageItemService.addMessageItem(str, SMSFormatUtil.convertListToSortedSplittingString(this.recipientsList), new MessageItem((long) this.chatId, "", str, str2, 1, new Date(), SMSConstants.MESSAGE_TYPE_TEXT, SMSConstants.MESSAGE_STATUS_SENDING, "Y"));
    }

    private void removeFailedMessage(int i) {
        this.messageItemService.deleteMessageByMsgId(String.valueOf(i));
    }

    private void updateLastMessageIdForChatListTable() {
        new ChatRecordService(this.ctx).updateMessageIdForChatList(this.chatId, this.messageItemService.getLastMessage(this.chatId).getMessageId());
    }

    /* access modifiers changed from: protected */
    public SendSMSAsyncResult doInBackground(Integer... numArr) {
        String phoneWithHKCountryCode = ClientStateManager.getPhoneWithHKCountryCode(this.ctx);
        if (TextUtils.isEmpty(phoneWithHKCountryCode)) {
            return null;
        }
        String textMessageByMessageId = getTextMessageByMessageId(numArr[0].intValue());
        removeFailedMessage(numArr[0].intValue());
        int insertMessageRecord = insertMessageRecord(phoneWithHKCountryCode, textMessageByMessageId);
        Log.v("KKSMS", "ResendSMSAsyncService newMsgId=" + insertMessageRecord);
        publishProgress(new Integer[]{Integer.valueOf(insertMessageRecord)});
        SendSMSAsyncResult sendSMSAsyncResult = new SendSMSAsyncResult(callSendSMSApi(textMessageByMessageId, insertMessageRecord), insertMessageRecord);
        updateLastMessageIdForChatListTable();
        return sendSMSAsyncResult;
    }

    /* access modifiers changed from: protected */
    public void onPostExecute(SendSMSAsyncResult sendSMSAsyncResult) {
        if (sendSMSAsyncResult == null) {
            this.sendSMSAsyncTaskListener.onSendFail();
        } else {
            SendSMSResponse resp = sendSMSAsyncResult.getResp();
            if (resp == null || !resp.getResultCode().equals("0")) {
                this.messageItemService.updateSentStatus(sendSMSAsyncResult.getMessageId(), SMSConstants.MESSAGE_STATUS_FAILED);
                this.sendSMSAsyncTaskListener.onSendFail();
            } else {
                this.messageItemService.updateSentStatus(sendSMSAsyncResult.getMessageId(), SMSConstants.MESSAGE_STATUS_SENT);
                this.messageItemService.updateServerMessageId(sendSMSAsyncResult.getMessageId(), resp.getServerMessageId());
                this.sendSMSAsyncTaskListener.onSendSuccess(sendSMSAsyncResult.getMessageId());
            }
        }
        super.onPostExecute(sendSMSAsyncResult);
    }

    /* access modifiers changed from: protected */
    public void onProgressUpdate(Integer... numArr) {
        this.sendSMSAsyncTaskListener.onSending(numArr[0].intValue());
        super.onProgressUpdate(numArr);
    }

    public void resendMessageWithMessageId(int i) throws NoNetworkException {
        if (!NetworkUtils.isWifiAvailable(this.ctx)) {
            throw new NoNetworkException("Error:No Network");
        }
        execute(new Integer[]{Integer.valueOf(i)});
    }
}
