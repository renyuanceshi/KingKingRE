.class Lcom/pccw/mobile/sip/TAndCActivity$4$1;
.super Ljava/lang/Object;
.source "TAndCActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/TAndCActivity$4;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/TAndCActivity$4;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/TAndCActivity$4;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/TAndCActivity$4;

    .prologue
    .line 239
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$4$1;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 242
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v0, :cond_0

    .line 243
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$4$1;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$4;

    iget-object v1, v1, Lcom/pccw/mobile/sip/TAndCActivity$4;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    .line 244
    :cond_0
    return-void
.end method
