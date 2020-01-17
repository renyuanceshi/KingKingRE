.class final Lcom/google/android/gms/internal/zzbbt;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/PendingResult$zza;


# instance fields
.field private synthetic zzaCT:Lcom/google/android/gms/internal/zzbbd;

.field private synthetic zzaCU:Lcom/google/android/gms/internal/zzbbs;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbbs;Lcom/google/android/gms/internal/zzbbd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbbt;->zzaCU:Lcom/google/android/gms/internal/zzbbs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbbt;->zzaCT:Lcom/google/android/gms/internal/zzbbd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zzo(Lcom/google/android/gms/common/api/Status;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbt;->zzaCU:Lcom/google/android/gms/internal/zzbbs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbbs;->zza(Lcom/google/android/gms/internal/zzbbs;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbbt;->zzaCT:Lcom/google/android/gms/internal/zzbbd;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
