.class Lcom/pccw/sms/GroupInfoActivity$2;
.super Ljava/lang/Object;
.source "GroupInfoActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/GroupInfoActivity;->getViews()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/GroupInfoActivity;

.field final synthetic val$recipants:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/sms/GroupInfoActivity;[Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/GroupInfoActivity;

    .prologue
    .line 171
    iput-object p1, p0, Lcom/pccw/sms/GroupInfoActivity$2;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    iput-object p2, p0, Lcom/pccw/sms/GroupInfoActivity$2;->val$recipants:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 174
    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$2;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-virtual {v2}, Lcom/pccw/sms/GroupInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 175
    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$2;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    sget-object v3, Lcom/pccw/dialog/EnumKKDialogType;->AlertNoWifiDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v2, v3}, Lcom/pccw/sms/GroupInfoActivity;->access$200(Lcom/pccw/sms/GroupInfoActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    .line 186
    :goto_0
    return-void

    .line 176
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginSuccress()Z

    move-result v2

    if-nez v2, :cond_1

    .line 177
    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$2;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    sget-object v3, Lcom/pccw/dialog/EnumKKDialogType;->AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v2, v3}, Lcom/pccw/sms/GroupInfoActivity;->access$200(Lcom/pccw/sms/GroupInfoActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 179
    :cond_1
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$2;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    const-class v3, Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 180
    .local v1, "intent":Landroid/content/Intent;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 181
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v2, "numbers"

    iget-object v3, p0, Lcom/pccw/sms/GroupInfoActivity$2;->val$recipants:[Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 182
    const-string/jumbo v2, "isComeFromEditParticipant"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 183
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 184
    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity$2;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-virtual {v2, v1}, Lcom/pccw/sms/GroupInfoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
