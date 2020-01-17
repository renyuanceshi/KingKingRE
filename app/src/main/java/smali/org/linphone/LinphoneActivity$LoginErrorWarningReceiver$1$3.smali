.class Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;
.super Ljava/lang/Object;
.source "LinphoneActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

.field final synthetic val$dialog:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;Landroid/app/AlertDialog;)V
    .locals 0
    .param p1, "this$2"    # Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    .prologue
    .line 813
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;->this$2:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    iput-object p2, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;->val$dialog:Landroid/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "d"    # Landroid/content/DialogInterface;

    .prologue
    .line 818
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;->val$dialog:Landroid/app/AlertDialog;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3$1;

    invoke-direct {v1, p0}, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3$1;-><init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;)V

    .line 819
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 827
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;->val$dialog:Landroid/app/AlertDialog;

    const/4 v1, -0x3

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3$2;

    invoke-direct {v1, p0}, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3$2;-><init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;)V

    .line 828
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 835
    return-void
.end method
