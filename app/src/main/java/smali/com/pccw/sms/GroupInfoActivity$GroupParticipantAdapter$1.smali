.class Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;
.super Ljava/lang/Object;
.source "GroupInfoActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

.field final synthetic val$number:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    .prologue
    .line 390
    iput-object p1, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;->this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    iput-object p2, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;->val$number:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 394
    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;->this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    iget-object v2, v2, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-virtual {v2}, Lcom/pccw/sms/GroupInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 395
    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;->this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    iget-object v2, v2, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    sget-object v3, Lcom/pccw/dialog/EnumKKDialogType;->AlertNoWifiDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v2, v3}, Lcom/pccw/sms/GroupInfoActivity;->access$200(Lcom/pccw/sms/GroupInfoActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    .line 409
    :goto_0
    return-void

    .line 396
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginSuccress()Z

    move-result v2

    if-nez v2, :cond_1

    .line 397
    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;->this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    iget-object v2, v2, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    sget-object v3, Lcom/pccw/dialog/EnumKKDialogType;->AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v2, v3}, Lcom/pccw/sms/GroupInfoActivity;->access$200(Lcom/pccw/sms/GroupInfoActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 398
    :cond_1
    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;->this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    iget-object v2, v2, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-virtual {v2}, Lcom/pccw/sms/GroupInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->isNotShowSMSConsumeWarmingCheckBox(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 399
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 400
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v2, "numbers"

    new-array v3, v4, [Ljava/lang/String;

    iget-object v4, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;->val$number:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 401
    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;->this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    iget-object v2, v2, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    sget-object v3, Lcom/pccw/dialog/EnumKKDialogType;->AlertSMSConsumeDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v2, v3, v0}, Lcom/pccw/sms/GroupInfoActivity;->access$300(Lcom/pccw/sms/GroupInfoActivity;Lcom/pccw/dialog/EnumKKDialogType;Landroid/os/Bundle;)V

    goto :goto_0

    .line 403
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_2
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;->this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    iget-object v2, v2, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    const-class v3, Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 404
    .local v1, "intent":Landroid/content/Intent;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 405
    .restart local v0    # "bundle":Landroid/os/Bundle;
    const-string/jumbo v2, "numbers"

    new-array v3, v4, [Ljava/lang/String;

    iget-object v4, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;->val$number:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 406
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 407
    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;->this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    iget-object v2, v2, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-virtual {v2, v1}, Lcom/pccw/sms/GroupInfoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
