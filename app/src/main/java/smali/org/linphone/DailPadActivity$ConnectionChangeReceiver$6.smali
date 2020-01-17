.class Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$6;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    .prologue
    .line 1499
    iput-object p1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$6;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1502
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$6;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$2000(Lorg/linphone/DailPadActivity;)V

    .line 1504
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$6;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$1200(Lorg/linphone/DailPadActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$6;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    const v2, 0x7f0701f2

    invoke-virtual {v1, v2}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1505
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$6;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$1200(Lorg/linphone/DailPadActivity;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1506
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$6;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$1800(Lorg/linphone/DailPadActivity;)V

    .line 1507
    return-void
.end method
