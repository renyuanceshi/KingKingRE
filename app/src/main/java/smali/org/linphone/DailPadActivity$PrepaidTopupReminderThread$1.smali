.class Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$1;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Lcom/pccw/mobile/server/api/ApiResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->doInBackground([Ljava/lang/Void;)Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    .prologue
    .line 1233
    iput-object p1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$1;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponseFailed()V
    .locals 2

    .prologue
    .line 1242
    iget-object v0, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$1;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    const/4 v1, 0x0

    iput-object v1, v0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->checkPrepaidBalanceResponse:Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;

    .line 1243
    return-void
.end method

.method public onResponseSuccess(Lcom/pccw/mobile/server/api/ApiResponse;)V
    .locals 1
    .param p1, "response"    # Lcom/pccw/mobile/server/api/ApiResponse;

    .prologue
    .line 1237
    iget-object v0, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$1;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    check-cast p1, Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;

    .end local p1    # "response":Lcom/pccw/mobile/server/api/ApiResponse;
    iput-object p1, v0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->checkPrepaidBalanceResponse:Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;

    .line 1238
    return-void
.end method
