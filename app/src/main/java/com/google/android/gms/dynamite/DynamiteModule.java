package com.google.android.gms.dynamite;

import android.content.Context;
import android.database.Cursor;
import android.os.IBinder;
import android.os.IInterface;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.common.util.DynamiteApi;
import com.google.android.gms.dynamic.IObjectWrapper;
import com.google.android.gms.dynamic.zzn;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;

public final class DynamiteModule {
    private static Boolean zzaSF;
    private static zzj zzaSG;
    private static zzl zzaSH;
    private static String zzaSI;
    private static final ThreadLocal<zza> zzaSJ = new ThreadLocal<>();
    private static final zzh zzaSK = new zza();
    public static final zzd zzaSL = new zzb();
    private static zzd zzaSM = new zzc();
    public static final zzd zzaSN = new zzd();
    public static final zzd zzaSO = new zze();
    public static final zzd zzaSP = new zzf();
    private final Context zzaSQ;

    @DynamiteApi
    public static class DynamiteLoaderClassLoader {
        public static ClassLoader sClassLoader;
    }

    static final class zza {
        public Cursor zzaSR;

        private zza() {
        }

        /* synthetic */ zza(zza zza) {
            this();
        }
    }

    static final class zzb implements zzh {
        private final int zzaSS;
        private final int zzaST = 0;

        public zzb(int i, int i2) {
            this.zzaSS = i;
        }

        public final int zzE(Context context, String str) {
            return this.zzaSS;
        }

        public final int zzb(Context context, String str, boolean z) {
            return 0;
        }
    }

    public static final class zzc extends Exception {
        private zzc(String str) {
            super(str);
        }

        /* synthetic */ zzc(String str, zza zza) {
            this(str);
        }

        private zzc(String str, Throwable th) {
            super(str, th);
        }

        /* synthetic */ zzc(String str, Throwable th, zza zza) {
            this(str, th);
        }
    }

    public interface zzd {
        zzi zza(Context context, String str, zzh zzh) throws zzc;
    }

    private DynamiteModule(Context context) {
        this.zzaSQ = (Context) zzbo.zzu(context);
    }

