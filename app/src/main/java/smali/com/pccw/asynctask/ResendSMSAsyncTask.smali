.class public Lcom/pccw/asynctask/ResendSMSAsyncTask;
.super Landroid/os/AsyncTask;
.source "ResendSMSAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Integer;",
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
    iput-object p3, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->ctx:Landroid/content/Context;

    .line 37
    iput p1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->chatId:I

    .line 38
    iput-object p2, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    .line 40
    new-instance v1, Lcom/pccw/sms/service/MessageItemService;

    invoke-direct {v1, p3}, Lcom/pccw/sms/service/MessageItemService;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    .line 42
    new-instance v0, Lcom/pccw/sms/service/ChatListService;

    invoke-direct {v0, p3}, Lcom/pccw/sms/service/ChatListService;-><init>(Landroid/content/Context;)V

    .line 43
    .local v0, "chatListService":Lcom/pccw/sms/service/ChatListService;
    invoke-virtual {v0, p1}, Lcom/pccw/sms/service/ChatListService;->getUserNameByChatId(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/sms/util/SMSFormatUtil;->convertSplittingStringToSortedArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->recipientsList:Ljava/util/ArrayList;

    .line 44
    return-void
.end method

.method private callSendSMSApi(Ljava/lang/String;I)Lcom/pccw/mobile/server/response/SendSMSResponse;
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "messageId"    # I

    .prologue
    .line 134
    new-instance v0, Lcom/pccw/mobile/server/SendSMSSyncApi;

    iget-object v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->recipientsList:Ljava/util/ArrayList;

    invoke-direct {v0, v1, v2, p1}, Lcom/pccw/mobile/server/SendSMSSyncApi;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 135
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
    .line 122
    iget-object v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    invoke-virtual {v1, p1}, Lcom/pccw/sms/service/MessageItemService;->getLastMessage(I)Lcom/pccw/database/entity/MessageStore;

    move-result-object v0

    .line 123
    .local v0, "msgStore":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual {v0}, Lcom/pccw/database/entity/MessageStore;->getMessageId()I

    move-result v1

    return v1
.end method

.method private getTextMessageByMessageId(I)Ljava/lang/String;
    .locals 3
    .param p1, "messageId"    # I

    .prologue
    .line 127
    new-instance v1, Lcom/pccw/sms/service/MessageItemService;

    iget-object v2, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->ctx:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/pccw/sms/service/MessageItemService;-><init>(Landroid/content/Context;)V

    .line 128
    .local v1, "service":Lcom/pccw/sms/service/MessageItemService;
    invoke-virtual {v1, p1}, Lcom/pccw/sms/service/MessageItemService;->getMessageStoreByMsgId(I)Lcom/pccw/database/entity/MessageStore;

    move-result-object v0

    .line 130
    .local v0, "msgStore":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual {v0}, Lcom/pccw/database/entity/MessageStore;->getTextMessage()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private insertMessageRecord(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p1, "sender"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 110
    invoke-direct {p0, p1, p2}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->insertNewRecordIntoMessageStoreTable(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    iget v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->chatId:I

    invoke-direct {p0, v1}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->getLastMessageId(I)I

    move-result v0

    .line 112
    .local v0, "messageId":I
    iget-object v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    invoke-interface {v1, v0}, Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;->onBeforeSend(I)V

    .line 113
    return v0
.end method

.method private insertNewRecordIntoMessageStoreTable(Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p1, "sender"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 117
    new-instance v1, Lcom/pccw/sms/bean/MessageItem;

    iget v0, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->chatId:I

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

    .line 118
    .local v1, "item":Lcom/pccw/sms/bean/MessageItem;
    iget-object v0, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    iget-object v2, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->recipientsList:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/pccw/sms/util/SMSFormatUtil;->convertListToSortedSplittingString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v2, v1}, Lcom/pccw/sms/service/MessageItemService;->addMessageItem(Ljava/lang/String;Ljava/lang/String;Lcom/pccw/sms/bean/MessageItem;)V

    .line 119
    return-void
.end method

.method private removeFailedMessage(I)V
    .locals 2
    .param p1, "msgId"    # I

    .prologue
    .line 106
    iget-object v0, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/sms/service/MessageItemService;->deleteMessageByMsgId(Ljava/lang/String;)I

    .line 107
    return-void
.end method

.method private updateLastMessageIdForChatListTable()V
    .locals 4

    .prologue
    .line 139
    new-instance v1, Lcom/pccw/sms/service/ChatRecordService;

    iget-object v2, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->ctx:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 140
    .local v1, "service":Lcom/pccw/sms/service/ChatRecordService;
    iget-object v2, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    iget v3, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->chatId:I

    invoke-virtual {v2, v3}, Lcom/pccw/sms/service/MessageItemService;->getLastMessage(I)Lcom/pccw/database/entity/MessageStore;

    move-result-object v0

    .line 141
    .local v0, "msgStore":Lcom/pccw/database/entity/MessageStore;
    iget v2, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->chatId:I

    invoke-virtual {v0}, Lcom/pccw/database/entity/MessageStore;->getMessageId()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/ChatRecordService;->updateMessageIdForChatList(II)V

    .line 142
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Integer;)Lcom/pccw/asynctask/result/SendSMSAsyncResult;
    .locals 8
    .param p1, "messageId"    # [Ljava/lang/Integer;

    .prologue
    const/4 v7, 0x0

    .line 58
    iget-object v4, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->ctx:Landroid/content/Context;

    invoke-static {v4}, Lcom/pccw/mobile/sip/ClientStateManager;->getPhoneWithHKCountryCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 59
    .local v3, "sender":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 60
    const/4 v2, 0x0

    .line 76
    :goto_0
    return-object v2

    .line 63
    :cond_0
    aget-object v4, p1, v7

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->getTextMessageByMessageId(I)Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "message":Ljava/lang/String;
    aget-object v4, p1, v7

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->removeFailedMessage(I)V

    .line 67
    invoke-direct {p0, v3, v0}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->insertMessageRecord(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 69
    .local v1, "newMsgId":I
    const-string/jumbo v4, "KKSMS"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ResendSMSAsyncService newMsgId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Integer;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-virtual {p0, v4}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 73
    new-instance v2, Lcom/pccw/asynctask/result/SendSMSAsyncResult;

    invoke-direct {p0, v0, v1}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->callSendSMSApi(Ljava/lang/String;I)Lcom/pccw/mobile/server/response/SendSMSResponse;

    move-result-object v4

    invoke-direct {v2, v4, v1}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;-><init>(Lcom/pccw/mobile/server/response/SendSMSResponse;I)V

    .line 74
    .local v2, "result":Lcom/pccw/asynctask/result/SendSMSAsyncResult;
    invoke-direct {p0}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->updateLastMessageIdForChatListTable()V

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 26
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->doInBackground([Ljava/lang/Integer;)Lcom/pccw/asynctask/result/SendSMSAsyncResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/pccw/asynctask/result/SendSMSAsyncResult;)V
    .locals 4
    .param p1, "result"    # Lcom/pccw/asynctask/result/SendSMSAsyncResult;

    .prologue
    .line 88
    if-nez p1, :cond_0

    .line 89
    iget-object v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    invoke-interface {v1}, Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;->onSendFail()V

    .line 102
    :goto_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 103
    return-void

    .line 91
    :cond_0
    invoke-virtual {p1}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->getResp()Lcom/pccw/mobile/server/response/SendSMSResponse;

    move-result-object v0

    .line 92
    .local v0, "resp":Lcom/pccw/mobile/server/response/SendSMSResponse;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/pccw/mobile/server/response/SendSMSResponse;->getResultCode()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 93
    iget-object v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    invoke-virtual {p1}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->getMessageId()I

    move-result v2

    sget-object v3, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_SENT:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/MessageItemService;->updateSentStatus(ILjava/lang/String;)V

    .line 94
    iget-object v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    invoke-virtual {p1}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->getMessageId()I

    move-result v2

    invoke-virtual {v0}, Lcom/pccw/mobile/server/response/SendSMSResponse;->getServerMessageId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/MessageItemService;->updateServerMessageId(ILjava/lang/String;)V

    .line 95
    iget-object v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    invoke-virtual {p1}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->getMessageId()I

    move-result v2

    invoke-interface {v1, v2}, Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;->onSendSuccess(I)V

    goto :goto_0

    .line 97
    :cond_1
    iget-object v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    invoke-virtual {p1}, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->getMessageId()I

    move-result v2

    sget-object v3, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_FAILED:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/MessageItemService;->updateSentStatus(ILjava/lang/String;)V

    .line 98
    iget-object v1, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    invoke-interface {v1}, Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;->onSendFail()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 26
    check-cast p1, Lcom/pccw/asynctask/result/SendSMSAsyncResult;

    invoke-virtual {p0, p1}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->onPostExecute(Lcom/pccw/asynctask/result/SendSMSAsyncResult;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 2
    .param p1, "messageId"    # [Ljava/lang/Integer;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;->onSending(I)V

    .line 82
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    .line 83
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 26
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method

.method public resendMessageWithMessageId(I)V
    .locals 3
    .param p1, "messageId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/pccw/exception/NoNetworkException;
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/pccw/asynctask/ResendSMSAsyncTask;->ctx:Landroid/content/Context;

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

    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 53
    return-void
.end method
