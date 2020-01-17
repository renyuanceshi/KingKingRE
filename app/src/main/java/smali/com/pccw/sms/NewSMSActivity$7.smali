.class Lcom/pccw/sms/NewSMSActivity$7;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


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
    .line 331
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$7;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .prologue
    .line 335
    if-eqz p2, :cond_0

    .line 336
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginSuccress()Z

    move-result v0

    if-nez v0, :cond_0

    .line 337
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$7;->this$0:Lcom/pccw/sms/NewSMSActivity;

    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v0, v1}, Lcom/pccw/sms/NewSMSActivity;->access$200(Lcom/pccw/sms/NewSMSActivity;Lcom/pccw/dialog/EnumKKDialogType;)V

    .line 340
    :cond_0
    return-void
.end method
