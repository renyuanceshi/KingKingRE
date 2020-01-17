.class public final Lcom/google/android/gms/internal/zzcae;
.super Ljava/lang/Object;


# static fields
.field private static zzaXH:Lcom/google/android/gms/internal/zzcae;


# instance fields
.field private final zzaXI:Lcom/google/android/gms/internal/zzbzz;

.field private final zzaXJ:Lcom/google/android/gms/internal/zzcaa;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzcae;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzcae;-><init>()V

    const-class v1, Lcom/google/android/gms/internal/zzcae;

    monitor-enter v1

    :try_start_0
    sput-object v0, Lcom/google/android/gms/internal/zzcae;->zzaXH:Lcom/google/android/gms/internal/zzcae;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/zzbzz;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzbzz;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzcae;->zzaXI:Lcom/google/android/gms/internal/zzbzz;

    new-instance v0, Lcom/google/android/gms/internal/zzcaa;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzcaa;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzcae;->zzaXJ:Lcom/google/android/gms/internal/zzcaa;

    return-void
.end method

.method private static zzua()Lcom/google/android/gms/internal/zzcae;
    .locals 2

    const-class v1, Lcom/google/android/gms/internal/zzcae;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/android/gms/internal/zzcae;->zzaXH:Lcom/google/android/gms/internal/zzcae;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static zzub()Lcom/google/android/gms/internal/zzbzz;
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/zzcae;->zzua()Lcom/google/android/gms/internal/zzcae;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzcae;->zzaXI:Lcom/google/android/gms/internal/zzbzz;

    return-object v0
.end method

.method public static zzuc()Lcom/google/android/gms/internal/zzcaa;
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/zzcae;->zzua()Lcom/google/android/gms/internal/zzcae;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzcae;->zzaXJ:Lcom/google/android/gms/internal/zzcaa;

    return-object v0
.end method
