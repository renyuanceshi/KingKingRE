package com.google.android.gms.internal;

import android.app.Activity;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.common.util.zza;

public class zzbbv extends zzbaz {
    private zzbda zzaAN;
    private final zza<zzbas<?>> zzaCW = new zza<>();

    private zzbbv(zzbds zzbds) {
        super(zzbds);
        this.zzaEG.zza("ConnectionlessLifecycleHelper", (zzbdr) this);
    }

    public static void zza(Activity activity, zzbda zzbda, zzbas<?> zzbas) {
        zzn(activity);
        zzbds zzn = zzn(activity);
        zzbbv zzbbv = (zzbbv) zzn.zza("ConnectionlessLifecycleHelper", zzbbv.class);
        if (zzbbv == null) {
            zzbbv = new zzbbv(zzn);
        }
        zzbbv.zzaAN = zzbda;
        zzbo.zzb(zzbas, (Object) "ApiKey cannot be null");
        zzbbv.zzaCW.add(zzbas);
        zzbda.zza(zzbbv);
    }

    private final void zzpS() {
        if (!this.zzaCW.isEmpty()) {
            this.zzaAN.zza(this);
        }
    }

    public final void onResume() {
        super.onResume();
        zzpS();
    }

    public final void onStart() {
        super.onStart();
        zzpS();
    }

    public final void onStop() {
        super.onStop();
        this.zzaAN.zzb(this);
    }

    /* access modifiers changed from: protected */
    public final void zza(ConnectionResult connectionResult, int i) {
        this.zzaAN.zza(connectionResult, i);
    }

    /* access modifiers changed from: package-private */
    public final zza<zzbas<?>> zzpR() {
        return this.zzaCW;
    }

    /* access modifiers changed from: protected */
    public final void zzps() {
        this.zzaAN.zzps();
    }
}
