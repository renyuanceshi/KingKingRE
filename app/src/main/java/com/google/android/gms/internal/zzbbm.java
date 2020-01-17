package com.google.android.gms.internal;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.common.ConnectionResult;

final class zzbbm implements zzbdp {
    private /* synthetic */ zzbbj zzaCx;

    private zzbbm(zzbbj zzbbj) {
        this.zzaCx = zzbbj;
    }

    /* synthetic */ zzbbm(zzbbj zzbbj, zzbbk zzbbk) {
        this(zzbbj);
    }

    public final void zzc(@NonNull ConnectionResult connectionResult) {
        this.zzaCx.zzaCv.lock();
        try {
            ConnectionResult unused = this.zzaCx.zzaCt = connectionResult;
            this.zzaCx.zzpF();
        } finally {
            this.zzaCx.zzaCv.unlock();
        }
    }

    public final void zze(int i, boolean z) {
        this.zzaCx.zzaCv.lock();
        try {
            if (this.zzaCx.zzaCu) {
                boolean unused = this.zzaCx.zzaCu = false;
                this.zzaCx.zzd(i, z);
                return;
            }
            boolean unused2 = this.zzaCx.zzaCu = true;
            this.zzaCx.zzaCm.onConnectionSuspended(i);
            this.zzaCx.zzaCv.unlock();
        } finally {
            this.zzaCx.zzaCv.unlock();
        }
    }

    public final void zzm(@Nullable Bundle bundle) {
        this.zzaCx.zzaCv.lock();
        try {
            ConnectionResult unused = this.zzaCx.zzaCt = ConnectionResult.zzazX;
            this.zzaCx.zzpF();
        } finally {
            this.zzaCx.zzaCv.unlock();
        }
    }
}
