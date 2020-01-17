package com.google.android.gms.internal;

final class zzbej implements Runnable {
    private /* synthetic */ zzctw zzaDx;
    private /* synthetic */ zzbei zzaEY;

    zzbej(zzbei zzbei, zzctw zzctw) {
        this.zzaEY = zzbei;
        this.zzaDx = zzctw;
    }

    public final void run() {
        this.zzaEY.zzc(this.zzaDx);
    }
}
