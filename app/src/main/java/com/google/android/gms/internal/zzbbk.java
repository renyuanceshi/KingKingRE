package com.google.android.gms.internal;

final class zzbbk implements Runnable {
    private /* synthetic */ zzbbj zzaCx;

    zzbbk(zzbbj zzbbj) {
        this.zzaCx = zzbbj;
    }

    public final void run() {
        this.zzaCx.zzaCv.lock();
        try {
            this.zzaCx.zzpF();
        } finally {
            this.zzaCx.zzaCv.unlock();
        }
    }
}
