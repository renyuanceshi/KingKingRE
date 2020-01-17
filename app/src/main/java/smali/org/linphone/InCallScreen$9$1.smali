.class Lorg/linphone/InCallScreen$9$1;
.super Landroid/os/CountDownTimer;
.source "InCallScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen$9;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/InCallScreen$9;


# direct methods
.method constructor <init>(Lorg/linphone/InCallScreen$9;JJ)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/InCallScreen$9;
    .param p2, "x0"    # J
    .param p4, "x1"    # J

    .prologue
    .line 1212
    iput-object p1, p0, Lorg/linphone/InCallScreen$9$1;->this$1:Lorg/linphone/InCallScreen$9;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1217
    iget-object v0, p0, Lorg/linphone/InCallScreen$9$1;->this$1:Lorg/linphone/InCallScreen$9;

    iget-object v0, v0, Lorg/linphone/InCallScreen$9;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0, v1, v1}, Lorg/linphone/InCallScreen;->access$1200(Lorg/linphone/InCallScreen;ZI)V

    .line 1218
    return-void
.end method

.method public onTick(J)V
    .locals 0
    .param p1, "millisUntilFinished"    # J

    .prologue
    .line 1214
    return-void
.end method
