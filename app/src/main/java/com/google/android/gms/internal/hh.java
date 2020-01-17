package com.google.android.gms.internal;

import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Pattern;

public class hh {
    private static Uri CONTENT_URI = Uri.parse("content://com.google.android.gsf.gservices");
    private static Uri zzbTY = Uri.parse("content://com.google.android.gsf.gservices/prefix");
    private static Pattern zzbTZ = Pattern.compile("^(1|true|t|on|yes|y)$", 2);
    private static Pattern zzbUa = Pattern.compile("^(0|false|f|off|no|n)$", 2);
    /* access modifiers changed from: private */
    public static final AtomicBoolean zzbUb = new AtomicBoolean();
    private static HashMap<String, String> zzbUc;
    private static HashMap<String, Boolean> zzbUd = new HashMap<>();
    private static HashMap<String, Integer> zzbUe = new HashMap<>();
    private static HashMap<String, Long> zzbUf = new HashMap<>();
    private static HashMap<String, Float> zzbUg = new HashMap<>();
    private static Object zzbUh;
    private static boolean zzbUi;
    private static String[] zzbUj = new String[0];

    public static long getLong(ContentResolver contentResolver, String str, long j) {
        Long l;
        long j2 = 0;
        Object zzb = zzb(contentResolver);
        Long l2 = (Long) zza(zzbUf, str, 0L);
        if (l2 != null) {
            return l2.longValue();
        }
        String zza = zza(contentResolver, str, (String) null);
        if (zza == null) {
            l = l2;
        } else {
            try {
                long parseLong = Long.parseLong(zza);
                l = Long.valueOf(parseLong);
                j2 = parseLong;
            } catch (NumberFormatException e) {
                l = l2;
            }
        }
        HashMap<String, Long> hashMap = zzbUf;
        synchronized (hh.class) {
            try {
                if (zzb == zzbUh) {
                    hashMap.put(str, l);
                    zzbUc.remove(str);
                }
            } catch (Throwable th) {
                Class<hh> cls = hh.class;
                throw th;
            }
        }
        return j2;
    }

