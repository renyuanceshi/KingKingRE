package com.google.android.gms.internal;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.internal.zzbe;
import java.util.Arrays;

public final class zzbas<O extends Api.ApiOptions> {
    private final O zzaAJ;
    private final int zzaBA;
    private final boolean zzaBz = true;
    private final Api<O> zzayW;

    private zzbas(Api<O> api) {
        this.zzayW = api;
        this.zzaAJ = null;
        this.zzaBA = System.identityHashCode(this);
    }

    private zzbas(Api<O> api, O o) {
        this.zzayW = api;
        this.zzaAJ = o;
        this.zzaBA = Arrays.hashCode(new Object[]{this.zzayW, this.zzaAJ});
    }

    public static <O extends Api.ApiOptions> zzbas<O> zza(Api<O> api, O o) {
        return new zzbas<>(api, o);
    }

    public static <O extends Api.ApiOptions> zzbas<O> zzb(Api<O> api) {
        return new zzbas<>(api);
    }

    public final boolean equals(Object obj) {
        if (obj != this) {
            if (!(obj instanceof zzbas)) {
                return false;
            }
            zzbas zzbas = (zzbas) obj;
            if (this.zzaBz || zzbas.zzaBz || !zzbe.equal(this.zzayW, zzbas.zzayW) || !zzbe.equal(this.zzaAJ, zzbas.zzaAJ)) {
                return false;
            }
        }
        return true;
    }

    public final int hashCode() {
        return this.zzaBA;
    }

    public final String zzpr() {
        return this.zzayW.getName();
    }
}
