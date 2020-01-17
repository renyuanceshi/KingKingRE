package com.google.android.gms.tasks;

import android.app.Activity;
import android.support.annotation.MainThread;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.internal.zzbdr;
import com.google.android.gms.internal.zzbds;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;

final class zzn<TResult> extends Task<TResult> {
    private final Object mLock = new Object();
    private final zzl<TResult> zzbMe = new zzl<>();
    private boolean zzbMf;
    private TResult zzbMg;
    private Exception zzbMh;

    static class zza extends zzbdr {
        private final List<WeakReference<zzk<?>>> mListeners = new ArrayList();

        private zza(zzbds zzbds) {
            super(zzbds);
            this.zzaEG.zza("TaskOnStopCallback", (zzbdr) this);
        }

        public static zza zzr(Activity activity) {
            zzbds zzn = zzn(activity);
            zza zza = (zza) zzn.zza("TaskOnStopCallback", zza.class);
            return zza == null ? new zza(zzn) : zza;
        }

        @MainThread
        public final void onStop() {
            synchronized (this.mListeners) {
                for (WeakReference<zzk<?>> weakReference : this.mListeners) {
                    zzk zzk = (zzk) weakReference.get();
                    if (zzk != null) {
                        zzk.cancel();
                    }
                }
                this.mListeners.clear();
            }
        }

        public final <T> void zzb(zzk<T> zzk) {
            synchronized (this.mListeners) {
                this.mListeners.add(new WeakReference(zzk));
            }
        }
    }

    zzn() {
    }

    private final void zzDF() {
        zzbo.zza(this.zzbMf, (Object) "Task is not yet complete");
    }

    private final void zzDG() {
        zzbo.zza(!this.zzbMf, (Object) "Task is already complete");
    }

    private final void zzDH() {
        synchronized (this.mLock) {
            if (this.zzbMf) {
                this.zzbMe.zza(this);
            }
        }
    }

    @NonNull
    public final Task<TResult> addOnCompleteListener(@NonNull Activity activity, @NonNull OnCompleteListener<TResult> onCompleteListener) {
        zze zze = new zze(TaskExecutors.MAIN_THREAD, onCompleteListener);
        this.zzbMe.zza(zze);
        zza.zzr(activity).zzb(zze);
        zzDH();
        return this;
    }

    @NonNull
    public final Task<TResult> addOnCompleteListener(@NonNull OnCompleteListener<TResult> onCompleteListener) {
        return addOnCompleteListener(TaskExecutors.MAIN_THREAD, onCompleteListener);
    }

    @NonNull
    public final Task<TResult> addOnCompleteListener(@NonNull Executor executor, @NonNull OnCompleteListener<TResult> onCompleteListener) {
        this.zzbMe.zza(new zze(executor, onCompleteListener));
        zzDH();
        return this;
    }

    @NonNull
    public final Task<TResult> addOnFailureListener(@NonNull Activity activity, @NonNull OnFailureListener onFailureListener) {
        zzg zzg = new zzg(TaskExecutors.MAIN_THREAD, onFailureListener);
        this.zzbMe.zza(zzg);
        zza.zzr(activity).zzb(zzg);
        zzDH();
        return this;
    }

    @NonNull
    public final Task<TResult> addOnFailureListener(@NonNull OnFailureListener onFailureListener) {
        return addOnFailureListener(TaskExecutors.MAIN_THREAD, onFailureListener);
    }

    @NonNull
    public final Task<TResult> addOnFailureListener(@NonNull Executor executor, @NonNull OnFailureListener onFailureListener) {
        this.zzbMe.zza(new zzg(executor, onFailureListener));
        zzDH();
        return this;
    }

    @NonNull
    public final Task<TResult> addOnSuccessListener(@NonNull Activity activity, @NonNull OnSuccessListener<? super TResult> onSuccessListener) {
        zzi zzi = new zzi(TaskExecutors.MAIN_THREAD, onSuccessListener);
        this.zzbMe.zza(zzi);
        zza.zzr(activity).zzb(zzi);
        zzDH();
        return this;
    }

