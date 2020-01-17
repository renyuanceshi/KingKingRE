.class Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$2;
.super Ljava/lang/Object;
.source "TAndCActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    .line 809
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$2;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 813
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    const-string/jumbo v2, "http://www.pccw-hkt.com/kk"

    .line 814
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 815
    .local v0, "browse":Landroid/content/Intent;
    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$2;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    iget-object v1, v1, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v1, v0}, Lcom/pccw/mobile/sip/TAndCActivity;->startActivity(Landroid/content/Intent;)V

    .line 816
    return-void
.end method
