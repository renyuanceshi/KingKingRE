.class public Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;
.super Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;
.source "CheckNumberTypeXmlHandler.java"


# instance fields
.field resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

.field private sb:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;-><init>()V

    .line 11
    new-instance v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    invoke-direct {v0}, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

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
    .line 21
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 25
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
    .line 78
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->setResponse(Lcom/pccw/mobile/server/api/ApiResponse;)V

    .line 79
    invoke-super {p0}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;->endDocument()V

    .line 80
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
    .line 29
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 74
    :goto_0
    return-void

    .line 31
    :cond_0
    const-string/jumbo v0, "resultcode"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 32
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    .line 72
    :cond_1
    :goto_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 73
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->setResponse(Lcom/pccw/mobile/server/api/ApiResponse;)V

    goto :goto_0

    .line 33
    :cond_2
    const-string/jumbo v0, "simType"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 34
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    goto :goto_1

    .line 35
    :cond_3
    const-string/jumbo v0, "operator"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 36
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->operator:Ljava/lang/String;

    goto :goto_1

    .line 37
    :cond_4
    const-string/jumbo v0, "brand"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 38
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->brand:Ljava/lang/String;

    goto :goto_1

    .line 39
    :cond_5
    const-string/jumbo v0, "class"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 40
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simClass:Ljava/lang/String;

    goto :goto_1

    .line 41
    :cond_6
    const-string/jumbo v0, "status"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 42
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->status:Ljava/lang/String;

    goto :goto_1

    .line 43
    :cond_7
    const-string/jumbo v0, "allow_kk"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 44
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allowkk:Ljava/lang/String;

    goto/16 :goto_1

    .line 45
    :cond_8
    const-string/jumbo v0, "allow_RS"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 46
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allowRS:Ljava/lang/String;

    goto/16 :goto_1

    .line 47
    :cond_9
    const-string/jumbo v0, "message"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 48
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->message:Ljava/lang/String;

    goto/16 :goto_1

    .line 49
    :cond_a
    const-string/jumbo v0, "allow_IDD"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 50
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allow_IDD:Ljava/lang/String;

    goto/16 :goto_1

    .line 51
    :cond_b
    const-string/jumbo v0, "isFreeTrialNum"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 52
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->isFreeTrial:Ljava/lang/String;

    goto/16 :goto_1

    .line 53
    :cond_c
    const-string/jumbo v0, "registeredFreeTrial"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 54
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->registeredFreeTrial:Ljava/lang/String;

    goto/16 :goto_1

    .line 55
    :cond_d
    const-string/jumbo v0, "freeTrialVirtualNum"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 56
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->freeTrialVirtualNum:Ljava/lang/String;

    goto/16 :goto_1

    .line 57
    :cond_e
    const-string/jumbo v0, "freeTrialVirtualNumStatus"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 58
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->freeTrialNumberStatus:Ljava/lang/String;

    goto/16 :goto_1

    .line 59
    :cond_f
    const-string/jumbo v0, "freeTrialPromotionStatus"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 60
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->freeTrialPromotionStatus:Ljava/lang/String;

    goto/16 :goto_1

    .line 61
    :cond_10
    const-string/jumbo v0, "freeTrialRegistrationURL_en"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 62
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->freeTrialUrl_en:Ljava/lang/String;

    goto/16 :goto_1

    .line 63
    :cond_11
    const-string/jumbo v0, "purchaseNumberURL_en"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 64
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->purchaseUrl_en:Ljava/lang/String;

    goto/16 :goto_1

    .line 65
    :cond_12
    const-string/jumbo v0, "freeTrialRegistrationURL_ch"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 66
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->freeTrialUrl_ch:Ljava/lang/String;

    goto/16 :goto_1

    .line 67
    :cond_13
    const-string/jumbo v0, "purchaseNumberURL_ch"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 68
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->purchaseUrl_ch:Ljava/lang/String;

    goto/16 :goto_1

    .line 69
    :cond_14
    const-string/jumbo v0, "purchasedVirtualNumber"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 70
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->resp:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v1, p0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->purchasedVirtualNumber:Ljava/lang/String;

    goto/16 :goto_1
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
    .line 16
    invoke-super {p0, p1, p2, p3, p4}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 17
    return-void
.end method
