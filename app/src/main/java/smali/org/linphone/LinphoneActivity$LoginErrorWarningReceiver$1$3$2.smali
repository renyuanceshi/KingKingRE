.class Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3$2;
.super Ljava/lang/Object;
.source "LinphoneActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;->onShow(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$3:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;)V
    .locals 0
    .param p1, "this$3"    # Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;

    .prologue
    .line 828
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3$2;->this$3:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 832
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3$2;->this$3:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;->this$2:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-static {v0}, Lorg/linphone/LinphoneActivity;->access$200(Lorg/linphone/LinphoneActivity;)V

    .line 833
    return-void
.end method
