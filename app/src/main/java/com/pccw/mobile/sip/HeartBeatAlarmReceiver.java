package com.pccw.mobile.sip;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.pccw.mobile.sip.service.MobileSipService;

public class HeartBeatAlarmReceiver extends BroadcastReceiver {
    public void onReceive(final Context context, Intent intent) {
        MobileSipService.getInstance().getBackendHandler().post(new Runnable() {
            public void run() {
                MobileSipService.getInstance().doHeartBeat(context);
            }
        });
    }
}
