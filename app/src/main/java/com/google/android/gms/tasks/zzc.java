package com.google.android.gms.tasks;

import android.support.annotation.NonNull;
import java.util.concurrent.Executor;

final class zzc<TResult, TContinuationResult> implements OnFailureListener, OnSuccessListener<TContinuationResult>, zzk<TResult> {
    private final Executor zzbEo;
    /* access modifiers changed from: private */
    public final Continuation<TResult, Task<TContinuationResult>> zzbLP;
    /* access modifiers changed from: private */
    public final zzn<TContinuationResult> zzbLQ;

    public zzc(@NonNull Executor executor, @NonNull Continuation<TResult, Task<TContinuationResult>> continuation, @NonNull zzn<TContinuationResult> zzn) {
        this.zzbEo = executor;
        this.zzbLP = continuation;
        this.zzbLQ = zzn;
    }

    public final void cancel() {
        throw new UnsupportedOperationException();
    }

    public final void onComplete(@NonNull Task<TResult> task) {
        this.zzbEo.execute(new zzd(this, task));
    }

    public final void onFailure(@NonNull Exception exc) {
        this.zzbLQ.setException(exc);
    }

    public final void onSuccess(TContinuationResult tcontinuationresult) {
        this.zzbLQ.setResult(tcontinuationresult);
    }
}
