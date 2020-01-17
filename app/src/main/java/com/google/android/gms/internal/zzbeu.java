package com.google.android.gms.internal;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

public final class zzbeu {
    public static final Status zzaFj = new Status(8, "The connection to Google Play services was lost");
    private static final zzbbd<?>[] zzaFk = new zzbbd[0];
    private final Map<Api.zzc<?>, Api.zze> zzaDF;
    final Set<zzbbd<?>> zzaFl = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap()));
    private final zzbew zzaFm = new zzbev(this);

    public zzbeu(Map<Api.zzc<?>, Api.zze> map) {
        this.zzaDF = map;
    }

    public final void release() {
        for (zzbbd zzbbd : (zzbbd[]) this.zzaFl.toArray(zzaFk)) {
            zzbbd.zza((zzbew) null);
            zzbbd.zzpo();
            if (zzbbd.zzpB()) {
                this.zzaFl.remove(zzbbd);
            }
        }
    }

    /* access modifiers changed from: package-private */
    public final void zzb(zzbbd<? extends Result> zzbbd) {
        this.zzaFl.add(zzbbd);
        zzbbd.zza(this.zzaFm);
    }

    public final void zzqM() {
        for (zzbbd zzs : (zzbbd[]) this.zzaFl.toArray(zzaFk)) {
            zzs.zzs(zzaFj);
        }
    }
}
