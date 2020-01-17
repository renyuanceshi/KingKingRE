.class public Lcom/pccw/mobile/service/CombineHistoryService;
.super Ljava/lang/Object;
.source "CombineHistoryService.java"


# static fields
.field public static CHAT_ID:Ljava/lang/String; = null

.field public static CHAT_ID_COLUMN_INDEX:I = 0x0

.field public static CHAT_NAME:Ljava/lang/String; = null

.field public static CHAT_NAME_COLUMN_INDEX:I = 0x0

.field public static CHAT_TYPE:Ljava/lang/String; = null

.field public static CHAT_TYPE_COLUMN_INDEX:I = 0x0

.field static final HISTORY_PROJECTION:[Ljava/lang/String;

.field public static final IMMESSAGE_TYPE:I = 0x15

.field public static LAST_MESSAGE:Ljava/lang/String;

.field public static LAST_MESSAGE_COLUMN_INDEX:I

.field public static LAST_MESSAGE_TIME:Ljava/lang/String;

.field public static LAST_MESSAGE_TIME_COLUMN_INDEX:I

.field public static MESSAGE_ID:Ljava/lang/String;

.field public static MESSAGE_ID_COLUMN_INDEX:I

.field public static MESSAGE_TYPE:Ljava/lang/String;

.field public static MESSAGE_TYPE_COLUMN_INDEX:I

.field public static UNREAD_MSG_COUNT:Ljava/lang/String;


# instance fields
.field context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/16 v7, 0xa

    const/16 v6, 0x9

    const/16 v5, 0x8

    const/4 v4, 0x6

    const/4 v3, 0x2

    .line 19
    const-string/jumbo v0, "chatid"

    sput-object v0, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_ID:Ljava/lang/String;

    .line 20
    const-string/jumbo v0, "chattype"

    sput-object v0, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_TYPE:Ljava/lang/String;

    .line 21
    const-string/jumbo v0, "chatname"

    sput-object v0, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_NAME:Ljava/lang/String;

    .line 22
    const-string/jumbo v0, "lastmessage"

    sput-object v0, Lcom/pccw/mobile/service/CombineHistoryService;->LAST_MESSAGE:Ljava/lang/String;

    .line 23
    const-string/jumbo v0, "date"

    sput-object v0, Lcom/pccw/mobile/service/CombineHistoryService;->LAST_MESSAGE_TIME:Ljava/lang/String;

    .line 24
    const-string/jumbo v0, "messageid"

    sput-object v0, Lcom/pccw/mobile/service/CombineHistoryService;->MESSAGE_ID:Ljava/lang/String;

    .line 25
    const-string/jumbo v0, "type"

    sput-object v0, Lcom/pccw/mobile/service/CombineHistoryService;->MESSAGE_TYPE:Ljava/lang/String;

    .line 26
    const-string/jumbo v0, "unreadMsgCount"

    sput-object v0, Lcom/pccw/mobile/service/CombineHistoryService;->UNREAD_MSG_COUNT:Ljava/lang/String;

    .line 28
    sput v5, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_ID_COLUMN_INDEX:I

    .line 29
    sput v6, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_TYPE_COLUMN_INDEX:I

    .line 30
    sput v7, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_NAME_COLUMN_INDEX:I

    .line 31
    const/16 v0, 0xb

    sput v0, Lcom/pccw/mobile/service/CombineHistoryService;->LAST_MESSAGE_COLUMN_INDEX:I

    .line 32
    sput v3, Lcom/pccw/mobile/service/CombineHistoryService;->LAST_MESSAGE_TIME_COLUMN_INDEX:I

    .line 33
    sput v4, Lcom/pccw/mobile/service/CombineHistoryService;->MESSAGE_ID_COLUMN_INDEX:I

    .line 34
    const/16 v0, 0xc

    sput v0, Lcom/pccw/mobile/service/CombineHistoryService;->MESSAGE_TYPE_COLUMN_INDEX:I

    .line 36
    const/16 v0, 0xe

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "number"

    aput-object v2, v0, v1

    const-string/jumbo v1, "date"

    aput-object v1, v0, v3

    const/4 v1, 0x3

    const-string/jumbo v2, "duration"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "type"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "name"

    aput-object v2, v0, v1

    const-string/jumbo v1, "numbertype"

    aput-object v1, v0, v4

    const/4 v1, 0x7

    const-string/jumbo v2, "numberlabel"

    aput-object v2, v0, v1

    sget-object v1, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_ID:Ljava/lang/String;

    aput-object v1, v0, v5

    sget-object v1, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_TYPE:Ljava/lang/String;

    aput-object v1, v0, v6

    sget-object v1, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_NAME:Ljava/lang/String;

    aput-object v1, v0, v7

    const/16 v1, 0xb

    sget-object v2, Lcom/pccw/mobile/service/CombineHistoryService;->LAST_MESSAGE:Ljava/lang/String;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/pccw/mobile/service/CombineHistoryService;->MESSAGE_TYPE:Ljava/lang/String;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/pccw/mobile/service/CombineHistoryService;->UNREAD_MSG_COUNT:Ljava/lang/String;

    aput-object v2, v0, v1

    sput-object v0, Lcom/pccw/mobile/service/CombineHistoryService;->HISTORY_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/pccw/mobile/service/CombineHistoryService;->context:Landroid/content/Context;

    .line 54
    return-void
.end method


# virtual methods
.method public getChatRecordCursor()Landroid/database/Cursor;
    .locals 15

    .prologue
    .line 57
    new-instance v4, Landroid/database/MatrixCursor;

    sget-object v11, Lcom/pccw/mobile/service/CombineHistoryService;->HISTORY_PROJECTION:[Ljava/lang/String;

    invoke-direct {v4, v11}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 59
    .local v4, "cursor":Landroid/database/MatrixCursor;
    new-instance v3, Lcom/pccw/sms/service/ChatRecordService;

    iget-object v11, p0, Lcom/pccw/mobile/service/CombineHistoryService;->context:Landroid/content/Context;

    invoke-direct {v3, v11}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 61
    .local v3, "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    invoke-virtual {v3}, Lcom/pccw/sms/service/ChatRecordService;->getChatRecordItem()Ljava/util/ArrayList;

    move-result-object v2

    .line 62
    .local v2, "chatRecordItem":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/ChatRecordItem;>;"
    const/4 v5, 0x0

    .line 63
    .local v5, "id":I
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/pccw/sms/bean/ChatRecordItem;

    .line 64
    .local v6, "item":Lcom/pccw/sms/bean/ChatRecordItem;
    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getName()Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "@"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-object v14, Lcom/pccw/mobile/sip/Constants;->domainName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-string/jumbo v14, ""

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    .line 65
    .local v7, "number":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getName()Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getChatId()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ""

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lcom/pccw/sms/service/ChatRecordService;->getUnreadMsgCount(Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    .line 66
    .local v10, "unreadMsgCount":I
    const-string/jumbo v12, "KKIM"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "CombineHistory, chatname="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " ;unreadMsg="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " ;chatId="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getChatId()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getLastMessageTime()Ljava/util/Date;

    move-result-object v12

    if-eqz v12, :cond_0

    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getLastMessageTime()Ljava/util/Date;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    .line 86
    .local v8, "lastMsgTime":J
    :goto_1
    const/16 v12, 0xe

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    .line 87
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    aput-object v7, v12, v13

    const/4 v13, 0x2

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x3

    const-string/jumbo v14, ""

    aput-object v14, v12, v13

    const/4 v13, 0x4

    const/16 v14, 0x15

    .line 88
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x5

    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getNickName()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x6

    const/4 v14, 0x1

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x7

    const-string/jumbo v14, "CACHED_NUMBER_LABEL"

    aput-object v14, v12, v13

    const/16 v13, 0x8

    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getChatId()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/16 v13, 0x9

    .line 89
    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getType()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    const/16 v13, 0xa

    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getName()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    const/16 v13, 0xb

    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getLastMessage()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    const/16 v13, 0xc

    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatRecordItem;->getType()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    const/16 v13, 0xd

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    .line 86
    invoke-virtual {v4, v12}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 92
    add-int/lit8 v5, v5, 0x1

    .line 93
    goto/16 :goto_0

    .line 79
    .end local v8    # "lastMsgTime":J
    :cond_0
    new-instance v12, Ljava/util/Date;

    invoke-direct {v12}, Ljava/util/Date;-><init>()V

    invoke-virtual {v12}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    goto :goto_1

    .line 110
    .end local v6    # "item":Lcom/pccw/sms/bean/ChatRecordItem;
    .end local v7    # "number":Ljava/lang/String;
    .end local v10    # "unreadMsgCount":I
    :cond_1
    invoke-virtual {v3}, Lcom/pccw/sms/service/ChatRecordService;->listAll()Ljava/util/ArrayList;

    move-result-object v1

    .line 111
    .local v1, "chatListArr":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/ChatList;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/database/entity/ChatList;

    .line 112
    .local v0, "c":Lcom/pccw/database/entity/ChatList;
    const-string/jumbo v12, "KKIM"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "->chatcontact="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v0}, Lcom/pccw/database/entity/ChatList;->getChatContact()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " ;msgId="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v0}, Lcom/pccw/database/entity/ChatList;->getMessageId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 116
    .end local v0    # "c":Lcom/pccw/database/entity/ChatList;
    :cond_2
    return-object v4
.end method

.method public getChatRecordStringArray()[Ljava/lang/String;
    .locals 9

    .prologue
    .line 120
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v2, "filterString":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v1, Lcom/pccw/sms/service/ChatRecordService;

    iget-object v5, p0, Lcom/pccw/mobile/service/CombineHistoryService;->context:Landroid/content/Context;

    invoke-direct {v1, v5}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 122
    .local v1, "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    invoke-virtual {v1}, Lcom/pccw/sms/service/ChatRecordService;->getChatRecordItem()Ljava/util/ArrayList;

    move-result-object v0

    .line 123
    .local v0, "chatRecordItem":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/ChatRecordItem;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/pccw/sms/bean/ChatRecordItem;

    .line 124
    .local v3, "item":Lcom/pccw/sms/bean/ChatRecordItem;
    invoke-virtual {v3}, Lcom/pccw/sms/bean/ChatRecordItem;->getName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "@"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Lcom/pccw/mobile/sip/Constants;->domainName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, ""

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 125
    .local v4, "number":Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 127
    .end local v3    # "item":Lcom/pccw/sms/bean/ChatRecordItem;
    .end local v4    # "number":Ljava/lang/String;
    :cond_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    return-object v5
.end method
