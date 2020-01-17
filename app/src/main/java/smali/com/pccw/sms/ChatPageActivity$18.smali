.class Lcom/pccw/sms/ChatPageActivity$18;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->showRemoveAllMessageAndQuitDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/ChatPageActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 1196
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$18;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1199
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$18;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$2900(Lcom/pccw/sms/ChatPageActivity;)V

    .line 1200
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$18;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$3000(Lcom/pccw/sms/ChatPageActivity;)V

    .line 1201
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$18;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-virtual {v0}, Lcom/pccw/sms/ChatPageActivity;->finish()V

    .line 1202
    return-void
.end method
