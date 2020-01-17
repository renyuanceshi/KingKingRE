.class Lcom/pccw/sms/ChatPageActivity$5;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->refreshList()V
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
    .line 296
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$5;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$5;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$300(Lcom/pccw/sms/ChatPageActivity;)V

    .line 300
    return-void
.end method
