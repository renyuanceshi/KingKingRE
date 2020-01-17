package com.google.android.gms.dynamic;

import android.os.Bundle;

final class zzd implements zzi {
    private /* synthetic */ zza zzaSv;
    private /* synthetic */ Bundle zzxX;

    zzd(zza zza, Bundle bundle) {
        this.zzaSv = zza;
        this.zzxX = bundle;
    }

    public final int getState() {
        return 1;
    }

    public final void zzb(LifecycleDelegate lifecycleDelegate) {
        this.zzaSv.zzaSr.onCreate(this.zzxX);
    }
}
