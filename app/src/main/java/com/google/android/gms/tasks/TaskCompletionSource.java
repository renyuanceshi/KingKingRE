package com.google.android.gms.tasks;

import android.support.annotation.NonNull;

public class TaskCompletionSource<TResult> {
    private final zzn<TResult> zzbMc = new zzn<>();

    @NonNull
    public Task<TResult> getTask() {
        return this.zzbMc;
    }

    public void setException(@NonNull Exception exc) {
        this.zzbMc.setException(exc);
    }

    public void setResult(TResult tresult) {
        this.zzbMc.setResult(tresult);
    }

    public boolean trySetException(@NonNull Exception exc) {
        return this.zzbMc.trySetException(exc);
    }

    public boolean trySetResult(TResult tresult) {
        return this.zzbMc.trySetResult(tresult);
    }
}
