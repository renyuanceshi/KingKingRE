package com.google.android.gms.internal;

import android.content.Context;
import android.os.Looper;
import android.support.annotation.NonNull;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.GoogleApi;
import com.google.android.gms.common.api.Result;

public final class zzbdi<O extends Api.ApiOptions> extends zzbby {
    private final GoogleApi<O> zzaEz;

    public zzbdi(GoogleApi<O> googleApi) {
        super("Method is not supported by connectionless client. APIs supporting connectionless client must not call this method.");
        this.zzaEz = googleApi;
    }

    public final Context getContext() {
        return this.zzaEz.getApplicationContext();
    }

    public final Looper getLooper() {
        return this.zzaEz.getLooper();
    }

    public final void zza(zzber zzber) {
    }

    public final void zzb(zzber zzber) {
    }

    public final <A extends Api.zzb, R extends Result, T extends zzbax<R, A>> T zzd(@NonNull T t) {
        return this.zzaEz.zza(t);
    }

    public final <A extends Api.zzb, T extends zzbax<? extends Result, A>> T zze(@NonNull T t) {
        return this.zzaEz.zzb(t);
    }
}
