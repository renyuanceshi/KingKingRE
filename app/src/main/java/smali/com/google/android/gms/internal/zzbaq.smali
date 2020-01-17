.class public final Lcom/google/android/gms/internal/zzbaq;
.super Lcom/google/android/gms/internal/zzbam;


# instance fields
.field private zzaBy:Lcom/google/android/gms/internal/zzbdx;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzbdx",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzbdx;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzbdx",
            "<*>;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource",
            "<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x4

    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/internal/zzbam;-><init>(ILcom/google/android/gms/tasks/TaskCompletionSource;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbaq;->zzaBy:Lcom/google/android/gms/internal/zzbdx;

    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Lcom/google/android/gms/internal/zzbbs;Z)V
    .locals 0
    .param p1    # Lcom/google/android/gms/internal/zzbbs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public final zzb(Lcom/google/android/gms/internal/zzbdc;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzbdc",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbdc;->zzqs()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbaq;->zzaBy:Lcom/google/android/gms/internal/zzbdx;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzbee;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/google/android/gms/internal/zzbee;->zzaBv:Lcom/google/android/gms/internal/zzbex;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbdc;->zzpJ()Lcom/google/android/gms/common/api/Api$zze;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzbaq;->zzalE:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzbex;->zzc(Lcom/google/android/gms/common/api/Api$zzb;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    iget-object v0, v0, Lcom/google/android/gms/internal/zzbee;->zzaBu:Lcom/google/android/gms/internal/zzbed;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbed;->zzqH()V

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v0, "UnregisterListenerTask"

    const-string/jumbo v1, "Received call to unregister a listener without a matching registration call."

    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    invoke-static {v0, v1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbaq;->zzalE:Lcom/google/android/gms/tasks/TaskCompletionSource;

    new-instance v1, Lcom/google/android/gms/common/api/ApiException;

    sget-object v2, Lcom/google/android/gms/common/api/Status;->zzaBo:Lcom/google/android/gms/common/api/Status;

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetException(Ljava/lang/Exception;)Z

    goto :goto_0
.end method

.method public final bridge synthetic zzp(Lcom/google/android/gms/common/api/Status;)V
    .locals 0
    .param p1    # Lcom/google/android/gms/common/api/Status;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzbam;->zzp(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method
