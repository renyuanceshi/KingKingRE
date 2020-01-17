.class public final Lcom/google/android/gms/internal/zzbap;
.super Lcom/google/android/gms/internal/zzbal;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TResult:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/zzbal;"
    }
.end annotation


# instance fields
.field private final zzaBw:Lcom/google/android/gms/internal/zzbep;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzbep",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "TTResult;>;"
        }
    .end annotation
.end field

.field private final zzaBx:Lcom/google/android/gms/internal/zzbel;

.field private final zzalE:Lcom/google/android/gms/tasks/TaskCompletionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/TaskCompletionSource",
            "<TTResult;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILcom/google/android/gms/internal/zzbep;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/internal/zzbel;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/internal/zzbep",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "TTResult;>;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource",
            "<TTResult;>;",
            "Lcom/google/android/gms/internal/zzbel;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzbal;-><init>(I)V

    iput-object p3, p0, Lcom/google/android/gms/internal/zzbap;->zzalE:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbap;->zzaBw:Lcom/google/android/gms/internal/zzbep;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzbap;->zzaBx:Lcom/google/android/gms/internal/zzbel;

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/zzbbs;Z)V
    .locals 1
    .param p1    # Lcom/google/android/gms/internal/zzbbs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbap;->zzalE:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/zzbbs;->zza(Lcom/google/android/gms/tasks/TaskCompletionSource;Z)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/zzbdc;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzbdc",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/DeadObjectException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbap;->zzaBw:Lcom/google/android/gms/internal/zzbep;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbdc;->zzpJ()Lcom/google/android/gms/common/api/Api$zze;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbap;->zzalE:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzbep;->zza(Lcom/google/android/gms/common/api/Api$zzb;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    return-void

    :catch_0
    move-exception v0

    throw v0

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbal;->zzb(Landroid/os/RemoteException;)Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzbap;->zzp(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_0
.end method

.method public final zzp(Lcom/google/android/gms/common/api/Status;)V
    .locals 2
    .param p1    # Lcom/google/android/gms/common/api/Status;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbap;->zzalE:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbap;->zzaBx:Lcom/google/android/gms/internal/zzbel;

    invoke-interface {v1, p1}, Lcom/google/android/gms/internal/zzbel;->zzq(Lcom/google/android/gms/common/api/Status;)Ljava/lang/Exception;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetException(Ljava/lang/Exception;)Z

    return-void
.end method
