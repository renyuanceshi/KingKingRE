.class Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$2;
.super Ljava/lang/Object;
.source "LinphoneActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;)V
    .locals 0
    .param p1, "this$2"    # Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    .prologue
    .line 770
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$2;->this$2:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 774
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    const-string/jumbo v2, "http://www.pccw-hkt.com/kk"

    .line 775
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 776
    .local v0, "browse":Landroid/content/Intent;
    iget-object v1, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$2;->this$2:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    iget-object v1, v1, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v1, v1, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-virtual {v1, v0}, Lorg/linphone/LinphoneActivity;->startActivity(Landroid/content/Intent;)V

    .line 777
    return-void
.end method
