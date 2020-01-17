.class Lorg/linphone/InCallScreen$6$1;
.super Landroid/os/CountDownTimer;
.source "InCallScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/InCallScreen$6;


# direct methods
.method constructor <init>(Lorg/linphone/InCallScreen$6;JJ)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/InCallScreen$6;
    .param p2, "x0"    # J
    .param p4, "x1"    # J

    .prologue
    .line 624
    iput-object p1, p0, Lorg/linphone/InCallScreen$6$1;->this$1:Lorg/linphone/InCallScreen$6;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .prologue
    .line 629
    iget-object v0, p0, Lorg/linphone/InCallScreen$6$1;->this$1:Lorg/linphone/InCallScreen$6;

    iget-object v0, v0, Lorg/linphone/InCallScreen$6;->this$0:Lorg/linphone/InCallScreen;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/linphone/InCallScreen;->removeDialog(I)V

    .line 630
    iget-object v0, p0, Lorg/linphone/InCallScreen$6$1;->this$1:Lorg/linphone/InCallScreen$6;

    iget-object v0, v0, Lorg/linphone/InCallScreen$6;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$700(Lorg/linphone/InCallScreen;)Landroid/os/CountDownTimer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 631
    iget-object v0, p0, Lorg/linphone/InCallScreen$6$1;->this$1:Lorg/linphone/InCallScreen$6;

    iget-object v0, v0, Lorg/linphone/InCallScreen$6;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$800(Lorg/linphone/InCallScreen;)Landroid/widget/ToggleButton;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 632
    return-void
.end method

.method public onTick(J)V
    .locals 0
    .param p1, "millisUntilFinished"    # J

    .prologue
    .line 626
    return-void
.end method
