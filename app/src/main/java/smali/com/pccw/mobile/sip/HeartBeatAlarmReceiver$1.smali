.class Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver$1;
.super Ljava/lang/Object;
.source "HeartBeatAlarmReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver;

    .prologue
    .line 14
    iput-object p1, p0, Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver$1;->this$0:Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver;

    iput-object p2, p0, Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 18
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->doHeartBeat(Landroid/content/Context;)V

    .line 19
    return-void
.end method
