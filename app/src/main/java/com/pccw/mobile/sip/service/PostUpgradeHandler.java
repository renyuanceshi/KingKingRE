package com.pccw.mobile.sip.service;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import com.pccw.mobile.sip.ClientStateManager;

public class PostUpgradeHandler extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        if (intent != null && intent.getAction().equals("android.intent.action.PACKAGE_REPLACED") && intent.getData() != null && intent.getData().getScheme() != null && intent.getData().getScheme().equals("package") && intent.getData().getSchemeSpecificPart() != null && intent.getData().getSchemeSpecificPart().equals(context.getPackageName())) {
            ClientStateManager.setPostpaidTcAccepted(context.getApplicationContext(), false);
            ClientStateManager.setPrepaidTcAccepted(context.getApplicationContext(), false);
            if (context.getSharedPreferences("RemovedShortcut", 0).getBoolean("check", true)) {
                Intent intent2 = new Intent("android.intent.action.MAIN");
                intent2.addCategory("android.intent.category.LAUNCHER");
                intent2.setComponent(new ComponentName(context.getPackageName(), "com.pccw.mobile.sip.TAndCActivity"));
                Intent intent3 = new Intent("com.android.launcher.action.UNINSTALL_SHORTCUT");
                intent3.putExtra("android.intent.extra.shortcut.NAME", "Roam Save");
                intent3.putExtra("android.intent.extra.shortcut.INTENT", intent2);
                context.sendBroadcast(intent3);
                context.getSharedPreferences("RemovedShortcut", 0).edit().putBoolean("check", false).commit();
            }
        }
    }
}
