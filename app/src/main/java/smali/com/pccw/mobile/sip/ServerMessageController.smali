.class public Lcom/pccw/mobile/sip/ServerMessageController;
.super Ljava/lang/Object;
.source "ServerMessageController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    }
.end annotation


# static fields
.field public static final ATTR_RESPONSE_FUNCTION:Ljava/lang/String; = "function"

.field public static final ATTR_RESPONSE_RESULTCODE:Ljava/lang/String; = "resultcode"

.field public static final LANG_CHI:I = 0x1

.field public static final LANG_ENG:I = 0x0

.field public static final LANG_UNKNOWN:I = -0x1

.field public static final MESSAGE_INTENT_MESSAGE:Ljava/lang/String; = "MESSAGE"

.field public static final MESSAGE_INTENT_OVERSEA_BOOLEAN:Ljava/lang/String; = "IS_OVERSEA"

.field private static final MESSAGE_LAST_DOWNLOAD_SUCCESS:Ljava/lang/String; = "MESSAGE_LAST_DOWNLOAD_SUCCESS"

.field private static final MESSAGE_LIST:Ljava/lang/String; = "MESSAGE_LIST"

.field private static final MESSAGE_LIST_TYPE:Ljava/lang/String; = "MESSAGE_LIST_TYPE"

.field public static final MESSAGE_TYPE_ACCEPTTANDC:Ljava/lang/String; = "acceptTandC"

.field public static final MESSAGE_TYPE_CALLFORWARD:Ljava/lang/String; = "callforward"

.field public static final MESSAGE_TYPE_CALLFORWARD_OVERSEA:Ljava/lang/String; = "callforward_oversea"

.field public static final MESSAGE_TYPE_CALLFORWARD_PREPAID:Ljava/lang/String; = "callforward_prepaid"

.field public static final MESSAGE_TYPE_CHECK_BALANCE:Ljava/lang/String; = "check_balance"

.field public static final MESSAGE_TYPE_GET_IMSI:Ljava/lang/String; = "get_imsi"

.field public static final MESSAGE_TYPE_GET_IMSI_OVERSEA:Ljava/lang/String; = "get_imsi_oversea"

.field public static final MESSAGE_TYPE_GET_IMSI_PREPAID:Ljava/lang/String; = "get_imsi_prepaid"

.field public static final MESSAGE_TYPE_GET_NUMBER_INFO:Ljava/lang/String; = "get_number_info"

.field public static final MESSAGE_TYPE_GET_NUMBER_INFO_OVERSEA:Ljava/lang/String; = "get_number_info_oversea"

.field public static final MESSAGE_TYPE_GET_NUMBER_INFO_PREPAID:Ljava/lang/String; = "get_number_info_prepaid"

.field public static final MESSAGE_TYPE_HEARTBEAT:Ljava/lang/String; = "heartbeat"

.field public static final MESSAGE_TYPE_LOGIN:Ljava/lang/String; = "login"

.field public static final MESSAGE_TYPE_LOGIN_OVERSEA:Ljava/lang/String; = "login_oversea"

.field public static final MESSAGE_TYPE_LOGIN_PREPAID:Ljava/lang/String; = "login_prepaid"

.field public static final MESSAGE_TYPE_MESSAGE:Ljava/lang/String; = "message"

.field public static final MESSAGE_TYPE_VERSION:Ljava/lang/String; = "version"

.field private static final MESSAGE_VERSION:Ljava/lang/String; = "MESSAGE_VERSION"

.field public static final TAG_MESSAGE_CH:Ljava/lang/String; = "message_ch"

.field public static final TAG_MESSAGE_EN:Ljava/lang/String; = "message_en"

.field public static final TAG_RESPONSE:Ljava/lang/String; = "response"

.field public static final TAG_ROAMSAVEMESSAGE:Ljava/lang/String; = "roamsavemessage"


# instance fields
.field private appContext:Landroid/content/Context;

.field private serverMessageList:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    .line 71
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    .line 72
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ServerMessageController;->init()V

    .line 73
    return-void
.end method

