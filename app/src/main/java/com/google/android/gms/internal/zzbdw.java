package com.google.android.gms.internal;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.google.android.gms.common.internal.zzbo;

final class zzbdw extends Handler {
    private /* synthetic */ zzbdv zzaEO;

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public zzbdw(zzbdv zzbdv, Looper looper) {
        super(looper);
        this.zzaEO = zzbdv;
    }

    public final void handleMessage(Message message) {
        boolean z = true;
        if (message.what != 1) {
            z = false;
        }
        zzbo.zzaf(z);
        this.zzaEO.zzb((zzbdy) message.obj);
    }
}
