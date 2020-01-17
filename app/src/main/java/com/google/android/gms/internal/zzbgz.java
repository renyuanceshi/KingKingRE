package com.google.android.gms.internal;

import android.content.Context;

public final class zzbgz {
    private static zzbgz zzaKk = new zzbgz();
    private zzbgy zzaKj = null;

    private final zzbgy zzaO(Context context) {
        zzbgy zzbgy;
        synchronized (this) {
            if (this.zzaKj == null) {
                if (context.getApplicationContext() != null) {
                    context = context.getApplicationContext();
                }
                this.zzaKj = new zzbgy(context);
            }
            zzbgy = this.zzaKj;
        }
        return zzbgy;
    }

    public static zzbgy zzaP(Context context) {
        return zzaKk.zzaO(context);
    }
}
