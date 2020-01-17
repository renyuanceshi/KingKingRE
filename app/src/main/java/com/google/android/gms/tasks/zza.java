package com.google.android.gms.tasks;

import android.support.annotation.NonNull;
import java.util.concurrent.Executor;

final class zza<TResult, TContinuationResult> implements zzk<TResult> {
    private final Executor zzbEo;
    /* access modifiers changed from: private */
    public final Continuation<TResult, TContinuationResult> zzbLP;
    /* access modifiers changed from: private */
    public final zzn<TContinuationResult> zzbLQ;

    public zza(@NonNull Executor executor, @NonNull Continuation<TResult, TContinuationResult> continuation, @NonNull zzn<TContinuationResult> zzn) {
        this.zzbEo = executor;
        this.zzbLP = continuation;
        this.zzbLQ = zzn;
    }

    public final void cancel() {
        throw new UnsupportedOperationException();
    }

    public final void onComplete(@NonNull Task<TResult> task) {
        this.zzbEo.execute(new zzb(this, task));
    }
}
