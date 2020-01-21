package org.linphone;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.preference.PreferenceManager;
import com.pccw.mobile.sip.service.MobileSipService;

public class BootReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).edit().putBoolean(context.getString(R.string.pref_debug_key), false).commit();
        PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).edit().putString(context.getString(R.string.pref_tunnel_mode_key), context.getString(R.string.pref_tunnel_mode_production)).commit();
        if (PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getBoolean(context.getString(R.string.pref_autostart_key), false) && MobileSipService.getInstance().isAutoStart(context)) {
            MobileSipService.getInstance().httpsLogin(context, new Handler());
        }
    }
}