    public static int zzE(Context context, String str) {
        try {
            ClassLoader classLoader = context.getApplicationContext().getClassLoader();
            String valueOf = String.valueOf("com.google.android.gms.dynamite.descriptors.");
            String valueOf2 = String.valueOf("ModuleDescriptor");
            Class<?> loadClass = classLoader.loadClass(new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(str).length() + String.valueOf(valueOf2).length()).append(valueOf).append(str).append(".").append(valueOf2).toString());
            Field declaredField = loadClass.getDeclaredField("MODULE_ID");
            Field declaredField2 = loadClass.getDeclaredField("MODULE_VERSION");
            if (declaredField.get((Object) null).equals(str)) {
                return declaredField2.getInt((Object) null);
            }
            String valueOf3 = String.valueOf(declaredField.get((Object) null));
            Log.e("DynamiteModule", new StringBuilder(String.valueOf(valueOf3).length() + 51 + String.valueOf(str).length()).append("Module descriptor id '").append(valueOf3).append("' didn't match expected id '").append(str).append("'").toString());
            return 0;
        } catch (ClassNotFoundException e) {
            Log.w("DynamiteModule", new StringBuilder(String.valueOf(str).length() + 45).append("Local module descriptor class for ").append(str).append(" not found.").toString());
            return 0;
        } catch (Exception e2) {
            String valueOf4 = String.valueOf(e2.getMessage());
            Log.e("DynamiteModule", valueOf4.length() != 0 ? "Failed to load module descriptor class: ".concat(valueOf4) : new String("Failed to load module descriptor class: "));
            return 0;
        }
    }

    public static int zzF(Context context, String str) {
        return zzb(context, str, false);
    }

    private static DynamiteModule zzG(Context context, String str) {
        String valueOf = String.valueOf(str);
        Log.i("DynamiteModule", valueOf.length() != 0 ? "Selected local version of ".concat(valueOf) : new String("Selected local version of "));
        return new DynamiteModule(context.getApplicationContext());
    }

    private static Context zza(Context context, String str, int i, Cursor cursor, zzl zzl) {
        try {
            return (Context) zzn.zzE(zzl.zza(zzn.zzw(context), str, i, zzn.zzw(cursor)));
        } catch (Exception e) {
            String valueOf = String.valueOf(e.toString());
            Log.e("DynamiteModule", valueOf.length() != 0 ? "Failed to load DynamiteLoader: ".concat(valueOf) : new String("Failed to load DynamiteLoader: "));
            return null;
        }
    }

    public static DynamiteModule zza(Context context, zzd zzd2, String str) throws zzc {
        zzi zza2;
        zza zza3 = zzaSJ.get();
        zza zza4 = new zza((zza) null);
        zzaSJ.set(zza4);
        try {
            zza2 = zzd2.zza(context, str, zzaSK);
            Log.i("DynamiteModule", new StringBuilder(String.valueOf(str).length() + 68 + String.valueOf(str).length()).append("Considering local module ").append(str).append(":").append(zza2.zzaSU).append(" and remote module ").append(str).append(":").append(zza2.zzaSV).toString());
            if (zza2.zzaSW == 0 || ((zza2.zzaSW == -1 && zza2.zzaSU == 0) || (zza2.zzaSW == 1 && zza2.zzaSV == 0))) {
                throw new zzc(new StringBuilder(91).append("No acceptable module found. Local version is ").append(zza2.zzaSU).append(" and remote version is ").append(zza2.zzaSV).append(".").toString(), (zza) null);
            } else if (zza2.zzaSW == -1) {
                DynamiteModule zzG = zzG(context, str);
                if (zza4.zzaSR != null) {
                    zza4.zzaSR.close();
                }
                zzaSJ.set(zza3);
                return zzG;
            } else if (zza2.zzaSW == 1) {
                DynamiteModule zza5 = zza(context, str, zza2.zzaSV);
                if (zza4.zzaSR != null) {
                    zza4.zzaSR.close();
                }
                zzaSJ.set(zza3);
                return zza5;
            } else {
                throw new zzc(new StringBuilder(47).append("VersionPolicy returned invalid code:").append(zza2.zzaSW).toString(), (zza) null);
            }
        } catch (zzc e) {
            String valueOf = String.valueOf(e.getMessage());
            Log.w("DynamiteModule", valueOf.length() != 0 ? "Failed to load remote module: ".concat(valueOf) : new String("Failed to load remote module: "));
            if (zza2.zzaSU == 0 || zzd2.zza(context, str, new zzb(zza2.zzaSU, 0)).zzaSW != -1) {
                throw new zzc("Remote load failed. No local fallback found.", e, (zza) null);
            }
            DynamiteModule zzG2 = zzG(context, str);
            if (zza4.zzaSR != null) {
                zza4.zzaSR.close();
            }
            zzaSJ.set(zza3);
            return zzG2;
        } catch (Throwable th) {
            if (zza4.zzaSR != null) {
                zza4.zzaSR.close();
            }
            zzaSJ.set(zza3);
            throw th;
        }
    }

    private static DynamiteModule zza(Context context, String str, int i) throws zzc {
        Boolean bool;
        synchronized (DynamiteModule.class) {
            try {
                bool = zzaSF;
            } catch (Throwable th) {
                while (true) {
                    Class<DynamiteModule> cls = DynamiteModule.class;
                    throw th;
                }
            }
        }
        if (bool != null) {
            return bool.booleanValue() ? zzc(context, str, i) : zzb(context, str, i);
        }
        throw new zzc("Failed to determine which loading route to use.", (zza) null);
    }

    private static void zza(ClassLoader classLoader) throws zzc {
        zzl zzm;
        try {
            IBinder iBinder = (IBinder) classLoader.loadClass("com.google.android.gms.dynamiteloader.DynamiteLoaderV2").getConstructor(new Class[0]).newInstance(new Object[0]);
            if (iBinder == null) {
                zzm = null;
            } else {
                IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.dynamite.IDynamiteLoaderV2");
                zzm = queryLocalInterface instanceof zzl ? (zzl) queryLocalInterface : new zzm(iBinder);
            }
            zzaSH = zzm;
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e) {
            throw new zzc("Failed to instantiate dynamite loader", e, (zza) null);
        }
    }

    /* JADX WARNING: No exception handlers in catch block: Catch:{  } */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static com.google.android.gms.dynamite.zzj zzaT(android.content.Context r5) {
        /*
            r3 = 0
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r1 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-enter(r1)
            com.google.android.gms.dynamite.zzj r1 = zzaSG     // Catch:{ all -> 0x003f }
            if (r1 == 0) goto L_0x000e
            com.google.android.gms.dynamite.zzj r1 = zzaSG     // Catch:{ all -> 0x003f }
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r2 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-exit(r2)     // Catch:{ all -> 0x003f }
        L_0x000d:
            return r1
        L_0x000e:
            com.google.android.gms.common.zze r1 = com.google.android.gms.common.zze.zzoW()     // Catch:{ all -> 0x003f }
            int r1 = r1.isGooglePlayServicesAvailable(r5)     // Catch:{ all -> 0x003f }
            if (r1 == 0) goto L_0x001d
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r1 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-exit(r1)     // Catch:{ all -> 0x003f }
            r1 = r3
            goto L_0x000d
        L_0x001d:
            java.lang.String r1 = "com.google.android.gms"
            r2 = 3
            android.content.Context r1 = r5.createPackageContext(r1, r2)     // Catch:{ Exception -> 0x005a }
            java.lang.ClassLoader r1 = r1.getClassLoader()     // Catch:{ Exception -> 0x005a }
            java.lang.String r2 = "com.google.android.gms.chimera.container.DynamiteLoaderImpl"
            java.lang.Class r1 = r1.loadClass(r2)     // Catch:{ Exception -> 0x005a }
            java.lang.Object r1 = r1.newInstance()     // Catch:{ Exception -> 0x005a }
            android.os.IBinder r1 = (android.os.IBinder) r1     // Catch:{ Exception -> 0x005a }
            if (r1 != 0) goto L_0x0044
            r1 = r3
        L_0x0037:
            if (r1 == 0) goto L_0x0074
            zzaSG = r1     // Catch:{ Exception -> 0x005a }
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r2 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-exit(r2)     // Catch:{ all -> 0x003f }
            goto L_0x000d
        L_0x003f:
            r1 = move-exception
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r2 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-exit(r2)     // Catch:{ all -> 0x003f }
            throw r1
        L_0x0044:
            java.lang.String r2 = "com.google.android.gms.dynamite.IDynamiteLoader"
            android.os.IInterface r2 = r1.queryLocalInterface(r2)     // Catch:{ Exception -> 0x005a }
            boolean r4 = r2 instanceof com.google.android.gms.dynamite.zzj     // Catch:{ Exception -> 0x005a }
            if (r4 == 0) goto L_0x0053
            r0 = r2
            com.google.android.gms.dynamite.zzj r0 = (com.google.android.gms.dynamite.zzj) r0     // Catch:{ Exception -> 0x005a }
            r1 = r0
            goto L_0x0037
        L_0x0053:
            com.google.android.gms.dynamite.zzk r2 = new com.google.android.gms.dynamite.zzk     // Catch:{ Exception -> 0x005a }
            r2.<init>(r1)     // Catch:{ Exception -> 0x005a }
            r1 = r2
            goto L_0x0037
        L_0x005a:
            r1 = move-exception
            java.lang.String r1 = r1.getMessage()     // Catch:{ all -> 0x003f }
            java.lang.String r1 = java.lang.String.valueOf(r1)     // Catch:{ all -> 0x003f }
            int r2 = r1.length()     // Catch:{ all -> 0x003f }
            if (r2 == 0) goto L_0x0079
            java.lang.String r2 = "Failed to load IDynamiteLoader from GmsCore: "
            java.lang.String r1 = r2.concat(r1)     // Catch:{ all -> 0x003f }
        L_0x006f:
            java.lang.String r2 = "DynamiteModule"
            android.util.Log.e(r2, r1)     // Catch:{ all -> 0x003f }
        L_0x0074:
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r1 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-exit(r1)     // Catch:{ all -> 0x003f }
            r1 = r3
            goto L_0x000d
        L_0x0079:
            java.lang.String r1 = new java.lang.String     // Catch:{ all -> 0x003f }
            java.lang.String r2 = "Failed to load IDynamiteLoader from GmsCore: "
            r1.<init>(r2)     // Catch:{ all -> 0x003f }
            goto L_0x006f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.dynamite.DynamiteModule.zzaT(android.content.Context):com.google.android.gms.dynamite.zzj");
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x003d A[SYNTHETIC, Splitter:B:22:0x003d] */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x00f7  */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:36:0x0073=Splitter:B:36:0x0073, B:26:0x0045=Splitter:B:26:0x0045} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int zzb(android.content.Context r6, java.lang.String r7, boolean r8) {
        /*
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r0 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-enter(r0)
            java.lang.Boolean r0 = zzaSF     // Catch:{ all -> 0x0078 }
            if (r0 != 0) goto L_0x0034
            android.content.Context r0 = r6.getApplicationContext()     // Catch:{ ClassNotFoundException -> 0x00a7, IllegalAccessException -> 0x0100, NoSuchFieldException -> 0x0102 }
            java.lang.ClassLoader r0 = r0.getClassLoader()     // Catch:{ ClassNotFoundException -> 0x00a7, IllegalAccessException -> 0x0100, NoSuchFieldException -> 0x0102 }
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule$DynamiteLoaderClassLoader> r1 = com.google.android.gms.dynamite.DynamiteModule.DynamiteLoaderClassLoader.class
            java.lang.String r1 = r1.getName()     // Catch:{ ClassNotFoundException -> 0x00a7, IllegalAccessException -> 0x0100, NoSuchFieldException -> 0x0102 }
            java.lang.Class r1 = r0.loadClass(r1)     // Catch:{ ClassNotFoundException -> 0x00a7, IllegalAccessException -> 0x0100, NoSuchFieldException -> 0x0102 }
            java.lang.String r0 = "sClassLoader"
            java.lang.reflect.Field r2 = r1.getDeclaredField(r0)     // Catch:{ ClassNotFoundException -> 0x00a7, IllegalAccessException -> 0x0100, NoSuchFieldException -> 0x0102 }
            monitor-enter(r1)     // Catch:{ ClassNotFoundException -> 0x00a7, IllegalAccessException -> 0x0100, NoSuchFieldException -> 0x0102 }
            r0 = 0
            java.lang.Object r0 = r2.get(r0)     // Catch:{ all -> 0x00a4 }
            java.lang.ClassLoader r0 = (java.lang.ClassLoader) r0     // Catch:{ all -> 0x00a4 }
            if (r0 == 0) goto L_0x0048
            java.lang.ClassLoader r2 = java.lang.ClassLoader.getSystemClassLoader()     // Catch:{ all -> 0x00a4 }
            if (r0 != r2) goto L_0x0042
            java.lang.Boolean r0 = java.lang.Boolean.FALSE     // Catch:{ all -> 0x00a4 }
        L_0x0031:
            monitor-exit(r1)     // Catch:{ all -> 0x00a4 }
        L_0x0032:
            zzaSF = r0     // Catch:{ all -> 0x0078 }
        L_0x0034:
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r1 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-exit(r1)     // Catch:{ all -> 0x0078 }
            boolean r0 = r0.booleanValue()
            if (r0 == 0) goto L_0x00f7
            int r0 = zzd(r6, r7, r8)     // Catch:{ zzc -> 0x00d2 }
        L_0x0041:
            return r0
        L_0x0042:
            zza(r0)     // Catch:{ zzc -> 0x00fd }
        L_0x0045:
            java.lang.Boolean r0 = java.lang.Boolean.TRUE     // Catch:{ all -> 0x00a4 }
            goto L_0x0031
        L_0x0048:
            java.lang.String r0 = "com.google.android.gms"
            android.content.Context r3 = r6.getApplicationContext()     // Catch:{ all -> 0x00a4 }
            java.lang.String r3 = r3.getPackageName()     // Catch:{ all -> 0x00a4 }
            boolean r0 = r0.equals(r3)     // Catch:{ all -> 0x00a4 }
            if (r0 == 0) goto L_0x0063
            r0 = 0
            java.lang.ClassLoader r3 = java.lang.ClassLoader.getSystemClassLoader()     // Catch:{ all -> 0x00a4 }
            r2.set(r0, r3)     // Catch:{ all -> 0x00a4 }
            java.lang.Boolean r0 = java.lang.Boolean.FALSE     // Catch:{ all -> 0x00a4 }
            goto L_0x0031
        L_0x0063:
            int r0 = zzd(r6, r7, r8)     // Catch:{ zzc -> 0x0098 }
            java.lang.String r3 = zzaSI     // Catch:{ zzc -> 0x0098 }
            if (r3 == 0) goto L_0x0073
            java.lang.String r3 = zzaSI     // Catch:{ zzc -> 0x0098 }
            boolean r3 = r3.isEmpty()     // Catch:{ zzc -> 0x0098 }
            if (r3 == 0) goto L_0x007d
        L_0x0073:
            monitor-exit(r1)     // Catch:{ all -> 0x00a4 }
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r1 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-exit(r1)     // Catch:{ all -> 0x0078 }
            goto L_0x0041
        L_0x0078:
            r0 = move-exception
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r1 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-exit(r1)     // Catch:{ all -> 0x0078 }
            throw r0
        L_0x007d:
            com.google.android.gms.dynamite.zzg r3 = new com.google.android.gms.dynamite.zzg     // Catch:{ zzc -> 0x0098 }
            java.lang.String r4 = zzaSI     // Catch:{ zzc -> 0x0098 }
            java.lang.ClassLoader r5 = java.lang.ClassLoader.getSystemClassLoader()     // Catch:{ zzc -> 0x0098 }
            r3.<init>(r4, r5)     // Catch:{ zzc -> 0x0098 }
            zza(r3)     // Catch:{ zzc -> 0x0098 }
            r4 = 0
            r2.set(r4, r3)     // Catch:{ zzc -> 0x0098 }
            java.lang.Boolean r3 = java.lang.Boolean.TRUE     // Catch:{ zzc -> 0x0098 }
            zzaSF = r3     // Catch:{ zzc -> 0x0098 }
            monitor-exit(r1)     // Catch:{ all -> 0x00a4 }
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r1 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-exit(r1)     // Catch:{ all -> 0x0078 }
            goto L_0x0041
        L_0x0098:
            r0 = move-exception
            r0 = 0
            java.lang.ClassLoader r3 = java.lang.ClassLoader.getSystemClassLoader()     // Catch:{ all -> 0x00a4 }
            r2.set(r0, r3)     // Catch:{ all -> 0x00a4 }
            java.lang.Boolean r0 = java.lang.Boolean.FALSE     // Catch:{ all -> 0x00a4 }
            goto L_0x0031
        L_0x00a4:
            r0 = move-exception
            monitor-exit(r1)     // Catch:{ all -> 0x00a4 }
            throw r0     // Catch:{ ClassNotFoundException -> 0x00a7, IllegalAccessException -> 0x0100, NoSuchFieldException -> 0x0102 }
        L_0x00a7:
            r0 = move-exception
        L_0x00a8:
            java.lang.String r0 = java.lang.String.valueOf(r0)     // Catch:{ all -> 0x0078 }
            java.lang.String r1 = java.lang.String.valueOf(r0)     // Catch:{ all -> 0x0078 }
            int r1 = r1.length()     // Catch:{ all -> 0x0078 }
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch:{ all -> 0x0078 }
            int r1 = r1 + 30
            r2.<init>(r1)     // Catch:{ all -> 0x0078 }
            java.lang.String r1 = "DynamiteModule"
            java.lang.String r3 = "Failed to load module via V2: "
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch:{ all -> 0x0078 }
            java.lang.StringBuilder r0 = r2.append(r0)     // Catch:{ all -> 0x0078 }
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x0078 }
            android.util.Log.w(r1, r0)     // Catch:{ all -> 0x0078 }
            java.lang.Boolean r0 = java.lang.Boolean.FALSE     // Catch:{ all -> 0x0078 }
            goto L_0x0032
        L_0x00d2:
            r0 = move-exception
            java.lang.String r0 = r0.getMessage()
            java.lang.String r0 = java.lang.String.valueOf(r0)
            int r1 = r0.length()
            if (r1 == 0) goto L_0x00ef
            java.lang.String r1 = "Failed to retrieve remote module version: "
            java.lang.String r0 = r1.concat(r0)
        L_0x00e7:
            java.lang.String r1 = "DynamiteModule"
            android.util.Log.w(r1, r0)
            r0 = 0
            goto L_0x0041
        L_0x00ef:
            java.lang.String r0 = new java.lang.String
            java.lang.String r1 = "Failed to retrieve remote module version: "
            r0.<init>(r1)
            goto L_0x00e7
        L_0x00f7:
            int r0 = zzc((android.content.Context) r6, (java.lang.String) r7, (boolean) r8)
            goto L_0x0041
        L_0x00fd:
            r0 = move-exception
            goto L_0x0045
        L_0x0100:
            r0 = move-exception
            goto L_0x00a8
        L_0x0102:
            r0 = move-exception
            goto L_0x00a8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.dynamite.DynamiteModule.zzb(android.content.Context, java.lang.String, boolean):int");
    }

    private static DynamiteModule zzb(Context context, String str, int i) throws zzc {
        Log.i("DynamiteModule", new StringBuilder(String.valueOf(str).length() + 51).append("Selected remote version of ").append(str).append(", version >= ").append(i).toString());
        zzj zzaT = zzaT(context);
        if (zzaT == null) {
            throw new zzc("Failed to create IDynamiteLoader.", (zza) null);
        }
        try {
            IObjectWrapper zza2 = zzaT.zza(zzn.zzw(context), str, i);
            if (zzn.zzE(zza2) != null) {
                return new DynamiteModule((Context) zzn.zzE(zza2));
            }
            throw new zzc("Failed to load remote module.", (zza) null);
        } catch (RemoteException e) {
            throw new zzc("Failed to load remote module.", e, (zza) null);
        }
    }

    private static int zzc(Context context, String str, boolean z) {
        zzj zzaT = zzaT(context);
        if (zzaT == null) {
            return 0;
        }
        try {
            return zzaT.zza(zzn.zzw(context), str, z);
        } catch (RemoteException e) {
            String valueOf = String.valueOf(e.getMessage());
            Log.w("DynamiteModule", valueOf.length() != 0 ? "Failed to retrieve remote module version: ".concat(valueOf) : new String("Failed to retrieve remote module version: "));
            return 0;
        }
    }

    private static DynamiteModule zzc(Context context, String str, int i) throws zzc {
        zzl zzl;
        Log.i("DynamiteModule", new StringBuilder(String.valueOf(str).length() + 51).append("Selected remote version of ").append(str).append(", version >= ").append(i).toString());
        synchronized (DynamiteModule.class) {
            try {
                zzl = zzaSH;
            } catch (Throwable th) {
                while (true) {
                    Class<DynamiteModule> cls = DynamiteModule.class;
                    throw th;
                }
            }
        }
        if (zzl == null) {
            throw new zzc("DynamiteLoaderV2 was not cached.", (zza) null);
        }
        zza zza2 = zzaSJ.get();
        if (zza2 == null || zza2.zzaSR == null) {
            throw new zzc("No result cursor", (zza) null);
        }
        Context zza3 = zza(context.getApplicationContext(), str, i, zza2.zzaSR, zzl);
        if (zza3 != null) {
            return new DynamiteModule(zza3);
        }
        throw new zzc("Failed to get module context", (zza) null);
    }

    /* JADX WARNING: Removed duplicated region for block: B:19:0x0073  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static int zzd(android.content.Context r7, java.lang.String r8, boolean r9) throws com.google.android.gms.dynamite.DynamiteModule.zzc {
        /*
            r6 = 0
            if (r9 == 0) goto L_0x0077
            java.lang.String r0 = "api_force_staging"
        L_0x0005:
            java.lang.String r1 = "content://com.google.android.gms.chimera/"
            java.lang.String r1 = java.lang.String.valueOf(r1)     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            java.lang.String r2 = java.lang.String.valueOf(r1)     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            int r2 = r2.length()     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            java.lang.String r3 = java.lang.String.valueOf(r0)     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            int r3 = r3.length()     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            java.lang.String r4 = java.lang.String.valueOf(r8)     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            int r4 = r4.length()     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            int r2 = r2 + 1
            int r2 = r2 + r3
            int r2 = r2 + r4
            r5.<init>(r2)     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            java.lang.StringBuilder r1 = r5.append(r1)     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            java.lang.StringBuilder r0 = r1.append(r0)     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            java.lang.String r1 = "/"
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            java.lang.StringBuilder r0 = r0.append(r8)     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            java.lang.String r0 = r0.toString()     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            android.net.Uri r1 = android.net.Uri.parse(r0)     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            android.content.ContentResolver r0 = r7.getContentResolver()     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5)     // Catch:{ Exception -> 0x00b6, all -> 0x00b3 }
            if (r1 == 0) goto L_0x005a
            boolean r0 = r1.moveToFirst()     // Catch:{ Exception -> 0x006a }
            if (r0 != 0) goto L_0x007a
        L_0x005a:
            java.lang.String r0 = "DynamiteModule"
            java.lang.String r2 = "Failed to retrieve remote module version."
            android.util.Log.w(r0, r2)     // Catch:{ Exception -> 0x006a }
            com.google.android.gms.dynamite.DynamiteModule$zzc r0 = new com.google.android.gms.dynamite.DynamiteModule$zzc     // Catch:{ Exception -> 0x006a }
            java.lang.String r2 = "Failed to connect to dynamite module ContentResolver."
            r3 = 0
            r0.<init>((java.lang.String) r2, (com.google.android.gms.dynamite.zza) r3)     // Catch:{ Exception -> 0x006a }
            throw r0     // Catch:{ Exception -> 0x006a }
        L_0x006a:
            r0 = move-exception
        L_0x006b:
            boolean r2 = r0 instanceof com.google.android.gms.dynamite.DynamiteModule.zzc     // Catch:{ all -> 0x0070 }
            if (r2 == 0) goto L_0x00aa
            throw r0     // Catch:{ all -> 0x0070 }
        L_0x0070:
            r0 = move-exception
        L_0x0071:
            if (r1 == 0) goto L_0x0076
            r1.close()
        L_0x0076:
            throw r0
        L_0x0077:
            java.lang.String r0 = "api"
            goto L_0x0005
        L_0x007a:
            r0 = 0
            int r2 = r1.getInt(r0)     // Catch:{ Exception -> 0x006a }
            if (r2 <= 0) goto L_0x009f
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r0 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-enter(r0)     // Catch:{ Exception -> 0x006a }
            r0 = 2
            java.lang.String r0 = r1.getString(r0)     // Catch:{ all -> 0x00a5 }
            zzaSI = r0     // Catch:{ all -> 0x00a5 }
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r0 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-exit(r0)     // Catch:{ all -> 0x00a5 }
            java.lang.ThreadLocal<com.google.android.gms.dynamite.DynamiteModule$zza> r0 = zzaSJ     // Catch:{ Exception -> 0x006a }
            java.lang.Object r0 = r0.get()     // Catch:{ Exception -> 0x006a }
            com.google.android.gms.dynamite.DynamiteModule$zza r0 = (com.google.android.gms.dynamite.DynamiteModule.zza) r0     // Catch:{ Exception -> 0x006a }
            if (r0 == 0) goto L_0x009f
            android.database.Cursor r3 = r0.zzaSR     // Catch:{ Exception -> 0x006a }
            if (r3 != 0) goto L_0x009f
            r0.zzaSR = r1     // Catch:{ Exception -> 0x006a }
            r1 = r6
        L_0x009f:
            if (r1 == 0) goto L_0x00a4
            r1.close()
        L_0x00a4:
            return r2
        L_0x00a5:
            r0 = move-exception
            java.lang.Class<com.google.android.gms.dynamite.DynamiteModule> r2 = com.google.android.gms.dynamite.DynamiteModule.class
            monitor-exit(r2)     // Catch:{ all -> 0x00a5 }
            throw r0     // Catch:{ Exception -> 0x006a }
        L_0x00aa:
            com.google.android.gms.dynamite.DynamiteModule$zzc r2 = new com.google.android.gms.dynamite.DynamiteModule$zzc     // Catch:{ all -> 0x0070 }
            java.lang.String r3 = "V2 version check failed"
            r4 = 0
            r2.<init>(r3, r0, r4)     // Catch:{ all -> 0x0070 }
            throw r2     // Catch:{ all -> 0x0070 }
        L_0x00b3:
            r0 = move-exception
            r1 = r6
            goto L_0x0071
        L_0x00b6:
            r0 = move-exception
            r1 = r6
            goto L_0x006b
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.dynamite.DynamiteModule.zzd(android.content.Context, java.lang.String, boolean):int");
    }

    public final IBinder zzcV(String str) throws zzc {
        try {
            return (IBinder) this.zzaSQ.getClassLoader().loadClass(str).newInstance();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException e) {
            String valueOf = String.valueOf(str);
            throw new zzc(valueOf.length() != 0 ? "Failed to instantiate module class: ".concat(valueOf) : new String("Failed to instantiate module class: "), e, (zza) null);
        }
    }

    public final Context zztC() {
        return this.zzaSQ;
    }
}
