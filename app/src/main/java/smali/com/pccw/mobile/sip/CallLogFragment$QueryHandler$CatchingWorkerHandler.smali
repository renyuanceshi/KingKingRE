.class public Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler$CatchingWorkerHandler;
.super Landroid/content/AsyncQueryHandler$WorkerHandler;
.source "CallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CatchingWorkerHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 309
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler$CatchingWorkerHandler;->this$0:Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;

    .line 310
    invoke-direct {p0, p1, p2}, Landroid/content/AsyncQueryHandler$WorkerHandler;-><init>(Landroid/content/AsyncQueryHandler;Landroid/os/Looper;)V

    .line 311
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 317
    :try_start_0
    invoke-super {p0, p1}, Landroid/content/AsyncQueryHandler$WorkerHandler;->handleMessage(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDiskIOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/database/sqlite/SQLiteDatabaseCorruptException; {:try_start_0 .. :try_end_0} :catch_2

    .line 328
    :goto_0
    return-void

    .line 318
    :catch_0
    move-exception v0

    goto :goto_0

    .line 321
    :catch_1
    move-exception v0

    goto :goto_0

    .line 324
    :catch_2
    move-exception v0

    goto :goto_0
.end method
