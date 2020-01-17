.class Lcom/pccw/mobile/sip/TAndCActivity$4;
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
    .line 235
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$4;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 238
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$4;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$100(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/widget/Button;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 239
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/pccw/mobile/sip/TAndCActivity$4$1;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/sip/TAndCActivity$4$1;-><init>(Lcom/pccw/mobile/sip/TAndCActivity$4;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 246
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$4;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$4;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->finish()V

    .line 249
    :cond_0
    return-void
.end method
