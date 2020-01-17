.class Lcom/pccw/sms/ChatPageActivity$7;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->setViewAction()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/ChatPageActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 573
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$7;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 577
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$7;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$1200(Lcom/pccw/sms/ChatPageActivity;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 578
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$7;->this$0:Lcom/pccw/sms/ChatPageActivity;

    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertNoWifiDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v0, v1}, Lcom/pccw/sms/ChatPageActivity;->access$1300(Lcom/pccw/sms/ChatPageActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    .line 586
    :goto_0
    return-void

    .line 579
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginSuccress()Z

    move-result v0

    if-nez v0, :cond_1

    .line 580
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$7;->this$0:Lcom/pccw/sms/ChatPageActivity;

    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v0, v1}, Lcom/pccw/sms/ChatPageActivity;->access$1300(Lcom/pccw/sms/ChatPageActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 581
    :cond_1
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$7;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$1200(Lcom/pccw/sms/ChatPageActivity;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/mobile/sip/ClientStateManager;->isNotShowSMSConsumeWarmingCheckBox(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 582
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$7;->this$0:Lcom/pccw/sms/ChatPageActivity;

    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertSMSConsumeDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v0, v1}, Lcom/pccw/sms/ChatPageActivity;->access$1300(Lcom/pccw/sms/ChatPageActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 584
    :cond_2
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$7;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$1400(Lcom/pccw/sms/ChatPageActivity;)V

    goto :goto_0
.end method
