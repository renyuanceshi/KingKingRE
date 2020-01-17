.class public abstract Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;
.super Lorg/apache/http/message/AbstractHttpMessage;
.source "AbstractExecutionAwareRequest.java"

# interfaces
.implements Lorg/apache/http/client/methods/HttpExecutionAware;
.implements Lorg/apache/http/client/methods/AbortableHttpRequest;
.implements Ljava/lang/Cloneable;
.implements Lorg/apache/http/HttpRequest;


# instance fields
.field private abortLock:Ljava/util/concurrent/locks/Lock;

.field private volatile aborted:Z

.field private volatile cancellable:Lorg/apache/http/concurrent/Cancellable;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/http/message/AbstractHttpMessage;-><init>()V

    .line 50
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    .line 51
    return-void
.end method

.method private cancelExecution()V
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->cancellable:Lorg/apache/http/concurrent/Cancellable;

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->cancellable:Lorg/apache/http/concurrent/Cancellable;

    invoke-interface {v0}, Lorg/apache/http/concurrent/Cancellable;->cancel()Z

    .line 100
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->cancellable:Lorg/apache/http/concurrent/Cancellable;

    .line 102
    :cond_0
    return-void
.end method


# virtual methods
.method public abort()V
    .locals 2

    .prologue
    .line 105
    iget-boolean v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->aborted:Z

    if-eqz v0, :cond_0

    .line 115
    :goto_0
    return-void

    .line 108
    :cond_0
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 110
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->aborted:Z

    .line 111
    invoke-direct {p0}, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->cancelExecution()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public clone()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;

    .line 139
    .local v0, "clone":Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;
    iget-object v1, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-static {v1}, Lorg/apache/http/client/utils/CloneUtils;->cloneObject(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/message/HeaderGroup;

    iput-object v1, v0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->headergroup:Lorg/apache/http/message/HeaderGroup;

    .line 140
    iget-object v1, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->params:Lorg/apache/http/params/HttpParams;

    invoke-static {v1}, Lorg/apache/http/client/utils/CloneUtils;->cloneObject(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/params/HttpParams;

    iput-object v1, v0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->params:Lorg/apache/http/params/HttpParams;

    .line 141
    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v1, v0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    .line 142
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->cancellable:Lorg/apache/http/concurrent/Cancellable;

    .line 143
    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->aborted:Z

    .line 144
    return-object v0
.end method

.method public completed()V
    .locals 2

    .prologue
    .line 151
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 153
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->cancellable:Lorg/apache/http/concurrent/Cancellable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 157
    return-void

    .line 155
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public isAborted()Z
    .locals 1

    .prologue
    .line 118
    iget-boolean v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->aborted:Z

    return v0
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 165
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 167
    :try_start_0
    invoke-direct {p0}, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->cancelExecution()V

    .line 168
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->aborted:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 172
    return-void

    .line 170
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setCancellable(Lorg/apache/http/concurrent/Cancellable;)V
    .locals 2
    .param p1, "cancellable"    # Lorg/apache/http/concurrent/Cancellable;

    .prologue
    .line 125
    iget-boolean v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->aborted:Z

    if-eqz v0, :cond_0

    .line 134
    :goto_0
    return-void

    .line 128
    :cond_0
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 130
    :try_start_0
    iput-object p1, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->cancellable:Lorg/apache/http/concurrent/Cancellable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setConnectionRequest(Lorg/apache/http/conn/ClientConnectionRequest;)V
    .locals 2
    .param p1, "connRequest"    # Lorg/apache/http/conn/ClientConnectionRequest;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 55
    iget-boolean v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->aborted:Z

    if-eqz v0, :cond_0

    .line 71
    :goto_0
    return-void

    .line 58
    :cond_0
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 60
    :try_start_0
    new-instance v0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest$1;

    invoke-direct {v0, p0, p1}, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest$1;-><init>(Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;Lorg/apache/http/conn/ClientConnectionRequest;)V

    iput-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->cancellable:Lorg/apache/http/concurrent/Cancellable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setReleaseTrigger(Lorg/apache/http/conn/ConnectionReleaseTrigger;)V
    .locals 2
    .param p1, "releaseTrigger"    # Lorg/apache/http/conn/ConnectionReleaseTrigger;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 75
    iget-boolean v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->aborted:Z

    if-eqz v0, :cond_0

    .line 95
    :goto_0
    return-void

    .line 78
    :cond_0
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 80
    :try_start_0
    new-instance v0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest$2;

    invoke-direct {v0, p0, p1}, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest$2;-><init>(Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;Lorg/apache/http/conn/ConnectionReleaseTrigger;)V

    iput-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->cancellable:Lorg/apache/http/concurrent/Cancellable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    iget-object v0, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->abortLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
