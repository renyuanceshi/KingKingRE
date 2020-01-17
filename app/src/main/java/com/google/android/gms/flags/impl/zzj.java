package com.google.android.gms.flags.impl;

import android.content.Context;
import android.content.SharedPreferences;
import com.google.android.gms.internal.zzcaf;

public final class zzj {
    private static SharedPreferences zzaXQ = null;

    public static SharedPreferences zzaW(Context context) throws Exception {
        SharedPreferences sharedPreferences;
        synchronized (SharedPreferences.class) {
            try {
                if (zzaXQ == null) {
                    zzaXQ = (SharedPreferences) zzcaf.zzb(new zzk(context));
                }
                sharedPreferences = zzaXQ;
            } catch (Throwable th) {
                Class<SharedPreferences> cls = SharedPreferences.class;
                throw th;
            }
        }
        return sharedPreferences;
    }
}
