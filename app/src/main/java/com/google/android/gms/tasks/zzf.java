package com.google.android.gms.tasks;

final class zzf implements Runnable {
    private /* synthetic */ Task zzbLR;
    private /* synthetic */ zze zzbLV;

    zzf(zze zze, Task task) {
        this.zzbLV = zze;
        this.zzbLR = task;
    }

    public final void run() {
        synchronized (this.zzbLV.mLock) {
            if (this.zzbLV.zzbLU != null) {
                this.zzbLV.zzbLU.onComplete(this.zzbLR);
            }
        }
    }
}
