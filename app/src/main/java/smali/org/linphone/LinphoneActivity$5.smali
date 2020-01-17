.class Lorg/linphone/LinphoneActivity$5;
.super Landroid/content/BroadcastReceiver;
.source "LinphoneActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/LinphoneActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/LinphoneActivity;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneActivity;

    .prologue
    .line 1035
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$5;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1039
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1040
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v1, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1043
    :cond_0
    return-void
.end method
