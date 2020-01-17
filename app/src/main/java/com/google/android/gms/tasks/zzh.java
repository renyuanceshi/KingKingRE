package com.google.android.gms.tasks;

final class zzh implements Runnable {
    private /* synthetic */ Task zzbLR;
    private /* synthetic */ zzg zzbLX;

    zzh(zzg zzg, Task task) {
        this.zzbLX = zzg;
        this.zzbLR = task;
    }

    public final void run() {
        synchronized (this.zzbLX.mLock) {
            if (this.zzbLX.zzbLW != null) {
                this.zzbLX.zzbLW.onFailure(this.zzbLR.getException());
            }
        }
    }
}
