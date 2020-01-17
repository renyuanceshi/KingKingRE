.class final Lcom/google/android/gms/internal/zzbcj;
.super Lcom/google/android/gms/internal/zzcto;


# instance fields
.field private final zzaDq:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/google/android/gms/internal/zzbcc;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbcc;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcto;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbcj;->zzaDq:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final zzb(Lcom/google/android/gms/internal/zzctw;)V
    .locals 3
    .annotation build Landroid/support/annotation/BinderThread;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcj;->zzaDq:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzbcc;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {v0}, Lcom/google/android/gms/internal/zzbcc;->zzd(Lcom/google/android/gms/internal/zzbcc;)Lcom/google/android/gms/internal/zzbcw;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzbck;

    invoke-direct {v2, p0, v0, v0, p1}, Lcom/google/android/gms/internal/zzbck;-><init>(Lcom/google/android/gms/internal/zzbcj;Lcom/google/android/gms/internal/zzbcv;Lcom/google/android/gms/internal/zzbcc;Lcom/google/android/gms/internal/zzctw;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzbcw;->zza(Lcom/google/android/gms/internal/zzbcx;)V

    goto :goto_0
.end method
