.class public final Lcom/google/android/gms/internal/zzbao;
.super Lcom/google/android/gms/internal/zzbam;


# instance fields
.field private zzaBu:Lcom/google/android/gms/internal/zzbed;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzbed",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "*>;"
        }
    .end annotation
.end field

.field private zzaBv:Lcom/google/android/gms/internal/zzbex;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzbex",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzbee;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzbee;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource",
            "<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x3

    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/internal/zzbam;-><init>(ILcom/google/android/gms/tasks/TaskCompletionSource;)V

    iget-object v0, p1, Lcom/google/android/gms/internal/zzbee;->zzaBu:Lcom/google/android/gms/internal/zzbed;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbao;->zzaBu:Lcom/google/android/gms/internal/zzbed;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzbee;->zzaBv:Lcom/google/android/gms/internal/zzbex;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbao;->zzaBv:Lcom/google/android/gms/internal/zzbex;

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
    .locals 5
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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbao;->zzaBu:Lcom/google/android/gms/internal/zzbed;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbdc;->zzpJ()Lcom/google/android/gms/common/api/Api$zze;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbao;->zzalE:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzbed;->zzb(Lcom/google/android/gms/common/api/Api$zzb;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbao;->zzaBu:Lcom/google/android/gms/internal/zzbed;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbed;->zzqG()Lcom/google/android/gms/internal/zzbdx;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbdc;->zzqs()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbao;->zzaBu:Lcom/google/android/gms/internal/zzbed;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzbed;->zzqG()Lcom/google/android/gms/internal/zzbdx;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzbee;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzbao;->zzaBu:Lcom/google/android/gms/internal/zzbed;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzbao;->zzaBv:Lcom/google/android/gms/internal/zzbex;

    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/internal/zzbee;-><init>(Lcom/google/android/gms/internal/zzbed;Lcom/google/android/gms/internal/zzbex;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
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
