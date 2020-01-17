.class Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$1;
.super Ljava/lang/Object;
.source "ConfirmRegistrationActivity.java"

# interfaces
.implements Lcom/pccw/mobile/server/api/ApiResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->prepaidRegistrationSubmit()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    .prologue
    .line 181
    iput-object p1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$1;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponseFailed()V
    .locals 2

    .prologue
    .line 195
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$1;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->confirmRegistrationResponse:Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

    .line 196
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$1;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->access$000(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)V

    .line 197
    return-void
.end method

.method public onResponseSuccess(Lcom/pccw/mobile/server/api/ApiResponse;)V
    .locals 1
    .param p1, "response"    # Lcom/pccw/mobile/server/api/ApiResponse;

    .prologue
    .line 185
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$1;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    check-cast p1, Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

    .end local p1    # "response":Lcom/pccw/mobile/server/api/ApiResponse;
    iput-object p1, v0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->confirmRegistrationResponse:Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

    .line 186
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$1;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    iget-object v0, v0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->confirmRegistrationResponse:Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

    if-nez v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$1;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->access$000(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)V

    .line 191
    :goto_0
    return-void

    .line 189
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$1;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->access$100(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)V

    goto :goto_0
.end method
