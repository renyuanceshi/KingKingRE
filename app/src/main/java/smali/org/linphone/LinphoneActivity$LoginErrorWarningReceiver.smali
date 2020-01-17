.class Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;
.super Landroid/content/BroadcastReceiver;
.source "LinphoneActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/LinphoneActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoginErrorWarningReceiver"
.end annotation


# instance fields
.field private activeActivity:Landroid/app/Activity;

.field final synthetic this$0:Lorg/linphone/LinphoneActivity;


# direct methods
.method public constructor <init>(Lorg/linphone/LinphoneActivity;Landroid/app/Activity;)V
    .locals 1
    .param p2, "act"    # Landroid/app/Activity;

    .prologue
    .line 728
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 726
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    iput-object v0, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->activeActivity:Landroid/app/Activity;

    .line 729
    iput-object p2, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->activeActivity:Landroid/app/Activity;

    .line 730
    return-void
.end method

.method static synthetic access$000(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    .prologue
    .line 725
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->activeActivity:Landroid/app/Activity;

    return-object v0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 734
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->activeActivity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 735
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->activeActivity:Landroid/app/Activity;

    new-instance v1, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    invoke-direct {v1, p0, p2, p1}, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;-><init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;Landroid/content/Intent;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 963
    :cond_0
    return-void
.end method
