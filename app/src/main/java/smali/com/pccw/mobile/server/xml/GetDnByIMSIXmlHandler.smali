.class public Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;
.super Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;
.source "GetDnByIMSIXmlHandler.java"


# instance fields
.field private resp:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

.field private sb:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;-><init>()V

    .line 10
    new-instance v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    invoke-direct {v0}, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->resp:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

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
    .line 19
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 23
    return-void
.end method

.method public endDocument()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->resp:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->setResponse(Lcom/pccw/mobile/server/api/ApiResponse;)V

    .line 42
    invoke-super {p0}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;->endDocument()V

    .line 43
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
    .line 27
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 37
    :goto_0
    return-void

    .line 29
    :cond_0
    const-string/jumbo v0, "resultcode"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 30
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->resp:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;->resultcode:Ljava/lang/String;

    .line 36
    :cond_1
    :goto_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->sb:Ljava/lang/StringBuilder;

    goto :goto_0

    .line 31
    :cond_2
    const-string/jumbo v0, "dn"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 32
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->resp:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;->msisdn:Ljava/lang/String;

    goto :goto_1

    .line 33
    :cond_3
    const-string/jumbo v0, "message"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 34
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->resp:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;->message:Ljava/lang/String;

    goto :goto_1
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 0
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
    .line 14
    invoke-super {p0, p1, p2, p3, p4}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 15
    return-void
.end method
