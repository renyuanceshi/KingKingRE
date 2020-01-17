.class Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$2;
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
    .line 1426
    iput-object p1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$2;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1429
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$2;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0, v1}, Lorg/linphone/DailPadActivity;->access$1600(Lorg/linphone/DailPadActivity;Z)V

    .line 1430
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$2;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0, v1}, Lorg/linphone/DailPadActivity;->access$1100(Lorg/linphone/DailPadActivity;Z)V

    .line 1433
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$2;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v0, v0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v0, v1}, Lorg/linphone/DailPadActivity;->on(Landroid/content/Context;Z)V

    .line 1434
    return-void
.end method
