.class public Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;
.super Ljava/lang/Object;
.source "CheckSMSDeliveryStatusService.java"

# interfaces
.implements Lcom/pccw/mobile/server/api/ApiResponseListener;


# static fields
.field private static final SET_TO_FAIL_STATUS_INTERVAL:J = 0xf731400L


# instance fields
.field chatId:Ljava/lang/String;

.field checkSMSDeliveryStatusServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;

.field ctx:Landroid/content/Context;

.field service:Lcom/pccw/sms/service/MessageItemService;


# direct methods
.method public constructor <init>(Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "checkSMSDeliveryStatusServiceListener"    # Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;
    .param p2, "chatId"    # Ljava/lang/String;
    .param p3, "ctx"    # Landroid/content/Context;

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    iput-object p1, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->checkSMSDeliveryStatusServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;

    .line 94
    iput-object p2, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->chatId:Ljava/lang/String;

    .line 95
    iput-object p3, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->ctx:Landroid/content/Context;

    .line 96
    new-instance v0, Lcom/pccw/sms/service/MessageItemService;

    invoke-direct {v0, p3}, Lcom/pccw/sms/service/MessageItemService;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->service:Lcom/pccw/sms/service/MessageItemService;

    .line 97
    return-void
.end method


# virtual methods
.method public checkDeliveryStatus()V
    .locals 12

    .prologue
    .line 101
    iget-object v6, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->service:Lcom/pccw/sms/service/MessageItemService;

    iget-object v7, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->chatId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/pccw/sms/service/MessageItemService;->getAllSentMessageWithChatId(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 102
    .local v3, "messageList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/MessageStore;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .local v1, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 105
    .local v4, "notifyFailStatusChanged":Z
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/pccw/database/entity/MessageStore;

    .line 106
    .local v2, "message":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual {v2}, Lcom/pccw/database/entity/MessageStore;->getSentTime()Ljava/util/Date;

    move-result-object v5

    .line 107
    .local v5, "sentTime":Ljava/util/Date;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    sub-long/2addr v8, v10

    const-wide/32 v10, 0xf731400

    cmp-long v7, v8, v10

    if-lez v7, :cond_0

    .line 108
    const-string/jumbo v7, "KKSMS"

    const-string/jumbo v8, "Set to fail interval reached, set to fail status"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    iget-object v7, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->service:Lcom/pccw/sms/service/MessageItemService;

    invoke-virtual {v2}, Lcom/pccw/database/entity/MessageStore;->getServerMessageId()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_FAILED:Ljava/lang/String;

    invoke-virtual {v7, v8, v9}, Lcom/pccw/sms/service/MessageItemService;->updateSentStatusByServerMessageId(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const/4 v4, 0x1

    goto :goto_0

    .line 112
    :cond_0
    invoke-virtual {v2}, Lcom/pccw/database/entity/MessageStore;->getServerMessageId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 116
    .end local v2    # "message":Lcom/pccw/database/entity/MessageStore;
    .end local v5    # "sentTime":Ljava/util/Date;
    :cond_1
    if-eqz v4, :cond_2

    .line 117
    iget-object v6, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->checkSMSDeliveryStatusServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;

    invoke-interface {v6}, Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;->onStatusUpdated()V

    .line 120
    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4

    .line 121
    iget-object v6, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->ctx:Landroid/content/Context;

    invoke-static {v6}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 122
    const-string/jumbo v6, "KKSMS"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " message in sending status and Wi-Fi is reachable call check sms delivery status API"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    new-instance v0, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;

    iget-object v6, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->ctx:Landroid/content/Context;

    invoke-direct {v0, p0, v6, v1}, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;-><init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/util/List;)V

    .line 124
    .local v0, "api":Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string/jumbo v8, ""

    aput-object v8, v6, v7

    invoke-virtual {v0, v6}, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 131
    .end local v0    # "api":Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;
    :goto_1
    return-void

    .line 126
    :cond_3
    const-string/jumbo v6, "KKSMS"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " message in sending status but Wi-Fi is unreachable, don\'t call check sms delivery status API"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 129
    :cond_4
    const-string/jumbo v6, "KKSMS"

    const-string/jumbo v7, "No message in sending status"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public onResponseFailed()V
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->checkSMSDeliveryStatusServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;

    invoke-interface {v0}, Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;->onCheckStatusFail()V

    .line 89
    return-void
.end method

.method public onResponseSuccess(Lcom/pccw/mobile/server/api/ApiResponse;)V
    .locals 14
    .param p1, "response"    # Lcom/pccw/mobile/server/api/ApiResponse;

    .prologue
    .line 32
    move-object v5, p1

    check-cast v5, Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;

    .line 33
    .local v5, "resp":Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;
    invoke-virtual {v5}, Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;->getStatusList()Ljava/util/List;

    move-result-object v10

    .line 35
    .local v10, "statusList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;>;"
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_0
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_c

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;

    .line 36
    .local v9, "status":Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;
    invoke-virtual {v9}, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;->getMessageId()Ljava/lang/String;

    move-result-object v2

    .line 37
    .local v2, "id":Ljava/lang/String;
    invoke-virtual {v9}, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;->getStatus()Ljava/lang/String;

    move-result-object v6

    .line 39
    .local v6, "st":Ljava/lang/String;
    const-string/jumbo v12, ","

    invoke-virtual {v6, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 41
    invoke-static {v6}, Lcom/pccw/sms/util/SMSFormatUtil;->convertCommaSplittingStringToSortedArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 42
    .local v7, "stList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 43
    .local v0, "deliveredCount":I
    const/4 v4, 0x0

    .line 44
    .local v4, "pendingCount":I
    const/4 v1, 0x0

    .line 45
    .local v1, "failedCount":I
    const/4 v3, 0x0

    .line 46
    .local v3, "notFoundCount":I
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_1
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 47
    .local v8, "stat":Ljava/lang/String;
    const-string/jumbo v13, "Delivered"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 48
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 49
    :cond_2
    const-string/jumbo v13, "Pending"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 50
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 51
    :cond_3
    const-string/jumbo v13, "Failed"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 52
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 53
    :cond_4
    const-string/jumbo v13, "NG"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 54
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 58
    .end local v8    # "stat":Ljava/lang/String;
    :cond_5
    if-lez v0, :cond_6

    .line 59
    iget-object v12, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->service:Lcom/pccw/sms/service/MessageItemService;

    sget-object v13, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_DELIVERED:Ljava/lang/String;

    invoke-virtual {v12, v2, v13}, Lcom/pccw/sms/service/MessageItemService;->updateSentStatusByServerMessageId(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 60
    :cond_6
    if-lez v4, :cond_7

    .line 61
    iget-object v12, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->service:Lcom/pccw/sms/service/MessageItemService;

    sget-object v13, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_SENT:Ljava/lang/String;

    invoke-virtual {v12, v2, v13}, Lcom/pccw/sms/service/MessageItemService;->updateSentStatusByServerMessageId(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 62
    :cond_7
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ne v1, v12, :cond_0

    .line 63
    iget-object v12, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->service:Lcom/pccw/sms/service/MessageItemService;

    sget-object v13, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_FAILED:Ljava/lang/String;

    invoke-virtual {v12, v2, v13}, Lcom/pccw/sms/service/MessageItemService;->updateSentStatusByServerMessageId(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 70
    .end local v0    # "deliveredCount":I
    .end local v1    # "failedCount":I
    .end local v3    # "notFoundCount":I
    .end local v4    # "pendingCount":I
    .end local v7    # "stList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_8
    const-string/jumbo v12, "Delivered"

    invoke-virtual {v6, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_9

    .line 71
    iget-object v12, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->service:Lcom/pccw/sms/service/MessageItemService;

    sget-object v13, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_DELIVERED:Ljava/lang/String;

    invoke-virtual {v12, v2, v13}, Lcom/pccw/sms/service/MessageItemService;->updateSentStatusByServerMessageId(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 72
    :cond_9
    const-string/jumbo v12, "Pending"

    invoke-virtual {v6, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 73
    iget-object v12, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->service:Lcom/pccw/sms/service/MessageItemService;

    sget-object v13, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_SENT:Ljava/lang/String;

    invoke-virtual {v12, v2, v13}, Lcom/pccw/sms/service/MessageItemService;->updateSentStatusByServerMessageId(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 74
    :cond_a
    const-string/jumbo v12, "Failed"

    invoke-virtual {v6, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_b

    .line 75
    iget-object v12, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->service:Lcom/pccw/sms/service/MessageItemService;

    sget-object v13, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_FAILED:Ljava/lang/String;

    invoke-virtual {v12, v2, v13}, Lcom/pccw/sms/service/MessageItemService;->updateSentStatusByServerMessageId(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 76
    :cond_b
    const-string/jumbo v12, "NG"

    invoke-virtual {v6, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_0

    goto/16 :goto_0

    .line 82
    .end local v2    # "id":Ljava/lang/String;
    .end local v6    # "st":Ljava/lang/String;
    .end local v9    # "status":Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;
    :cond_c
    iget-object v11, p0, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;->checkSMSDeliveryStatusServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;

    invoke-interface {v11}, Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;->onStatusUpdated()V

    .line 83
    return-void
.end method
