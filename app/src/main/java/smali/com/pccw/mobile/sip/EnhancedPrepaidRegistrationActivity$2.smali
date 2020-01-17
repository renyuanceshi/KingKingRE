.class Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$2;
.super Ljava/lang/Object;
.source "EnhancedPrepaidRegistrationActivity.java"

# interfaces
.implements Lcom/pccw/mobile/server/api/ApiResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getNumberType()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    .prologue
    .line 275
    iput-object p1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$2;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponseFailed()V
    .locals 2

    .prologue
    .line 291
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$2;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->access$102(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;)Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    .line 292
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$2;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->access$200(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)V

    .line 293
    return-void
.end method

.method public onResponseSuccess(Lcom/pccw/mobile/server/api/ApiResponse;)V
    .locals 2
    .param p1, "response"    # Lcom/pccw/mobile/server/api/ApiResponse;

    .prologue
    .line 279
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$2;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    check-cast p1, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    .end local p1    # "response":Lcom/pccw/mobile/server/api/ApiResponse;
    invoke-static {v0, p1}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->access$102(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;)Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    .line 280
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$2;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->access$100(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$2;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->access$100(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-result-object v0

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    const-string/jumbo v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 281
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$2;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->access$200(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)V

    .line 285
    :goto_0
    return-void

    .line 283
    :cond_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$2;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->access$300(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)V

    goto :goto_0
.end method
