.class public Lcom/pccw/sms/singleton/ChatPageLayoutInstance;
.super Ljava/lang/Object;
.source "ChatPageLayoutInstance.java"


# static fields
.field private static chatPageLayoutInstance:Lcom/pccw/sms/singleton/ChatPageLayoutInstance;


# instance fields
.field private chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/pccw/sms/singleton/ChatPageLayoutInstance;
    .locals 2

    .prologue
    .line 11
    const-class v1, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->chatPageLayoutInstance:Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    if-nez v0, :cond_0

    .line 12
    new-instance v0, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    invoke-direct {v0}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;-><init>()V

    sput-object v0, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->chatPageLayoutInstance:Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    .line 14
    :cond_0
    sget-object v0, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->chatPageLayoutInstance:Lcom/pccw/sms/singleton/ChatPageLayoutInstance;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 11
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    .line 27
    return-void
.end method

.method public getChatPageListView()Lcom/pccw/sms/bean/ChatPageListView;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    return-object v0
.end method

.method public init(Lcom/pccw/sms/bean/ChatPageListView;)V
    .locals 0
    .param p1, "chatPageListView"    # Lcom/pccw/sms/bean/ChatPageListView;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    .line 23
    return-void
.end method
