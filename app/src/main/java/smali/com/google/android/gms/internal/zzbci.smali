.class final Lcom/google/android/gms/internal/zzbci;
.super Lcom/google/android/gms/internal/zzbcm;


# instance fields
.field private synthetic zzaDp:Lcom/google/android/gms/internal/zzbcc;

.field private final zzaDv:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/common/api/Api$zze;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzbcc;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/common/api/Api$zze;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbci;->zzaDp:Lcom/google/android/gms/internal/zzbcc;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzbcm;-><init>(Lcom/google/android/gms/internal/zzbcc;Lcom/google/android/gms/internal/zzbcd;)V

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbci;->zzaDv:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final zzpV()V
    .locals 6
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbci;->zzaDp:Lcom/google/android/gms/internal/zzbcc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbcc;->zzd(Lcom/google/android/gms/internal/zzbcc;)Lcom/google/android/gms/internal/zzbcw;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzbcw;->zzaCl:Lcom/google/android/gms/internal/zzbco;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbci;->zzaDp:Lcom/google/android/gms/internal/zzbcc;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzbcc;->zzg(Lcom/google/android/gms/internal/zzbcc;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzbco;->zzaDG:Ljava/util/Set;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbci;->zzaDv:Ljava/util/ArrayList;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v3, :cond_0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, v2, 0x1

    check-cast v1, Lcom/google/android/gms/common/api/Api$zze;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzbci;->zzaDp:Lcom/google/android/gms/internal/zzbcc;

    invoke-static {v4}, Lcom/google/android/gms/internal/zzbcc;->zzh(Lcom/google/android/gms/internal/zzbcc;)Lcom/google/android/gms/common/internal/zzal;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/internal/zzbci;->zzaDp:Lcom/google/android/gms/internal/zzbcc;

    invoke-static {v5}, Lcom/google/android/gms/internal/zzbcc;->zzd(Lcom/google/android/gms/internal/zzbcc;)Lcom/google/android/gms/internal/zzbcw;

    move-result-object v5

    iget-object v5, v5, Lcom/google/android/gms/internal/zzbcw;->zzaCl:Lcom/google/android/gms/internal/zzbco;

    iget-object v5, v5, Lcom/google/android/gms/internal/zzbco;->zzaDG:Ljava/util/Set;

    invoke-interface {v1, v4, v5}, Lcom/google/android/gms/common/api/Api$zze;->zza(Lcom/google/android/gms/common/internal/zzal;Ljava/util/Set;)V

    goto :goto_0

    :cond_0
    return-void
.end method
