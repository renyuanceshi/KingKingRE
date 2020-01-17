.class Lorg/linphone/DailPadActivity$11;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity;->callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivity;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 1519
    iput-object p1, p0, Lorg/linphone/DailPadActivity$11;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 1521
    iget-object v0, p0, Lorg/linphone/DailPadActivity$11;->this$0:Lorg/linphone/DailPadActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/linphone/DailPadActivity;->access$700(Lorg/linphone/DailPadActivity;I)V

    .line 1523
    iget-object v6, p0, Lorg/linphone/DailPadActivity$11;->this$0:Lorg/linphone/DailPadActivity;

    new-instance v0, Lorg/linphone/DailPadActivity$11$1;

    const-wide/32 v2, 0x927c0

    const-wide/16 v4, 0x3e8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/linphone/DailPadActivity$11$1;-><init>(Lorg/linphone/DailPadActivity$11;JJ)V

    .line 1531
    invoke-virtual {v0}, Lorg/linphone/DailPadActivity$11$1;->start()Landroid/os/CountDownTimer;

    move-result-object v0

    .line 1523
    invoke-static {v6, v0}, Lorg/linphone/DailPadActivity;->access$902(Lorg/linphone/DailPadActivity;Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;

    .line 1532
    return-void
.end method
