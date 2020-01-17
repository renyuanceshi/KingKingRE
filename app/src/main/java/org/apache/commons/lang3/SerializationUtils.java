package org.apache.commons.lang3;

import de.timroes.axmlrpc.serializer.SerializerHandler;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class SerializationUtils {

    static class ClassLoaderAwareObjectInputStream extends ObjectInputStream {
        private static final Map<String, Class<?>> primitiveTypes = new HashMap();
        private final ClassLoader classLoader;

        public ClassLoaderAwareObjectInputStream(InputStream inputStream, ClassLoader classLoader2) throws IOException {
            super(inputStream);
            this.classLoader = classLoader2;
            primitiveTypes.put("byte", Byte.TYPE);
            primitiveTypes.put("short", Short.TYPE);
            primitiveTypes.put(SerializerHandler.TYPE_INT, Integer.TYPE);
            primitiveTypes.put("long", Long.TYPE);
            primitiveTypes.put("float", Float.TYPE);
            primitiveTypes.put(SerializerHandler.TYPE_DOUBLE, Double.TYPE);
            primitiveTypes.put(SerializerHandler.TYPE_BOOLEAN, Boolean.TYPE);
            primitiveTypes.put("char", Character.TYPE);
            primitiveTypes.put("void", Void.TYPE);
        }

        /* access modifiers changed from: protected */
        public Class<?> resolveClass(ObjectStreamClass objectStreamClass) throws IOException, ClassNotFoundException {
            String name = objectStreamClass.getName();
            try {
                return Class.forName(name, false, this.classLoader);
            } catch (ClassNotFoundException e) {
                try {
                    return Class.forName(name, false, Thread.currentThread().getContextClassLoader());
                } catch (ClassNotFoundException e2) {
                    ClassNotFoundException classNotFoundException = e2;
                    Class<?> cls = primitiveTypes.get(name);
                    if (cls != null) {
                        return cls;
                    }
                    throw classNotFoundException;
                }
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x003e A[SYNTHETIC, Splitter:B:23:0x003e] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:16:0x0031=Splitter:B:16:0x0031, B:28:0x0044=Splitter:B:28:0x0044} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static <T extends java.io.Serializable> T clone(T r4) {
        /*
            r0 = 0
            if (r4 != 0) goto L_0x0004
        L_0x0003:
            return r0
        L_0x0004:
            java.io.ByteArrayInputStream r1 = new java.io.ByteArrayInputStream
            byte[] r2 = serialize(r4)
            r1.<init>(r2)
            org.apache.commons.lang3.SerializationUtils$ClassLoaderAwareObjectInputStream r2 = new org.apache.commons.lang3.SerializationUtils$ClassLoaderAwareObjectInputStream     // Catch:{ ClassNotFoundException -> 0x002f, IOException -> 0x0042, all -> 0x005d }
            java.lang.Class r3 = r4.getClass()     // Catch:{ ClassNotFoundException -> 0x002f, IOException -> 0x0042, all -> 0x005d }
            java.lang.ClassLoader r3 = r3.getClassLoader()     // Catch:{ ClassNotFoundException -> 0x002f, IOException -> 0x0042, all -> 0x005d }
            r2.<init>(r1, r3)     // Catch:{ ClassNotFoundException -> 0x002f, IOException -> 0x0042, all -> 0x005d }
            java.lang.Object r0 = r2.readObject()     // Catch:{ ClassNotFoundException -> 0x0058, IOException -> 0x0055, all -> 0x005b }
            java.io.Serializable r0 = (java.io.Serializable) r0     // Catch:{ ClassNotFoundException -> 0x0058, IOException -> 0x0055, all -> 0x005b }
            if (r2 == 0) goto L_0x0003
            r2.close()     // Catch:{ IOException -> 0x0026 }
            goto L_0x0003
        L_0x0026:
            r0 = move-exception
            org.apache.commons.lang3.SerializationException r1 = new org.apache.commons.lang3.SerializationException
            java.lang.String r2 = "IOException on closing cloned object data InputStream."
            r1.<init>(r2, r0)
            throw r1
        L_0x002f:
            r1 = move-exception
            r2 = r0
        L_0x0031:
            org.apache.commons.lang3.SerializationException r0 = new org.apache.commons.lang3.SerializationException     // Catch:{ all -> 0x0039 }
            java.lang.String r3 = "ClassNotFoundException while reading cloned object data"
            r0.<init>(r3, r1)     // Catch:{ all -> 0x0039 }
            throw r0     // Catch:{ all -> 0x0039 }
        L_0x0039:
            r0 = move-exception
            r1 = r0
        L_0x003b:
            r0 = r1
        L_0x003c:
            if (r2 == 0) goto L_0x0041
            r2.close()     // Catch:{ IOException -> 0x004c }
        L_0x0041:
            throw r0
        L_0x0042:
            r1 = move-exception
            r2 = r0
        L_0x0044:
            org.apache.commons.lang3.SerializationException r0 = new org.apache.commons.lang3.SerializationException     // Catch:{ all -> 0x0039 }
            java.lang.String r3 = "IOException while reading cloned object data"
            r0.<init>(r3, r1)     // Catch:{ all -> 0x0039 }
            throw r0     // Catch:{ all -> 0x0039 }
        L_0x004c:
            r0 = move-exception
            org.apache.commons.lang3.SerializationException r1 = new org.apache.commons.lang3.SerializationException
            java.lang.String r2 = "IOException on closing cloned object data InputStream."
            r1.<init>(r2, r0)
            throw r1
        L_0x0055:
            r0 = move-exception
            r1 = r0
            goto L_0x0044
        L_0x0058:
            r0 = move-exception
            r1 = r0
            goto L_0x0031
        L_0x005b:
            r0 = move-exception
            goto L_0x003c
        L_0x005d:
            r1 = move-exception
            r2 = r0
            goto L_0x003b
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.SerializationUtils.clone(java.io.Serializable):java.io.Serializable");
    }

    /* JADX WARNING: Removed duplicated region for block: B:19:0x0025 A[SYNTHETIC, Splitter:B:19:0x0025] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:24:0x002b=Splitter:B:24:0x002b, B:14:0x001c=Splitter:B:14:0x001c} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static <T> T deserialize(java.io.InputStream r3) {
        /*
            r2 = 0
            if (r3 != 0) goto L_0x000b
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.String r1 = "The InputStream must not be null"
            r0.<init>(r1)
            throw r0
        L_0x000b:
            java.io.ObjectInputStream r1 = new java.io.ObjectInputStream     // Catch:{ ClassCastException -> 0x001a, ClassNotFoundException -> 0x0029, IOException -> 0x0031, all -> 0x0045 }
            r1.<init>(r3)     // Catch:{ ClassCastException -> 0x001a, ClassNotFoundException -> 0x0029, IOException -> 0x0031, all -> 0x0045 }
            java.lang.Object r0 = r1.readObject()     // Catch:{ ClassCastException -> 0x0039, ClassNotFoundException -> 0x003b, IOException -> 0x003d, all -> 0x003f }
            if (r1 == 0) goto L_0x0019
            r1.close()     // Catch:{ IOException -> 0x0041 }
        L_0x0019:
            return r0
        L_0x001a:
            r0 = move-exception
            r1 = r2
        L_0x001c:
            org.apache.commons.lang3.SerializationException r2 = new org.apache.commons.lang3.SerializationException     // Catch:{ all -> 0x0022 }
            r2.<init>((java.lang.Throwable) r0)     // Catch:{ all -> 0x0022 }
            throw r2     // Catch:{ all -> 0x0022 }
        L_0x0022:
            r0 = move-exception
        L_0x0023:
            if (r1 == 0) goto L_0x0028
            r1.close()     // Catch:{ IOException -> 0x0043 }
        L_0x0028:
            throw r0
        L_0x0029:
            r0 = move-exception
            r1 = r2
        L_0x002b:
            org.apache.commons.lang3.SerializationException r2 = new org.apache.commons.lang3.SerializationException     // Catch:{ all -> 0x0022 }
            r2.<init>((java.lang.Throwable) r0)     // Catch:{ all -> 0x0022 }
            throw r2     // Catch:{ all -> 0x0022 }
        L_0x0031:
            r0 = move-exception
            r1 = r2
        L_0x0033:
            org.apache.commons.lang3.SerializationException r2 = new org.apache.commons.lang3.SerializationException     // Catch:{ all -> 0x0022 }
            r2.<init>((java.lang.Throwable) r0)     // Catch:{ all -> 0x0022 }
            throw r2     // Catch:{ all -> 0x0022 }
        L_0x0039:
            r0 = move-exception
            goto L_0x001c
        L_0x003b:
            r0 = move-exception
            goto L_0x002b
        L_0x003d:
            r0 = move-exception
            goto L_0x0033
        L_0x003f:
            r0 = move-exception
            goto L_0x0023
        L_0x0041:
            r1 = move-exception
            goto L_0x0019
        L_0x0043:
            r1 = move-exception
            goto L_0x0028
        L_0x0045:
            r0 = move-exception
            r1 = r2
            goto L_0x0023
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.SerializationUtils.deserialize(java.io.InputStream):java.lang.Object");
    }

    public static <T> T deserialize(byte[] bArr) {
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
            org.apache.commons.lang3.SerializationException r2 = new org.apache.commons.lang3.SerializationException     // Catch:{ all -> 0x0021 }
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
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.SerializationUtils.serialize(java.io.Serializable, java.io.OutputStream):void");
    }

    public static byte[] serialize(Serializable serializable) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(512);
        serialize(serializable, byteArrayOutputStream);
        return byteArrayOutputStream.toByteArray();
    }
}
