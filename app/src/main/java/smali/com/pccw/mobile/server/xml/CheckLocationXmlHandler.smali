.class public Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;
.super Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;
.source "CheckLocationXmlHandler.java"


# instance fields
.field private resp:Lcom/pccw/mobile/server/response/CheckLocationResponse;

.field private sb:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;-><init>()V

    .line 10
    new-instance v0, Lcom/pccw/mobile/server/response/CheckLocationResponse;

    invoke-direct {v0}, Lcom/pccw/mobile/server/response/CheckLocationResponse;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckLocationResponse;

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
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->sb:Ljava/lang/StringBuilder;

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
    .line 39
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckLocationResponse;

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->setResponse(Lcom/pccw/mobile/server/api/ApiResponse;)V

    .line 40
    invoke-super {p0}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;->endDocument()V

    .line 41
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
    const-string/jumbo v0, "resultcode"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 28
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckLocationResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckLocationResponse;->resultCode:Ljava/lang/String;

    .line 34
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckLocationResponse;

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->setResponse(Lcom/pccw/mobile/server/api/ApiResponse;)V

    .line 35
    return-void

    .line 29
    :cond_1
    const-string/jumbo v0, "country"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 30
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckLocationResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckLocationResponse;->country:Ljava/lang/String;

    goto :goto_0

    .line 31
    :cond_2
    const-string/jumbo v0, "is_HK"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckLocationResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckLocationResponse;->isHK:Ljava/lang/String;

    goto :goto_0
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
