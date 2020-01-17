package com.google.android.gms.internal;

import android.app.Application;
import android.app.PendingIntent;
import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.WorkerThread;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApi;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.common.util.zza;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public final class zzbda implements Handler.Callback {
    public static final Status zzaEc = new Status(4, "Sign-out occurred while this API call was in progress.");
    /* access modifiers changed from: private */
    public static final Status zzaEd = new Status(4, "The user must be signed in to make this API call.");
    private static zzbda zzaEf;
    /* access modifiers changed from: private */
    public static final Object zzuH = new Object();
    /* access modifiers changed from: private */
    public final Context mContext;
    /* access modifiers changed from: private */
    public final Handler mHandler;
    /* access modifiers changed from: private */
    public final GoogleApiAvailability zzaBd;
    /* access modifiers changed from: private */
    public final Map<zzbas<?>, zzbdc<?>> zzaCB = new ConcurrentHashMap(5, 0.75f, 1);
    /* access modifiers changed from: private */
    public long zzaDB = 120000;
    /* access modifiers changed from: private */
    public long zzaDC = 5000;
    /* access modifiers changed from: private */
    public long zzaEe = 10000;
    /* access modifiers changed from: private */
    public int zzaEg = -1;
    private final AtomicInteger zzaEh = new AtomicInteger(1);
    private final AtomicInteger zzaEi = new AtomicInteger(0);
    /* access modifiers changed from: private */
    public zzbbv zzaEj = null;
    /* access modifiers changed from: private */
    public final Set<zzbas<?>> zzaEk = new zza();
    private final Set<zzbas<?>> zzaEl = new zza();

    private zzbda(Context context, Looper looper, GoogleApiAvailability googleApiAvailability) {
        this.mContext = context;
        this.mHandler = new Handler(looper, this);
        this.zzaBd = googleApiAvailability;
        this.mHandler.sendMessage(this.mHandler.obtainMessage(6));
    }

    public static zzbda zzay(Context context) {
        zzbda zzbda;
        synchronized (zzuH) {
            if (zzaEf == null) {
                HandlerThread handlerThread = new HandlerThread("GoogleApiHandler", 9);
                handlerThread.start();
                zzaEf = new zzbda(context.getApplicationContext(), handlerThread.getLooper(), GoogleApiAvailability.getInstance());
            }
            zzbda = zzaEf;
        }
        return zzbda;
    }

    @WorkerThread
    private final void zzc(GoogleApi<?> googleApi) {
        zzbas<?> zzph = googleApi.zzph();
        zzbdc zzbdc = this.zzaCB.get(zzph);
        if (zzbdc == null) {
            zzbdc = new zzbdc(this, googleApi);
            this.zzaCB.put(zzph, zzbdc);
        }
        if (zzbdc.zzmv()) {
            this.zzaEl.add(zzph);
        }
        zzbdc.connect();
    }

    public static zzbda zzqk() {
        zzbda zzbda;
        synchronized (zzuH) {
            zzbo.zzb(zzaEf, (Object) "Must guarantee manager is non-null before using getInstance");
            zzbda = zzaEf;
        }
        return zzbda;
    }

    public static void zzql() {
        synchronized (zzuH) {
            if (zzaEf != null) {
                zzbda zzbda = zzaEf;
                zzbda.zzaEi.incrementAndGet();
                zzbda.mHandler.sendMessageAtFrontOfQueue(zzbda.mHandler.obtainMessage(10));
            }
        }
    }

    @WorkerThread
    private final void zzqn() {
        for (zzbas<?> remove : this.zzaEl) {
            this.zzaCB.remove(remove).signOut();
        }
        this.zzaEl.clear();
    }

    @WorkerThread
    public final boolean handleMessage(Message message) {
        zzbdc zzbdc;
        switch (message.what) {
            case 1:
                this.zzaEe = ((Boolean) message.obj).booleanValue() ? 10000 : 300000;
                this.mHandler.removeMessages(12);
                for (zzbas<?> obtainMessage : this.zzaCB.keySet()) {
                    this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(12, obtainMessage), this.zzaEe);
                }
                break;
            case 2:
                zzbau zzbau = (zzbau) message.obj;
                Iterator<zzbas<?>> it = zzbau.zzpt().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    } else {
                        zzbas next = it.next();
                        zzbdc zzbdc2 = this.zzaCB.get(next);
                        if (zzbdc2 == null) {
                            zzbau.zza(next, new ConnectionResult(13));
                            break;
                        } else if (zzbdc2.isConnected()) {
                            zzbau.zza(next, ConnectionResult.zzazX);
                        } else if (zzbdc2.zzqu() != null) {
                            zzbau.zza(next, zzbdc2.zzqu());
                        } else {
                            zzbdc2.zza(zzbau);
                        }
                    }
                }
            case 3:
                for (zzbdc next2 : this.zzaCB.values()) {
                    next2.zzqt();
                    next2.connect();
                }
                break;
            case 4:
            case 8:
            case 13:
                zzbec zzbec = (zzbec) message.obj;
                zzbdc zzbdc3 = this.zzaCB.get(zzbec.zzaET.zzph());
                if (zzbdc3 == null) {
                    zzc(zzbec.zzaET);
                    zzbdc3 = this.zzaCB.get(zzbec.zzaET.zzph());
                }
                if (zzbdc3.zzmv() && this.zzaEi.get() != zzbec.zzaES) {
                    zzbec.zzaER.zzp(zzaEc);
                    zzbdc3.signOut();
                    break;
                } else {
                    zzbdc3.zza(zzbec.zzaER);
                    break;
                }
                break;
            case 5:
                int i = message.arg1;
                ConnectionResult connectionResult = (ConnectionResult) message.obj;
                Iterator<zzbdc<?>> it2 = this.zzaCB.values().iterator();
                while (true) {
                    if (it2.hasNext()) {
                        zzbdc = it2.next();
                        if (zzbdc.getInstanceId() == i) {
                        }
                    } else {
                        zzbdc = null;
                    }
                }
                if (zzbdc == null) {
                    Log.wtf("GoogleApiManager", new StringBuilder(76).append("Could not find API instance ").append(i).append(" while trying to fail enqueued calls.").toString(), new Exception());
                    break;
                } else {
                    String valueOf = String.valueOf(this.zzaBd.getErrorString(connectionResult.getErrorCode()));
                    String valueOf2 = String.valueOf(connectionResult.getErrorMessage());
                    zzbdc.zzt(new Status(17, new StringBuilder(String.valueOf(valueOf).length() + 69 + String.valueOf(valueOf2).length()).append("Error resolution was canceled by the user, original error message: ").append(valueOf).append(": ").append(valueOf2).toString()));
                    break;
                }
            case 6:
                if (this.mContext.getApplicationContext() instanceof Application) {
                    zzbav.zza((Application) this.mContext.getApplicationContext());
                    zzbav.zzpv().zza((zzbaw) new zzbdb(this));
                    if (!zzbav.zzpv().zzab(true)) {
                        this.zzaEe = 300000;
                        break;
                    }
                }
                break;
            case 7:
                zzc((GoogleApi<?>) (GoogleApi) message.obj);
                break;
            case 9:
                if (this.zzaCB.containsKey(message.obj)) {
                    this.zzaCB.get(message.obj).resume();
                    break;
                }
                break;
            case 10:
                zzqn();
                break;
            case 11:
                if (this.zzaCB.containsKey(message.obj)) {
                    this.zzaCB.get(message.obj).zzqd();
                    break;
                }
                break;
            case 12:
                if (this.zzaCB.containsKey(message.obj)) {
                    this.zzaCB.get(message.obj).zzqx();
                    break;
                }
                break;
            default:
                Log.w("GoogleApiManager", new StringBuilder(31).append("Unknown message id: ").append(message.what).toString());
                return false;
        }
        return true;
    }

    /* access modifiers changed from: package-private */
    public final PendingIntent zza(zzbas<?> zzbas, int i) {
        zzbdc zzbdc = this.zzaCB.get(zzbas);
        if (zzbdc == null) {
            return null;
        }
        zzctj zzqy = zzbdc.zzqy();
        if (zzqy == null) {
            return null;
        }
        return PendingIntent.getActivity(this.mContext, i, zzqy.zzmH(), 134217728);
    }

    public final <O extends Api.ApiOptions> Task<Void> zza(@NonNull GoogleApi<O> googleApi, @NonNull zzbdx<?> zzbdx) {
        TaskCompletionSource taskCompletionSource = new TaskCompletionSource();
        this.mHandler.sendMessage(this.mHandler.obtainMessage(13, new zzbec(new zzbaq(zzbdx, taskCompletionSource), this.zzaEi.get(), googleApi)));
        return taskCompletionSource.getTask();
    }

    public final <O extends Api.ApiOptions> Task<Void> zza(@NonNull GoogleApi<O> googleApi, @NonNull zzbed<Api.zzb, ?> zzbed, @NonNull zzbex<Api.zzb, ?> zzbex) {
        TaskCompletionSource taskCompletionSource = new TaskCompletionSource();
        this.mHandler.sendMessage(this.mHandler.obtainMessage(8, new zzbec(new zzbao(new zzbee(zzbed, zzbex), taskCompletionSource), this.zzaEi.get(), googleApi)));
        return taskCompletionSource.getTask();
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x000f  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final com.google.android.gms.tasks.Task<java.lang.Void> zza(java.lang.Iterable<? extends com.google.android.gms.common.api.GoogleApi<?>> r5) {
        /*
            r4 = this;
            com.google.android.gms.internal.zzbau r1 = new com.google.android.gms.internal.zzbau
            r1.<init>(r5)
            java.util.Iterator r2 = r5.iterator()
        L_0x0009:
            boolean r0 = r2.hasNext()
            if (r0 == 0) goto L_0x003a
            java.lang.Object r0 = r2.next()
            com.google.android.gms.common.api.GoogleApi r0 = (com.google.android.gms.common.api.GoogleApi) r0
            java.util.Map<com.google.android.gms.internal.zzbas<?>, com.google.android.gms.internal.zzbdc<?>> r3 = r4.zzaCB
            com.google.android.gms.internal.zzbas r0 = r0.zzph()
            java.lang.Object r0 = r3.get(r0)
            com.google.android.gms.internal.zzbdc r0 = (com.google.android.gms.internal.zzbdc) r0
            if (r0 == 0) goto L_0x0029
            boolean r0 = r0.isConnected()
            if (r0 != 0) goto L_0x0009
        L_0x0029:
            android.os.Handler r0 = r4.mHandler
            android.os.Handler r2 = r4.mHandler
            r3 = 2
            android.os.Message r2 = r2.obtainMessage(r3, r1)
            r0.sendMessage(r2)
            com.google.android.gms.tasks.Task r0 = r1.getTask()
        L_0x0039:
            return r0
        L_0x003a:
            r1.zzpu()
            com.google.android.gms.tasks.Task r0 = r1.getTask()
            goto L_0x0039
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzbda.zza(java.lang.Iterable):com.google.android.gms.tasks.Task");
    }

    public final void zza(ConnectionResult connectionResult, int i) {
        if (!zzc(connectionResult, i)) {
            this.mHandler.sendMessage(this.mHandler.obtainMessage(5, i, 0, connectionResult));
        }
    }

    public final <O extends Api.ApiOptions> void zza(GoogleApi<O> googleApi, int i, zzbax<? extends Result, Api.zzb> zzbax) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(4, new zzbec(new zzban(i, zzbax), this.zzaEi.get(), googleApi)));
    }

    public final <O extends Api.ApiOptions, TResult> void zza(GoogleApi<O> googleApi, int i, zzbep<Api.zzb, TResult> zzbep, TaskCompletionSource<TResult> taskCompletionSource, zzbel zzbel) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(4, new zzbec(new zzbap(i, zzbep, taskCompletionSource, zzbel), this.zzaEi.get(), googleApi)));
    }

    public final void zza(@NonNull zzbbv zzbbv) {
        synchronized (zzuH) {
            if (this.zzaEj != zzbbv) {
                this.zzaEj = zzbbv;
                this.zzaEk.clear();
                this.zzaEk.addAll(zzbbv.zzpR());
            }
        }
    }

    public final void zzb(GoogleApi<?> googleApi) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(7, googleApi));
    }

    /* access modifiers changed from: package-private */
    public final void zzb(@NonNull zzbbv zzbbv) {
        synchronized (zzuH) {
            if (this.zzaEj == zzbbv) {
                this.zzaEj = null;
                this.zzaEk.clear();
            }
        }
    }

    /* access modifiers changed from: package-private */
    public final boolean zzc(ConnectionResult connectionResult, int i) {
        return this.zzaBd.zza(this.mContext, connectionResult, i);
    }

    /* access modifiers changed from: package-private */
    public final void zzpl() {
        this.zzaEi.incrementAndGet();
        this.mHandler.sendMessage(this.mHandler.obtainMessage(10));
    }

    public final void zzps() {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(3));
    }

    public final int zzqm() {
        return this.zzaEh.getAndIncrement();
    }
}
