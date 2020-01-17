.class Lorg/linphone/DailPadActivity$11$1;
.super Landroid/os/CountDownTimer;
.source "DailPadActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity$11;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/DailPadActivity$11;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity$11;JJ)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/DailPadActivity$11;
    .param p2, "x0"    # J
    .param p4, "x1"    # J

    .prologue
    .line 1523
    iput-object p1, p0, Lorg/linphone/DailPadActivity$11$1;->this$1:Lorg/linphone/DailPadActivity$11;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 1

    .prologue
    .line 1529
    iget-object v0, p0, Lorg/linphone/DailPadActivity$11$1;->this$1:Lorg/linphone/DailPadActivity$11;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$11;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$900(Lorg/linphone/DailPadActivity;)Landroid/os/CountDownTimer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 1530
    return-void
.end method

.method public onTick(J)V
    .locals 0
    .param p1, "millisUntilFinished"    # J

    .prologue
    .line 1525
    return-void
.end method
