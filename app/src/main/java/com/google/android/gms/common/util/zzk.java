package com.google.android.gms.common.util;

import android.annotation.TargetApi;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.PowerManager;
import android.os.SystemClock;

public final class zzk {
    private static IntentFilter zzaJO = new IntentFilter("android.intent.action.BATTERY_CHANGED");
    private static long zzaJP;
    private static float zzaJQ = Float.NaN;

    @TargetApi(20)
    public static int zzaK(Context context) {
        int i = 1;
        if (context == null || context.getApplicationContext() == null) {
            return -1;
        }
        Intent registerReceiver = context.getApplicationContext().registerReceiver((BroadcastReceiver) null, zzaJO);
        boolean z = ((registerReceiver == null ? 0 : registerReceiver.getIntExtra("plugged", 0)) & 7) != 0;
        PowerManager powerManager = (PowerManager) context.getSystemService("power");
        if (powerManager == null) {
            return -1;
        }
        int i2 = zzq.zzsd() ? powerManager.isInteractive() : powerManager.isScreenOn() ? 1 : 0;
        if (!z) {
            i = 0;
        }
        return (i2 << 1) | i;
    }

    public static float zzaL(Context context) {
        float f;
        synchronized (zzk.class) {
            try {
                if (SystemClock.elapsedRealtime() - zzaJP >= 60000 || Float.isNaN(zzaJQ)) {
                    Intent registerReceiver = context.getApplicationContext().registerReceiver((BroadcastReceiver) null, zzaJO);
                    if (registerReceiver != null) {
                        zzaJQ = ((float) registerReceiver.getIntExtra("level", -1)) / ((float) registerReceiver.getIntExtra("scale", -1));
                    }
                    zzaJP = SystemClock.elapsedRealtime();
                    f = zzaJQ;
                } else {
                    f = zzaJQ;
                }
            } catch (Throwable th) {
                Class<zzk> cls = zzk.class;
                throw th;
            }
        }
        return f;
    }
}
