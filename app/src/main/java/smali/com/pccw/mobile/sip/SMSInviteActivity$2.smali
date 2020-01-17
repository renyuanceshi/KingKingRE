.class Lcom/pccw/mobile/sip/SMSInviteActivity$2;
.super Ljava/lang/Object;
.source "SMSInviteActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/SMSInviteActivity;->showSMSConfirmDialog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

.field final synthetic val$number:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/SMSInviteActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;

    .prologue
    .line 281
    iput-object p1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$2;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    iput-object p2, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$2;->val$number:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 284
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$2;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$600(Lcom/pccw/mobile/sip/SMSInviteActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 285
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$2;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$602(Lcom/pccw/mobile/sip/SMSInviteActivity;Z)Z

    .line 286
    invoke-static {}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$700()Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$700()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 287
    invoke-static {}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$700()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->cancel()V

    .line 289
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$2;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 290
    invoke-static {}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$700()Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 291
    invoke-static {}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$700()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 300
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$2;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$202(Lcom/pccw/mobile/sip/SMSInviteActivity;Z)Z

    .line 301
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$2;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->dismiss()V

    .line 302
    return-void

    .line 293
    :cond_2
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$2;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$800(Lcom/pccw/mobile/sip/SMSInviteActivity;)V

    goto :goto_0

    .line 296
    :cond_3
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$2;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    iget-object v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$2;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    iget-object v2, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$2;->val$number:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/sip/SMSInviteActivity;->sendSMS(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/SMSInviteActivity;->showSMSInviteResultDialog(Z)Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Landroid/app/AlertDialog;

    invoke-static {v0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$902(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 297
    invoke-static {}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$900()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method
