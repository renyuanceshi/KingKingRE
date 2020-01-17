package com.google.android.gms.internal;

import android.os.SystemClock;
import java.io.BufferedOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

public final class zzag implements zzb {
    private final Map<String, zzai> zzav;
    private long zzaw;
    private final File zzax;
    private final int zzay;

    public zzag(File file) {
        this(file, 5242880);
    }

    private zzag(File file, int i) {
        this.zzav = new LinkedHashMap(16, 0.75f, true);
        this.zzaw = 0;
        this.zzax = file;
        this.zzay = 5242880;
    }

    private final void remove(String str) {
        synchronized (this) {
            boolean delete = zze(str).delete();
            zzai zzai = this.zzav.get(str);
            if (zzai != null) {
                this.zzaw -= zzai.size;
                this.zzav.remove(str);
            }
            if (!delete) {
                zzab.zzb("Could not delete cache entry for key=%s, filename=%s", str, zzd(str));
            }
        }
    }

    private static int zza(InputStream inputStream) throws IOException {
        int read = inputStream.read();
        if (read != -1) {
            return read;
        }
        throw new EOFException();
    }

    static void zza(OutputStream outputStream, int i) throws IOException {
        outputStream.write(i & 255);
        outputStream.write((i >> 8) & 255);
        outputStream.write((i >> 16) & 255);
        outputStream.write(i >>> 24);
    }

    static void zza(OutputStream outputStream, long j) throws IOException {
        outputStream.write((byte) ((int) j));
        outputStream.write((byte) ((int) (j >>> 8)));
        outputStream.write((byte) ((int) (j >>> 16)));
        outputStream.write((byte) ((int) (j >>> 24)));
        outputStream.write((byte) ((int) (j >>> 32)));
        outputStream.write((byte) ((int) (j >>> 40)));
        outputStream.write((byte) ((int) (j >>> 48)));
        outputStream.write((byte) ((int) (j >>> 56)));
    }

    static void zza(OutputStream outputStream, String str) throws IOException {
        byte[] bytes = str.getBytes("UTF-8");
        zza(outputStream, (long) bytes.length);
        outputStream.write(bytes, 0, bytes.length);
    }

    private final void zza(String str, zzai zzai) {
        if (!this.zzav.containsKey(str)) {
            this.zzaw += zzai.size;
        } else {
            this.zzaw = (zzai.size - this.zzav.get(str).size) + this.zzaw;
        }
        this.zzav.put(str, zzai);
    }

    private static byte[] zza(InputStream inputStream, int i) throws IOException {
        byte[] bArr = new byte[i];
        int i2 = 0;
        while (i2 < i) {
            int read = inputStream.read(bArr, i2, i - i2);
            if (read == -1) {
                break;
            }
            i2 += read;
        }
        if (i2 == i) {
            return bArr;
        }
        throw new IOException(new StringBuilder(50).append("Expected ").append(i).append(" bytes, read ").append(i2).append(" bytes").toString());
    }

    static int zzb(InputStream inputStream) throws IOException {
        return zza(inputStream) | 0 | (zza(inputStream) << 8) | (zza(inputStream) << 16) | (zza(inputStream) << 24);
    }

    static long zzc(InputStream inputStream) throws IOException {
        return 0 | (((long) zza(inputStream)) & 255) | ((((long) zza(inputStream)) & 255) << 8) | ((((long) zza(inputStream)) & 255) << 16) | ((((long) zza(inputStream)) & 255) << 24) | ((((long) zza(inputStream)) & 255) << 32) | ((((long) zza(inputStream)) & 255) << 40) | ((((long) zza(inputStream)) & 255) << 48) | ((((long) zza(inputStream)) & 255) << 56);
    }

    static String zzd(InputStream inputStream) throws IOException {
        return new String(zza(inputStream, (int) zzc(inputStream)), "UTF-8");
    }

    private static String zzd(String str) {
        int length = str.length() / 2;
        String valueOf = String.valueOf(String.valueOf(str.substring(0, length).hashCode()));
        String valueOf2 = String.valueOf(String.valueOf(str.substring(length).hashCode()));
        return valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
    }

    private final File zze(String str) {
        return new File(this.zzax, zzd(str));
    }

