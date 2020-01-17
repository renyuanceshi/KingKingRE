package com.google.android.gms.common.util;

import android.os.Process;

public final class zzr {
    private static String zzaJW = null;
    private static final int zzaJX = Process.myPid();

    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v6, resolved type: java.lang.String} */
    /* JADX WARNING: type inference failed for: r0v0 */
    /* JADX WARNING: type inference failed for: r0v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r0v4 */
    /* JADX WARNING: type inference failed for: r0v7 */
    /* JADX WARNING: Multi-variable type inference failed */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static java.lang.String zzaD(int r6) {
        /*
            r0 = 0
            if (r6 > 0) goto L_0x0004
        L_0x0003:
            return r0
        L_0x0004:
            android.os.StrictMode$ThreadPolicy r2 = android.os.StrictMode.allowThreadDiskReads()     // Catch:{ IOException -> 0x0041, all -> 0x0047 }
            java.io.BufferedReader r1 = new java.io.BufferedReader     // Catch:{ all -> 0x003c }
            java.io.FileReader r3 = new java.io.FileReader     // Catch:{ all -> 0x003c }
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ all -> 0x003c }
            r5 = 25
            r4.<init>(r5)     // Catch:{ all -> 0x003c }
            java.lang.String r5 = "/proc/"
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x003c }
            java.lang.StringBuilder r4 = r4.append(r6)     // Catch:{ all -> 0x003c }
            java.lang.String r5 = "/cmdline"
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x003c }
            java.lang.String r4 = r4.toString()     // Catch:{ all -> 0x003c }
            r3.<init>(r4)     // Catch:{ all -> 0x003c }
            r1.<init>(r3)     // Catch:{ all -> 0x003c }
            android.os.StrictMode.setThreadPolicy(r2)     // Catch:{ IOException -> 0x0050, all -> 0x004d }
            java.lang.String r2 = r1.readLine()     // Catch:{ IOException -> 0x0050, all -> 0x004d }
            java.lang.String r0 = r2.trim()     // Catch:{ IOException -> 0x0050, all -> 0x004d }
            com.google.android.gms.common.util.zzn.closeQuietly(r1)
            goto L_0x0003
        L_0x003c:
            r1 = move-exception
            android.os.StrictMode.setThreadPolicy(r2)     // Catch:{ IOException -> 0x0041, all -> 0x0047 }
            throw r1     // Catch:{ IOException -> 0x0041, all -> 0x0047 }
        L_0x0041:
            r1 = move-exception
            r1 = r0
        L_0x0043:
            com.google.android.gms.common.util.zzn.closeQuietly(r1)
            goto L_0x0003
        L_0x0047:
            r1 = move-exception
            r2 = r1
        L_0x0049:
            com.google.android.gms.common.util.zzn.closeQuietly(r0)
            throw r2
        L_0x004d:
            r2 = move-exception
            r0 = r1
            goto L_0x0049
        L_0x0050:
            r2 = move-exception
            goto L_0x0043
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.common.util.zzr.zzaD(int):java.lang.String");
    }

    public static String zzsf() {
        if (zzaJW == null) {
            zzaJW = zzaD(zzaJX);
        }
        return zzaJW;
    }
}
