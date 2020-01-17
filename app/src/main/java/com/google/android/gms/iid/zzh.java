package com.google.android.gms.iid;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Base64;
import android.util.Log;
import com.google.android.gms.common.util.zzu;
import java.io.File;
import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

public final class zzh {
    private SharedPreferences zzbho;
    private Context zzqF;

    public zzh(Context context) {
        this(context, "com.google.android.gms.appid");
    }

    private zzh(Context context, String str) {
        this.zzqF = context;
        this.zzbho = context.getSharedPreferences(str, 0);
        String valueOf = String.valueOf(str);
        String valueOf2 = String.valueOf("-no-backup");
        File file = new File(zzu.getNoBackupFilesDir(this.zzqF), valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
        if (!file.exists()) {
            try {
                if (file.createNewFile() && !isEmpty()) {
                    Log.i("InstanceID/Store", "App restored, clearing state");
                    InstanceIDListenerService.zza(this.zzqF, this);
                }
            } catch (IOException e) {
                if (Log.isLoggable("InstanceID/Store", 3)) {
                    String valueOf3 = String.valueOf(e.getMessage());
                    Log.d("InstanceID/Store", valueOf3.length() != 0 ? "Error creating file in no backup dir: ".concat(valueOf3) : new String("Error creating file in no backup dir: "));
                }
            }
        }
    }

    private final void zza(SharedPreferences.Editor editor, String str, String str2, String str3) {
        synchronized (this) {
            String valueOf = String.valueOf("|S|");
            editor.putString(new StringBuilder(String.valueOf(str).length() + String.valueOf(valueOf).length() + String.valueOf(str2).length()).append(str).append(valueOf).append(str2).toString(), str3);
        }
    }

    private static String zze(String str, String str2, String str3) {
        String valueOf = String.valueOf("|T|");
        return new StringBuilder(String.valueOf(str).length() + 1 + String.valueOf(valueOf).length() + String.valueOf(str2).length() + String.valueOf(str3).length()).append(str).append(valueOf).append(str2).append("|").append(str3).toString();
    }

    /* access modifiers changed from: package-private */
    public final String get(String str) {
        String string;
        synchronized (this) {
            string = this.zzbho.getString(str, (String) null);
        }
        return string;
    }

    /* access modifiers changed from: package-private */
    public final String get(String str, String str2) {
        String string;
        synchronized (this) {
            SharedPreferences sharedPreferences = this.zzbho;
            String valueOf = String.valueOf("|S|");
            string = sharedPreferences.getString(new StringBuilder(String.valueOf(str).length() + String.valueOf(valueOf).length() + String.valueOf(str2).length()).append(str).append(valueOf).append(str2).toString(), (String) null);
        }
        return string;
    }

    public final boolean isEmpty() {
        return this.zzbho.getAll().isEmpty();
    }

    public final void zza(String str, String str2, String str3, String str4, String str5) {
        synchronized (this) {
            String zze = zze(str, str2, str3);
            SharedPreferences.Editor edit = this.zzbho.edit();
            edit.putString(zze, str4);
            edit.putString("appVersion", str5);
            edit.putString("lastToken", Long.toString(System.currentTimeMillis() / 1000));
            edit.commit();
        }
    }

    /* access modifiers changed from: package-private */
    public final KeyPair zzc(String str, long j) {
        KeyPair zzvJ;
        synchronized (this) {
            zzvJ = zza.zzvJ();
            SharedPreferences.Editor edit = this.zzbho.edit();
            zza(edit, str, "|P|", InstanceID.zzj(zzvJ.getPublic().getEncoded()));
            zza(edit, str, "|K|", InstanceID.zzj(zzvJ.getPrivate().getEncoded()));
            zza(edit, str, "cre", Long.toString(j));
            edit.commit();
        }
        return zzvJ;
    }

    public final void zzdq(String str) {
        synchronized (this) {
            SharedPreferences.Editor edit = this.zzbho.edit();
            for (String next : this.zzbho.getAll().keySet()) {
                if (next.startsWith(str)) {
                    edit.remove(next);
                }
            }
            edit.commit();
        }
    }

    public final void zzdr(String str) {
        zzdq(String.valueOf(str).concat("|T|"));
    }

    /* access modifiers changed from: package-private */
    public final KeyPair zzds(String str) {
        String str2 = get(str, "|P|");
        String str3 = get(str, "|K|");
        if (str2 == null || str3 == null) {
            return null;
        }
        try {
            byte[] decode = Base64.decode(str2, 8);
            byte[] decode2 = Base64.decode(str3, 8);
            KeyFactory instance = KeyFactory.getInstance("RSA");
            return new KeyPair(instance.generatePublic(new X509EncodedKeySpec(decode)), instance.generatePrivate(new PKCS8EncodedKeySpec(decode2)));
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            String valueOf = String.valueOf(e);
            Log.w("InstanceID/Store", new StringBuilder(String.valueOf(valueOf).length() + 19).append("Invalid key stored ").append(valueOf).toString());
            InstanceIDListenerService.zza(this.zzqF, this);
            return null;
        }
    }

    public final String zzf(String str, String str2, String str3) {
        String string;
        synchronized (this) {
            string = this.zzbho.getString(zze(str, str2, str3), (String) null);
        }
        return string;
    }

    public final void zzg(String str, String str2, String str3) {
        synchronized (this) {
            String zze = zze(str, str2, str3);
            SharedPreferences.Editor edit = this.zzbho.edit();
            edit.remove(zze);
            edit.commit();
        }
    }

    public final void zzvP() {
        synchronized (this) {
            this.zzbho.edit().clear().commit();
        }
    }
}
