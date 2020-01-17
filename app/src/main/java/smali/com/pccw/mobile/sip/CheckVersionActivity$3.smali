.class Lcom/pccw/mobile/sip/CheckVersionActivity$3;
.super Ljava/lang/Object;
.source "CheckVersionActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CheckVersionActivity;->contResume()V
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
    .line 203
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$3;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "di"    # Landroid/content/DialogInterface;

    .prologue
    .line 206
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$3;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->finish()V

    .line 207
    return-void
.end method
