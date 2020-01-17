.class Lcom/pccw/mobile/sip/TAndCActivity$2;
.super Ljava/lang/Object;
.source "TAndCActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


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
    .line 194
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$2;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "di"    # Landroid/content/DialogInterface;

    .prologue
    .line 197
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$2;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 198
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$2;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->finish()V

    .line 199
    :cond_0
    return-void
.end method
