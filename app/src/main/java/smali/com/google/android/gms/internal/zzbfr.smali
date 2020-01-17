.class final Lcom/google/android/gms/internal/zzbfr;
.super Lcom/google/android/gms/internal/zzbfu;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbfq;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzbfu;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    return-void
.end method


# virtual methods
.method protected final synthetic zza(Lcom/google/android/gms/common/api/Api$zzb;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    check-cast p1, Lcom/google/android/gms/internal/zzbfv;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbfv;->zzrf()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzbfy;

    new-instance v1, Lcom/google/android/gms/internal/zzbfs;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzbfs;-><init>(Lcom/google/android/gms/internal/zzbay;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzbfy;->zza(Lcom/google/android/gms/internal/zzbfw;)V

    return-void
.end method
