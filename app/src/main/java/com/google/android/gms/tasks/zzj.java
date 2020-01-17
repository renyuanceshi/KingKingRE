package com.google.android.gms.tasks;

final class zzj implements Runnable {
    private /* synthetic */ Task zzbLR;
    private /* synthetic */ zzi zzbLZ;

    zzj(zzi zzi, Task task) {
        this.zzbLZ = zzi;
        this.zzbLR = task;
    }

    public final void run() {
        synchronized (this.zzbLZ.mLock) {
            if (this.zzbLZ.zzbLY != null) {
                this.zzbLZ.zzbLY.onSuccess(this.zzbLR.getResult());
            }
        }
    }
}
