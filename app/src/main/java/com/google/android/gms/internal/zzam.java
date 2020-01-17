package com.google.android.gms.internal;

import java.util.Map;
import org.apache.http.client.cache.HeaderConstants;
import org.apache.http.impl.cookie.DateParseException;
import org.apache.http.impl.cookie.DateUtils;

public final class zzam {
    public static String zza(Map<String, String> map) {
        String str = map.get("Content-Type");
        if (str != null) {
            String[] split = str.split(";");
            for (int i = 1; i < split.length; i++) {
                String[] split2 = split[i].trim().split("=");
                if (split2.length == 2 && split2[0].equals("charset")) {
                    return split2[1];
                }
            }
        }
        return "ISO-8859-1";
    }

    public static zzc zzb(zzn zzn) {
        boolean z;
        boolean z2;
        long j;
        long j2;
        long j3;
        long j4;
        long currentTimeMillis = System.currentTimeMillis();
        Map<String, String> map = zzn.zzy;
        long j5 = 0;
        String str = map.get("Date");
        if (str != null) {
            j5 = zzf(str);
        }
        String str2 = map.get("Cache-Control");
        if (str2 != null) {
            String[] split = str2.split(",");
            boolean z3 = false;
            long j6 = 0;
            long j7 = 0;
            for (String trim : split) {
                String trim2 = trim.trim();
                if (trim2.equals(HeaderConstants.CACHE_CONTROL_NO_CACHE) || trim2.equals(HeaderConstants.CACHE_CONTROL_NO_STORE)) {
                    return null;
                }
                if (trim2.startsWith("max-age=")) {
                    try {
                        j7 = Long.parseLong(trim2.substring(8));
                    } catch (Exception e) {
                    }
                } else if (trim2.startsWith("stale-while-revalidate=")) {
                    try {
                        j6 = Long.parseLong(trim2.substring(23));
                    } catch (Exception e2) {
                    }
                } else if (trim2.equals(HeaderConstants.CACHE_CONTROL_MUST_REVALIDATE) || trim2.equals(HeaderConstants.CACHE_CONTROL_PROXY_REVALIDATE)) {
                    z3 = true;
                }
            }
            z = z3;
            z2 = true;
            j = j6;
            j2 = j7;
        } else {
            z = false;
            z2 = false;
            j = 0;
            j2 = 0;
        }
        String str3 = map.get("Expires");
        long zzf = str3 != null ? zzf(str3) : 0;
        String str4 = map.get("Last-Modified");
        long zzf2 = str4 != null ? zzf(str4) : 0;
        String str5 = map.get("ETag");
        if (z2) {
            long j8 = currentTimeMillis + (1000 * j2);
            if (z) {
                j3 = j8;
                j4 = j8;
            } else {
                j3 = (1000 * j) + j8;
                j4 = j8;
            }
        } else if (j5 <= 0 || zzf < j5) {
            j3 = 0;
            j4 = 0;
        } else {
            long j9 = (zzf - j5) + currentTimeMillis;
            j3 = j9;
            j4 = j9;
        }
        zzc zzc = new zzc();
        zzc.data = zzn.data;
        zzc.zza = str5;
        zzc.zze = j4;
        zzc.zzd = j3;
        zzc.zzb = j5;
        zzc.zzc = zzf2;
        zzc.zzf = map;
        return zzc;
    }

    private static long zzf(String str) {
        try {
            return DateUtils.parseDate(str).getTime();
        } catch (DateParseException e) {
            return 0;
        }
    }
}
