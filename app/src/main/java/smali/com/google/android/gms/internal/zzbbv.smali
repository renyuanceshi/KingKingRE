.class public Lcom/google/android/gms/internal/zzbbv;
.super Lcom/google/android/gms/internal/zzbaz;


# instance fields
.field private zzaAN:Lcom/google/android/gms/internal/zzbda;

.field private final zzaCW:Lcom/google/android/gms/common/util/zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/util/zza",
            "<",
            "Lcom/google/android/gms/internal/zzbas",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzbds;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzbaz;-><init>(Lcom/google/android/gms/internal/zzbds;)V

    new-instance v0, Lcom/google/android/gms/common/util/zza;

    invoke-direct {v0}, Lcom/google/android/gms/common/util/zza;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbbv;->zzaCW:Lcom/google/android/gms/common/util/zza;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbv;->zzaEG:Lcom/google/android/gms/internal/zzbds;

    const-string/jumbo v1, "ConnectionlessLifecycleHelper"

    invoke-interface {v0, v1, p0}, Lcom/google/android/gms/internal/zzbds;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzbdr;)V

    return-void
.end method

.method public static zza(Landroid/app/Activity;Lcom/google/android/gms/internal/zzbda;Lcom/google/android/gms/internal/zzbas;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/internal/zzbda;",
            "Lcom/google/android/gms/internal/zzbas",
            "<*>;)V"
        }
    .end annotation

    invoke-static {p0}, Lcom/google/android/gms/internal/zzbbv;->zzn(Landroid/app/Activity;)Lcom/google/android/gms/internal/zzbds;

    invoke-static {p0}, Lcom/google/android/gms/internal/zzbbv;->zzn(Landroid/app/Activity;)Lcom/google/android/gms/internal/zzbds;

    move-result-object v1

    const-string/jumbo v0, "ConnectionlessLifecycleHelper"

    const-class v2, Lcom/google/android/gms/internal/zzbbv;

    invoke-interface {v1, v0, v2}, Lcom/google/android/gms/internal/zzbds;->zza(Ljava/lang/String;Ljava/lang/Class;)Lcom/google/android/gms/internal/zzbdr;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzbbv;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzbbv;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzbbv;-><init>(Lcom/google/android/gms/internal/zzbds;)V

    :cond_0
    iput-object p1, v0, Lcom/google/android/gms/internal/zzbbv;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    const-string/jumbo v1, "ApiKey cannot be null"

    invoke-static {p2, v1}, Lcom/google/android/gms/common/internal/zzbo;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v0, Lcom/google/android/gms/internal/zzbbv;->zzaCW:Lcom/google/android/gms/common/util/zza;

    invoke-virtual {v1, p2}, Lcom/google/android/gms/common/util/zza;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzbda;->zza(Lcom/google/android/gms/internal/zzbbv;)V

    return-void
.end method

.method private final zzpS()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbv;->zzaCW:Lcom/google/android/gms/common/util/zza;

    invoke-virtual {v0}, Lcom/google/android/gms/common/util/zza;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbv;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzbda;->zza(Lcom/google/android/gms/internal/zzbbv;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public final onResume()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/internal/zzbaz;->onResume()V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbbv;->zzpS()V

    return-void
.end method

.method public final onStart()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/internal/zzbaz;->onStart()V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbbv;->zzpS()V

    return-void
.end method

.method public final onStop()V
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/zzbaz;->onStop()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbv;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzbda;->zzb(Lcom/google/android/gms/internal/zzbbv;)V

    return-void
.end method

.method protected final zza(Lcom/google/android/gms/common/ConnectionResult;I)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbv;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzbda;->zza(Lcom/google/android/gms/common/ConnectionResult;I)V

    return-void
.end method

.method final zzpR()Lcom/google/android/gms/common/util/zza;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/common/util/zza",
            "<",
            "Lcom/google/android/gms/internal/zzbas",
            "<*>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbv;->zzaCW:Lcom/google/android/gms/common/util/zza;

    return-object v0
.end method

.method protected final zzps()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbv;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbda;->zzps()V

    return-void
.end method
