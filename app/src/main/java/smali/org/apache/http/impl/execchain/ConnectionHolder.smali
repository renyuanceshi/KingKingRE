.class Lorg/apache/http/impl/execchain/ConnectionHolder;
.super Ljava/lang/Object;
.source "ConnectionHolder.java"

# interfaces
.implements Lorg/apache/http/conn/ConnectionReleaseTrigger;
.implements Lorg/apache/http/concurrent/Cancellable;
.implements Ljava/io/Closeable;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final managedConn:Lorg/apache/http/HttpClientConnection;

.field private final manager:Lorg/apache/http/conn/HttpClientConnectionManager;

.field private volatile released:Z

.field private volatile reusable:Z

.field private volatile state:Ljava/lang/Object;

.field private volatile tunit:Ljava/util/concurrent/TimeUnit;

.field private volatile validDuration:J


# direct methods
.method public constructor <init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/HttpClientConnection;)V
    .locals 0
    .param p1, "log"    # Lorg/apache/commons/logging/Log;
    .param p2, "manager"    # Lorg/apache/http/conn/HttpClientConnectionManager;
    .param p3, "managedConn"    # Lorg/apache/http/HttpClientConnection;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    .line 66
    iput-object p2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    .line 67
    iput-object p3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    .line 68
    return-void
.end method


# virtual methods
.method public abortConnection()V
    .locals 9

    .prologue
    .line 119
    iget-object v8, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    monitor-enter v8

    .line 120
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z

    if-eqz v1, :cond_0

    .line 121
    monitor-exit v8

    .line 136
    :goto_0
    return-void

    .line 123
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    :try_start_1
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    invoke-interface {v1}, Lorg/apache/http/HttpClientConnection;->shutdown()V

    .line 126
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "Connection discarded"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 132
    :try_start_2
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    .line 135
    :goto_1
    monitor-exit v8

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 127
    :catch_0
    move-exception v0

    .line 128
    .local v0, "ex":Ljava/io/IOException;
    :try_start_3
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 129
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 132
    :cond_1
    :try_start_4
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    goto :goto_1

    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_1
    move-exception v1

    move-object v7, v1

    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    throw v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method public cancel()Z
    .locals 3

    .prologue
    .line 139
    iget-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z

    .line 140
    .local v0, "alreadyReleased":Z
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "Cancelling request execution"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 141
    invoke-virtual {p0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 142
    if-nez v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-virtual {p0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 151
    return-void
.end method

.method public isReleased()Z
    .locals 1

    .prologue
    .line 146
    iget-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z

    return v0
.end method

.method public isReusable()Z
    .locals 1

    .prologue
    .line 71
    iget-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    return v0
.end method

.method public markNonReusable()V
    .locals 1

    .prologue
    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    .line 80
    return-void
.end method

.method public markReusable()V
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    .line 76
    return-void
.end method

.method public releaseConnection()V
    .locals 9

    .prologue
    .line 94
    iget-object v8, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    monitor-enter v8

    .line 95
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z

    if-eqz v1, :cond_0

    .line 96
    monitor-exit v8

    .line 116
    :goto_0
    return-void

    .line 98
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z

    .line 99
    iget-boolean v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    if-eqz v1, :cond_1

    .line 100
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    iget-object v3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->state:Ljava/lang/Object;

    iget-wide v4, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->validDuration:J

    iget-object v6, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->tunit:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    .line 115
    :goto_1
    monitor-exit v8

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 104
    :cond_1
    :try_start_1
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    invoke-interface {v1}, Lorg/apache/http/HttpClientConnection;->close()V

    .line 105
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "Connection discarded"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 111
    :try_start_2
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "ex":Ljava/io/IOException;
    :try_start_3
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 108
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 111
    :cond_2
    :try_start_4
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    goto :goto_1

    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_1
    move-exception v1

    move-object v7, v1

    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    throw v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method public setState(Ljava/lang/Object;)V
    .locals 0
    .param p1, "state"    # Ljava/lang/Object;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->state:Ljava/lang/Object;

    .line 84
    return-void
.end method

.method public setValidFor(JLjava/util/concurrent/TimeUnit;)V
    .locals 3
    .param p1, "duration"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 87
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    monitor-enter v1

    .line 88
    :try_start_0
    iput-wide p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->validDuration:J

    .line 89
    iput-object p3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->tunit:Ljava/util/concurrent/TimeUnit;

    .line 90
    monitor-exit v1

    .line 91
    return-void

    .line 90
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
