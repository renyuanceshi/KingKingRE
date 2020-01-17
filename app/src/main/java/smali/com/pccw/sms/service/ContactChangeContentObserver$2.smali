.class Lcom/pccw/sms/service/ContactChangeContentObserver$2;
.super Ljava/lang/Object;
.source "ContactChangeContentObserver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/service/ContactChangeContentObserver;->startSyncIMUserThread(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/service/ContactChangeContentObserver;


# direct methods
.method constructor <init>(Lcom/pccw/sms/service/ContactChangeContentObserver;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/service/ContactChangeContentObserver;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/pccw/sms/service/ContactChangeContentObserver$2;->this$0:Lcom/pccw/sms/service/ContactChangeContentObserver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 87
    :goto_0
    sget v0, Lcom/pccw/sms/service/ContactChangeContentObserver;->queueCount:I

    if-lez v0, :cond_1

    .line 88
    iget-object v0, p0, Lcom/pccw/sms/service/ContactChangeContentObserver$2;->this$0:Lcom/pccw/sms/service/ContactChangeContentObserver;

    iget-object v0, v0, Lcom/pccw/sms/service/ContactChangeContentObserver;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    invoke-static {}, Lorg/linphone/LinphoneActivity;->isPhoneBookSyncRunning()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 91
    const/4 v0, 0x1

    invoke-static {v0}, Lorg/linphone/LinphoneActivity;->setPhoneBookSyncRunning(Z)V

    .line 94
    :cond_0
    sget v0, Lcom/pccw/sms/service/ContactChangeContentObserver;->queueCount:I

    add-int/lit8 v0, v0, -0x1

    sput v0, Lcom/pccw/sms/service/ContactChangeContentObserver;->queueCount:I

    goto :goto_0

    .line 96
    :cond_1
    return-void
.end method
