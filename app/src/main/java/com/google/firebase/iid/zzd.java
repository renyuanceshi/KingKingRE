package com.google.firebase.iid;

import android.content.BroadcastReceiver;
import android.content.Intent;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

final class zzd {
    final Intent intent;
    private final BroadcastReceiver.PendingResult zzcke;
    private boolean zzckf = false;
    private final ScheduledFuture<?> zzckg;

    zzd(Intent intent2, BroadcastReceiver.PendingResult pendingResult, ScheduledExecutorService scheduledExecutorService) {
        this.intent = intent2;
        this.zzcke = pendingResult;
        this.zzckg = scheduledExecutorService.schedule(new zze(this, intent2), 9500, TimeUnit.MILLISECONDS);
    }

    /* access modifiers changed from: package-private */
    public final void finish() {
        synchronized (this) {
            if (!this.zzckf) {
                this.zzcke.finish();
                this.zzckg.cancel(false);
                this.zzckf = true;
            }
        }
    }
}
