package com.google.android.gms.gcm;

import android.annotation.TargetApi;
import android.app.Service;
import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.support.annotation.CallSuper;
import android.support.annotation.Nullable;
import android.util.Log;
import com.facebook.applinks.AppLinkData;
import com.google.android.gms.common.util.zzq;
import com.google.android.gms.common.util.zzw;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;

public abstract class GcmTaskService extends Service {
    public static final String SERVICE_ACTION_EXECUTE_TASK = "com.google.android.gms.gcm.ACTION_TASK_READY";
    public static final String SERVICE_ACTION_INITIALIZE = "com.google.android.gms.gcm.SERVICE_ACTION_INITIALIZE";
    public static final String SERVICE_PERMISSION = "com.google.android.gms.permission.BIND_NETWORK_TASK_SERVICE";
    /* access modifiers changed from: private */
    public ComponentName componentName;
    /* access modifiers changed from: private */
    public final Object lock = new Object();
    private final Set<String> zzbfE = new HashSet();
    private int zzbfF;
    private Messenger zzbfG;
    private ExecutorService zzqH;

    @TargetApi(21)
    final class zza extends Handler {
        zza(Looper looper) {
            super(looper);
        }

        public final void handleMessage(Message message) {
            Messenger messenger;
            if (!zzw.zzb(GcmTaskService.this, message.sendingUid, "com.google.android.gms")) {
                Log.e("GcmTaskService", "unable to verify presence of Google Play Services");
                return;
            }
            switch (message.what) {
                case 1:
                    Bundle data = message.getData();
                    if (data != null && (messenger = message.replyTo) != null) {
                        GcmTaskService.this.zza(new zzb(data.getString("tag"), messenger, data.getBundle(AppLinkData.ARGUMENTS_EXTRAS_KEY), (List<Uri>) data.getParcelableArrayList("triggered_uris")));
                        return;
                    }
                    return;
                case 2:
                    if (Log.isLoggable("GcmTaskService", 3)) {
                        String valueOf = String.valueOf(message);
                        Log.d("GcmTaskService", new StringBuilder(String.valueOf(valueOf).length() + 45).append("ignoring unimplemented stop message for now: ").append(valueOf).toString());
                        return;
                    }
                    return;
                case 4:
                    GcmTaskService.this.onInitializeTasks();
                    return;
                default:
                    String valueOf2 = String.valueOf(message);
                    Log.e("GcmTaskService", new StringBuilder(String.valueOf(valueOf2).length() + 31).append("Unrecognized message received: ").append(valueOf2).toString());
                    return;
            }
        }
    }

    final class zzb implements Runnable {
        private final Bundle mExtras;
        @Nullable
        private final Messenger mMessenger;
        private final String mTag;
        private final List<Uri> zzbfJ;
        @Nullable
        private final zzd zzbfK;

        zzb(String str, IBinder iBinder, Bundle bundle, List<Uri> list) {
            zzd zze;
            this.mTag = str;
            if (iBinder == null) {
                zze = null;
            } else {
                IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.gcm.INetworkTaskCallback");
                zze = queryLocalInterface instanceof zzd ? (zzd) queryLocalInterface : new zze(iBinder);
            }
            this.zzbfK = zze;
            this.mExtras = bundle;
            this.zzbfJ = list;
            this.mMessenger = null;
        }

        zzb(String str, Messenger messenger, Bundle bundle, List<Uri> list) {
            this.mTag = str;
            this.mMessenger = messenger;
            this.mExtras = bundle;
            this.zzbfJ = list;
            this.zzbfK = null;
        }

        /* access modifiers changed from: private */
        public final void zzbg(int i) {
            synchronized (GcmTaskService.this.lock) {
                try {
                    if (zzvC()) {
                        Messenger messenger = this.mMessenger;
                        Message obtain = Message.obtain();
                        obtain.what = 3;
                        obtain.arg1 = i;
                        Bundle bundle = new Bundle();
                        bundle.putParcelable("component", GcmTaskService.this.componentName);
                        bundle.putString("tag", this.mTag);
                        obtain.setData(bundle);
                        messenger.send(obtain);
                    } else {
                        this.zzbfK.zzbh(i);
                    }
                    if (!zzvC()) {
                        GcmTaskService.this.zzdp(this.mTag);
                    }
                } catch (RemoteException e) {
                    String valueOf = String.valueOf(this.mTag);
                    Log.e("GcmTaskService", valueOf.length() != 0 ? "Error reporting result of operation to scheduler for ".concat(valueOf) : new String("Error reporting result of operation to scheduler for "));
                    if (!zzvC()) {
                        GcmTaskService.this.zzdp(this.mTag);
                    }
                } catch (Throwable th) {
                    if (!zzvC()) {
                        GcmTaskService.this.zzdp(this.mTag);
                    }
                    throw th;
                }
            }
        }

        private final boolean zzvC() {
            return this.mMessenger != null;
        }

