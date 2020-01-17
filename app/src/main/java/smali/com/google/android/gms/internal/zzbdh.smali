.class final Lcom/google/android/gms/internal/zzbdh;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic zzaEw:Lcom/google/android/gms/common/ConnectionResult;

.field private synthetic zzaEy:Lcom/google/android/gms/internal/zzbdg;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbdg;Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbdh;->zzaEy:Lcom/google/android/gms/internal/zzbdg;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbdh;->zzaEw:Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdh;->zzaEw:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdh;->zzaEy:Lcom/google/android/gms/internal/zzbdg;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzbdg;->zza(Lcom/google/android/gms/internal/zzbdg;Z)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdh;->zzaEy:Lcom/google/android/gms/internal/zzbdg;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdg;->zza(Lcom/google/android/gms/internal/zzbdg;)Lcom/google/android/gms/common/api/Api$zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$zze;->zzmv()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdh;->zzaEy:Lcom/google/android/gms/internal/zzbdg;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdg;->zzb(Lcom/google/android/gms/internal/zzbdg;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdh;->zzaEy:Lcom/google/android/gms/internal/zzbdg;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdg;->zza(Lcom/google/android/gms/internal/zzbdg;)Lcom/google/android/gms/common/api/Api$zze;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/common/api/Api$zze;->zza(Lcom/google/android/gms/common/internal/zzal;Ljava/util/Set;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdh;->zzaEy:Lcom/google/android/gms/internal/zzbdg;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzbdg;->zzaEm:Lcom/google/android/gms/internal/zzbda;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbda;->zzj(Lcom/google/android/gms/internal/zzbda;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbdh;->zzaEy:Lcom/google/android/gms/internal/zzbdg;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzbdg;->zzc(Lcom/google/android/gms/internal/zzbdg;)Lcom/google/android/gms/internal/zzbas;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzbdc;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbdh;->zzaEw:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzbdc;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_0
.end method
