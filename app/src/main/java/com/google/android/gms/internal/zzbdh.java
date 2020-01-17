package com.google.android.gms.internal;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zzal;
import java.util.Collections;

final class zzbdh implements Runnable {
    private /* synthetic */ ConnectionResult zzaEw;
    private /* synthetic */ zzbdg zzaEy;

    zzbdh(zzbdg zzbdg, ConnectionResult connectionResult) {
        this.zzaEy = zzbdg;
        this.zzaEw = connectionResult;
    }

    public final void run() {
        if (this.zzaEw.isSuccess()) {
            boolean unused = this.zzaEy.zzaEx = true;
            if (this.zzaEy.zzaCy.zzmv()) {
                this.zzaEy.zzqz();
            } else {
                this.zzaEy.zzaCy.zza((zzal) null, Collections.emptySet());
            }
        } else {
            ((zzbdc) this.zzaEy.zzaEm.zzaCB.get(this.zzaEy.zzaAK)).onConnectionFailed(this.zzaEw);
        }
    }
}
