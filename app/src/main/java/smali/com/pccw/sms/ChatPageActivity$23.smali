.class Lcom/pccw/sms/ChatPageActivity$23;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/ChatPageActivity;
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
    .line 1420
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$23;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1422
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$23;->this$0:Lcom/pccw/sms/ChatPageActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/pccw/sms/ChatPageActivity;->access$3102(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 1423
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$23;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$3600(Lcom/pccw/sms/ChatPageActivity;)V

    .line 1424
    return-void
.end method