    private static <T> T zza(HashMap<String, T> hashMap, String str, T t) {
        synchronized (hh.class) {
            try {
                if (!hashMap.containsKey(str)) {
                    return null;
                }
                T t2 = hashMap.get(str);
                if (t2 == null) {
                    t2 = t;
                }
                return t2;
            } catch (Throwable th) {
                Class<hh> cls = hh.class;
                throw th;
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:16:0x0032, code lost:
        if (zzbUi == false) goto L_0x003c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x003a, code lost:
        if (zzbUc.isEmpty() == false) goto L_0x005d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x003c, code lost:
        zzc(r8, zzbUj);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0047, code lost:
        if (zzbUc.containsKey(r9) == false) goto L_0x005d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0049, code lost:
        r0 = zzbUc.get(r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0051, code lost:
        if (r0 == null) goto L_0x0054;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0053, code lost:
        r2 = r0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static java.lang.String zza(android.content.ContentResolver r8, java.lang.String r9, java.lang.String r10) {
        /*
            r7 = 1
            r3 = 0
            r2 = 0
            java.lang.Class<com.google.android.gms.internal.hh> r0 = com.google.android.gms.internal.hh.class
            monitor-enter(r0)
            zza(r8)     // Catch:{ all -> 0x0058 }
            java.lang.Object r6 = zzbUh     // Catch:{ all -> 0x0058 }
            java.util.HashMap<java.lang.String, java.lang.String> r0 = zzbUc     // Catch:{ all -> 0x0058 }
            boolean r0 = r0.containsKey(r9)     // Catch:{ all -> 0x0058 }
            if (r0 == 0) goto L_0x0022
            java.util.HashMap<java.lang.String, java.lang.String> r0 = zzbUc     // Catch:{ all -> 0x0058 }
            java.lang.Object r0 = r0.get(r9)     // Catch:{ all -> 0x0058 }
            java.lang.String r0 = (java.lang.String) r0     // Catch:{ all -> 0x0058 }
            if (r0 == 0) goto L_0x001e
            r2 = r0
        L_0x001e:
            java.lang.Class<com.google.android.gms.internal.hh> r0 = com.google.android.gms.internal.hh.class
            monitor-exit(r0)     // Catch:{ all -> 0x0058 }
        L_0x0021:
            return r2
        L_0x0022:
            java.lang.String[] r1 = zzbUj     // Catch:{ all -> 0x0058 }
            int r4 = r1.length     // Catch:{ all -> 0x0058 }
            r0 = r3
        L_0x0026:
            if (r0 >= r4) goto L_0x0064
            r5 = r1[r0]     // Catch:{ all -> 0x0058 }
            boolean r5 = r9.startsWith(r5)     // Catch:{ all -> 0x0058 }
            if (r5 == 0) goto L_0x0061
            boolean r0 = zzbUi     // Catch:{ all -> 0x0058 }
            if (r0 == 0) goto L_0x003c
            java.util.HashMap<java.lang.String, java.lang.String> r0 = zzbUc     // Catch:{ all -> 0x0058 }
            boolean r0 = r0.isEmpty()     // Catch:{ all -> 0x0058 }
            if (r0 == 0) goto L_0x005d
        L_0x003c:
            java.lang.String[] r0 = zzbUj     // Catch:{ all -> 0x0058 }
            zzc(r8, r0)     // Catch:{ all -> 0x0058 }
            java.util.HashMap<java.lang.String, java.lang.String> r0 = zzbUc     // Catch:{ all -> 0x0058 }
            boolean r0 = r0.containsKey(r9)     // Catch:{ all -> 0x0058 }
            if (r0 == 0) goto L_0x005d
            java.util.HashMap<java.lang.String, java.lang.String> r0 = zzbUc     // Catch:{ all -> 0x0058 }
            java.lang.Object r0 = r0.get(r9)     // Catch:{ all -> 0x0058 }
            java.lang.String r0 = (java.lang.String) r0     // Catch:{ all -> 0x0058 }
            if (r0 == 0) goto L_0x0054
            r2 = r0
        L_0x0054:
            java.lang.Class<com.google.android.gms.internal.hh> r0 = com.google.android.gms.internal.hh.class
            monitor-exit(r0)     // Catch:{ all -> 0x0058 }
            goto L_0x0021
        L_0x0058:
            r0 = move-exception
            java.lang.Class<com.google.android.gms.internal.hh> r1 = com.google.android.gms.internal.hh.class
            monitor-exit(r1)     // Catch:{ all -> 0x0058 }
            throw r0
        L_0x005d:
            java.lang.Class<com.google.android.gms.internal.hh> r0 = com.google.android.gms.internal.hh.class
            monitor-exit(r0)     // Catch:{ all -> 0x0058 }
            goto L_0x0021
        L_0x0061:
            int r0 = r0 + 1
            goto L_0x0026
        L_0x0064:
            java.lang.Class<com.google.android.gms.internal.hh> r0 = com.google.android.gms.internal.hh.class
            monitor-exit(r0)     // Catch:{ all -> 0x0058 }
            android.net.Uri r1 = CONTENT_URI
            java.lang.String[] r4 = new java.lang.String[r7]
            r4[r3] = r9
            r0 = r8
            r3 = r2
            r5 = r2
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5)
            if (r1 == 0) goto L_0x007c
            boolean r0 = r1.moveToFirst()     // Catch:{ all -> 0x00a1 }
            if (r0 != 0) goto L_0x0086
        L_0x007c:
            r0 = 0
            zza((java.lang.Object) r6, (java.lang.String) r9, (java.lang.String) r0)     // Catch:{ all -> 0x00a1 }
            if (r1 == 0) goto L_0x0021
            r1.close()
            goto L_0x0021
        L_0x0086:
            r0 = 1
            java.lang.String r0 = r1.getString(r0)     // Catch:{ all -> 0x00a1 }
            if (r0 == 0) goto L_0x0095
            r3 = 0
            boolean r3 = r0.equals(r3)     // Catch:{ all -> 0x00a1 }
            if (r3 == 0) goto L_0x0095
            r0 = r2
        L_0x0095:
            zza((java.lang.Object) r6, (java.lang.String) r9, (java.lang.String) r0)     // Catch:{ all -> 0x00a1 }
            if (r0 == 0) goto L_0x009b
            r2 = r0
        L_0x009b:
            if (r1 == 0) goto L_0x0021
            r1.close()
            goto L_0x0021
        L_0x00a1:
            r0 = move-exception
            if (r1 == 0) goto L_0x00a7
            r1.close()
        L_0x00a7:
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.hh.zza(android.content.ContentResolver, java.lang.String, java.lang.String):java.lang.String");
    }

    private static Map<String, String> zza(ContentResolver contentResolver, String... strArr) {
        Cursor query = contentResolver.query(zzbTY, (String[]) null, (String) null, strArr, (String) null);
        TreeMap treeMap = new TreeMap();
        if (query != null) {
            while (query.moveToNext()) {
                try {
                    treeMap.put(query.getString(0), query.getString(1));
                } finally {
                    query.close();
                }
            }
        }
        return treeMap;
    }

    private static void zza(ContentResolver contentResolver) {
        if (zzbUc == null) {
            zzbUb.set(false);
            zzbUc = new HashMap<>();
            zzbUh = new Object();
            zzbUi = false;
            contentResolver.registerContentObserver(CONTENT_URI, true, new hi((Handler) null));
        } else if (zzbUb.getAndSet(false)) {
            zzbUc.clear();
            zzbUd.clear();
            zzbUe.clear();
            zzbUf.clear();
            zzbUg.clear();
            zzbUh = new Object();
            zzbUi = false;
        }
    }

    private static void zza(Object obj, String str, String str2) {
        synchronized (hh.class) {
            try {
                if (obj == zzbUh) {
                    zzbUc.put(str, str2);
                }
            } catch (Throwable th) {
                Class<hh> cls = hh.class;
                throw th;
            }
        }
    }

    private static Object zzb(ContentResolver contentResolver) {
        Object obj;
        synchronized (hh.class) {
            try {
                zza(contentResolver);
                obj = zzbUh;
            } catch (Throwable th) {
                Class<hh> cls = hh.class;
                throw th;
            }
        }
        return obj;
    }

    public static void zzb(ContentResolver contentResolver, String... strArr) {
        String[] strArr2;
        if (strArr.length != 0) {
            synchronized (hh.class) {
                try {
                    zza(contentResolver);
                    HashSet hashSet = new HashSet((((zzbUj.length + strArr.length) << 2) / 3) + 1);
                    hashSet.addAll(Arrays.asList(zzbUj));
                    ArrayList arrayList = new ArrayList();
                    for (String str : strArr) {
                        if (hashSet.add(str)) {
                            arrayList.add(str);
                        }
                    }
                    if (arrayList.isEmpty()) {
                        strArr2 = new String[0];
                    } else {
                        zzbUj = (String[]) hashSet.toArray(new String[hashSet.size()]);
                        strArr2 = (String[]) arrayList.toArray(new String[arrayList.size()]);
                    }
                    if (!zzbUi || zzbUc.isEmpty()) {
                        zzc(contentResolver, zzbUj);
                    } else if (strArr2.length != 0) {
                        zzc(contentResolver, strArr2);
                    }
                } catch (Throwable th) {
                    Class<hh> cls = hh.class;
                    throw th;
                }
            }
        }
    }

    private static void zzc(ContentResolver contentResolver, String[] strArr) {
        zzbUc.putAll(zza(contentResolver, strArr));
        zzbUi = true;
    }
}
