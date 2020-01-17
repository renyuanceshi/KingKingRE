package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.Status;

final class zzbfs extends zzbfm {
    private final zzbay<Status> zzaIz;

    public zzbfs(zzbay<Status> zzbay) {
        this.zzaIz = zzbay;
    }

    public final void zzaC(int i) throws RemoteException {
        this.zzaIz.setResult(new Status(i));
    }
}
