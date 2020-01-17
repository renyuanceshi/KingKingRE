package com.google.android.gms.common.api;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.FragmentActivity;
import android.support.v4.util.ArrayMap;
import android.view.View;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.common.internal.zzq;
import com.google.android.gms.common.internal.zzr;
import com.google.android.gms.internal.zzbat;
import com.google.android.gms.internal.zzbax;
import com.google.android.gms.internal.zzbbh;
import com.google.android.gms.internal.zzbco;
import com.google.android.gms.internal.zzbdq;
import com.google.android.gms.internal.zzbdv;
import com.google.android.gms.internal.zzbeh;
import com.google.android.gms.internal.zzber;
import com.google.android.gms.internal.zzctf;
import com.google.android.gms.internal.zzctj;
import com.google.android.gms.internal.zzctk;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

public abstract class GoogleApiClient {
    public static final int SIGN_IN_MODE_OPTIONAL = 2;
    public static final int SIGN_IN_MODE_REQUIRED = 1;
    /* access modifiers changed from: private */
    public static final Set<GoogleApiClient> zzaAS = Collections.newSetFromMap(new WeakHashMap());

    public static final class Builder {
        private final Context mContext;
        private final Set<Scope> zzaAT;
        private final Set<Scope> zzaAU;
        private int zzaAV;
        private View zzaAW;
        private String zzaAX;
        private final Map<Api<?>, zzr> zzaAY;
        private final Map<Api<?>, Api.ApiOptions> zzaAZ;
        private zzbdq zzaBa;
        private int zzaBb;
        private OnConnectionFailedListener zzaBc;
        private GoogleApiAvailability zzaBd;
        private Api.zza<? extends zzctj, zzctk> zzaBe;
        private final ArrayList<ConnectionCallbacks> zzaBf;
        private final ArrayList<OnConnectionFailedListener> zzaBg;
        private boolean zzaBh;
        private Account zzajb;
        private String zzake;
        private Looper zzrO;

        public Builder(@NonNull Context context) {
            this.zzaAT = new HashSet();
            this.zzaAU = new HashSet();
            this.zzaAY = new ArrayMap();
            this.zzaAZ = new ArrayMap();
            this.zzaBb = -1;
            this.zzaBd = GoogleApiAvailability.getInstance();
            this.zzaBe = zzctf.zzajS;
            this.zzaBf = new ArrayList<>();
            this.zzaBg = new ArrayList<>();
            this.zzaBh = false;
            this.mContext = context;
            this.zzrO = context.getMainLooper();
            this.zzake = context.getPackageName();
            this.zzaAX = context.getClass().getName();
        }

        public Builder(@NonNull Context context, @NonNull ConnectionCallbacks connectionCallbacks, @NonNull OnConnectionFailedListener onConnectionFailedListener) {
            this(context);
            zzbo.zzb(connectionCallbacks, (Object) "Must provide a connected listener");
            this.zzaBf.add(connectionCallbacks);
            zzbo.zzb(onConnectionFailedListener, (Object) "Must provide a connection failed listener");
            this.zzaBg.add(onConnectionFailedListener);
        }

        private final <O extends Api.ApiOptions> void zza(Api<O> api, O o, Scope... scopeArr) {
            HashSet hashSet = new HashSet(api.zzpb().zzn(o));
            for (Scope add : scopeArr) {
                hashSet.add(add);
            }
            this.zzaAY.put(api, new zzr(hashSet));
        }

        public final Builder addApi(@NonNull Api<? extends Api.ApiOptions.NotRequiredOptions> api) {
            zzbo.zzb(api, (Object) "Api must not be null");
            this.zzaAZ.put(api, (Object) null);
            List<Scope> zzn = api.zzpb().zzn(null);
            this.zzaAU.addAll(zzn);
            this.zzaAT.addAll(zzn);
            return this;
        }

        public final <O extends Api.ApiOptions.HasOptions> Builder addApi(@NonNull Api<O> api, @NonNull O o) {
            zzbo.zzb(api, (Object) "Api must not be null");
            zzbo.zzb(o, (Object) "Null options are not permitted for this Api");
            this.zzaAZ.put(api, o);
            List<Scope> zzn = api.zzpb().zzn(o);
            this.zzaAU.addAll(zzn);
            this.zzaAT.addAll(zzn);
            return this;
        }

        public final <O extends Api.ApiOptions.HasOptions> Builder addApiIfAvailable(@NonNull Api<O> api, @NonNull O o, Scope... scopeArr) {
            zzbo.zzb(api, (Object) "Api must not be null");
            zzbo.zzb(o, (Object) "Null options are not permitted for this Api");
            this.zzaAZ.put(api, o);
            zza(api, o, scopeArr);
            return this;
        }

