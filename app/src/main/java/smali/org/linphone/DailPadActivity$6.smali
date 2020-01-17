.class Lorg/linphone/DailPadActivity$6;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity;->performCallWithAddress(Ljava/lang/String;Z)V
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
    .line 785
    iput-object p1, p0, Lorg/linphone/DailPadActivity$6;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 787
    iget-object v0, p0, Lorg/linphone/DailPadActivity$6;->this$0:Lorg/linphone/DailPadActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/linphone/DailPadActivity;->access$700(Lorg/linphone/DailPadActivity;I)V

    .line 789
    iget-object v6, p0, Lorg/linphone/DailPadActivity$6;->this$0:Lorg/linphone/DailPadActivity;

    new-instance v0, Lorg/linphone/DailPadActivity$6$1;

    const-wide/32 v2, 0x927c0

    const-wide/16 v4, 0x3e8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/linphone/DailPadActivity$6$1;-><init>(Lorg/linphone/DailPadActivity$6;JJ)V

    .line 797
    invoke-virtual {v0}, Lorg/linphone/DailPadActivity$6$1;->start()Landroid/os/CountDownTimer;

    move-result-object v0

    .line 789
    invoke-static {v6, v0}, Lorg/linphone/DailPadActivity;->access$902(Lorg/linphone/DailPadActivity;Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;

    .line 798
    return-void
.end method
