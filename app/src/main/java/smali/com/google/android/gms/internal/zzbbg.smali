.class final Lcom/google/android/gms/internal/zzbbg;
.super Ljava/lang/Object;


# instance fields
.field private synthetic zzaCi:Lcom/google/android/gms/internal/zzbbd;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzbbd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbbg;->zzaCi:Lcom/google/android/gms/internal/zzbbd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zzbbd;Lcom/google/android/gms/internal/zzbbe;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzbbg;-><init>(Lcom/google/android/gms/internal/zzbbd;)V

    return-void
.end method


# virtual methods
.method protected final finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbg;->zzaCi:Lcom/google/android/gms/internal/zzbbd;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbbd;->zza(Lcom/google/android/gms/internal/zzbbd;)Lcom/google/android/gms/common/api/Result;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbbd;->zzc(Lcom/google/android/gms/common/api/Result;)V

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