        public final void run() {
            zzbg(GcmTaskService.this.onRunTask(new TaskParams(this.mTag, this.mExtras, this.zzbfJ)));
        }
    }

    /* access modifiers changed from: private */
    public final void zza(zzb zzb2) {
        try {
            this.zzqH.execute(zzb2);
        } catch (RejectedExecutionException e) {
            Log.e("GcmTaskService", "Executor is shutdown. onDestroy was called but main looper had an unprocessed start task message. The task will be retried with backoff delay.", e);
            zzb2.zzbg(1);
        }
    }

    private final void zzbf(int i) {
        synchronized (this.lock) {
            this.zzbfF = i;
            if (this.zzbfE.isEmpty()) {
                stopSelf(this.zzbfF);
            }
        }
    }

    /* access modifiers changed from: private */
    public final void zzdp(String str) {
        synchronized (this.lock) {
            this.zzbfE.remove(str);
            if (this.zzbfE.isEmpty()) {
                stopSelf(this.zzbfF);
            }
        }
    }

    @CallSuper
    public IBinder onBind(Intent intent) {
        if (intent == null || !zzq.zzse() || !SERVICE_ACTION_EXECUTE_TASK.equals(intent.getAction())) {
            return null;
        }
        return this.zzbfG.getBinder();
    }

    @CallSuper
    public void onCreate() {
        super.onCreate();
        this.zzqH = Executors.newFixedThreadPool(2, new zzb(this));
        this.zzbfG = new Messenger(new zza(Looper.getMainLooper()));
        this.componentName = new ComponentName(this, getClass());
    }

    @CallSuper
    public void onDestroy() {
        super.onDestroy();
        List<Runnable> shutdownNow = this.zzqH.shutdownNow();
        if (!shutdownNow.isEmpty()) {
            Log.e("GcmTaskService", new StringBuilder(79).append("Shutting down, but not all tasks are finished executing. Remaining: ").append(shutdownNow.size()).toString());
        }
    }

    public void onInitializeTasks() {
    }

    public abstract int onRunTask(TaskParams taskParams);

