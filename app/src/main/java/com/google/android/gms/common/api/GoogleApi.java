package com.google.android.gms.common.api;

import android.accounts.Account;
import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.MainThread;
import android.support.annotation.NonNull;
import android.support.annotation.WorkerThread;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.internal.zzbar;
import com.google.android.gms.internal.zzbas;
import com.google.android.gms.internal.zzbax;
import com.google.android.gms.internal.zzbbv;
import com.google.android.gms.internal.zzbda;
import com.google.android.gms.internal.zzbdc;
import com.google.android.gms.internal.zzbdi;
import com.google.android.gms.internal.zzbei;
import com.google.android.gms.internal.zzbel;
import com.google.android.gms.internal.zzbep;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;

public class GoogleApi<O extends Api.ApiOptions> {
    private final Context mContext;
    private final int mId;
    private final O zzaAJ;
    private final zzbas<O> zzaAK;
    private final GoogleApiClient zzaAL;
    private final zzbel zzaAM;
    protected final zzbda zzaAN;
    private final Account zzajb;
    private final Api<O> zzayW;
    private final Looper zzrO;

    public static final class zza {
        public static final zza zzaAO = new zzd().zzpj();
        public final Account account;
        public final zzbel zzaAP;
        public final Looper zzaAQ;

        private zza(zzbel zzbel, Account account2, Looper looper) {
            this.zzaAP = zzbel;
            this.account = account2;
            this.zzaAQ = looper;
        }
    }

    @MainThread
    private GoogleApi(@NonNull Activity activity, Api<O> api, O o, zza zza2) {
        zzbo.zzb(activity, (Object) "Null activity is not permitted.");
        zzbo.zzb(api, (Object) "Api must not be null.");
        zzbo.zzb(zza2, (Object) "Settings must not be null; use Settings.DEFAULT_SETTINGS instead.");
        this.mContext = activity.getApplicationContext();
        this.zzayW = api;
        this.zzaAJ = null;
        this.zzrO = zza2.zzaAQ;
        this.zzaAK = zzbas.zza(this.zzayW, this.zzaAJ);
        this.zzaAL = new zzbdi(this);
        this.zzaAN = zzbda.zzay(this.mContext);
        this.mId = this.zzaAN.zzqm();
        this.zzaAM = zza2.zzaAP;
        this.zzajb = zza2.account;
        zzbbv.zza(activity, this.zzaAN, this.zzaAK);
        this.zzaAN.zzb((GoogleApi<?>) this);
    }

    @Deprecated
    public GoogleApi(@NonNull Activity activity, Api<O> api, O o, zzbel zzbel) {
        this(activity, api, (Api.ApiOptions) null, new zzd().zza(zzbel).zza(activity.getMainLooper()).zzpj());
    }

    protected GoogleApi(@NonNull Context context, Api<O> api, Looper looper) {
        zzbo.zzb(context, (Object) "Null context is not permitted.");
        zzbo.zzb(api, (Object) "Api must not be null.");
        zzbo.zzb(looper, (Object) "Looper must not be null.");
        this.mContext = context.getApplicationContext();
        this.zzayW = api;
        this.zzaAJ = null;
        this.zzrO = looper;
        this.zzaAK = zzbas.zzb(api);
        this.zzaAL = new zzbdi(this);
        this.zzaAN = zzbda.zzay(this.mContext);
        this.mId = this.zzaAN.zzqm();
        this.zzaAM = new zzbar();
        this.zzajb = null;
    }

    @Deprecated
    public GoogleApi(@NonNull Context context, Api<O> api, O o, Looper looper, zzbel zzbel) {
        this(context, api, (Api.ApiOptions) null, new zzd().zza(looper).zza(zzbel).zzpj());
    }

    public GoogleApi(@NonNull Context context, Api<O> api, O o, zza zza2) {
        zzbo.zzb(context, (Object) "Null context is not permitted.");
        zzbo.zzb(api, (Object) "Api must not be null.");
        zzbo.zzb(zza2, (Object) "Settings must not be null; use Settings.DEFAULT_SETTINGS instead.");
        this.mContext = context.getApplicationContext();
        this.zzayW = api;
        this.zzaAJ = o;
        this.zzrO = zza2.zzaAQ;
        this.zzaAK = zzbas.zza(this.zzayW, this.zzaAJ);
        this.zzaAL = new zzbdi(this);
        this.zzaAN = zzbda.zzay(this.mContext);
        this.mId = this.zzaAN.zzqm();
        this.zzaAM = zza2.zzaAP;
        this.zzajb = zza2.account;
        this.zzaAN.zzb((GoogleApi<?>) this);
    }

    @Deprecated
    public GoogleApi(@NonNull Context context, Api<O> api, O o, zzbel zzbel) {
        this(context, api, o, new zzd().zza(zzbel).zzpj());
    }

    private final <A extends Api.zzb, T extends zzbax<? extends Result, A>> T zza(int i, @NonNull T t) {
        t.zzpC();
        this.zzaAN.zza(this, i, (zzbax<? extends Result, Api.zzb>) t);
        return t;
    }

    private final <TResult, A extends Api.zzb> Task<TResult> zza(int i, @NonNull zzbep<A, TResult> zzbep) {
        TaskCompletionSource taskCompletionSource = new TaskCompletionSource();
        this.zzaAN.zza(this, i, zzbep, taskCompletionSource, this.zzaAM);
        return taskCompletionSource.getTask();
    }

    public final Context getApplicationContext() {
        return this.mContext;
    }

    public final int getInstanceId() {
        return this.mId;
    }

    public final Looper getLooper() {
        return this.zzrO;
    }

    @WorkerThread
    public Api.zze zza(Looper looper, zzbdc<O> zzbdc) {
        return this.zzayW.zzpc().zza(this.mContext, looper, new GoogleApiClient.Builder(this.mContext).zze(this.zzajb).zzpn(), this.zzaAJ, zzbdc, zzbdc);
    }

    public final <A extends Api.zzb, T extends zzbax<? extends Result, A>> T zza(@NonNull T t) {
        return zza(0, t);
    }

    public zzbei zza(Context context, Handler handler) {
        return new zzbei(context, handler);
    }

    public final <TResult, A extends Api.zzb> Task<TResult> zza(zzbep<A, TResult> zzbep) {
        return zza(0, zzbep);
    }

    public final <A extends Api.zzb, T extends zzbax<? extends Result, A>> T zzb(@NonNull T t) {
        return zza(1, t);
    }

    public final <TResult, A extends Api.zzb> Task<TResult> zzb(zzbep<A, TResult> zzbep) {
        return zza(1, zzbep);
    }

    public final <A extends Api.zzb, T extends zzbax<? extends Result, A>> T zzc(@NonNull T t) {
        return zza(2, t);
    }

    public final Api<O> zzpg() {
        return this.zzayW;
    }

    public final zzbas<O> zzph() {
        return this.zzaAK;
    }

    public final GoogleApiClient zzpi() {
        return this.zzaAL;
    }
}
