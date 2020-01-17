.class Lcom/pccw/sms/adapter/MessageAdapter$1;
.super Ljava/lang/Object;
.source "MessageAdapter.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/adapter/MessageAdapter;->messageLongClickListner(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View$OnLongClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/adapter/MessageAdapter;

.field final synthetic val$messageType:Ljava/lang/String;

.field final synthetic val$msgContent:Ljava/lang/String;

.field final synthetic val$msgId:I

.field final synthetic val$msgStatus:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/sms/adapter/MessageAdapter;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/adapter/MessageAdapter;

    .prologue
    .line 493
    iput-object p1, p0, Lcom/pccw/sms/adapter/MessageAdapter$1;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    iput p2, p0, Lcom/pccw/sms/adapter/MessageAdapter$1;->val$msgId:I

    iput-object p3, p0, Lcom/pccw/sms/adapter/MessageAdapter$1;->val$messageType:Ljava/lang/String;

    iput-object p4, p0, Lcom/pccw/sms/adapter/MessageAdapter$1;->val$msgContent:Ljava/lang/String;

    iput-object p5, p0, Lcom/pccw/sms/adapter/MessageAdapter$1;->val$msgStatus:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 497
    const-string/jumbo v0, "KKIM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Message Item OnLongClick = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/pccw/sms/adapter/MessageAdapter$1;->val$msgId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter$1;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    iget v1, p0, Lcom/pccw/sms/adapter/MessageAdapter$1;->val$msgId:I

    iget-object v2, p0, Lcom/pccw/sms/adapter/MessageAdapter$1;->val$messageType:Ljava/lang/String;

    iget-object v3, p0, Lcom/pccw/sms/adapter/MessageAdapter$1;->val$msgContent:Ljava/lang/String;

    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter$1;->val$msgStatus:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/pccw/sms/adapter/MessageAdapter;->access$100(Lcom/pccw/sms/adapter/MessageAdapter;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    const/4 v0, 0x1

    return v0
.end method
