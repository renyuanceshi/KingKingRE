.class Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$3;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->showPrepaidTopUpReminderDialog(Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    .prologue
    .line 1348
    iput-object p1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$3;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1350
    iget-object v0, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$3;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$3;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1351
    iget-object v0, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$3;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1353
    :cond_0
    return-void
.end method
