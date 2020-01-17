.class Lorg/linphone/InCallScreen$9;
.super Ljava/lang/Object;
.source "InCallScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen;->callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
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
    .line 1208
    iput-object p1, p0, Lorg/linphone/InCallScreen$9;->this$0:Lorg/linphone/InCallScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 1210
    iget-object v0, p0, Lorg/linphone/InCallScreen$9;->this$0:Lorg/linphone/InCallScreen;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/linphone/InCallScreen;->showDialog(I)V

    .line 1212
    iget-object v6, p0, Lorg/linphone/InCallScreen$9;->this$0:Lorg/linphone/InCallScreen;

    new-instance v0, Lorg/linphone/InCallScreen$9$1;

    const-wide/16 v2, 0x7530

    const-wide/16 v4, 0x3e8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/linphone/InCallScreen$9$1;-><init>(Lorg/linphone/InCallScreen$9;JJ)V

    .line 1219
    invoke-virtual {v0}, Lorg/linphone/InCallScreen$9$1;->start()Landroid/os/CountDownTimer;

    move-result-object v0

    .line 1212
    invoke-static {v6, v0}, Lorg/linphone/InCallScreen;->access$702(Lorg/linphone/InCallScreen;Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;

    .line 1220
    return-void
.end method
