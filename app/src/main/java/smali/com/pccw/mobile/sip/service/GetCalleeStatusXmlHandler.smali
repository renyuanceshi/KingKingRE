.class public Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetCalleeStatusXmlHandler.java"


# instance fields
.field private res:Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

.field private sb:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 10
    new-instance v0, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->res:Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

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
    .line 20
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 24
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
    .line 28
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 39
    :goto_0
    return-void

    .line 30
    :cond_0
    const-string/jumbo v0, "resultcode"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 31
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->res:Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;->resultCode:Ljava/lang/String;

    .line 38
    :cond_1
    :goto_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->sb:Ljava/lang/StringBuilder;

    goto :goto_0

    .line 32
    :cond_2
    const-string/jumbo v0, "status"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 33
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->res:Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;->status:Ljava/lang/String;

    goto :goto_1

    .line 34
    :cond_3
    const-string/jumbo v0, "sip_number"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 35
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->res:Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;->sip_number:Ljava/lang/String;

    goto :goto_1
.end method

.method public response()Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->res:Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

    return-object v0
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
    .line 15
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 16
    return-void
.end method
