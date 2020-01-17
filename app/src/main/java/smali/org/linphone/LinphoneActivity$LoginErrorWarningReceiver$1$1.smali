.class Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$1;
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
    .line 750
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$1;->this$2:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 752
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$1;->this$2:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.settings.WIFI_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneActivity;->startActivity(Landroid/content/Intent;)V

    .line 754
    return-void
.end method