    /* JADX WARNING: Code restructure failed: missing block: B:22:?, code lost:
        zza(new com.google.android.gms.gcm.GcmTaskService.zzb(r6, r2, ((com.google.android.gms.gcm.PendingCallback) r0).zzaHj, r4, (java.util.List<android.net.Uri>) r5));
     */
    @android.support.annotation.CallSuper
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int onStartCommand(android.content.Intent r7, int r8, int r9) {
        /*
            r6 = this;
            if (r7 != 0) goto L_0x0007
            r6.zzbf(r9)
        L_0x0005:
            r0 = 2
            return r0
        L_0x0007:
            java.lang.Class<com.google.android.gms.gcm.PendingCallback> r0 = com.google.android.gms.gcm.PendingCallback.class
            java.lang.ClassLoader r0 = r0.getClassLoader()     // Catch:{ all -> 0x00dd }
            r7.setExtrasClassLoader(r0)     // Catch:{ all -> 0x00dd }
            java.lang.String r0 = r7.getAction()     // Catch:{ all -> 0x00dd }
            java.lang.String r1 = "com.google.android.gms.gcm.ACTION_TASK_READY"
            boolean r1 = r1.equals(r0)     // Catch:{ all -> 0x00dd }
            if (r1 == 0) goto L_0x00e2
            java.lang.String r0 = "tag"
            java.lang.String r2 = r7.getStringExtra(r0)     // Catch:{ all -> 0x00dd }
            java.lang.String r0 = "callback"
            android.os.Parcelable r0 = r7.getParcelableExtra(r0)     // Catch:{ all -> 0x00dd }
            java.lang.String r1 = "extras"
            android.os.Bundle r4 = r7.getBundleExtra(r1)     // Catch:{ all -> 0x00dd }
            java.lang.String r1 = "triggered_uris"
            java.util.ArrayList r5 = r7.getParcelableArrayListExtra(r1)     // Catch:{ all -> 0x00dd }
            boolean r1 = r0 instanceof com.google.android.gms.gcm.PendingCallback     // Catch:{ all -> 0x00dd }
            if (r1 != 0) goto L_0x0079
            java.lang.String r0 = r6.getPackageName()     // Catch:{ all -> 0x00dd }
            java.lang.String r0 = java.lang.String.valueOf(r0)     // Catch:{ all -> 0x00dd }
            java.lang.String r1 = java.lang.String.valueOf(r0)     // Catch:{ all -> 0x00dd }
            int r1 = r1.length()     // Catch:{ all -> 0x00dd }
            java.lang.String r3 = java.lang.String.valueOf(r2)     // Catch:{ all -> 0x00dd }
            int r3 = r3.length()     // Catch:{ all -> 0x00dd }
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ all -> 0x00dd }
            int r1 = r1 + 47
            int r1 = r1 + r3
            r4.<init>(r1)     // Catch:{ all -> 0x00dd }
            java.lang.String r1 = "GcmTaskService"
            java.lang.StringBuilder r0 = r4.append(r0)     // Catch:{ all -> 0x00dd }
            java.lang.String r3 = " "
            java.lang.StringBuilder r0 = r0.append(r3)     // Catch:{ all -> 0x00dd }
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x00dd }
            java.lang.String r2 = ": Could not process request, invalid callback."
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x00dd }
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x00dd }
            android.util.Log.e(r1, r0)     // Catch:{ all -> 0x00dd }
            r6.zzbf(r9)
            goto L_0x0005
        L_0x0079:
            java.lang.Object r1 = r6.lock     // Catch:{ all -> 0x00dd }
            monitor-enter(r1)     // Catch:{ all -> 0x00dd }
            java.util.Set<java.lang.String> r3 = r6.zzbfE     // Catch:{ all -> 0x00da }
            boolean r3 = r3.add(r2)     // Catch:{ all -> 0x00da }
            if (r3 != 0) goto L_0x00c7
            java.lang.String r0 = r6.getPackageName()     // Catch:{ all -> 0x00da }
            java.lang.String r0 = java.lang.String.valueOf(r0)     // Catch:{ all -> 0x00da }
            java.lang.String r3 = java.lang.String.valueOf(r0)     // Catch:{ all -> 0x00da }
            int r3 = r3.length()     // Catch:{ all -> 0x00da }
            java.lang.String r4 = java.lang.String.valueOf(r2)     // Catch:{ all -> 0x00da }
            int r4 = r4.length()     // Catch:{ all -> 0x00da }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ all -> 0x00da }
            int r3 = r3 + 44
            int r3 = r3 + r4
            r5.<init>(r3)     // Catch:{ all -> 0x00da }
            java.lang.String r3 = "GcmTaskService"
            java.lang.StringBuilder r0 = r5.append(r0)     // Catch:{ all -> 0x00da }
            java.lang.String r4 = " "
            java.lang.StringBuilder r0 = r0.append(r4)     // Catch:{ all -> 0x00da }
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x00da }
            java.lang.String r2 = ": Task already running, won't start another"
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x00da }
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x00da }
            android.util.Log.w(r3, r0)     // Catch:{ all -> 0x00da }
            monitor-exit(r1)     // Catch:{ all -> 0x00da }
            r6.zzbf(r9)
            goto L_0x0005
        L_0x00c7:
            monitor-exit(r1)     // Catch:{ all -> 0x00da }
            com.google.android.gms.gcm.PendingCallback r0 = (com.google.android.gms.gcm.PendingCallback) r0     // Catch:{ all -> 0x00dd }
            android.os.IBinder r3 = r0.zzaHj     // Catch:{ all -> 0x00dd }
            com.google.android.gms.gcm.GcmTaskService$zzb r0 = new com.google.android.gms.gcm.GcmTaskService$zzb     // Catch:{ all -> 0x00dd }
            r1 = r6
            r0.<init>((java.lang.String) r2, (android.os.IBinder) r3, (android.os.Bundle) r4, (java.util.List<android.net.Uri>) r5)     // Catch:{ all -> 0x00dd }
            r6.zza((com.google.android.gms.gcm.GcmTaskService.zzb) r0)     // Catch:{ all -> 0x00dd }
        L_0x00d5:
            r6.zzbf(r9)
            goto L_0x0005
        L_0x00da:
            r0 = move-exception
            monitor-exit(r1)     // Catch:{ all -> 0x00da }
            throw r0     // Catch:{ all -> 0x00dd }
        L_0x00dd:
            r0 = move-exception
            r6.zzbf(r9)
            throw r0
        L_0x00e2:
            java.lang.String r1 = "com.google.android.gms.gcm.SERVICE_ACTION_INITIALIZE"
            boolean r1 = r1.equals(r0)     // Catch:{ all -> 0x00dd }
            if (r1 == 0) goto L_0x00ee
            r6.onInitializeTasks()     // Catch:{ all -> 0x00dd }
            goto L_0x00d5
        L_0x00ee:
            java.lang.String r1 = java.lang.String.valueOf(r0)     // Catch:{ all -> 0x00dd }
            int r1 = r1.length()     // Catch:{ all -> 0x00dd }
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch:{ all -> 0x00dd }
            int r1 = r1 + 37
            r2.<init>(r1)     // Catch:{ all -> 0x00dd }
            java.lang.String r1 = "GcmTaskService"
            java.lang.String r3 = "Unknown action received "
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch:{ all -> 0x00dd }
            java.lang.StringBuilder r0 = r2.append(r0)     // Catch:{ all -> 0x00dd }
            java.lang.String r2 = ", terminating"
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x00dd }
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x00dd }
            android.util.Log.e(r1, r0)     // Catch:{ all -> 0x00dd }
            goto L_0x00d5
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.gcm.GcmTaskService.onStartCommand(android.content.Intent, int, int):int");
    }
}
