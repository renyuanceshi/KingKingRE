package com.google.android.gms.tasks;

import java.util.concurrent.Callable;

final class zzo implements Runnable {
    private /* synthetic */ Callable zzZo;
    private /* synthetic */ zzn zzbMi;

    zzo(zzn zzn, Callable callable) {
        this.zzbMi = zzn;
        this.zzZo = callable;
    }

    public final void run() {
        try {
            this.zzbMi.setResult(this.zzZo.call());
        } catch (Exception e) {
            this.zzbMi.setException(e);
        }
    }
}
