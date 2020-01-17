package com.google.firebase.iid;

import android.os.Binder;
import android.os.Process;
import android.util.Log;

public final class zzf extends Binder {
    /* access modifiers changed from: private */
    public final zzb zzcki;

    zzf(zzb zzb) {
        this.zzcki = zzb;
    }

    public final void zza(zzd zzd) {
        if (Binder.getCallingUid() != Process.myUid()) {
            throw new SecurityException("Binding only allowed within app");
        }
        if (Log.isLoggable("EnhancedIntentService", 3)) {
            Log.d("EnhancedIntentService", "service received new intent via bind strategy");
        }
        if (this.zzcki.zzo(zzd.intent)) {
            zzd.finish();
            return;
        }
        if (Log.isLoggable("EnhancedIntentService", 3)) {
            Log.d("EnhancedIntentService", "intent being queued for bg execution");
        }
        this.zzcki.zzbrV.execute(new zzg(this, zzd));
    }
}
