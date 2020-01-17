.class final Lcom/google/android/gms/internal/zzbcg;
.super Lcom/google/android/gms/internal/zzbcx;


# instance fields
.field private synthetic zzaDs:Lcom/google/android/gms/common/ConnectionResult;

.field private synthetic zzaDt:Lcom/google/android/gms/internal/zzbcf;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbcf;Lcom/google/android/gms/internal/zzbcv;Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbcg;->zzaDt:Lcom/google/android/gms/internal/zzbcf;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzbcg;->zzaDs:Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzbcx;-><init>(Lcom/google/android/gms/internal/zzbcv;)V

    return-void
.end method


# virtual methods
.method public final zzpV()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcg;->zzaDt:Lcom/google/android/gms/internal/zzbcf;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzbcf;->zzaDp:Lcom/google/android/gms/internal/zzbcc;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbcg;->zzaDs:Lcom/google/android/gms/common/ConnectionResult;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzbcc;->zza(Lcom/google/android/gms/internal/zzbcc;Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method
