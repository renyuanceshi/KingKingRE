package com.google.android.gms.internal;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;

final class zzbcy extends Handler {
    private /* synthetic */ zzbcw zzaEa;

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    zzbcy(zzbcw zzbcw, Looper looper) {
        super(looper);
        this.zzaEa = zzbcw;
    }

    public final void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                ((zzbcx) message.obj).zzc(this.zzaEa);
                return;
            case 2:
                throw ((RuntimeException) message.obj);
            default:
                Log.w("GACStateManager", new StringBuilder(31).append("Unknown message id: ").append(message.what).toString());
                return;
        }
    }
}
