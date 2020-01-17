package com.pccw.mobile.sip;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.pccw.mobile.sip.service.MobileSipService;

public class RetryAlarmReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        if (MobileSipService.getInstance().shouldRelogin) {
            MobileSipService.getInstance().doRelogin(context);
            MobileSipService.getInstance().loginRetryCount++;
        } else if (MobileSipService.getInstance().shouldAutologin) {
            MobileSipService.getInstance().doAutologin(context);
            MobileSipService.getInstance().loginRetryCount++;
        }
    }
}
