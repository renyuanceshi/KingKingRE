.class Lcom/pccw/mobile/sip/CheckVersionActivity$6;
.super Ljava/lang/Object;
.source "CheckVersionActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CheckVersionActivity;->showCannotGetMsisdnAndQuitAppDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;

    .prologue
    .line 1146
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$6;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "di"    # Landroid/content/DialogInterface;

    .prologue
    .line 1149
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$6;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1150
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$6;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->finish()V

    .line 1151
    :cond_0
    return-void
.end method
