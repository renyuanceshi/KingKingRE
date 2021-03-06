.class public final Lcom/google/android/gms/internal/zzbcw;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzbbi;
.implements Lcom/google/android/gms/internal/zzbdo;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private zzaBe:Lcom/google/android/gms/common/api/Api$zza;
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

.field private zzaCD:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaCF:Lcom/google/android/gms/common/zze;

.field final zzaCl:Lcom/google/android/gms/internal/zzbco;

.field private final zzaCv:Ljava/util/concurrent/locks/Lock;

.field final zzaDF:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzc",
            "<*>;",
            "Lcom/google/android/gms/common/api/Api$zze;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaDS:Ljava/util/concurrent/locks/Condition;

.field private final zzaDT:Lcom/google/android/gms/internal/zzbcy;

.field final zzaDU:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzc",
            "<*>;",
            "Lcom/google/android/gms/common/ConnectionResult;",
            ">;"
        }
    .end annotation
.end field

.field private volatile zzaDV:Lcom/google/android/gms/internal/zzbcv;

.field private zzaDW:Lcom/google/android/gms/common/ConnectionResult;

.field zzaDX:I

.field final zzaDY:Lcom/google/android/gms/internal/zzbdp;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzbco;Ljava/util/concurrent/locks/Lock;Landroid/os/Looper;Lcom/google/android/gms/common/zze;Ljava/util/Map;Lcom/google/android/gms/common/internal/zzq;Ljava/util/Map;Lcom/google/android/gms/common/api/Api$zza;Ljava/util/ArrayList;Lcom/google/android/gms/internal/zzbdp;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/internal/zzbco;",
            "Ljava/util/concurrent/locks/Lock;",
            "Landroid/os/Looper;",
            "Lcom/google/android/gms/common/zze;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzc",
            "<*>;",
            "Lcom/google/android/gms/common/api/Api$zze;",
            ">;",
            "Lcom/google/android/gms/common/internal/zzq;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/google/android/gms/common/api/Api$zza",
            "<+",
            "Lcom/google/android/gms/internal/zzctj;",
            "Lcom/google/android/gms/internal/zzctk;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/internal/zzbbh;",
            ">;",
            "Lcom/google/android/gms/internal/zzbdp;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDU:Ljava/util/Map;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDW:Lcom/google/android/gms/common/ConnectionResult;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbcw;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCF:Lcom/google/android/gms/common/zze;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDF:Ljava/util/Map;

    iput-object p7, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCA:Lcom/google/android/gms/common/internal/zzq;

    iput-object p8, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCD:Ljava/util/Map;

    iput-object p9, p0, Lcom/google/android/gms/internal/zzbcw;->zzaBe:Lcom/google/android/gms/common/api/Api$zza;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCl:Lcom/google/android/gms/internal/zzbco;

    iput-object p11, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDY:Lcom/google/android/gms/internal/zzbdp;

    check-cast p10, Ljava/util/ArrayList;

    invoke-virtual {p10}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    invoke-virtual {p10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    check-cast v0, Lcom/google/android/gms/internal/zzbbh;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzbbh;->zza(Lcom/google/android/gms/internal/zzbbi;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzbcy;

    invoke-direct {v0, p0, p4}, Lcom/google/android/gms/internal/zzbcy;-><init>(Lcom/google/android/gms/internal/zzbcw;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDT:Lcom/google/android/gms/internal/zzbcy;

    invoke-interface {p3}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDS:Ljava/util/concurrent/locks/Condition;

    new-instance v0, Lcom/google/android/gms/internal/zzbcn;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzbcn;-><init>(Lcom/google/android/gms/internal/zzbcw;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzbcw;)Ljava/util/concurrent/locks/Lock;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzbcw;)Lcom/google/android/gms/internal/zzbcv;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    return-object v0
.end method


# virtual methods
.method public final blockingConnect()Lcom/google/android/gms/common/ConnectionResult;
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbcw;->connect()V

    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbcw;->isConnecting()Z

    move-result v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDS:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v1, 0xf

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    :goto_1
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbcw;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/google/android/gms/common/ConnectionResult;->zzazX:Lcom/google/android/gms/common/ConnectionResult;

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDW:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDW:Lcom/google/android/gms/common/ConnectionResult;

    goto :goto_1

    :cond_2
    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v1, 0xd

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    goto :goto_1
.end method

.method public final blockingConnect(JLjava/util/concurrent/TimeUnit;)Lcom/google/android/gms/common/ConnectionResult;
    .locals 5

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbcw;->connect()V

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbcw;->isConnecting()Z

    move-result v2

    if-eqz v2, :cond_1

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbcw;->disconnect()V

    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v1, 0xe

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    :goto_1
    return-object v0

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDS:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2, v0, v1}, Ljava/util/concurrent/locks/Condition;->awaitNanos(J)J
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v1, 0xf

    invoke-direct {v0, v1, v4}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbcw;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/google/android/gms/common/ConnectionResult;->zzazX:Lcom/google/android/gms/common/ConnectionResult;

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDW:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDW:Lcom/google/android/gms/common/ConnectionResult;

    goto :goto_1

    :cond_3
    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v1, 0xd

    invoke-direct {v0, v1, v4}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    goto :goto_1
.end method

.method public final connect()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzbcv;->connect()V

    return-void
.end method

.method public final disconnect()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzbcv;->disconnect()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDU:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :cond_0
    return-void
.end method

.method public final dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 5

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "  "

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    const-string/jumbo v2, "mState="

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCD:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api;

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Api;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v3

    const-string/jumbo v4, ":"

    invoke-virtual {v3, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDF:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Api;->zzpd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zze;

    invoke-interface {v0, v1, p2, p3, p4}, Lcom/google/android/gms/common/api/Api$zze;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final getConnectionResult(Lcom/google/android/gms/common/api/Api;)Lcom/google/android/gms/common/ConnectionResult;
    .locals 2
    .param p1    # Lcom/google/android/gms/common/api/Api;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;)",
            "Lcom/google/android/gms/common/ConnectionResult;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Api;->zzpd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDF:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDF:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zze;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$zze;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/android/gms/common/ConnectionResult;->zzazX:Lcom/google/android/gms/common/ConnectionResult;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDU:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDU:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/ConnectionResult;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isConnected()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    instance-of v0, v0, Lcom/google/android/gms/internal/zzbbz;

    return v0
.end method

.method public final isConnecting()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    instance-of v0, v0, Lcom/google/android/gms/internal/zzbcc;

    return v0
.end method

.method public final onConnected(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzbcv;->onConnected(Landroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public final onConnectionSuspended(I)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzbcv;->onConnectionSuspended(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public final zza(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/api/Api;Z)V
    .locals 2
    .param p1    # Lcom/google/android/gms/common/ConnectionResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/google/android/gms/common/api/Api;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/ConnectionResult;",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;Z)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/android/gms/internal/zzbcv;->zza(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/api/Api;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method final zza(Lcom/google/android/gms/internal/zzbcx;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDT:Lcom/google/android/gms/internal/zzbcy;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/internal/zzbcy;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDT:Lcom/google/android/gms/internal/zzbcy;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzbcy;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method final zza(Ljava/lang/RuntimeException;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDT:Lcom/google/android/gms/internal/zzbcy;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/internal/zzbcy;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDT:Lcom/google/android/gms/internal/zzbcy;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzbcy;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/zzbeh;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final zzd(Lcom/google/android/gms/internal/zzbax;)Lcom/google/android/gms/internal/zzbax;
    .locals 1
    .param p1    # Lcom/google/android/gms/internal/zzbax;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "R::",
            "Lcom/google/android/gms/common/api/Result;",
            "T:",
            "Lcom/google/android/gms/internal/zzbax",
            "<TR;TA;>;>(TT;)TT;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbax;->zzpC()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzbcv;->zzd(Lcom/google/android/gms/internal/zzbax;)Lcom/google/android/gms/internal/zzbax;

    move-result-object v0

    return-object v0
.end method

.method public final zze(Lcom/google/android/gms/internal/zzbax;)Lcom/google/android/gms/internal/zzbax;
    .locals 1
    .param p1    # Lcom/google/android/gms/internal/zzbax;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "T:",
            "Lcom/google/android/gms/internal/zzbax",
            "<+",
            "Lcom/google/android/gms/common/api/Result;",
            "TA;>;>(TT;)TT;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbax;->zzpC()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzbcv;->zze(Lcom/google/android/gms/internal/zzbax;)Lcom/google/android/gms/internal/zzbax;

    move-result-object v0

    return-object v0
.end method

.method final zzg(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDW:Lcom/google/android/gms/common/ConnectionResult;

    new-instance v0, Lcom/google/android/gms/internal/zzbcn;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzbcn;-><init>(Lcom/google/android/gms/internal/zzbcw;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzbcv;->begin()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDS:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public final zzpE()V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbcw;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    check-cast v0, Lcom/google/android/gms/internal/zzbbz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbbz;->zzpU()V

    :cond_0
    return-void
.end method

.method public final zzpl()V
    .locals 0

    return-void
.end method

.method final zzqh()V
    .locals 8

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    new-instance v0, Lcom/google/android/gms/internal/zzbcc;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCA:Lcom/google/android/gms/common/internal/zzq;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCD:Ljava/util/Map;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCF:Lcom/google/android/gms/common/zze;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzbcw;->zzaBe:Lcom/google/android/gms/common/api/Api$zza;

    iget-object v6, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    iget-object v7, p0, Lcom/google/android/gms/internal/zzbcw;->mContext:Landroid/content/Context;

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzbcc;-><init>(Lcom/google/android/gms/internal/zzbcw;Lcom/google/android/gms/common/internal/zzq;Ljava/util/Map;Lcom/google/android/gms/common/zze;Lcom/google/android/gms/common/api/Api$zza;Ljava/util/concurrent/locks/Lock;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzbcv;->begin()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDS:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method final zzqi()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCl:Lcom/google/android/gms/internal/zzbco;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbco;->zzqe()Z

    new-instance v0, Lcom/google/android/gms/internal/zzbbz;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzbbz;-><init>(Lcom/google/android/gms/internal/zzbcw;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDV:Lcom/google/android/gms/internal/zzbcv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzbcv;->begin()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaDS:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbcw;->zzaCv:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
