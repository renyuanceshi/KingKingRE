.class final Lcom/google/android/gms/internal/zzbch;
.super Lcom/google/android/gms/internal/zzbcx;


# instance fields
.field private synthetic zzaDu:Lcom/google/android/gms/common/internal/zzj;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbcf;Lcom/google/android/gms/internal/zzbcv;Lcom/google/android/gms/common/internal/zzj;)V
    .locals 0

    iput-object p3, p0, Lcom/google/android/gms/internal/zzbch;->zzaDu:Lcom/google/android/gms/common/internal/zzj;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzbcx;-><init>(Lcom/google/android/gms/internal/zzbcv;)V

    return-void
.end method


# virtual methods
.method public final zzpV()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbch;->zzaDu:Lcom/google/android/gms/common/internal/zzj;

    new-instance v1, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v2, 0x10

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/common/internal/zzj;->zzf(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method
