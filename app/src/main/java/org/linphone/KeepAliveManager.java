package org.linphone;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class KeepAliveManager extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        if (LinphoneService.isready() && !intent.getAction().equalsIgnoreCase("android.intent.action.SCREEN_ON") && intent.getAction().equalsIgnoreCase("android.intent.action.SCREEN_OFF")) {
        }
    }
}
