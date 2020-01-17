.class Lorg/linphone/InCallScreen$8;
.super Ljava/lang/Object;
.source "InCallScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen;->startVideoView(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/InCallScreen;


# direct methods
.method constructor <init>(Lorg/linphone/InCallScreen;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 753
    iput-object p1, p0, Lorg/linphone/InCallScreen$8;->this$0:Lorg/linphone/InCallScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 755
    sget-boolean v0, Lorg/linphone/VideoCallActivity;->launched:Z

    if-eqz v0, :cond_0

    .line 763
    :goto_0
    return-void

    .line 759
    :cond_0
    iget-object v0, p0, Lorg/linphone/InCallScreen$8;->this$0:Lorg/linphone/InCallScreen;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    iget-object v2, p0, Lorg/linphone/InCallScreen$8;->this$0:Lorg/linphone/InCallScreen;

    const-class v3, Lorg/linphone/VideoCallActivity;

    .line 760
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v1

    const/16 v2, 0x64

    .line 759
    invoke-virtual {v0, v1, v2}, Lorg/linphone/InCallScreen;->startActivityForResult(Landroid/content/Intent;I)V

    .line 762
    const/4 v0, 0x1

    sput-boolean v0, Lorg/linphone/VideoCallActivity;->launched:Z

    goto :goto_0
.end method
