.class Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$3;
.super Ljava/lang/Object;
.source "CheckVersionActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->onPostExecute(Lcom/pccw/mobile/sip/CheckVersionResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

.field final synthetic val$result:Lcom/pccw/mobile/sip/CheckVersionResponse;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;Lcom/pccw/mobile/sip/CheckVersionResponse;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    .prologue
    .line 639
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$3;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    iput-object p2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$3;->val$result:Lcom/pccw/mobile/sip/CheckVersionResponse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 643
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 647
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$3;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$3;->val$result:Lcom/pccw/mobile/sip/CheckVersionResponse;

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->access$400(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;Lcom/pccw/mobile/sip/CheckVersionResponse;)V

    .line 649
    return-void
.end method
