package com.google.android.gms.gcm;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.iid.InstanceID;
import com.google.android.gms.iid.zze;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class GoogleCloudMessaging {
    public static final String ERROR_MAIN_THREAD = "MAIN_THREAD";
    public static final String ERROR_SERVICE_NOT_AVAILABLE = "SERVICE_NOT_AVAILABLE";
    public static final String INSTANCE_ID_SCOPE = "GCM";
    @Deprecated
    public static final String MESSAGE_TYPE_DELETED = "deleted_messages";
    @Deprecated
    public static final String MESSAGE_TYPE_MESSAGE = "gcm";
    @Deprecated
    public static final String MESSAGE_TYPE_SEND_ERROR = "send_error";
    @Deprecated
    public static final String MESSAGE_TYPE_SEND_EVENT = "send_event";
    public static int zzbfL = 5000000;
    private static int zzbfM = 6500000;
    private static int zzbfN = 7000000;
    private static GoogleCloudMessaging zzbfO;
    private static final AtomicInteger zzbfR = new AtomicInteger(1);
    private PendingIntent zzbfP;
    private Map<String, Handler> zzbfQ = Collections.synchronizedMap(new HashMap());
    /* access modifiers changed from: private */
    public final BlockingQueue<Intent> zzbfS = new LinkedBlockingQueue();
    private Messenger zzbfT = new Messenger(new zzc(this, Looper.getMainLooper()));
    /* access modifiers changed from: private */
    public Context zzqF;

    public static GoogleCloudMessaging getInstance(Context context) {
        GoogleCloudMessaging googleCloudMessaging;
        synchronized (GoogleCloudMessaging.class) {
            try {
                if (zzbfO == null) {
                    GoogleCloudMessaging googleCloudMessaging2 = new GoogleCloudMessaging();
                    zzbfO = googleCloudMessaging2;
                    googleCloudMessaging2.zzqF = context.getApplicationContext();
                }
                googleCloudMessaging = zzbfO;
            } catch (Throwable th) {
                Class<GoogleCloudMessaging> cls = GoogleCloudMessaging.class;
                throw th;
            }
        }
        return googleCloudMessaging;
    }

    @Deprecated
    private final Intent zza(Bundle bundle, boolean z) throws IOException {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            throw new IOException("MAIN_THREAD");
        } else if (zzaZ(this.zzqF) < 0) {
            throw new IOException("Google Play Services missing");
        } else {
            Intent intent = new Intent(z ? "com.google.iid.TOKEN_REQUEST" : "com.google.android.c2dm.intent.REGISTER");
            intent.setPackage(zze.zzbd(this.zzqF));
            zzf(intent);
            String valueOf = String.valueOf("google.rpc");
            String valueOf2 = String.valueOf(String.valueOf(zzbfR.getAndIncrement()));
            intent.putExtra("google.message_id", valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
            intent.putExtras(bundle);
            intent.putExtra("google.messenger", this.zzbfT);
            if (z) {
                this.zzqF.sendBroadcast(intent);
            } else {
                this.zzqF.startService(intent);
            }
            try {
                return this.zzbfS.poll(30000, TimeUnit.MILLISECONDS);
            } catch (InterruptedException e) {
                throw new IOException(e.getMessage());
            }
        }
    }

    @Deprecated
    private final String zza(boolean z, String... strArr) throws IOException {
        String stringExtra;
        synchronized (this) {
            String zzbd = zze.zzbd(this.zzqF);
            if (zzbd == null) {
                throw new IOException("SERVICE_NOT_AVAILABLE");
            }
            String zzc = zzc(strArr);
            Bundle bundle = new Bundle();
            if (zzbd.contains(".gsf")) {
                bundle.putString("legacy.sender", zzc);
                stringExtra = InstanceID.getInstance(this.zzqF).getToken(zzc, INSTANCE_ID_SCOPE, bundle);
            } else {
                bundle.putString("sender", zzc);
                Intent zza = zza(bundle, z);
                if (zza == null) {
                    throw new IOException("SERVICE_NOT_AVAILABLE");
                }
                stringExtra = zza.getStringExtra("registration_id");
                if (stringExtra == null) {
                    String stringExtra2 = zza.getStringExtra("error");
                    if (stringExtra2 != null) {
                        throw new IOException(stringExtra2);
                    }
                    throw new IOException("SERVICE_NOT_AVAILABLE");
                }
            }
        }
        return stringExtra;
    }

    public static int zzaZ(Context context) {
        String zzbd = zze.zzbd(context);
        if (zzbd != null) {
            try {
                PackageInfo packageInfo = context.getPackageManager().getPackageInfo(zzbd, 0);
                if (packageInfo != null) {
                    return packageInfo.versionCode;
                }
            } catch (PackageManager.NameNotFoundException e) {
            }
        }
        return -1;
    }

    private static String zzc(String... strArr) {
        if (strArr == null || strArr.length == 0) {
            throw new IllegalArgumentException("No senderIds");
        }
        StringBuilder sb = new StringBuilder(strArr[0]);
        for (int i = 1; i < strArr.length; i++) {
            sb.append(',').append(strArr[i]);
        }
        return sb.toString();
    }

    /* access modifiers changed from: private */
    public final boolean zze(Intent intent) {
        Handler remove;
        String stringExtra = intent.getStringExtra("In-Reply-To");
        if (stringExtra == null && intent.hasExtra("error")) {
            stringExtra = intent.getStringExtra("google.message_id");
        }
        if (stringExtra == null || (remove = this.zzbfQ.remove(stringExtra)) == null) {
            return false;
        }
        Message obtain = Message.obtain();
        obtain.obj = intent;
        return remove.sendMessage(obtain);
    }

    private final void zzf(Intent intent) {
        synchronized (this) {
            if (this.zzbfP == null) {
                Intent intent2 = new Intent();
                intent2.setPackage("com.google.example.invalidpackage");
                this.zzbfP = PendingIntent.getBroadcast(this.zzqF, 0, intent2, 0);
            }
            intent.putExtra("app", this.zzbfP);
        }
    }

    private final void zzvD() {
        synchronized (this) {
            if (this.zzbfP != null) {
                this.zzbfP.cancel();
                this.zzbfP = null;
            }
        }
    }

    public void close() {
        zzbfO = null;
        zza.zzbfw = null;
        zzvD();
    }

    public String getMessageType(Intent intent) {
        if (!"com.google.android.c2dm.intent.RECEIVE".equals(intent.getAction())) {
            return null;
        }
        String stringExtra = intent.getStringExtra("message_type");
        return stringExtra == null ? MESSAGE_TYPE_MESSAGE : stringExtra;
    }

    @RequiresPermission("com.google.android.c2dm.permission.RECEIVE")
    @Deprecated
    public String register(String... strArr) throws IOException {
        String zza;
        synchronized (this) {
            zza = zza(zze.zzbc(this.zzqF), strArr);
        }
        return zza;
    }

    @RequiresPermission("com.google.android.c2dm.permission.RECEIVE")
    public void send(String str, String str2, long j, Bundle bundle) throws IOException {
        if (str == null) {
            throw new IllegalArgumentException("Missing 'to'");
        }
        String zzbd = zze.zzbd(this.zzqF);
        if (zzbd == null) {
            throw new IOException("SERVICE_NOT_AVAILABLE");
        }
        Intent intent = new Intent("com.google.android.gcm.intent.SEND");
        if (bundle != null) {
            intent.putExtras(bundle);
        }
        zzf(intent);
        intent.setPackage(zzbd);
        intent.putExtra("google.to", str);
        intent.putExtra("google.message_id", str2);
        intent.putExtra("google.ttl", Long.toString(j));
        intent.putExtra("google.delay", Integer.toString(-1));
        int indexOf = str.indexOf(64);
        String substring = indexOf > 0 ? str.substring(0, indexOf) : str;
        InstanceID.getInstance(this.zzqF);
        intent.putExtra("google.from", InstanceID.zzvM().zzf("", substring, INSTANCE_ID_SCOPE));
        if (zzbd.contains(".gsf")) {
            Bundle bundle2 = new Bundle();
            for (String str3 : bundle.keySet()) {
                Object obj = bundle.get(str3);
                if (obj instanceof String) {
                    String valueOf = String.valueOf(str3);
                    bundle2.putString(valueOf.length() != 0 ? "gcm.".concat(valueOf) : new String("gcm."), (String) obj);
                }
            }
            bundle2.putString("google.to", str);
            bundle2.putString("google.message_id", str2);
            InstanceID.getInstance(this.zzqF).zzc(INSTANCE_ID_SCOPE, "upstream", bundle2);
            return;
        }
        this.zzqF.sendOrderedBroadcast(intent, "com.google.android.gtalkservice.permission.GTALK_SERVICE");
    }

    @RequiresPermission("com.google.android.c2dm.permission.RECEIVE")
    public void send(String str, String str2, Bundle bundle) throws IOException {
        send(str, str2, -1, bundle);
    }

    @RequiresPermission("com.google.android.c2dm.permission.RECEIVE")
    @Deprecated
    public void unregister() throws IOException {
        synchronized (this) {
            if (Looper.getMainLooper() == Looper.myLooper()) {
                throw new IOException("MAIN_THREAD");
            }
            InstanceID.getInstance(this.zzqF).deleteInstanceID();
        }
    }
}
