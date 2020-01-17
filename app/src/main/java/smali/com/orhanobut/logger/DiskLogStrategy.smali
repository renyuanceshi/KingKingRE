.class public Lcom/orhanobut/logger/DiskLogStrategy;
.super Ljava/lang/Object;
.source "DiskLogStrategy.java"

# interfaces
.implements Lcom/orhanobut/logger/LogStrategy;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/orhanobut/logger/DiskLogStrategy$WriteHandler;
    }
.end annotation


# instance fields
.field private final handler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .locals 0
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/orhanobut/logger/DiskLogStrategy;->handler:Landroid/os/Handler;

    .line 21
    return-void
.end method


# virtual methods
.method public log(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "level"    # I
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/orhanobut/logger/DiskLogStrategy;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/orhanobut/logger/DiskLogStrategy;->handler:Landroid/os/Handler;

    invoke-virtual {v1, p1, p3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 26
    return-void
.end method