    @NonNull
    public final Task<TResult> addOnSuccessListener(@NonNull OnSuccessListener<? super TResult> onSuccessListener) {
        return addOnSuccessListener(TaskExecutors.MAIN_THREAD, onSuccessListener);
    }

    @NonNull
    public final Task<TResult> addOnSuccessListener(@NonNull Executor executor, @NonNull OnSuccessListener<? super TResult> onSuccessListener) {
        this.zzbMe.zza(new zzi(executor, onSuccessListener));
        zzDH();
        return this;
    }

    @NonNull
    public final <TContinuationResult> Task<TContinuationResult> continueWith(@NonNull Continuation<TResult, TContinuationResult> continuation) {
        return continueWith(TaskExecutors.MAIN_THREAD, continuation);
    }

    @NonNull
    public final <TContinuationResult> Task<TContinuationResult> continueWith(@NonNull Executor executor, @NonNull Continuation<TResult, TContinuationResult> continuation) {
        zzn zzn = new zzn();
        this.zzbMe.zza(new zza(executor, continuation, zzn));
        zzDH();
        return zzn;
    }

    @NonNull
    public final <TContinuationResult> Task<TContinuationResult> continueWithTask(@NonNull Continuation<TResult, Task<TContinuationResult>> continuation) {
        return continueWithTask(TaskExecutors.MAIN_THREAD, continuation);
    }

    @NonNull
    public final <TContinuationResult> Task<TContinuationResult> continueWithTask(@NonNull Executor executor, @NonNull Continuation<TResult, Task<TContinuationResult>> continuation) {
        zzn zzn = new zzn();
        this.zzbMe.zza(new zzc(executor, continuation, zzn));
        zzDH();
        return zzn;
    }

    @Nullable
    public final Exception getException() {
        Exception exc;
        synchronized (this.mLock) {
            exc = this.zzbMh;
        }
        return exc;
    }

    public final TResult getResult() {
        TResult tresult;
        synchronized (this.mLock) {
            zzDF();
            if (this.zzbMh != null) {
                throw new RuntimeExecutionException(this.zzbMh);
            }
            tresult = this.zzbMg;
        }
        return tresult;
    }

    public final <X extends Throwable> TResult getResult(@NonNull Class<X> cls) throws Throwable {
        TResult tresult;
        synchronized (this.mLock) {
            zzDF();
            if (cls.isInstance(this.zzbMh)) {
                throw ((Throwable) cls.cast(this.zzbMh));
            } else if (this.zzbMh != null) {
                throw new RuntimeExecutionException(this.zzbMh);
            } else {
                tresult = this.zzbMg;
            }
        }
        return tresult;
    }

    public final boolean isComplete() {
        boolean z;
        synchronized (this.mLock) {
            z = this.zzbMf;
        }
        return z;
    }

    public final boolean isSuccessful() {
        boolean z;
        synchronized (this.mLock) {
            z = this.zzbMf && this.zzbMh == null;
        }
        return z;
    }

    public final void setException(@NonNull Exception exc) {
        zzbo.zzb(exc, (Object) "Exception must not be null");
        synchronized (this.mLock) {
            zzDG();
            this.zzbMf = true;
            this.zzbMh = exc;
        }
        this.zzbMe.zza(this);
    }

    public final void setResult(TResult tresult) {
        synchronized (this.mLock) {
            zzDG();
            this.zzbMf = true;
            this.zzbMg = tresult;
        }
        this.zzbMe.zza(this);
    }

    public final boolean trySetException(@NonNull Exception exc) {
        boolean z = true;
        zzbo.zzb(exc, (Object) "Exception must not be null");
        synchronized (this.mLock) {
            if (this.zzbMf) {
                z = false;
            } else {
                this.zzbMf = true;
                this.zzbMh = exc;
                this.zzbMe.zza(this);
            }
        }
        return z;
    }

    public final boolean trySetResult(TResult tresult) {
        boolean z = true;
        synchronized (this.mLock) {
            if (this.zzbMf) {
                z = false;
            } else {
                this.zzbMf = true;
                this.zzbMg = tresult;
                this.zzbMe.zza(this);
            }
        }
        return z;
    }
}
