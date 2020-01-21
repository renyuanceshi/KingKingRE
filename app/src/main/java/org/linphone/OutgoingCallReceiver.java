package org.linphone;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.preference.PreferenceManager;

public class OutgoingCallReceiver extends BroadcastReceiver {
    public static String TAG = ";0000000";
    public static String key_always = "alway_intercept_out_call";
    public static String key_off = "off";
    public static String key_on_demand = "ask_for_outcall_interception";

    public void onReceive(Context context, Intent intent) {
        String stringExtra = intent.getStringExtra("android.intent.extra.PHONE_NUMBER");
        if (stringExtra != null && !stringExtra.contains("#")) {
            if (stringExtra.contains(TAG)) {
                setResult(-1, stringExtra.replace(TAG, ""), (Bundle) null);
            } else if (!LinphoneService.isready() || LinphoneService.instance().getLinphoneCore().getDefaultProxyConfig() != null) {
                setResult(-1, (String) null, (Bundle) null);
                Intent intent2 = new Intent();
                if (PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getString(context.getString(R.string.pref_handle_outcall_key), key_on_demand).equals(key_always)) {
                    intent2.setClass(context, LinphoneActivity.class);
                } else {
                    intent2.setAction("android.intent.action.CALL");
                }
                intent2.setData(Uri.parse("tel://" + stringExtra + TAG));
                intent2.addFlags(268435456);
                context.startActivity(intent2);
            }
        }
    }
}
