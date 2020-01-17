.class public Lcom/pccw/mobile/sip/ServerMessageXmlHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "ServerMessageXmlHandler.java"


# instance fields
.field private currentCode:Ljava/lang/String;

.field private currentType:Ljava/lang/String;

.field private messageList:Ljava/util/HashMap;
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

.field private sb:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>(Ljava/util/HashMap;)V
    .locals 1
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
    .local p1, "list":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;>;"
    const/4 v0, 0x0

    .line 18
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 13
    iput-object v0, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->messageList:Ljava/util/HashMap;

    .line 15
    iput-object v0, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentType:Ljava/lang/String;

    .line 16
    iput-object v0, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentCode:Ljava/lang/String;

    .line 19
    iput-object p1, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->messageList:Ljava/util/HashMap;

    .line 20
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 2
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 58
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v3, :cond_1

    .line 90
    :cond_0
    :goto_0
    return-void

    .line 67
    :cond_1
    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentType:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentCode:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 70
    const/4 v1, -0x1

    .line 71
    .local v1, "currentLang":I
    const-string/jumbo v3, "message_en"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 72
    const/4 v1, 0x0

    .line 78
    :goto_1
    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->messageList:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 79
    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->messageList:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentType:Ljava/lang/String;

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    :cond_2
    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->messageList:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 82
    .local v2, "typeList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;"
    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentCode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 83
    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentCode:Ljava/lang/String;

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    :cond_3
    iget-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentCode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 86
    .local v0, "codeList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;"
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 87
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    :cond_4
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->sb:Ljava/lang/StringBuilder;

    goto :goto_0

    .line 73
    .end local v0    # "codeList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;"
    .end local v2    # "typeList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;>;"
    :cond_5
    const-string/jumbo v3, "message_ch"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 74
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 5
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 25
    const-string/jumbo v4, "response"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 26
    if-eqz p4, :cond_2

    .line 27
    invoke-interface {p4}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v3

    .line 29
    .local v3, "len":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_2

    .line 30
    invoke-interface {p4, v2}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v0

    .line 31
    .local v0, "attrName":Ljava/lang/String;
    invoke-interface {p4, v2}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    .line 33
    .local v1, "attrVal":Ljava/lang/String;
    const-string/jumbo v4, "function"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 34
    iput-object v1, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentType:Ljava/lang/String;

    .line 29
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 35
    :cond_1
    const-string/jumbo v4, "resultcode"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 36
    iput-object v1, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->currentCode:Ljava/lang/String;

    goto :goto_1

    .line 42
    .end local v0    # "attrName":Ljava/lang/String;
    .end local v1    # "attrVal":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "len":I
    :cond_2
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/pccw/mobile/sip/ServerMessageXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 50
    return-void
.end method
