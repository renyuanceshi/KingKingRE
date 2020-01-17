package com.google.android.gms.internal;

import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.TaskCompletionSource;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

public final class zzbbs {
    /* access modifiers changed from: private */
    public final Map<zzbbd<?>, Boolean> zzaCR = Collections.synchronizedMap(new WeakHashMap());
    /* access modifiers changed from: private */
    public final Map<TaskCompletionSource<?>, Boolean> zzaCS = Collections.synchronizedMap(new WeakHashMap());

    private final void zza(boolean z, Status status) {
        HashMap hashMap;
        HashMap hashMap2;
        synchronized (this.zzaCR) {
            hashMap = new HashMap(this.zzaCR);
        }
        synchronized (this.zzaCS) {
            hashMap2 = new HashMap(this.zzaCS);
        }
        for (Map.Entry entry : hashMap.entrySet()) {
            if (z || ((Boolean) entry.getValue()).booleanValue()) {
                ((zzbbd) entry.getKey()).zzs(status);
            }
        }
        for (Map.Entry entry2 : hashMap2.entrySet()) {
            if (z || ((Boolean) entry2.getValue()).booleanValue()) {
                ((TaskCompletionSource) entry2.getKey()).trySetException(new ApiException(status));
            }
        }
    }

    /* access modifiers changed from: package-private */
    public final void zza(zzbbd<? extends Result> zzbbd, boolean z) {
        this.zzaCR.put(zzbbd, Boolean.valueOf(z));
        zzbbd.zza((PendingResult.zza) new zzbbt(this, zzbbd));
    }

    /* access modifiers changed from: package-private */
    public final <TResult> void zza(TaskCompletionSource<TResult> taskCompletionSource, boolean z) {
        this.zzaCS.put(taskCompletionSource, Boolean.valueOf(z));
        taskCompletionSource.getTask().addOnCompleteListener(new zzbbu(this, taskCompletionSource));
    }

    /* access modifiers changed from: package-private */
    public final boolean zzpO() {
        return !this.zzaCR.isEmpty() || !this.zzaCS.isEmpty();
    }

    public final void zzpP() {
        zza(false, zzbda.zzaEc);
    }

    public final void zzpQ() {
        zza(true, zzbeu.zzaFj);
    }
}
