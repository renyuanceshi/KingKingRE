.class Lcom/pccw/sms/ChatPageActivity$4;
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
    .line 284
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$4;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 288
    const-string/jumbo v0, "KKSMS"

    const-string/jumbo v1, "Call CheckSMSDeliveryStatusService"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$4;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v0, v0, Lcom/pccw/sms/ChatPageActivity;->checkSMSDeliveryStatusService:Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;

    invoke-virtual {v0}, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->checkDeliveryStatus()V

    .line 292
    return-void
.end method
