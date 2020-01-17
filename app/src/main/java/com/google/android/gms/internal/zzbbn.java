package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.GoogleApi;
import com.google.android.gms.common.internal.zzq;

public final class zzbbn<O extends Api.ApiOptions> extends GoogleApi<O> {
    private final Api.zza<? extends zzctj, zzctk> zzaBe;
    private final zzq zzaCA;
    private final Api.zze zzaCy;
    private final zzbbh zzaCz;

    public zzbbn(@NonNull Context context, Api<O> api, Looper looper, @NonNull Api.zze zze, @NonNull zzbbh zzbbh, zzq zzq, Api.zza<? extends zzctj, zzctk> zza) {
        super(context, api, looper);
        this.zzaCy = zze;
        this.zzaCz = zzbbh;
        this.zzaCA = zzq;
        this.zzaBe = zza;
        this.zzaAN.zzb((GoogleApi<?>) this);
    }

    public final Api.zze zza(Looper looper, zzbdc<O> zzbdc) {
        this.zzaCz.zza(zzbdc);
        return this.zzaCy;
    }

    public final zzbei zza(Context context, Handler handler) {
        return new zzbei(context, handler, this.zzaCA, this.zzaBe);
    }

    public final Api.zze zzpJ() {
        return this.zzaCy;
    }
}
