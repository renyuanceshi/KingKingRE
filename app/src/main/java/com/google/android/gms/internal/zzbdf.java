package com.google.android.gms.internal;

import com.google.android.gms.common.ConnectionResult;

final class zzbdf implements Runnable {
    private /* synthetic */ zzbdc zzaEv;
    private /* synthetic */ ConnectionResult zzaEw;

    zzbdf(zzbdc zzbdc, ConnectionResult connectionResult) {
        this.zzaEv = zzbdc;
        this.zzaEw = connectionResult;
    }

    public final void run() {
        this.zzaEv.onConnectionFailed(this.zzaEw);
    }
}
