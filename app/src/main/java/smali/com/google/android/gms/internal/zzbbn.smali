.class public final Lcom/google/android/gms/internal/zzbbn;
.super Lcom/google/android/gms/common/api/GoogleApi;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<O::",
        "Lcom/google/android/gms/common/api/Api$ApiOptions;",
        ">",
        "Lcom/google/android/gms/common/api/GoogleApi",
        "<TO;>;"
    }
.end annotation


# instance fields
.field private final zzaBe:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza",
            "<+",
            "Lcom/google/android/gms/internal/zzctj;",
            "Lcom/google/android/gms/internal/zzctk;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaCA:Lcom/google/android/gms/common/internal/zzq;

.field private final zzaCy:Lcom/google/android/gms/common/api/Api$zze;

.field private final zzaCz:Lcom/google/android/gms/internal/zzbbh;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/api/Api;Landroid/os/Looper;Lcom/google/android/gms/common/api/Api$zze;Lcom/google/android/gms/internal/zzbbh;Lcom/google/android/gms/common/internal/zzq;Lcom/google/android/gms/common/api/Api$zza;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/google/android/gms/common/api/Api$zze;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/google/android/gms/internal/zzbbh;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/common/api/Api",
            "<TO;>;",
            "Landroid/os/Looper;",
            "Lcom/google/android/gms/common/api/Api$zze;",
            "Lcom/google/android/gms/internal/zzbbh;",
            "Lcom/google/android/gms/common/internal/zzq;",
            "Lcom/google/android/gms/common/api/Api$zza",
            "<+",
            "Lcom/google/android/gms/internal/zzctj;",
            "Lcom/google/android/gms/internal/zzctk;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/common/api/GoogleApi;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/api/Api;Landroid/os/Looper;)V

    iput-object p4, p0, Lcom/google/android/gms/internal/zzbbn;->zzaCy:Lcom/google/android/gms/common/api/Api$zze;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzbbn;->zzaCz:Lcom/google/android/gms/internal/zzbbh;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzbbn;->zzaCA:Lcom/google/android/gms/common/internal/zzq;

    iput-object p7, p0, Lcom/google/android/gms/internal/zzbbn;->zzaBe:Lcom/google/android/gms/common/api/Api$zza;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbn;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzbda;->zzb(Lcom/google/android/gms/common/api/GoogleApi;)V

    return-void
.end method


# virtual methods
.method public final zza(Landroid/os/Looper;Lcom/google/android/gms/internal/zzbdc;)Lcom/google/android/gms/common/api/Api$zze;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Looper;",
            "Lcom/google/android/gms/internal/zzbdc",
            "<TO;>;)",
            "Lcom/google/android/gms/common/api/Api$zze;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbn;->zzaCz:Lcom/google/android/gms/internal/zzbbh;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/zzbbh;->zza(Lcom/google/android/gms/internal/zzbbi;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbn;->zzaCy:Lcom/google/android/gms/common/api/Api$zze;

    return-object v0
.end method

.method public final zza(Landroid/content/Context;Landroid/os/Handler;)Lcom/google/android/gms/internal/zzbei;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzbei;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbbn;->zzaCA:Lcom/google/android/gms/common/internal/zzq;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbbn;->zzaBe:Lcom/google/android/gms/common/api/Api$zza;

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/google/android/gms/internal/zzbei;-><init>(Landroid/content/Context;Landroid/os/Handler;Lcom/google/android/gms/common/internal/zzq;Lcom/google/android/gms/common/api/Api$zza;)V

    return-object v0
.end method

.method public final zzpJ()Lcom/google/android/gms/common/api/Api$zze;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbn;->zzaCy:Lcom/google/android/gms/common/api/Api$zze;

    return-object v0
.end method
