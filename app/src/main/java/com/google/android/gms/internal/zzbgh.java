package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.common.util.zzc;
import com.google.android.gms.common.util.zzo;
import com.google.android.gms.common.util.zzp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public abstract class zzbgh {
    protected static <O, I> I zza(zzbgi<I, O> zzbgi, Object obj) {
        return zzbgi.zzaIQ != null ? zzbgi.convertBack(obj) : obj;
    }

    private static void zza(StringBuilder sb, zzbgi zzbgi, Object obj) {
        if (zzbgi.zzaIH == 11) {
            sb.append(((zzbgh) zzbgi.zzaIN.cast(obj)).toString());
        } else if (zzbgi.zzaIH == 7) {
            sb.append("\"");
            sb.append(zzo.zzcK((String) obj));
            sb.append("\"");
        } else {
            sb.append(obj);
        }
    }

    private static void zza(StringBuilder sb, zzbgi zzbgi, ArrayList<Object> arrayList) {
        sb.append("[");
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            if (i > 0) {
                sb.append(",");
            }
            Object obj = arrayList.get(i);
            if (obj != null) {
                zza(sb, zzbgi, obj);
            }
        }
        sb.append("]");
    }

    public String toString() {
        Map<String, zzbgi<?, ?>> zzrL = zzrL();
        StringBuilder sb = new StringBuilder(100);
        for (String next : zzrL.keySet()) {
            zzbgi zzbgi = zzrL.get(next);
            if (zza(zzbgi)) {
                Object zza = zza(zzbgi, zzb(zzbgi));
                if (sb.length() == 0) {
                    sb.append("{");
                } else {
                    sb.append(",");
                }
                sb.append("\"").append(next).append("\":");
                if (zza != null) {
                    switch (zzbgi.zzaIJ) {
                        case 8:
                            sb.append("\"").append(zzc.encode((byte[]) zza)).append("\"");
                            break;
                        case 9:
                            sb.append("\"").append(zzc.zzg((byte[]) zza)).append("\"");
                            break;
                        case 10:
                            zzp.zza(sb, (HashMap) zza);
                            break;
                        default:
                            if (!zzbgi.zzaII) {
                                zza(sb, zzbgi, zza);
                                break;
                            } else {
                                zza(sb, zzbgi, (ArrayList<Object>) (ArrayList) zza);
                                break;
                            }
                    }
                } else {
                    sb.append("null");
                }
            }
        }
        if (sb.length() > 0) {
            sb.append("}");
        } else {
            sb.append("{}");
        }
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    public boolean zza(zzbgi zzbgi) {
        if (zzbgi.zzaIJ != 11) {
            return zzcI(zzbgi.zzaIL);
        }
        if (zzbgi.zzaIK) {
            String str = zzbgi.zzaIL;
            throw new UnsupportedOperationException("Concrete type arrays not supported");
        }
        String str2 = zzbgi.zzaIL;
        throw new UnsupportedOperationException("Concrete types not supported");
    }

    /* access modifiers changed from: protected */
    public Object zzb(zzbgi zzbgi) {
        String str = zzbgi.zzaIL;
        if (zzbgi.zzaIN == null) {
            return zzcH(zzbgi.zzaIL);
        }
        zzcH(zzbgi.zzaIL);
        zzbo.zza(true, "Concrete field shouldn't be value object: %s", zzbgi.zzaIL);
        boolean z = zzbgi.zzaIK;
        try {
            char upperCase = Character.toUpperCase(str.charAt(0));
            String valueOf = String.valueOf(str.substring(1));
            return getClass().getMethod(new StringBuilder(String.valueOf(valueOf).length() + 4).append("get").append(upperCase).append(valueOf).toString(), new Class[0]).invoke(this, new Object[0]);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /* access modifiers changed from: protected */
    public abstract Object zzcH(String str);

    /* access modifiers changed from: protected */
    public abstract boolean zzcI(String str);

    public abstract Map<String, zzbgi<?, ?>> zzrL();
}
