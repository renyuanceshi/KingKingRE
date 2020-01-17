package com.google.android.gms.tasks;

import android.support.annotation.NonNull;
import java.util.concurrent.Executor;

final class zzg<TResult> implements zzk<TResult> {
    /* access modifiers changed from: private */
    public final Object mLock = new Object();
    private final Executor zzbEo;
    /* access modifiers changed from: private */
    public OnFailureListener zzbLW;

    public zzg(@NonNull Executor executor, @NonNull OnFailureListener onFailureListener) {
        this.zzbEo = executor;
        this.zzbLW = onFailureListener;
    }

    public final void cancel() {
        synchronized (this.mLock) {
            this.zzbLW = null;
        }
    }

    public final void onComplete(@NonNull Task<TResult> task) {
        if (!task.isSuccessful()) {
            synchronized (this.mLock) {
                if (this.zzbLW != null) {
                    this.zzbEo.execute(new zzh(this, task));
                }
            }
        }
    }
}
