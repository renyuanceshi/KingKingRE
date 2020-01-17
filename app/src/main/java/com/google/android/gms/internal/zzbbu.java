package com.google.android.gms.internal;

import android.support.annotation.NonNull;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;

final class zzbbu implements OnCompleteListener<TResult> {
    private /* synthetic */ zzbbs zzaCU;
    private /* synthetic */ TaskCompletionSource zzaCV;

    zzbbu(zzbbs zzbbs, TaskCompletionSource taskCompletionSource) {
        this.zzaCU = zzbbs;
        this.zzaCV = taskCompletionSource;
    }

    public final void onComplete(@NonNull Task<TResult> task) {
        this.zzaCU.zzaCS.remove(this.zzaCV);
    }
}
