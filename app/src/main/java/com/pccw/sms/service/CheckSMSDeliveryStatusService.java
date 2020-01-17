package com.pccw.sms.service;

import android.content.Context;
import android.util.Log;
import com.pccw.database.entity.MessageStore;
import com.pccw.mobile.server.CheckSMSDeliveryStatusApi;
import com.pccw.mobile.server.api.ApiResponse;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.entity.SMSDeliveryStatus;
import com.pccw.mobile.server.response.CheckSMSDeliveryStatusResponse;
import com.pccw.mobile.sip.util.NetworkUtils;
import com.pccw.sms.bean.SMSConstants;
import com.pccw.sms.service.listener.ICheckSMSDeliveryStatusServiceListener;
import com.pccw.sms.util.SMSFormatUtil;
import java.util.ArrayList;
import java.util.Iterator;

public class CheckSMSDeliveryStatusService implements ApiResponseListener {
    private static final long SET_TO_FAIL_STATUS_INTERVAL = 259200000;
    String chatId;
    ICheckSMSDeliveryStatusServiceListener checkSMSDeliveryStatusServiceListener;
    Context ctx;
    MessageItemService service;

    public CheckSMSDeliveryStatusService(ICheckSMSDeliveryStatusServiceListener iCheckSMSDeliveryStatusServiceListener, String str, Context context) {
        this.checkSMSDeliveryStatusServiceListener = iCheckSMSDeliveryStatusServiceListener;
        this.chatId = str;
        this.ctx = context;
        this.service = new MessageItemService(context);
    }

    public void checkDeliveryStatus() {
        ArrayList<MessageStore> allSentMessageWithChatId = this.service.getAllSentMessageWithChatId(this.chatId);
        ArrayList arrayList = new ArrayList();
        Iterator<MessageStore> it = allSentMessageWithChatId.iterator();
        boolean z = false;
        while (it.hasNext()) {
            MessageStore next = it.next();
            if (System.currentTimeMillis() - next.getSentTime().getTime() > SET_TO_FAIL_STATUS_INTERVAL) {
                Log.i("KKSMS", "Set to fail interval reached, set to fail status");
                this.service.updateSentStatusByServerMessageId(next.getServerMessageId(), SMSConstants.MESSAGE_STATUS_FAILED);
                z = true;
            } else {
                arrayList.add(next.getServerMessageId());
            }
        }
        if (z) {
            this.checkSMSDeliveryStatusServiceListener.onStatusUpdated();
        }
        if (arrayList.isEmpty()) {
            Log.i("KKSMS", "No message in sending status");
        } else if (NetworkUtils.isWifiAvailable(this.ctx)) {
            Log.i("KKSMS", arrayList.size() + " message in sending status and Wi-Fi is reachable call check sms delivery status API");
            new CheckSMSDeliveryStatusApi(this, this.ctx, arrayList).execute(new String[]{""});
        } else {
            Log.i("KKSMS", arrayList.size() + " message in sending status but Wi-Fi is unreachable, don't call check sms delivery status API");
        }
    }

    public void onResponseFailed() {
        this.checkSMSDeliveryStatusServiceListener.onCheckStatusFail();
    }

    public void onResponseSuccess(ApiResponse apiResponse) {
        for (SMSDeliveryStatus next : ((CheckSMSDeliveryStatusResponse) apiResponse).getStatusList()) {
            String messageId = next.getMessageId();
            String status = next.getStatus();
            if (status.contains(",")) {
                ArrayList<String> convertCommaSplittingStringToSortedArrayList = SMSFormatUtil.convertCommaSplittingStringToSortedArrayList(status);
                Iterator<String> it = convertCommaSplittingStringToSortedArrayList.iterator();
                int i = 0;
                int i2 = 0;
                int i3 = 0;
                int i4 = 0;
                while (it.hasNext()) {
                    String next2 = it.next();
                    if (next2.equalsIgnoreCase(CheckSMSDeliveryStatusResponse.DELIVERED)) {
                        i4++;
                    } else if (next2.equalsIgnoreCase(CheckSMSDeliveryStatusResponse.PENDING)) {
                        i3++;
                    } else if (next2.equalsIgnoreCase("Failed")) {
                        i2++;
                    } else if (next2.equalsIgnoreCase(CheckSMSDeliveryStatusResponse.NOT_FOUND)) {
                        i++;
                    }
                }
                if (i4 > 0) {
                    this.service.updateSentStatusByServerMessageId(messageId, SMSConstants.MESSAGE_STATUS_DELIVERED);
                } else if (i3 > 0) {
                    this.service.updateSentStatusByServerMessageId(messageId, SMSConstants.MESSAGE_STATUS_SENT);
                } else if (i2 == convertCommaSplittingStringToSortedArrayList.size()) {
                    this.service.updateSentStatusByServerMessageId(messageId, SMSConstants.MESSAGE_STATUS_FAILED);
                }
            } else if (status.equalsIgnoreCase(CheckSMSDeliveryStatusResponse.DELIVERED)) {
                this.service.updateSentStatusByServerMessageId(messageId, SMSConstants.MESSAGE_STATUS_DELIVERED);
            } else if (status.equalsIgnoreCase(CheckSMSDeliveryStatusResponse.PENDING)) {
                this.service.updateSentStatusByServerMessageId(messageId, SMSConstants.MESSAGE_STATUS_SENT);
            } else if (status.equalsIgnoreCase("Failed")) {
                this.service.updateSentStatusByServerMessageId(messageId, SMSConstants.MESSAGE_STATUS_FAILED);
            } else if (status.equalsIgnoreCase(CheckSMSDeliveryStatusResponse.NOT_FOUND)) {
            }
        }
        this.checkSMSDeliveryStatusServiceListener.onStatusUpdated();
    }
}
