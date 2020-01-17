.class final Lcom/google/android/gms/internal/zzbca;
.super Lcom/google/android/gms/internal/zzbcx;


# instance fields
.field private synthetic zzaDb:Lcom/google/android/gms/internal/zzbbz;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbbz;Lcom/google/android/gms/internal/zzbcv;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbca;->zzaDb:Lcom/google/android/gms/internal/zzbbz;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzbcx;-><init>(Lcom/google/android/gms/internal/zzbcv;)V

    return-void
.end method


# virtual methods
.method public final zzpV()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbca;->zzaDb:Lcom/google/android/gms/internal/zzbbz;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzbbz;->onConnectionSuspended(I)V

    return-void
.end method
