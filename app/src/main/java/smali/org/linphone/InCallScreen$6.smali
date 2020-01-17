.class Lorg/linphone/InCallScreen$6;
.super Ljava/lang/Object;
.source "InCallScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen;->onClick(Landroid/view/View;)V
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
    .line 620
    iput-object p1, p0, Lorg/linphone/InCallScreen$6;->this$0:Lorg/linphone/InCallScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 622
    iget-object v0, p0, Lorg/linphone/InCallScreen$6;->this$0:Lorg/linphone/InCallScreen;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/linphone/InCallScreen;->showDialog(I)V

    .line 624
    iget-object v6, p0, Lorg/linphone/InCallScreen$6;->this$0:Lorg/linphone/InCallScreen;

    new-instance v0, Lorg/linphone/InCallScreen$6$1;

    const-wide/16 v2, 0x2710

    const-wide/16 v4, 0x3e8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/linphone/InCallScreen$6$1;-><init>(Lorg/linphone/InCallScreen$6;JJ)V

    .line 633
    invoke-virtual {v0}, Lorg/linphone/InCallScreen$6$1;->start()Landroid/os/CountDownTimer;

    move-result-object v0

    .line 624
    invoke-static {v6, v0}, Lorg/linphone/InCallScreen;->access$702(Lorg/linphone/InCallScreen;Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;

    .line 634
    return-void
.end method
