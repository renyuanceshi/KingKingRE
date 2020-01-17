package com.google.firebase.iid;

import android.util.Log;

final class zzg implements Runnable {
    private /* synthetic */ zzd zzckj;
    private /* synthetic */ zzf zzckk;

    zzg(zzf zzf, zzd zzd) {
        this.zzckk = zzf;
        this.zzckj = zzd;
    }

    public final void run() {
        if (Log.isLoggable("EnhancedIntentService", 3)) {
            Log.d("EnhancedIntentService", "bg processing of the intent starting now");
        }
        this.zzckk.zzcki.handleIntent(this.zzckj.intent);
        this.zzckj.finish();
    }
}
