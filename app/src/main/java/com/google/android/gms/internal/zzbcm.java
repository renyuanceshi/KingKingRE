package com.google.android.gms.internal;

import android.support.annotation.WorkerThread;

abstract class zzbcm implements Runnable {
    private /* synthetic */ zzbcc zzaDp;

    private zzbcm(zzbcc zzbcc) {
        this.zzaDp = zzbcc;
    }

    /* synthetic */ zzbcm(zzbcc zzbcc, zzbcd zzbcd) {
        this(zzbcc);
    }

    @WorkerThread
    public void run() {
        this.zzaDp.zzaCv.lock();
        try {
            if (!Thread.interrupted()) {
                zzpV();
                this.zzaDp.zzaCv.unlock();
            }
        } catch (RuntimeException e) {
            this.zzaDp.zzaCZ.zza(e);
        } finally {
            this.zzaDp.zzaCv.unlock();
        }
    }

    /* access modifiers changed from: protected */
    @WorkerThread
    public abstract void zzpV();
}
