package org.apache.commons.lang;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.Serializable;

public class SerializationUtils {
    public static Object clone(Serializable serializable) {
        return deserialize(serialize(serializable));
    }

    /* JADX WARNING: Removed duplicated region for block: B:19:0x0025 A[SYNTHETIC, Splitter:B:19:0x0025] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:24:0x002b=Splitter:B:24:0x002b, B:14:0x001c=Splitter:B:14:0x001c} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static java.lang.Object deserialize(java.io.InputStream r3) {
        /*
            r2 = 0
            if (r3 != 0) goto L_0x000b
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.String r1 = "The InputStream must not be null"
            r0.<init>(r1)
            throw r0
        L_0x000b:
            java.io.ObjectInputStream r1 = new java.io.ObjectInputStream     // Catch:{ ClassNotFoundException -> 0x001a, IOException -> 0x0029, all -> 0x003b }
            r1.<init>(r3)     // Catch:{ ClassNotFoundException -> 0x001a, IOException -> 0x0029, all -> 0x003b }
            java.lang.Object r0 = r1.readObject()     // Catch:{ ClassNotFoundException -> 0x0031, IOException -> 0x0033, all -> 0x0035 }
            if (r1 == 0) goto L_0x0019
            r1.close()     // Catch:{ IOException -> 0x0037 }
        L_0x0019:
            return r0
        L_0x001a:
            r0 = move-exception
            r1 = r2
        L_0x001c:
            org.apache.commons.lang.SerializationException r2 = new org.apache.commons.lang.SerializationException     // Catch:{ all -> 0x0022 }
            r2.<init>((java.lang.Throwable) r0)     // Catch:{ all -> 0x0022 }
            throw r2     // Catch:{ all -> 0x0022 }
        L_0x0022:
            r0 = move-exception
        L_0x0023:
            if (r1 == 0) goto L_0x0028
            r1.close()     // Catch:{ IOException -> 0x0039 }
        L_0x0028:
            throw r0
        L_0x0029:
            r0 = move-exception
            r1 = r2
        L_0x002b:
            org.apache.commons.lang.SerializationException r2 = new org.apache.commons.lang.SerializationException     // Catch:{ all -> 0x0022 }
            r2.<init>((java.lang.Throwable) r0)     // Catch:{ all -> 0x0022 }
            throw r2     // Catch:{ all -> 0x0022 }
        L_0x0031:
            r0 = move-exception
            goto L_0x001c
        L_0x0033:
            r0 = move-exception
            goto L_0x002b
        L_0x0035:
            r0 = move-exception
            goto L_0x0023
        L_0x0037:
            r1 = move-exception
            goto L_0x0019
        L_0x0039:
            r1 = move-exception
            goto L_0x0028
        L_0x003b:
            r0 = move-exception
            r1 = r2
            goto L_0x0023
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.SerializationUtils.deserialize(java.io.InputStream):java.lang.Object");
    }

    public static Object deserialize(byte[] bArr) {
        if (bArr != null) {
            return deserialize((InputStream) new ByteArrayInputStream(bArr));
        }
        throw new IllegalArgumentException("The byte[] must not be null");
    }

    /* JADX WARNING: Removed duplicated region for block: B:18:0x0024 A[SYNTHETIC, Splitter:B:18:0x0024] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void serialize(java.io.Serializable r3, java.io.OutputStream r4) {
        /*
            r2 = 0
            if (r4 != 0) goto L_0x000b
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.String r1 = "The OutputStream must not be null"
            r0.<init>(r1)
            throw r0
        L_0x000b:
            java.io.ObjectOutputStream r1 = new java.io.ObjectOutputStream     // Catch:{ IOException -> 0x0019, all -> 0x0030 }
            r1.<init>(r4)     // Catch:{ IOException -> 0x0019, all -> 0x0030 }
            r1.writeObject(r3)     // Catch:{ IOException -> 0x0028, all -> 0x002a }
            if (r1 == 0) goto L_0x0018
            r1.close()     // Catch:{ IOException -> 0x002c }
        L_0x0018:
            return
        L_0x0019:
            r0 = move-exception
            r1 = r2
        L_0x001b:
            org.apache.commons.lang.SerializationException r2 = new org.apache.commons.lang.SerializationException     // Catch:{ all -> 0x0021 }
            r2.<init>((java.lang.Throwable) r0)     // Catch:{ all -> 0x0021 }
            throw r2     // Catch:{ all -> 0x0021 }
        L_0x0021:
            r0 = move-exception
        L_0x0022:
            if (r1 == 0) goto L_0x0027
            r1.close()     // Catch:{ IOException -> 0x002e }
        L_0x0027:
            throw r0
        L_0x0028:
            r0 = move-exception
            goto L_0x001b
        L_0x002a:
            r0 = move-exception
            goto L_0x0022
        L_0x002c:
            r0 = move-exception
            goto L_0x0018
        L_0x002e:
            r1 = move-exception
            goto L_0x0027
        L_0x0030:
            r0 = move-exception
            r1 = r2
            goto L_0x0022
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.SerializationUtils.serialize(java.io.Serializable, java.io.OutputStream):void");
    }

    public static byte[] serialize(Serializable serializable) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(512);
        serialize(serializable, byteArrayOutputStream);
        return byteArrayOutputStream.toByteArray();
    }
}
