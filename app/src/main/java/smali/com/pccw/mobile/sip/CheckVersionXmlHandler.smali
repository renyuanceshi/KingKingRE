.class public Lcom/pccw/mobile/sip/CheckVersionXmlHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "CheckVersionXmlHandler.java"


# instance fields
.field public res:Lcom/pccw/mobile/sip/CheckVersionResponse;

.field private sb:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 14
    new-instance v0, Lcom/pccw/mobile/sip/CheckVersionResponse;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/CheckVersionResponse;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    .line 15
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
    .line 25
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 30
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
    .line 34
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 92
    :goto_0
    return-void

    .line 36
    :cond_0
    const-string/jumbo v0, "resultcode"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 37
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->resultcode:Ljava/lang/String;

    .line 91
    :cond_1
    :goto_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    goto :goto_0

    .line 38
    :cond_2
    const-string/jumbo v0, "app_version"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 39
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->app_version:Ljava/lang/String;

    goto :goto_1

    .line 40
    :cond_3
    const-string/jumbo v0, "app_link"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 41
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->app_link:Ljava/lang/String;

    goto :goto_1

    .line 42
    :cond_4
    const-string/jumbo v0, "TandC_version"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 43
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version:Ljava/lang/String;

    goto :goto_1

    .line 44
    :cond_5
    const-string/jumbo v0, "TandC_URL_C"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 45
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c:Ljava/lang/String;

    goto :goto_1

    .line 46
    :cond_6
    const-string/jumbo v0, "TandC_URL_E"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 47
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e:Ljava/lang/String;

    goto :goto_1

    .line 48
    :cond_7
    const-string/jumbo v0, "TandC_version_prepaid"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 49
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_prepaid:Ljava/lang/String;

    goto/16 :goto_1

    .line 50
    :cond_8
    const-string/jumbo v0, "TandC_URL_C_prepaid"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 51
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_prepaid:Ljava/lang/String;

    goto/16 :goto_1

    .line 52
    :cond_9
    const-string/jumbo v0, "TandC_URL_E_prepaid"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 53
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_prepaid:Ljava/lang/String;

    goto/16 :goto_1

    .line 54
    :cond_a
    const-string/jumbo v0, "TandC_version_one2free"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 55
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_one2free:Ljava/lang/String;

    goto/16 :goto_1

    .line 56
    :cond_b
    const-string/jumbo v0, "TandC_URL_C_one2free"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 57
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_one2free:Ljava/lang/String;

    goto/16 :goto_1

    .line 58
    :cond_c
    const-string/jumbo v0, "TandC_URL_E_one2free"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 59
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_one2free:Ljava/lang/String;

    goto/16 :goto_1

    .line 60
    :cond_d
    const-string/jumbo v0, "TandC_version_1010"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 61
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_1010:Ljava/lang/String;

    goto/16 :goto_1

    .line 62
    :cond_e
    const-string/jumbo v0, "TandC_URL_C_1010"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 63
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_1010:Ljava/lang/String;

    goto/16 :goto_1

    .line 64
    :cond_f
    const-string/jumbo v0, "TandC_URL_E_1010"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 65
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_1010:Ljava/lang/String;

    goto/16 :goto_1

    .line 66
    :cond_10
    const-string/jumbo v0, "TandC_version_csl_prepaid"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 67
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_csl_prepaid:Ljava/lang/String;

    goto/16 :goto_1

    .line 68
    :cond_11
    const-string/jumbo v0, "TandC_URL_C_csl_prepaid"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 69
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_csl_prepaid:Ljava/lang/String;

    goto/16 :goto_1

    .line 70
    :cond_12
    const-string/jumbo v0, "TandC_URL_E_csl_prepaid"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 71
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_csl_prepaid:Ljava/lang/String;

    goto/16 :goto_1

    .line 72
    :cond_13
    const-string/jumbo v0, "Msg_version"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 73
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version:Ljava/lang/String;

    goto/16 :goto_1

    .line 74
    :cond_14
    const-string/jumbo v0, "Msg_version_one2free"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 75
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version_one2free:Ljava/lang/String;

    goto/16 :goto_1

    .line 76
    :cond_15
    const-string/jumbo v0, "Msg_version_1010"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 77
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version_1010:Ljava/lang/String;

    goto/16 :goto_1

    .line 78
    :cond_16
    const-string/jumbo v0, "Msg_version_csl_prepaid"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 79
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version_csl_prepaid:Ljava/lang/String;

    goto/16 :goto_1

    .line 80
    :cond_17
    const-string/jumbo v0, "Msg_URL"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 81
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url:Ljava/lang/String;

    goto/16 :goto_1

    .line 82
    :cond_18
    const-string/jumbo v0, "Msg_URL_one2free"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 83
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url_one2free:Ljava/lang/String;

    goto/16 :goto_1

    .line 84
    :cond_19
    const-string/jumbo v0, "Msg_URL_1010"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 85
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url_1010:Ljava/lang/String;

    goto/16 :goto_1

    .line 86
    :cond_1a
    const-string/jumbo v0, "Msg_URL_csl_prepaid"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 87
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url_csl_prepaid:Ljava/lang/String;

    goto/16 :goto_1

    .line 88
    :cond_1b
    const-string/jumbo v0, "message"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 89
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/CheckVersionResponse;->message:Ljava/lang/String;

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
    .line 20
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 21
    return-void
.end method
