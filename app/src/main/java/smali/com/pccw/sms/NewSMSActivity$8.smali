.class Lcom/pccw/sms/NewSMSActivity$8;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/NewSMSActivity;->setViewAction()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/NewSMSActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/NewSMSActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/NewSMSActivity;

    .prologue
    .line 343
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$8;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 347
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$8;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v1, v1, Lcom/pccw/sms/NewSMSActivity;->sendEt:Lcom/pccw/sms/emoji/EmojiEditText;

    invoke-virtual {v1}, Lcom/pccw/sms/emoji/EmojiEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 348
    .local v0, "text":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 361
    :goto_0
    return-void

    .line 352
    :cond_0
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$8;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v1}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 353
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$8;->this$0:Lcom/pccw/sms/NewSMSActivity;

    sget-object v2, Lcom/pccw/dialog/EnumKKDialogType;->AlertNoWifiDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v1, v2}, Lcom/pccw/sms/NewSMSActivity;->access$200(Lcom/pccw/sms/NewSMSActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 354
    :cond_1
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginSuccress()Z

    move-result v1

    if-nez v1, :cond_2

    .line 355
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$8;->this$0:Lcom/pccw/sms/NewSMSActivity;

    sget-object v2, Lcom/pccw/dialog/EnumKKDialogType;->AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v1, v2}, Lcom/pccw/sms/NewSMSActivity;->access$200(Lcom/pccw/sms/NewSMSActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 356
    :cond_2
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$8;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-boolean v1, v1, Lcom/pccw/sms/NewSMSActivity;->isComeFromEditParticipant:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$8;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v1}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isNotShowSMSConsumeWarmingCheckBox(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 357
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$8;->this$0:Lcom/pccw/sms/NewSMSActivity;

    sget-object v2, Lcom/pccw/dialog/EnumKKDialogType;->AlertSMSConsumeDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v1, v2}, Lcom/pccw/sms/NewSMSActivity;->access$200(Lcom/pccw/sms/NewSMSActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 359
    :cond_3
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$8;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-static {v1, v0}, Lcom/pccw/sms/NewSMSActivity;->access$300(Lcom/pccw/sms/NewSMSActivity;Ljava/lang/String;)V

    goto :goto_0
.end method
