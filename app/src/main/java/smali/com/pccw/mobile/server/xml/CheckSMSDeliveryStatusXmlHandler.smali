.class public Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;
.super Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;
.source "CheckSMSDeliveryStatusXmlHandler.java"


# instance fields
.field bMsgId:Z

.field bResultCode:Z

.field bStatus:Z

.field private resp:Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;

.field private status:Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;

.field private statusList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 12
    invoke-direct {p0}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;-><init>()V

    .line 18
    iput-boolean v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bResultCode:Z

    .line 19
    iput-boolean v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bMsgId:Z

    .line 20
    iput-boolean v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bStatus:Z

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 3
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 52
    iget-boolean v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bResultCode:Z

    if-eqz v0, :cond_1

    .line 53
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;->setResultcode(Ljava/lang/String;)V

    .line 54
    iput-boolean v2, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bResultCode:Z

    .line 62
    :cond_0
    :goto_0
    return-void

    .line 55
    :cond_1
    iget-boolean v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bMsgId:Z

    if-eqz v0, :cond_2

    .line 56
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->status:Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;->setMessageId(Ljava/lang/String;)V

    .line 57
    iput-boolean v2, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bMsgId:Z

    goto :goto_0

    .line 58
    :cond_2
    iget-boolean v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bStatus:Z

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->status:Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;->setStatus(Ljava/lang/String;)V

    .line 60
    iput-boolean v2, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bStatus:Z

    goto :goto_0
.end method

.method public endDocument()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->statusList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;->setStatusList(Ljava/util/List;)V

    .line 67
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->setResponse(Lcom/pccw/mobile/server/api/ApiResponse;)V

    .line 68
    invoke-super {p0}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;->endDocument()V

    .line 69
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 45
    const-string/jumbo v0, "msg"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->statusList:Ljava/util/List;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->status:Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    :cond_0
    return-void
.end method

.method public startDocument()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 24
    new-instance v0, Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;

    invoke-direct {v0}, Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;

    .line 25
    new-instance v0, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;

    invoke-direct {v0}, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->status:Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->statusList:Ljava/util/List;

    .line 27
    invoke-super {p0}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;->startDocument()V

    .line 28
    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 2
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
    const/4 v1, 0x1

    .line 32
    const-string/jumbo v0, "resultcode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 33
    iput-boolean v1, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bResultCode:Z

    .line 41
    :cond_0
    :goto_0
    return-void

    .line 34
    :cond_1
    const-string/jumbo v0, "msg"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 35
    new-instance v0, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;

    invoke-direct {v0}, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->status:Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;

    goto :goto_0

    .line 36
    :cond_2
    const-string/jumbo v0, "msgid"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 37
    iput-boolean v1, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bMsgId:Z

    goto :goto_0

    .line 38
    :cond_3
    const-string/jumbo v0, "status"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    iput-boolean v1, p0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;->bStatus:Z

    goto :goto_0
.end method
