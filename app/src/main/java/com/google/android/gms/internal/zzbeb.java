package com.google.android.gms.internal;

import android.support.annotation.NonNull;
import com.google.android.gms.common.api.OptionalPendingResult;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.ResultTransform;
import com.google.android.gms.common.api.TransformedResult;
import java.util.concurrent.TimeUnit;

public final class zzbeb<R extends Result> extends OptionalPendingResult<R> {
    private final zzbbd<R> zzaEQ;

    public zzbeb(PendingResult<R> pendingResult) {
        if (!(pendingResult instanceof zzbbd)) {
            throw new IllegalArgumentException("OptionalPendingResult can only wrap PendingResults generated by an API call.");
        }
        this.zzaEQ = (zzbbd) pendingResult;
    }

    public final R await() {
        return this.zzaEQ.await();
    }

    public final R await(long j, TimeUnit timeUnit) {
        return this.zzaEQ.await(j, timeUnit);
    }

    public final void cancel() {
        this.zzaEQ.cancel();
    }

    public final R get() {
        if (isDone()) {
            return await(0, TimeUnit.MILLISECONDS);
        }
        throw new IllegalStateException("Result is not available. Check that isDone() returns true before calling get().");
    }

    public final boolean isCanceled() {
        return this.zzaEQ.isCanceled();
    }

    public final boolean isDone() {
        return this.zzaEQ.isReady();
    }

    public final void setResultCallback(ResultCallback<? super R> resultCallback) {
        this.zzaEQ.setResultCallback(resultCallback);
    }

    public final void setResultCallback(ResultCallback<? super R> resultCallback, long j, TimeUnit timeUnit) {
        this.zzaEQ.setResultCallback(resultCallback, j, timeUnit);
    }

    @NonNull
    public final <S extends Result> TransformedResult<S> then(@NonNull ResultTransform<? super R, ? extends S> resultTransform) {
        return this.zzaEQ.then(resultTransform);
    }

    public final void zza(PendingResult.zza zza) {
        this.zzaEQ.zza(zza);
    }

    public final Integer zzpo() {
        return this.zzaEQ.zzpo();
    }
}