        public final Builder addApiIfAvailable(@NonNull Api<? extends Api.ApiOptions.NotRequiredOptions> api, Scope... scopeArr) {
            zzbo.zzb(api, (Object) "Api must not be null");
            this.zzaAZ.put(api, (Object) null);
            zza(api, (Api.ApiOptions) null, scopeArr);
            return this;
        }

        public final Builder addConnectionCallbacks(@NonNull ConnectionCallbacks connectionCallbacks) {
            zzbo.zzb(connectionCallbacks, (Object) "Listener must not be null");
            this.zzaBf.add(connectionCallbacks);
            return this;
        }

        public final Builder addOnConnectionFailedListener(@NonNull OnConnectionFailedListener onConnectionFailedListener) {
            zzbo.zzb(onConnectionFailedListener, (Object) "Listener must not be null");
            this.zzaBg.add(onConnectionFailedListener);
            return this;
        }

        public final Builder addScope(@NonNull Scope scope) {
            zzbo.zzb(scope, (Object) "Scope must not be null");
            this.zzaAT.add(scope);
            return this;
        }

        public final GoogleApiClient build() {
            zzbo.zzb(!this.zzaAZ.isEmpty(), (Object) "must call addApi() to add at least one API");
            zzq zzpn = zzpn();
            Api api = null;
            Map<Api<?>, zzr> zzrp = zzpn.zzrp();
            ArrayMap arrayMap = new ArrayMap();
            ArrayMap arrayMap2 = new ArrayMap();
            ArrayList arrayList = new ArrayList();
            Iterator<Api<?>> it = this.zzaAZ.keySet().iterator();
            boolean z = false;
            while (true) {
                boolean z2 = z;
                Api api2 = api;
                if (it.hasNext()) {
                    Api next = it.next();
                    Api.ApiOptions apiOptions = this.zzaAZ.get(next);
                    boolean z3 = zzrp.get(next) != null;
                    arrayMap.put(next, Boolean.valueOf(z3));
                    zzbbh zzbbh = new zzbbh(next, z3);
                    arrayList.add(zzbbh);
                    Api.zza zzpc = next.zzpc();
                    Api.zze zza = zzpc.zza(this.mContext, this.zzrO, zzpn, apiOptions, zzbbh, zzbbh);
                    arrayMap2.put(next.zzpd(), zza);
                    z = zzpc.getPriority() == 1 ? apiOptions != null : z2;
                    if (!zza.zzmG()) {
                        api = api2;
                    } else if (api2 != null) {
                        String valueOf = String.valueOf(next.getName());
                        String valueOf2 = String.valueOf(api2.getName());
                        throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 21 + String.valueOf(valueOf2).length()).append(valueOf).append(" cannot be used with ").append(valueOf2).toString());
                    } else {
                        api = next;
                    }
                } else {
                    if (api2 != null) {
                        if (z2) {
                            String valueOf3 = String.valueOf(api2.getName());
                            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf3).length() + 82).append("With using ").append(valueOf3).append(", GamesOptions can only be specified within GoogleSignInOptions.Builder").toString());
                        }
                        zzbo.zza(this.zzajb == null, "Must not set an account in GoogleApiClient.Builder when using %s. Set account in GoogleSignInOptions.Builder instead", api2.getName());
                        zzbo.zza(this.zzaAT.equals(this.zzaAU), "Must not set scopes in GoogleApiClient.Builder when using %s. Set account in GoogleSignInOptions.Builder instead.", api2.getName());
                    }
                    zzbco zzbco = new zzbco(this.mContext, new ReentrantLock(), this.zzrO, zzpn, this.zzaBd, this.zzaBe, arrayMap, this.zzaBf, this.zzaBg, arrayMap2, this.zzaBb, zzbco.zza(arrayMap2.values(), true), arrayList, false);
                    synchronized (GoogleApiClient.zzaAS) {
                        GoogleApiClient.zzaAS.add(zzbco);
                    }
                    if (this.zzaBb >= 0) {
                        zzbat.zza(this.zzaBa).zza(this.zzaBb, zzbco, this.zzaBc);
                    }
                    return zzbco;
                }
            }
        }

        public final Builder enableAutoManage(@NonNull FragmentActivity fragmentActivity, int i, @Nullable OnConnectionFailedListener onConnectionFailedListener) {
            zzbdq zzbdq = new zzbdq(fragmentActivity);
            zzbo.zzb(i >= 0, (Object) "clientId must be non-negative");
            this.zzaBb = i;
            this.zzaBc = onConnectionFailedListener;
            this.zzaBa = zzbdq;
            return this;
        }

        public final Builder enableAutoManage(@NonNull FragmentActivity fragmentActivity, @Nullable OnConnectionFailedListener onConnectionFailedListener) {
            return enableAutoManage(fragmentActivity, 0, onConnectionFailedListener);
        }

        public final Builder setAccountName(String str) {
            this.zzajb = str == null ? null : new Account(str, "com.google");
            return this;
        }

        public final Builder setGravityForPopups(int i) {
            this.zzaAV = i;
            return this;
        }

        public final Builder setHandler(@NonNull Handler handler) {
            zzbo.zzb(handler, (Object) "Handler must not be null");
            this.zzrO = handler.getLooper();
            return this;
        }

        public final Builder setViewForPopups(@NonNull View view) {
            zzbo.zzb(view, (Object) "View must not be null");
            this.zzaAW = view;
            return this;
        }

        public final Builder useDefaultAccount() {
            return setAccountName("<<default account>>");
        }

        public final Builder zze(Account account) {
            this.zzajb = account;
            return this;
        }

        public final zzq zzpn() {
            zzctk zzctk = zzctk.zzbCM;
            if (this.zzaAZ.containsKey(zzctf.API)) {
                zzctk = (zzctk) this.zzaAZ.get(zzctf.API);
            }
            return new zzq(this.zzajb, this.zzaAT, this.zzaAY, this.zzaAV, this.zzaAW, this.zzake, this.zzaAX, zzctk);
        }
    }

    public interface ConnectionCallbacks {
        public static final int CAUSE_NETWORK_LOST = 2;
        public static final int CAUSE_SERVICE_DISCONNECTED = 1;

        void onConnected(@Nullable Bundle bundle);

        void onConnectionSuspended(int i);
    }

    public interface OnConnectionFailedListener {
        void onConnectionFailed(@NonNull ConnectionResult connectionResult);
    }

    public static void dumpAll(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        synchronized (zzaAS) {
            String concat = String.valueOf(str).concat("  ");
            int i = 0;
            for (GoogleApiClient dump : zzaAS) {
                printWriter.append(str).append("GoogleApiClient#").println(i);
                dump.dump(concat, fileDescriptor, printWriter, strArr);
                i++;
            }
        }
    }

    public static Set<GoogleApiClient> zzpk() {
        Set<GoogleApiClient> set;
        synchronized (zzaAS) {
            set = zzaAS;
        }
        return set;
    }

    public abstract ConnectionResult blockingConnect();

    public abstract ConnectionResult blockingConnect(long j, @NonNull TimeUnit timeUnit);

    public abstract PendingResult<Status> clearDefaultAccountAndReconnect();

    public abstract void connect();

    public void connect(int i) {
        throw new UnsupportedOperationException();
    }

    public abstract void disconnect();

    public abstract void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr);

    @NonNull
    public abstract ConnectionResult getConnectionResult(@NonNull Api<?> api);

    public Context getContext() {
        throw new UnsupportedOperationException();
    }

    public Looper getLooper() {
        throw new UnsupportedOperationException();
    }

    public abstract boolean hasConnectedApi(@NonNull Api<?> api);

    public abstract boolean isConnected();

    public abstract boolean isConnecting();

    public abstract boolean isConnectionCallbacksRegistered(@NonNull ConnectionCallbacks connectionCallbacks);

    public abstract boolean isConnectionFailedListenerRegistered(@NonNull OnConnectionFailedListener onConnectionFailedListener);

    public abstract void reconnect();

    public abstract void registerConnectionCallbacks(@NonNull ConnectionCallbacks connectionCallbacks);

    public abstract void registerConnectionFailedListener(@NonNull OnConnectionFailedListener onConnectionFailedListener);

    public abstract void stopAutoManage(@NonNull FragmentActivity fragmentActivity);

    public abstract void unregisterConnectionCallbacks(@NonNull ConnectionCallbacks connectionCallbacks);

    public abstract void unregisterConnectionFailedListener(@NonNull OnConnectionFailedListener onConnectionFailedListener);

    @NonNull
    public <C extends Api.zze> C zza(@NonNull Api.zzc<C> zzc) {
        throw new UnsupportedOperationException();
    }

    public void zza(zzber zzber) {
        throw new UnsupportedOperationException();
    }

    public boolean zza(@NonNull Api<?> api) {
        throw new UnsupportedOperationException();
    }

    public boolean zza(zzbeh zzbeh) {
        throw new UnsupportedOperationException();
    }

    public void zzb(zzber zzber) {
        throw new UnsupportedOperationException();
    }

    public <A extends Api.zzb, R extends Result, T extends zzbax<R, A>> T zzd(@NonNull T t) {
        throw new UnsupportedOperationException();
    }

    public <A extends Api.zzb, T extends zzbax<? extends Result, A>> T zze(@NonNull T t) {
        throw new UnsupportedOperationException();
    }

    public <L> zzbdv<L> zzp(@NonNull L l) {
        throw new UnsupportedOperationException();
    }

    public void zzpl() {
        throw new UnsupportedOperationException();
    }
}
