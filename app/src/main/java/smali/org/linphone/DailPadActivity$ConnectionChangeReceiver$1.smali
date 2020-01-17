.class Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$1;
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
    .line 1413
    iput-object p1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$1;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1416
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$1;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0, v2}, Lorg/linphone/DailPadActivity;->access$1600(Lorg/linphone/DailPadActivity;Z)V

    .line 1417
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$1;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/linphone/DailPadActivity;->access$1100(Lorg/linphone/DailPadActivity;Z)V

    .line 1420
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$1;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v0, v0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v0, v2}, Lorg/linphone/DailPadActivity;->on(Landroid/content/Context;Z)V

    .line 1421
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$1;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$1800(Lorg/linphone/DailPadActivity;)V

    .line 1422
    return-void
.end method