.method private combineMessageList(Ljava/util/HashMap;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;>;)V"
        }
    .end annotation

    .prologue
    .line 118
    .line 119
    .local p1, "newServerMessageList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    .line 118
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 120
    .local v6, "typeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 121
    .local v4, "currentType":Ljava/lang/String;
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 122
    .local v0, "codeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 123
    .local v1, "currentCode":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_2
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 124
    .local v5, "message":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 125
    .local v2, "currentLang":I
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 127
    .local v3, "currentMessage":Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 128
    iget-object v7, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 129
    iget-object v7, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v7, v4, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    :cond_3
    iget-object v7, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    invoke-virtual {v7, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 132
    iget-object v7, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v7, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    :cond_4
    iget-object v7, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    invoke-virtual {v7, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    .line 135
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v7, v11, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 140
    .end local v0    # "codeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;"
    .end local v1    # "currentCode":Ljava/lang/String;
    .end local v2    # "currentLang":I
    .end local v3    # "currentMessage":Ljava/lang/String;
    .end local v4    # "currentType":Ljava/lang/String;
    .end local v5    # "message":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/String;>;"
    .end local v6    # "typeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    :cond_5
    return-void
.end method

.method private parse(Lorg/xml/sax/InputSource;Lcom/pccw/mobile/sip/ServerMessageXmlHandler;)Z
    .locals 6
    .param p1, "src"    # Lorg/xml/sax/InputSource;
    .param p2, "handler"    # Lcom/pccw/mobile/sip/ServerMessageXmlHandler;

    .prologue
    .line 76
    const/4 v1, 0x0

    .line 82
    .local v1, "isOK":Z
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v3

    .line 83
    .local v3, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    .line 84
    .local v2, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v4

    .line 85
    .local v4, "xr":Lorg/xml/sax/XMLReader;
    invoke-interface {v4, p2}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 86
    invoke-interface {v4, p1}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    const/4 v1, 0x1

    move v5, v1

    .line 95
    .end local v2    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v3    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v4    # "xr":Lorg/xml/sax/XMLReader;
    :goto_0
    return v5

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 92
    const/4 v5, 0x0

    goto :goto_0
.end method


# virtual methods
.method public asString()Ljava/lang/String;
    .locals 13

    .prologue
    .line 227
    const-string/jumbo v6, ""

    .line 231
    .local v6, "resultString":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "<roamsavemessage>\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 232
    iget-object v8, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    .line 233
    invoke-virtual {v8}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    .line 232
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 234
    .local v7, "typeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 235
    .local v4, "currentType":Ljava/lang/String;
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 236
    .local v0, "codeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 237
    .local v1, "currentCode":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v11, "<response function=\""

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v11, "\" "

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v11, "resultcode"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v11, "=\""

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v11, "\">\n"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 240
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_1
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 241
    .local v5, "message":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 242
    .local v2, "currentLang":I
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 244
    .local v3, "currentMessage":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 245
    if-nez v2, :cond_2

    .line 246
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v12, "<message_en>"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v12, "</"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v12, "message_en"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v12, ">\n"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 248
    :cond_2
    const/4 v8, 0x1

    if-ne v2, v8, :cond_1

    .line 249
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v12, "<message_ch>"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v12, "</"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v12, "message_ch"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v12, ">\n"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 253
    .end local v2    # "currentLang":I
    .end local v3    # "currentMessage":Ljava/lang/String;
    .end local v5    # "message":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/String;>;"
    :cond_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v11, "</response>\n"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 254
    goto/16 :goto_0

    .line 256
    .end local v0    # "codeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;"
    .end local v1    # "currentCode":Ljava/lang/String;
    .end local v4    # "currentType":Ljava/lang/String;
    .end local v7    # "typeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "</roamsavemessage>\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 257
    return-object v6
.end method

.method public init()V
    .locals 6

    .prologue
    const v5, 0x7f060001

    .line 99
    iget-object v2, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "MESSAGE_LIST"

    const/4 v4, 0x0

    .line 100
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 101
    .local v0, "messageListString":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 102
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 103
    .local v1, "newServerMessageList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    new-instance v2, Lorg/xml/sax/InputSource;

    new-instance v3, Ljava/io/StringReader;

    invoke-direct {v3, v0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    new-instance v3, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;

    invoke-direct {v3, v1}, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;-><init>(Ljava/util/HashMap;)V

    invoke-direct {p0, v2, v3}, Lcom/pccw/mobile/sip/ServerMessageController;->parse(Lorg/xml/sax/InputSource;Lcom/pccw/mobile/sip/ServerMessageXmlHandler;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 105
    iput-object v1, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    .line 112
    .end local v1    # "newServerMessageList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    :goto_0
    return-void

    .line 107
    .restart local v1    # "newServerMessageList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    :cond_0
    new-instance v2, Lorg/xml/sax/InputSource;

    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    new-instance v3, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;

    iget-object v4, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    invoke-direct {v3, v4}, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;-><init>(Ljava/util/HashMap;)V

    invoke-direct {p0, v2, v3}, Lcom/pccw/mobile/sip/ServerMessageController;->parse(Lorg/xml/sax/InputSource;Lcom/pccw/mobile/sip/ServerMessageXmlHandler;)Z

    goto :goto_0

    .line 110
    .end local v1    # "newServerMessageList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    :cond_1
    new-instance v2, Lorg/xml/sax/InputSource;

    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    new-instance v3, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;

    iget-object v4, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    invoke-direct {v3, v4}, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;-><init>(Ljava/util/HashMap;)V

    invoke-direct {p0, v2, v3}, Lcom/pccw/mobile/sip/ServerMessageController;->parse(Lorg/xml/sax/InputSource;Lcom/pccw/mobile/sip/ServerMessageXmlHandler;)Z

    goto :goto_0
.end method

.method public lastMessageDownloadSuccess()Z
    .locals 3

    .prologue
    .line 222
    iget-object v0, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "MESSAGE_LAST_DOWNLOAD_SUCCESS"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public loadNewVersion(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 11
    .param p1, "newVersionURL"    # Ljava/lang/String;
    .param p2, "newVersion"    # Ljava/lang/String;
    .param p3, "messageListType"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 178
    const/4 v4, 0x0

    .line 179
    .local v4, "retryCount":I
    const/4 v2, 0x1

    .line 180
    .local v2, "needTry":Z
    :goto_0
    if-ge v4, v10, :cond_3

    if-eqz v2, :cond_3

    .line 181
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v7

    iget-object v8, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-virtual {v7, v8}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 182
    const/4 v2, 0x0

    .line 183
    const/4 v1, 0x0

    .line 185
    .local v1, "hlContent":Ljava/lang/String;
    const/4 v7, 0x2

    :try_start_0
    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "os"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    sget-object v9, Lcom/pccw/mobile/sip/service/MobileSipService;->OS:Ljava/lang/String;

    aput-object v9, v7, v8

    invoke-static {p1, v7}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 192
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_1

    .line 193
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 194
    const/4 v2, 0x1

    goto :goto_0

    .line 186
    :catch_0
    move-exception v0

    .line 187
    .local v0, "e":Ljava/lang/Exception;
    add-int/lit8 v4, v4, 0x1

    .line 188
    const/4 v2, 0x1

    .line 189
    goto :goto_0

    .line 196
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 198
    .local v3, "newServerMessageList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    new-instance v7, Lorg/xml/sax/InputSource;

    new-instance v8, Ljava/io/StringReader;

    invoke-direct {v8, v1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v7, v8}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    new-instance v8, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;

    invoke-direct {v8, v3}, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;-><init>(Ljava/util/HashMap;)V

    invoke-direct {p0, v7, v8}, Lcom/pccw/mobile/sip/ServerMessageController;->parse(Lorg/xml/sax/InputSource;Lcom/pccw/mobile/sip/ServerMessageXmlHandler;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 200
    invoke-direct {p0, v3}, Lcom/pccw/mobile/sip/ServerMessageController;->combineMessageList(Ljava/util/HashMap;)V

    .line 201
    iget-object v6, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-static {v6}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string/jumbo v7, "MESSAGE_LIST"

    .line 202
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ServerMessageController;->asString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 203
    iget-object v6, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-static {v6}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string/jumbo v7, "MESSAGE_VERSION"

    .line 204
    invoke-interface {v6, v7, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 205
    iget-object v6, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-static {v6}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string/jumbo v7, "MESSAGE_LIST_TYPE"

    .line 206
    invoke-interface {v6, v7, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 207
    iget-object v6, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-static {v6}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string/jumbo v7, "MESSAGE_LAST_DOWNLOAD_SUCCESS"

    .line 208
    invoke-interface {v6, v7, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 218
    .end local v1    # "hlContent":Ljava/lang/String;
    .end local v3    # "newServerMessageList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    :goto_1
    return v5

    .line 211
    .restart local v1    # "hlContent":Ljava/lang/String;
    .restart local v3    # "newServerMessageList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 212
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 216
    .end local v1    # "hlContent":Ljava/lang/String;
    .end local v3    # "newServerMessageList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    :cond_3
    iget-object v5, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string/jumbo v7, "MESSAGE_LAST_DOWNLOAD_SUCCESS"

    .line 217
    invoke-interface {v5, v7, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move v5, v6

    .line 218
    goto :goto_1
.end method

.method public needUpdateErrorMessageList(Ljava/lang/String;Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;)Z
    .locals 8
    .param p1, "newVersionString"    # Ljava/lang/String;
    .param p2, "newMsgListType"    # Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    .prologue
    const/4 v4, 0x1

    .line 149
    iget-object v5, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string/jumbo v6, "MESSAGE_LIST_TYPE"

    const-string/jumbo v7, ""

    .line 150
    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "currentMsgListType":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 174
    :goto_0
    return v4

    .line 159
    :cond_0
    iget-object v5, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string/jumbo v6, "MESSAGE_VERSION"

    const-string/jumbo v7, "0.0.0"

    .line 160
    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 161
    .local v1, "currentVersion":Ljava/lang/String;
    const/4 v3, 0x0

    .line 163
    .local v3, "newVersion":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 171
    :goto_1
    invoke-static {v1, v3}, Lcom/pccw/mobile/sip/util/VersionUtils;->isNewerVersion(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 172
    iget-object v5, p0, Lcom/pccw/mobile/sip/ServerMessageController;->appContext:Landroid/content/Context;

    invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string/jumbo v6, "MESSAGE_LAST_DOWNLOAD_SUCCESS"

    .line 173
    invoke-interface {v5, v6, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 174
    :cond_1
    invoke-static {v1, v3}, Lcom/pccw/mobile/sip/util/VersionUtils;->isNewerVersion(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    goto :goto_0

    .line 164
    :catch_0
    move-exception v2

    .line 165
    .local v2, "e":Ljava/lang/Exception;
    move-object v3, v1

    goto :goto_1
.end method

.method public obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "code"    # Ljava/lang/String;

    .prologue
    .line 261
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "zh"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 262
    .local v0, "language":I
    :goto_0
    iget-object v1, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 263
    iget-object v1, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 264
    iget-object v1, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 265
    const-string/jumbo v2, "testing"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "code: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, "     "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v1, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    .line 266
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 265
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    iget-object v1, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 272
    :goto_1
    return-object v1

    .line 261
    .end local v0    # "language":I
    :cond_0
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 271
    .restart local v0    # "language":I
    :cond_1
    const-string/jumbo v1, "testing"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "code: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "     null"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public printToLog(I)V
    .locals 9
    .param p1, "level"    # I

    .prologue
    .line 276
    const-string/jumbo v3, "PCCW_MOBILE_SIP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "serverMessageList.size() = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    .line 277
    invoke-virtual {v5}, Ljava/util/HashMap;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 276
    invoke-static {p1, v3, v4}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 278
    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageController;->serverMessageList:Ljava/util/HashMap;

    .line 279
    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    .line 278
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 280
    .local v2, "typeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    const-string/jumbo v5, "PCCW_MOBILE_SIP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "\ttype = "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, ", size() = "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 281
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 280
    invoke-static {p1, v5, v3}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 282
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 283
    .local v0, "codeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;"
    const-string/jumbo v6, "PCCW_MOBILE_SIP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "\t\tresultcode = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v7, ", size() = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 284
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 283
    invoke-static {p1, v6, v3}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 285
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 286
    .local v1, "message":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/String;>;"
    const-string/jumbo v7, "PCCW_MOBILE_SIP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "\t\t\tlanguage = "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 287
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v3, "EN"

    :goto_1
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v8, ": "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 288
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 286
    invoke-static {p1, v7, v3}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 287
    :cond_2
    const-string/jumbo v3, "CH"

    goto :goto_1

    .line 291
    .end local v0    # "codeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;"
    .end local v1    # "message":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/String;>;"
    .end local v2    # "typeList":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    :cond_3
    return-void
.end method