    static Map<String, String> zze(InputStream inputStream) throws IOException {
        int zzb = zzb(inputStream);
        Map<String, String> emptyMap = zzb == 0 ? Collections.emptyMap() : new HashMap<>(zzb);
        for (int i = 0; i < zzb; i++) {
            emptyMap.put(zzd(inputStream).intern(), zzd(inputStream).intern());
        }
        return emptyMap;
    }

    /* JADX WARNING: Removed duplicated region for block: B:26:0x0056 A[SYNTHETIC, Splitter:B:26:0x0056] */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x005b A[SYNTHETIC, Splitter:B:29:0x005b] */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x0065 A[SYNTHETIC, Splitter:B:35:0x0065] */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x004f A[SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final void initialize() {
        /*
            r10 = this;
            r2 = 0
            r0 = 0
            monitor-enter(r10)
            java.io.File r1 = r10.zzax     // Catch:{ all -> 0x0069 }
            boolean r1 = r1.exists()     // Catch:{ all -> 0x0069 }
            if (r1 != 0) goto L_0x0026
            java.io.File r0 = r10.zzax     // Catch:{ all -> 0x0069 }
            boolean r0 = r0.mkdirs()     // Catch:{ all -> 0x0069 }
            if (r0 != 0) goto L_0x0024
            java.lang.String r0 = "Unable to create cache dir %s"
            r1 = 1
            java.lang.Object[] r1 = new java.lang.Object[r1]     // Catch:{ all -> 0x0069 }
            r2 = 0
            java.io.File r3 = r10.zzax     // Catch:{ all -> 0x0069 }
            java.lang.String r3 = r3.getAbsolutePath()     // Catch:{ all -> 0x0069 }
            r1[r2] = r3     // Catch:{ all -> 0x0069 }
            com.google.android.gms.internal.zzab.zzc(r0, r1)     // Catch:{ all -> 0x0069 }
        L_0x0024:
            monitor-exit(r10)
            return
        L_0x0026:
            java.io.File r1 = r10.zzax     // Catch:{ all -> 0x0069 }
            java.io.File[] r3 = r1.listFiles()     // Catch:{ all -> 0x0069 }
            if (r3 == 0) goto L_0x0024
            int r4 = r3.length     // Catch:{ all -> 0x0069 }
        L_0x002f:
            if (r0 >= r4) goto L_0x0024
            r5 = r3[r0]
            java.io.BufferedInputStream r1 = new java.io.BufferedInputStream     // Catch:{ IOException -> 0x0052, all -> 0x0072 }
            java.io.FileInputStream r6 = new java.io.FileInputStream     // Catch:{ IOException -> 0x0052, all -> 0x0072 }
            r6.<init>(r5)     // Catch:{ IOException -> 0x0052, all -> 0x0072 }
            r1.<init>(r6)     // Catch:{ IOException -> 0x0052, all -> 0x0072 }
            com.google.android.gms.internal.zzai r6 = com.google.android.gms.internal.zzai.zzf(r1)     // Catch:{ IOException -> 0x0070 }
            long r8 = r5.length()     // Catch:{ IOException -> 0x0070 }
            r6.size = r8     // Catch:{ IOException -> 0x0070 }
            java.lang.String r7 = r6.key     // Catch:{ IOException -> 0x0070 }
            r10.zza((java.lang.String) r7, (com.google.android.gms.internal.zzai) r6)     // Catch:{ IOException -> 0x0070 }
            r1.close()     // Catch:{ IOException -> 0x006c }
        L_0x004f:
            int r0 = r0 + 1
            goto L_0x002f
        L_0x0052:
            r1 = move-exception
            r1 = r2
        L_0x0054:
            if (r5 == 0) goto L_0x0059
            r5.delete()     // Catch:{ all -> 0x0061 }
        L_0x0059:
            if (r1 == 0) goto L_0x004f
            r1.close()     // Catch:{ IOException -> 0x005f }
            goto L_0x004f
        L_0x005f:
            r1 = move-exception
            goto L_0x004f
        L_0x0061:
            r0 = move-exception
            r2 = r1
        L_0x0063:
            if (r2 == 0) goto L_0x0068
            r2.close()     // Catch:{ IOException -> 0x006e }
        L_0x0068:
            throw r0     // Catch:{ all -> 0x0069 }
        L_0x0069:
            r0 = move-exception
            monitor-exit(r10)
            throw r0
        L_0x006c:
            r1 = move-exception
            goto L_0x004f
        L_0x006e:
            r1 = move-exception
            goto L_0x0068
        L_0x0070:
            r6 = move-exception
            goto L_0x0054
        L_0x0072:
            r0 = move-exception
            goto L_0x0063
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzag.initialize():void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x0079 A[SYNTHETIC, Splitter:B:25:0x0079] */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x009e A[SYNTHETIC, Splitter:B:36:0x009e] */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00ac A[SYNTHETIC, Splitter:B:44:0x00ac] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final com.google.android.gms.internal.zzc zza(java.lang.String r11) {
        /*
            r10 = this;
            r1 = 0
            monitor-enter(r10)
            java.util.Map<java.lang.String, com.google.android.gms.internal.zzai> r0 = r10.zzav     // Catch:{ all -> 0x00b0 }
            java.lang.Object r0 = r0.get(r11)     // Catch:{ all -> 0x00b0 }
            com.google.android.gms.internal.zzai r0 = (com.google.android.gms.internal.zzai) r0     // Catch:{ all -> 0x00b0 }
            if (r0 != 0) goto L_0x000f
            r0 = r1
        L_0x000d:
            monitor-exit(r10)
            return r0
        L_0x000f:
            java.io.File r4 = r10.zze((java.lang.String) r11)     // Catch:{ all -> 0x00b0 }
            com.google.android.gms.internal.zzaj r3 = new com.google.android.gms.internal.zzaj     // Catch:{ IOException -> 0x005c, NegativeArraySizeException -> 0x0081, all -> 0x00a8 }
            java.io.BufferedInputStream r2 = new java.io.BufferedInputStream     // Catch:{ IOException -> 0x005c, NegativeArraySizeException -> 0x0081, all -> 0x00a8 }
            java.io.FileInputStream r5 = new java.io.FileInputStream     // Catch:{ IOException -> 0x005c, NegativeArraySizeException -> 0x0081, all -> 0x00a8 }
            r5.<init>(r4)     // Catch:{ IOException -> 0x005c, NegativeArraySizeException -> 0x0081, all -> 0x00a8 }
            r2.<init>(r5)     // Catch:{ IOException -> 0x005c, NegativeArraySizeException -> 0x0081, all -> 0x00a8 }
            r5 = 0
            r3.<init>(r2)     // Catch:{ IOException -> 0x005c, NegativeArraySizeException -> 0x0081, all -> 0x00a8 }
            com.google.android.gms.internal.zzai.zzf(r3)     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            long r6 = r4.length()     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            int r2 = r3.zzaz     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            long r8 = (long) r2     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            long r6 = r6 - r8
            int r2 = (int) r6     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            byte[] r5 = zza((java.io.InputStream) r3, (int) r2)     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            com.google.android.gms.internal.zzc r2 = new com.google.android.gms.internal.zzc     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            r2.<init>()     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            r2.data = r5     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            java.lang.String r5 = r0.zza     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            r2.zza = r5     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            long r6 = r0.zzb     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            r2.zzb = r6     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            long r6 = r0.zzc     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            r2.zzc = r6     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            long r6 = r0.zzd     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            r2.zzd = r6     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            long r6 = r0.zze     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            r2.zze = r6     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            java.util.Map<java.lang.String, java.lang.String> r0 = r0.zzf     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            r2.zzf = r0     // Catch:{ IOException -> 0x00ba, NegativeArraySizeException -> 0x00b7, all -> 0x00be }
            r3.close()     // Catch:{ IOException -> 0x0059 }
            r0 = r2
            goto L_0x000d
        L_0x0059:
            r0 = move-exception
            r0 = r1
            goto L_0x000d
        L_0x005c:
            r0 = move-exception
            r3 = r1
        L_0x005e:
            java.lang.String r2 = "%s: %s"
            r5 = 2
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch:{ all -> 0x00bc }
            r6 = 0
            java.lang.String r4 = r4.getAbsolutePath()     // Catch:{ all -> 0x00bc }
            r5[r6] = r4     // Catch:{ all -> 0x00bc }
            r4 = 1
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x00bc }
            r5[r4] = r0     // Catch:{ all -> 0x00bc }
            com.google.android.gms.internal.zzab.zzb(r2, r5)     // Catch:{ all -> 0x00bc }
            r10.remove(r11)     // Catch:{ all -> 0x00bc }
            if (r3 == 0) goto L_0x007c
            r3.close()     // Catch:{ IOException -> 0x007e }
        L_0x007c:
            r0 = r1
            goto L_0x000d
        L_0x007e:
            r0 = move-exception
            r0 = r1
            goto L_0x000d
        L_0x0081:
            r0 = move-exception
            r2 = r1
        L_0x0083:
            java.lang.String r3 = "%s: %s"
            r5 = 2
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch:{ all -> 0x00c0 }
            r6 = 0
            java.lang.String r4 = r4.getAbsolutePath()     // Catch:{ all -> 0x00c0 }
            r5[r6] = r4     // Catch:{ all -> 0x00c0 }
            r4 = 1
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x00c0 }
            r5[r4] = r0     // Catch:{ all -> 0x00c0 }
            com.google.android.gms.internal.zzab.zzb(r3, r5)     // Catch:{ all -> 0x00c0 }
            r10.remove(r11)     // Catch:{ all -> 0x00c0 }
            if (r2 == 0) goto L_0x00a1
            r2.close()     // Catch:{ IOException -> 0x00a4 }
        L_0x00a1:
            r0 = r1
            goto L_0x000d
        L_0x00a4:
            r0 = move-exception
            r0 = r1
            goto L_0x000d
        L_0x00a8:
            r0 = move-exception
            r3 = r1
        L_0x00aa:
            if (r3 == 0) goto L_0x00af
            r3.close()     // Catch:{ IOException -> 0x00b3 }
        L_0x00af:
            throw r0     // Catch:{ all -> 0x00b0 }
        L_0x00b0:
            r0 = move-exception
            monitor-exit(r10)
            throw r0
        L_0x00b3:
            r0 = move-exception
            r0 = r1
            goto L_0x000d
        L_0x00b7:
            r0 = move-exception
            r2 = r3
            goto L_0x0083
        L_0x00ba:
            r0 = move-exception
            goto L_0x005e
        L_0x00bc:
            r0 = move-exception
            goto L_0x00aa
        L_0x00be:
            r0 = move-exception
            goto L_0x00aa
        L_0x00c0:
            r0 = move-exception
            r3 = r2
            goto L_0x00aa
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzag.zza(java.lang.String):com.google.android.gms.internal.zzc");
    }

    public final void zza(String str, zzc zzc) {
        int i;
        int i2 = 0;
        synchronized (this) {
            int length = zzc.data.length;
            if (this.zzaw + ((long) length) >= ((long) this.zzay)) {
                if (zzab.DEBUG) {
                    zzab.zza("Pruning old cache entries.", new Object[0]);
                }
                long j = this.zzaw;
                long elapsedRealtime = SystemClock.elapsedRealtime();
                Iterator<Map.Entry<String, zzai>> it = this.zzav.entrySet().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        i = i2;
                        break;
                    }
                    zzai zzai = (zzai) it.next().getValue();
                    if (zze(zzai.key).delete()) {
                        this.zzaw -= zzai.size;
                    } else {
                        zzab.zzb("Could not delete cache entry for key=%s, filename=%s", zzai.key, zzd(zzai.key));
                    }
                    it.remove();
                    i = i2 + 1;
                    if (((float) (this.zzaw + ((long) length))) < ((float) this.zzay) * 0.9f) {
                        break;
                    }
                    i2 = i;
                }
                if (zzab.DEBUG) {
                    zzab.zza("pruned %d files, %d bytes, %d ms", Integer.valueOf(i), Long.valueOf(this.zzaw - j), Long.valueOf(SystemClock.elapsedRealtime() - elapsedRealtime));
                }
            }
            File zze = zze(str);
            try {
                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(zze));
                zzai zzai2 = new zzai(str, zzc);
                if (!zzai2.zza(bufferedOutputStream)) {
                    bufferedOutputStream.close();
                    zzab.zzb("Failed to write header for %s", zze.getAbsolutePath());
                    throw new IOException();
                }
                bufferedOutputStream.write(zzc.data);
                bufferedOutputStream.close();
                zza(str, zzai2);
            } catch (IOException e) {
                if (!zze.delete()) {
                    zzab.zzb("Could not clean up file %s", zze.getAbsolutePath());
                }
            }
        }
    }
}
