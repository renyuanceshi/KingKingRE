.class Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;
.super Ljava/lang/Object;
.source "ContactDetailsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

.field final synthetic val$content:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    .prologue
    .line 826
    iput-object p1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;->this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;->val$content:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 830
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;->this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 831
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;->this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    sget-object v2, Lcom/pccw/dialog/EnumKKDialogType;->AlertNoWifiDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v1, v2}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$300(Lcom/pccw/mobile/sip/ContactDetailsActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    .line 841
    :goto_0
    return-void

    .line 832
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginSuccress()Z

    move-result v1

    if-nez v1, :cond_1

    .line 833
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;->this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    sget-object v2, Lcom/pccw/dialog/EnumKKDialogType;->AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v1, v2}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$300(Lcom/pccw/mobile/sip/ContactDetailsActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 834
    :cond_1
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;->this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isNotShowSMSConsumeWarmingCheckBox(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 835
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 836
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v1, "number"

    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;->val$content:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 837
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;->this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    sget-object v2, Lcom/pccw/dialog/EnumKKDialogType;->AlertSMSConsumeDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v1, v2, v0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$400(Lcom/pccw/mobile/sip/ContactDetailsActivity;Lcom/pccw/dialog/EnumKKDialogType;Landroid/os/Bundle;)V

    goto :goto_0

    .line 839
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_2
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;->this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;->val$content:Ljava/lang/String;

    invoke-static {v2}, Lcom/pccw/sms/util/SMSNumberUtil;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$500(Lcom/pccw/mobile/sip/ContactDetailsActivity;Ljava/lang/String;)V

    goto :goto_0
.end method
