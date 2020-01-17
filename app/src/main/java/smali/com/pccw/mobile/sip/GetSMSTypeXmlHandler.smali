.class public Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetSMSTypeXmlHandler.java"


# instance fields
.field public msisdn:Ljava/lang/String;

.field public resultCode:Ljava/lang/String;

.field private sb:Ljava/lang/StringBuilder;

.field public typeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->typeList:Ljava/util/List;

    .line 13
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->resultCode:Ljava/lang/String;

    .line 14
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->msisdn:Ljava/lang/String;

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
    .line 27
    iget-object v0, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 32
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
    .line 36
    iget-object v1, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v1, :cond_0

    .line 49
    :goto_0
    return-void

    .line 38
    :cond_0
    const-string/jumbo v1, "resultcode"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 39
    iget-object v1, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->resultCode:Ljava/lang/String;

    .line 48
    :cond_1
    :goto_1
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    goto :goto_0

    .line 40
    :cond_2
    const-string/jumbo v1, "msisdn"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 41
    iget-object v1, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->msisdn:Ljava/lang/String;

    goto :goto_1

    .line 42
    :cond_3
    const-string/jumbo v1, "type"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 43
    new-instance v0, Lcom/pccw/mobile/sip/SMSType;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/SMSType;-><init>()V

    .line 44
    .local v0, "smsType":Lcom/pccw/mobile/sip/SMSType;
    iget-object v1, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->msisdn:Ljava/lang/String;

    iput-object v1, v0, Lcom/pccw/mobile/sip/SMSType;->msisdn:Ljava/lang/String;

    .line 45
    iget-object v1, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/SMSType;->type:Ljava/lang/String;

    .line 46
    iget-object v1, p0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->typeList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

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
    .line 22
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 23
    return-void
.end method
