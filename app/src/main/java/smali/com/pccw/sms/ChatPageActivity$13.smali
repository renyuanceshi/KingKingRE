.class Lcom/pccw/sms/ChatPageActivity$13;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->setViewAction()V
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
    .line 717
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$13;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 720
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$13;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$13;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1}, Lcom/pccw/database/entity/ChatPageInfo;->getRecipient()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pccw/sms/ChatPageActivity;->access$1900(Lcom/pccw/sms/ChatPageActivity;Ljava/lang/String;)V

    .line 721
    return-void
.end method
