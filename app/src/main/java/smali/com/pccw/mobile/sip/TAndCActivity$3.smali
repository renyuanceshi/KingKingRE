.class Lcom/pccw/mobile/sip/TAndCActivity$3;
.super Ljava/lang/Object;
.source "TAndCActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/TAndCActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/TAndCActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/TAndCActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/TAndCActivity;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$3;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 224
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$3;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$000(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/widget/Button;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 225
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$3;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$000(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setClickable(Z)V

    .line 226
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$3;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$000(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 227
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$3;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$100(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setClickable(Z)V

    .line 228
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$3;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$100(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 229
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$3;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    new-instance v1, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$3;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    iget-object v3, p0, Lcom/pccw/mobile/sip/TAndCActivity$3;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v1, v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;-><init>(Lcom/pccw/mobile/sip/TAndCActivity;Landroid/app/Activity;)V

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/TAndCActivity;->access$202(Lcom/pccw/mobile/sip/TAndCActivity;Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    .line 230
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$3;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$200(Lcom/pccw/mobile/sip/TAndCActivity;)Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    move-result-object v0

    new-array v1, v4, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 232
    :cond_0
    return-void
.end method
