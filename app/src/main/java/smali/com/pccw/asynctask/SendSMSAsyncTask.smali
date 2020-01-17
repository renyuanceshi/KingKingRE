.class public Lcom/pccw/asynctask/SendSMSAsyncTask;
.super Landroid/os/AsyncTask;
.source "SendSMSAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Lcom/pccw/asynctask/result/SendSMSAsyncResult;",
        ">;"
    }
.end annotation


# instance fields
.field chatId:I

.field ctx:Landroid/content/Context;

.field messageItemService:Lcom/pccw/sms/service/MessageItemService;

.field recipientsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;


# direct methods
.method public constructor <init>(ILcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;Landroid/content/Context;)V
    .locals 2
    .param p1, "chatId"    # I
    .param p2, "sendSMSAsyncTaskListener"    # Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;
    .param p3, "ctx"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 36
    iput-object p3, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->ctx:Landroid/content/Context;

    .line 37
    iput p1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->chatId:I

    .line 38
    iput-object p2, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    .line 40
    new-instance v1, Lcom/pccw/sms/service/MessageItemService;

    invoke-direct {v1, p3}, Lcom/pccw/sms/service/MessageItemService;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    .line 42
    new-instance v0, Lcom/pccw/sms/service/ChatListService;

    invoke-direct {v0, p3}, Lcom/pccw/sms/service/ChatListService;-><init>(Landroid/content/Context;)V

    .line 43
    .local v0, "chatListService":Lcom/pccw/sms/service/ChatListService;
    invoke-virtual {v0, p1}, Lcom/pccw/sms/service/ChatListService;->getUserNameByChatId(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/sms/util/SMSFormatUtil;->convertSplittingStringToSortedArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->recipientsList:Ljava/util/ArrayList;

    .line 44
    return-void
.end method

.method private callSendSMSApi(Ljava/lang/String;I)Lcom/pccw/mobile/server/response/SendSMSResponse;
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "messageId"    # I

    .prologue
    .line 119
    new-instance v0, Lcom/pccw/mobile/server/SendSMSSyncApi;

    iget-object v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->recipientsList:Ljava/util/ArrayList;

    invoke-direct {v0, v1, v2, p1}, Lcom/pccw/mobile/server/SendSMSSyncApi;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 120
    .local v0, "sendSMSSyncApi":Lcom/pccw/mobile/server/SendSMSSyncApi;
    invoke-virtual {v0}, Lcom/pccw/mobile/server/SendSMSSyncApi;->postToServer()Lcom/pccw/mobile/server/api/ApiResponse;

    move-result-object v1

    check-cast v1, Lcom/pccw/mobile/server/response/SendSMSResponse;

    return-object v1
.end method

.method private getLastMessageId(I)I
    .locals 2
    .param p1, "chatId"    # I

    .prologue
    .line 114
    iget-object v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    invoke-virtual {v1, p1}, Lcom/pccw/sms/service/MessageItemService;->getLastMessage(I)Lcom/pccw/database/entity/MessageStore;

    move-result-object v0

    .line 115
    .local v0, "msgStore":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual {v0}, Lcom/pccw/database/entity/MessageStore;->getMessageId()I

    move-result v1

    return v1
.end method

.method private insertMessageRecord(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p1, "sender"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 102
    invoke-direct {p0, p1, p2}, Lcom/pccw/asynctask/SendSMSAsyncTask;->insertNewRecordIntoMessageStoreTable(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    iget v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->chatId:I

    invoke-direct {p0, v1}, Lcom/pccw/asynctask/SendSMSAsyncTask;->getLastMessageId(I)I

    move-result v0

    .line 104
    .local v0, "messageId":I
    iget-object v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    invoke-interface {v1, v0}, Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;->onBeforeSend(I)V

    .line 105
    return v0
.end method

.method private insertNewRecordIntoMessageStoreTable(Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p1, "sender"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 109
    new-instance v1, Lcom/pccw/sms/bean/MessageItem;

    iget v0, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->chatId:I

    int-to-long v2, v0

    const-string/jumbo v4, ""

    const/4 v7, 0x1

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8}, Ljava/util/Date;-><init>()V

    sget-object v9, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_TEXT:Ljava/lang/String;

    sget-object v10, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_SENDING:Ljava/lang/String;

    const-string/jumbo v11, "Y"

    move-object v5, p1

    move-object v6, p2

    invoke-direct/range {v1 .. v11}, Lcom/pccw/sms/bean/MessageItem;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/Date;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .local v1, "item":Lcom/pccw/sms/bean/MessageItem;
    iget-object v0, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    iget-object v2, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->recipientsList:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/pccw/sms/util/SMSFormatUtil;->convertListToSortedSplittingString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v2, v1}, Lcom/pccw/sms/service/MessageItemService;->addMessageItem(Ljava/lang/String;Ljava/lang/String;Lcom/pccw/sms/bean/MessageItem;)V

    .line 111
    return-void
.end method

.method private updateLastMessageIdForChatListTable()V
    .locals 4

    .prologue
    .line 124
    new-instance v1, Lcom/pccw/sms/service/ChatRecordService;

    iget-object v2, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->ctx:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 125
    .local v1, "service":Lcom/pccw/sms/service/ChatRecordService;
    iget-object v2, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    iget v3, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->chatId:I

    invoke-virtual {v2, v3}, Lcom/pccw/sms/service/MessageItemService;->getLastMessage(I)Lcom/pccw/database/entity/MessageStore;

    move-result-object v0

    .line 126
    .local v0, "msgStore":Lcom/pccw/database/entity/MessageStore;
    iget v2, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->chatId:I

    invoke-virtual {v0}, Lcom/pccw/database/entity/MessageStore;->getMessageId()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/ChatRecordService;->updateMessageIdForChatList(II)V

    .line 127
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Lcom/pccw/asynctask/result/SendSMSAsyncResult;
    .locals 7
    .param p1, "message"    # [Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 58
    iget-object v3, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->ctx:Landroid/content/Context;

    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->getPhoneWithHKCountryCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 59
    .local v2, "sender":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 60
    const/4 v1, 0x0

    .line 72
    :goto_0
    return-object v1

    .line 63
    :cond_0
    aget-object v3, p1, v6

    invoke-direct {p0, v2, v3}, Lcom/pccw/asynctask/SendSMSAsyncTask;->insertMessageRecord(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 65
    .local v0, "messageId":I
    const-string/jumbo v3, "KKSMS"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SendSMSAsyncService messageId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Integer;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p0, v3}, Lcom/pccw/asynctask/SendSMSAsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 69
    new-instance v1, Lcom/pccw/asynctask/result/SendSMSAsyncResult;

    aget-object v3, p1, v6

    invoke-direct {p0, v3, v0}, Lcom/pccw/asynctask/SendSMSAsyncTask;->callSendSMSApi(Ljava/lang/String;I)Lcom/pccw/mobile/server/response/SendSMSResponse;

    move-result-object v3

    invoke-direct {v1, v3, v0}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;-><init>(Lcom/pccw/mobile/server/response/SendSMSResponse;I)V

    .line 70
    .local v1, "result":Lcom/pccw/asynctask/result/SendSMSAsyncResult;
    invoke-direct {p0}, Lcom/pccw/asynctask/SendSMSAsyncTask;->updateLastMessageIdForChatListTable()V

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 26
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/asynctask/SendSMSAsyncTask;->doInBackground([Ljava/lang/String;)Lcom/pccw/asynctask/result/SendSMSAsyncResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/pccw/asynctask/result/SendSMSAsyncResult;)V
    .locals 4
    .param p1, "result"    # Lcom/pccw/asynctask/result/SendSMSAsyncResult;

    .prologue
    .line 84
    if-nez p1, :cond_0

    .line 85
    iget-object v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    invoke-interface {v1}, Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;->onSendFail()V

    .line 98
    :goto_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 99
    return-void

    .line 87
    :cond_0
    invoke-virtual {p1}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->getResp()Lcom/pccw/mobile/server/response/SendSMSResponse;

    move-result-object v0

    .line 88
    .local v0, "resp":Lcom/pccw/mobile/server/response/SendSMSResponse;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/pccw/mobile/server/response/SendSMSResponse;->getResultCode()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 89
    iget-object v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    invoke-virtual {p1}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->getMessageId()I

    move-result v2

    sget-object v3, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_SENT:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/MessageItemService;->updateSentStatus(ILjava/lang/String;)V

    .line 90
    iget-object v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    invoke-virtual {p1}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->getMessageId()I

    move-result v2

    invoke-virtual {v0}, Lcom/pccw/mobile/server/response/SendSMSResponse;->getServerMessageId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/MessageItemService;->updateServerMessageId(ILjava/lang/String;)V

    .line 91
    iget-object v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    invoke-virtual {p1}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->getMessageId()I

    move-result v2

    invoke-interface {v1, v2}, Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;->onSendSuccess(I)V

    goto :goto_0

    .line 93
    :cond_1
    iget-object v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    invoke-virtual {p1}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->getMessageId()I

    move-result v2

    sget-object v3, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_FAILED:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/MessageItemService;->updateSentStatus(ILjava/lang/String;)V

    .line 94
    iget-object v1, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    invoke-interface {v1}, Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;->onSendFail()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 26
    check-cast p1, Lcom/pccw/asynctask/result/SendSMSAsyncResult;

    invoke-virtual {p0, p1}, Lcom/pccw/asynctask/SendSMSAsyncTask;->onPostExecute(Lcom/pccw/asynctask/result/SendSMSAsyncResult;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 2
    .param p1, "messageId"    # [Ljava/lang/Integer;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;->onSending(I)V

    .line 78
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    .line 79
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 26
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/pccw/asynctask/SendSMSAsyncTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method

.method public sendMessage(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/pccw/exception/NoNetworkException;
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/pccw/asynctask/SendSMSAsyncTask;->ctx:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 49
    new-instance v0, Lcom/pccw/exception/NoNetworkException;

    const-string/jumbo v1, "Error:No Network"

    invoke-direct {v0, v1}, Lcom/pccw/exception/NoNetworkException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/pccw/asynctask/SendSMSAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 53
    return-void
.end method
