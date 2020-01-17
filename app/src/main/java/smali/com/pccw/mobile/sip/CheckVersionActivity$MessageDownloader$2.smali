.class Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader$2;
.super Ljava/lang/Object;
.source "CheckVersionActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->onPostExecute(Ljava/lang/Boolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    .prologue
    .line 927
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader$2;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "d"    # Landroid/content/DialogInterface;

    .prologue
    .line 934
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader$2;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    iget-object v0, v0, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 935
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader$2;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    iget-object v0, v0, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->finish()V

    .line 936
    :cond_0
    return-void
.end method
