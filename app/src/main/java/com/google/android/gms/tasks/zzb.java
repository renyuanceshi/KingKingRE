package com.google.android.gms.tasks;

final class zzb implements Runnable {
    private /* synthetic */ Task zzbLR;
    private /* synthetic */ zza zzbLS;

    zzb(zza zza, Task task) {
        this.zzbLS = zza;
        this.zzbLR = task;
    }

    public final void run() {
        try {
            this.zzbLS.zzbLQ.setResult(this.zzbLS.zzbLP.then(this.zzbLR));
        } catch (RuntimeExecutionException e) {
            if (e.getCause() instanceof Exception) {
                this.zzbLS.zzbLQ.setException((Exception) e.getCause());
            } else {
                this.zzbLS.zzbLQ.setException(e);
            }
        } catch (Exception e2) {
            this.zzbLS.zzbLQ.setException(e2);
        }
    }
}
