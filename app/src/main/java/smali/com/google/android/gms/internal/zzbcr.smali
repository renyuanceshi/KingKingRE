.class final Lcom/google/android/gms/internal/zzbcr;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# instance fields
.field private synthetic zzaDP:Lcom/google/android/gms/internal/zzbem;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbco;Lcom/google/android/gms/internal/zzbem;)V
    .locals 0

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbcr;->zzaDP:Lcom/google/android/gms/internal/zzbem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 3
    .param p1    # Lcom/google/android/gms/common/ConnectionResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcr;->zzaDP:Lcom/google/android/gms/internal/zzbem;

    new-instance v1, Lcom/google/android/gms/common/api/Status;

    const/16 v2, 0x8

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzbem;->setResult(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method
