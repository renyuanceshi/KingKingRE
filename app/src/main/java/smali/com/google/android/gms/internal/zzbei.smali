.class public final Lcom/google/android/gms/internal/zzbei;
.super Lcom/google/android/gms/internal/zzcto;

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# static fields
.field private static zzaEV:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza",
            "<+",
            "Lcom/google/android/gms/internal/zzctj;",
            "Lcom/google/android/gms/internal/zzctk;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private final zzaAx:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza",
            "<+",
            "Lcom/google/android/gms/internal/zzctj;",
            "Lcom/google/android/gms/internal/zzctk;",
            ">;"
        }
    .end annotation
.end field

.field private zzaCA:Lcom/google/android/gms/common/internal/zzq;

.field private zzaDh:Lcom/google/android/gms/internal/zzctj;

.field private final zzaEW:Z

.field private zzaEX:Lcom/google/android/gms/internal/zzbek;

.field private zzame:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzctf;->zzajS:Lcom/google/android/gms/common/api/Api$zza;

    sput-object v0, Lcom/google/android/gms/internal/zzbei;->zzaEV:Lcom/google/android/gms/common/api/Api$zza;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcto;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbei;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbei;->mHandler:Landroid/os/Handler;

    sget-object v0, Lcom/google/android/gms/internal/zzbei;->zzaEV:Lcom/google/android/gms/common/api/Api$zza;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaAx:Lcom/google/android/gms/common/api/Api$zza;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaEW:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Lcom/google/android/gms/common/internal/zzq;Lcom/google/android/gms/common/api/Api$zza;)V
    .locals 1
    .param p3    # Lcom/google/android/gms/common/internal/zzq;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/os/Handler;",
            "Lcom/google/android/gms/common/internal/zzq;",
            "Lcom/google/android/gms/common/api/Api$zza",
            "<+",
            "Lcom/google/android/gms/internal/zzctj;",
            "Lcom/google/android/gms/internal/zzctk;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcto;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbei;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbei;->mHandler:Landroid/os/Handler;

    const-string/jumbo v0, "ClientSettings must not be null"

    invoke-static {p3, v0}, Lcom/google/android/gms/common/internal/zzbo;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/internal/zzq;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaCA:Lcom/google/android/gms/common/internal/zzq;

    invoke-virtual {p3}, Lcom/google/android/gms/common/internal/zzq;->zzrn()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzame:Ljava/util/Set;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzbei;->zzaAx:Lcom/google/android/gms/common/api/Api$zza;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaEW:Z

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzbei;Lcom/google/android/gms/internal/zzctw;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzbei;->zzc(Lcom/google/android/gms/internal/zzctw;)V

    return-void
.end method

.method private final zzc(Lcom/google/android/gms/internal/zzctw;)V
    .locals 5
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzctw;->zzpz()Lcom/google/android/gms/common/ConnectionResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzctw;->zzAx()Lcom/google/android/gms/common/internal/zzbr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzbr;->zzpz()Lcom/google/android/gms/common/ConnectionResult;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v0, "SignInCoordinator"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x30

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Sign-in succeeded with resolve account failure: "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/Exception;

    invoke-direct {v3}, Ljava/lang/Exception;-><init>()V

    invoke-static {v0, v2, v3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaEX:Lcom/google/android/gms/internal/zzbek;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzbek;->zzh(Lcom/google/android/gms/common/ConnectionResult;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaDh:Lcom/google/android/gms/internal/zzctj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzctj;->disconnect()V

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzbei;->zzaEX:Lcom/google/android/gms/internal/zzbek;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzbr;->zzrH()Lcom/google/android/gms/common/internal/zzal;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbei;->zzame:Ljava/util/Set;

    invoke-interface {v1, v0, v2}, Lcom/google/android/gms/internal/zzbek;->zzb(Lcom/google/android/gms/common/internal/zzal;Ljava/util/Set;)V

    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaDh:Lcom/google/android/gms/internal/zzctj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzctj;->disconnect()V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzbei;->zzaEX:Lcom/google/android/gms/internal/zzbek;

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzbek;->zzh(Lcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_1
.end method


# virtual methods
.method public final onConnected(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaDh:Lcom/google/android/gms/internal/zzctj;

    invoke-interface {v0, p0}, Lcom/google/android/gms/internal/zzctj;->zza(Lcom/google/android/gms/internal/zzctp;)V

    return-void
.end method

.method public final onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 1
    .param p1    # Lcom/google/android/gms/common/ConnectionResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaEX:Lcom/google/android/gms/internal/zzbek;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzbek;->zzh(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method public final onConnectionSuspended(I)V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaDh:Lcom/google/android/gms/internal/zzctj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzctj;->disconnect()V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/zzbek;)V
    .locals 9
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaDh:Lcom/google/android/gms/internal/zzctj;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaDh:Lcom/google/android/gms/internal/zzctj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzctj;->disconnect()V

    :cond_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaEW:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/auth/api/signin/internal/zzy;->zzaj(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/internal/zzy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/internal/zzy;->zzmO()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    move-result-object v2

    if-nez v2, :cond_2

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzame:Ljava/util/Set;

    new-instance v0, Lcom/google/android/gms/common/internal/zzq;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbei;->zzame:Ljava/util/Set;

    const/4 v4, 0x0

    sget-object v8, Lcom/google/android/gms/internal/zzctk;->zzbCM:Lcom/google/android/gms/internal/zzctk;

    move-object v3, v1

    move-object v5, v1

    move-object v6, v1

    move-object v7, v1

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/common/internal/zzq;-><init>(Landroid/accounts/Account;Ljava/util/Set;Ljava/util/Map;ILandroid/view/View;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzctk;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaCA:Lcom/google/android/gms/common/internal/zzq;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaCA:Lcom/google/android/gms/common/internal/zzq;

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/internal/zzq;->zzc(Ljava/lang/Integer;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaAx:Lcom/google/android/gms/common/api/Api$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbei;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbei;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzbei;->zzaCA:Lcom/google/android/gms/common/internal/zzq;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzbei;->zzaCA:Lcom/google/android/gms/common/internal/zzq;

    invoke-virtual {v4}, Lcom/google/android/gms/common/internal/zzq;->zzrt()Lcom/google/android/gms/internal/zzctk;

    move-result-object v4

    move-object v5, p0

    move-object v6, p0

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/common/api/Api$zza;->zza(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzq;Ljava/lang/Object;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/Api$zze;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzctj;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaDh:Lcom/google/android/gms/internal/zzctj;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbei;->zzaEX:Lcom/google/android/gms/internal/zzbek;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaDh:Lcom/google/android/gms/internal/zzctj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzctj;->connect()V

    return-void

    :cond_2
    new-instance v0, Ljava/util/HashSet;

    invoke-virtual {v2}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzmA()Ljava/util/ArrayList;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    goto :goto_0
.end method

.method public final zzb(Lcom/google/android/gms/internal/zzctw;)V
    .locals 2
    .annotation build Landroid/support/annotation/BinderThread;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzbej;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzbej;-><init>(Lcom/google/android/gms/internal/zzbei;Lcom/google/android/gms/internal/zzctw;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final zzqI()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaDh:Lcom/google/android/gms/internal/zzctj;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaDh:Lcom/google/android/gms/internal/zzctj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzctj;->disconnect()V

    :cond_0
    return-void
.end method

.method public final zzqy()Lcom/google/android/gms/internal/zzctj;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbei;->zzaDh:Lcom/google/android/gms/internal/zzctj;

    return-object v0
.end method
