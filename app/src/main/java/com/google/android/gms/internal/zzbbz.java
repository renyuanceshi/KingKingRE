package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.DeadObjectException;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.common.internal.zzbx;

public final class zzbbz implements zzbcv {
    /* access modifiers changed from: private */
    public final zzbcw zzaCZ;
    private boolean zzaDa = false;

    public zzbbz(zzbcw zzbcw) {
        this.zzaCZ = zzbcw;
    }

    public final void begin() {
    }

    public final void connect() {
        if (this.zzaDa) {
            this.zzaDa = false;
            this.zzaCZ.zza((zzbcx) new zzbcb(this, this));
        }
    }

    public final boolean disconnect() {
        if (this.zzaDa) {
            return false;
        }
        if (this.zzaCZ.zzaCl.zzqf()) {
            this.zzaDa = true;
            for (zzber zzqK : this.zzaCZ.zzaCl.zzaDK) {
                zzqK.zzqK();
            }
            return false;
        }
        this.zzaCZ.zzg((ConnectionResult) null);
        return true;
    }

    public final void onConnected(Bundle bundle) {
    }

    public final void onConnectionSuspended(int i) {
        this.zzaCZ.zzg((ConnectionResult) null);
        this.zzaCZ.zzaDY.zze(i, this.zzaDa);
    }

    public final void zza(ConnectionResult connectionResult, Api<?> api, boolean z) {
    }

    public final <A extends Api.zzb, R extends Result, T extends zzbax<R, A>> T zzd(T t) {
        return zze(t);
    }

    public final <A extends Api.zzb, T extends zzbax<? extends Result, A>> T zze(T t) {
        try {
            this.zzaCZ.zzaCl.zzaDL.zzb(t);
            zzbco zzbco = this.zzaCZ.zzaCl;
            Api.zze zze = zzbco.zzaDF.get(t.zzpd());
            zzbo.zzb(zze, (Object) "Appropriate Api was not requested.");
            if (zze.isConnected() || !this.zzaCZ.zzaDU.containsKey(t.zzpd())) {
                if (zze instanceof zzbx) {
                    zzbx zzbx = (zzbx) zze;
                    zze = null;
                }
                t.zzb(zze);
                return t;
            }
            t.zzr(new Status(17));
            return t;
        } catch (DeadObjectException e) {
            this.zzaCZ.zza((zzbcx) new zzbca(this, this));
        }
    }

    /* access modifiers changed from: package-private */
    public final void zzpU() {
        if (this.zzaDa) {
            this.zzaDa = false;
            this.zzaCZ.zzaCl.zzaDL.release();
            disconnect();
        }
    }
}
