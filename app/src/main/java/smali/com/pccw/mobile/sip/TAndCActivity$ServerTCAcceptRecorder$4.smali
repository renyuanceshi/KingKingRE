.class Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$4;
.super Ljava/lang/Object;
.source "TAndCActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->onPostExecute(Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    .prologue
    .line 839
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$4;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "di"    # Landroid/content/DialogInterface;

    .prologue
    .line 842
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$4;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->access$2500(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 843
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$4;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->access$2500(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 844
    :cond_0
    return-void
.end method
