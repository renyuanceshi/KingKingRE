package com.google.android.gms.internal;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.internal.zzy;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzal;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.common.internal.zzbp;
import com.google.android.gms.common.internal.zzj;
import com.google.android.gms.common.internal.zzm;
import com.google.android.gms.common.internal.zzq;
import com.google.android.gms.common.internal.zzz;

public final class zzctt extends zzz<zzctr> implements zzctj {
    private final zzq zzaCA;
    private Integer zzaHn;
    private final Bundle zzbCL;
    private final boolean zzbCT;

    public zzctt(Context context, Looper looper, boolean z, zzq zzq, Bundle bundle, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, looper, 44, zzq, connectionCallbacks, onConnectionFailedListener);
        this.zzbCT = z;
        this.zzaCA = zzq;
        this.zzbCL = bundle;
        this.zzaHn = zzq.zzru();
    }

    public zzctt(Context context, Looper looper, boolean z, zzq zzq, zzctk zzctk, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        this(context, looper, true, zzq, zza(zzq), connectionCallbacks, onConnectionFailedListener);
    }

    public static Bundle zza(zzq zzq) {
        zzctk zzrt = zzq.zzrt();
        Integer zzru = zzq.zzru();
        Bundle bundle = new Bundle();
        bundle.putParcelable("com.google.android.gms.signin.internal.clientRequestedAccount", zzq.getAccount());
        if (zzru != null) {
            bundle.putInt("com.google.android.gms.common.internal.ClientSettings.sessionId", zzru.intValue());
        }
        if (zzrt != null) {
            bundle.putBoolean("com.google.android.gms.signin.internal.offlineAccessRequested", zzrt.zzAr());
            bundle.putBoolean("com.google.android.gms.signin.internal.idTokenRequested", zzrt.isIdTokenRequested());
            bundle.putString("com.google.android.gms.signin.internal.serverClientId", zzrt.getServerClientId());
            bundle.putBoolean("com.google.android.gms.signin.internal.usePromptModeForAuthCode", true);
            bundle.putBoolean("com.google.android.gms.signin.internal.forceCodeForRefreshToken", zzrt.zzAs());
            bundle.putString("com.google.android.gms.signin.internal.hostedDomain", zzrt.zzAt());
            bundle.putBoolean("com.google.android.gms.signin.internal.waitForAccessTokenRefresh", zzrt.zzAu());
            if (zzrt.zzAv() != null) {
                bundle.putLong("com.google.android.gms.signin.internal.authApiSignInModuleVersion", zzrt.zzAv().longValue());
            }
            if (zzrt.zzAw() != null) {
                bundle.putLong("com.google.android.gms.signin.internal.realClientLibraryVersion", zzrt.zzAw().longValue());
            }
        }
        return bundle;
    }

    public final void connect() {
        zza((zzj) new zzm(this));
    }

    public final void zzAq() {
        try {
            ((zzctr) zzrf()).zzbv(this.zzaHn.intValue());
        } catch (RemoteException e) {
            Log.w("SignInClientImpl", "Remote service probably died when clearAccountFromSessionStore is called");
        }
    }

    public final void zza(zzal zzal, boolean z) {
        try {
            ((zzctr) zzrf()).zza(zzal, this.zzaHn.intValue(), z);
        } catch (RemoteException e) {
            Log.w("SignInClientImpl", "Remote service probably died when saveDefaultAccount is called");
        }
    }

    public final void zza(zzctp zzctp) {
        zzbo.zzb(zzctp, (Object) "Expecting a valid ISignInCallbacks");
        try {
            Account zzrl = this.zzaCA.zzrl();
            GoogleSignInAccount googleSignInAccount = null;
            if ("<<default account>>".equals(zzrl.name)) {
                googleSignInAccount = zzy.zzaj(getContext()).zzmN();
            }
            ((zzctr) zzrf()).zza(new zzctu(new zzbp(zzrl, this.zzaHn.intValue(), googleSignInAccount)), zzctp);
        } catch (RemoteException e) {
            Log.w("SignInClientImpl", "Remote service probably died when signIn is called");
            try {
                zzctp.zzb(new zzctw(8));
            } catch (RemoteException e2) {
                Log.wtf("SignInClientImpl", "ISignInCallbacks#onSignInComplete should be executed from the same process, unexpected RemoteException.", e);
            }
        }
    }

    /* access modifiers changed from: protected */
    public final /* synthetic */ IInterface zzd(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.signin.internal.ISignInService");
        return queryLocalInterface instanceof zzctr ? (zzctr) queryLocalInterface : new zzcts(iBinder);
    }

    /* access modifiers changed from: protected */
    public final String zzdb() {
        return "com.google.android.gms.signin.service.START";
    }

    /* access modifiers changed from: protected */
    public final String zzdc() {
        return "com.google.android.gms.signin.internal.ISignInService";
    }

    /* access modifiers changed from: protected */
    public final Bundle zzmo() {
        if (!getContext().getPackageName().equals(this.zzaCA.zzrq())) {
            this.zzbCL.putString("com.google.android.gms.signin.internal.realClientPackageName", this.zzaCA.zzrq());
        }
        return this.zzbCL;
    }

    public final boolean zzmv() {
        return this.zzbCT;
    }
}
