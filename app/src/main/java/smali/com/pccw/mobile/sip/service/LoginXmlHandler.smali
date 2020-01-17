.class public Lcom/pccw/mobile/sip/service/LoginXmlHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "LoginXmlHandler.java"


# instance fields
.field public res:Lcom/pccw/mobile/sip/service/LoginResponse;

.field private sb:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 14
    new-instance v0, Lcom/pccw/mobile/sip/service/LoginResponse;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/service/LoginResponse;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

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
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 30
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
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
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 73
    :goto_0
    return-void

    .line 36
    :cond_0
    const-string/jumbo v0, "resultcode"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 37
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->resultcode:Ljava/lang/String;

    .line 72
    :cond_1
    :goto_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    goto :goto_0

    .line 38
    :cond_2
    const-string/jumbo v0, "sip_domain"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 39
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_domain:Ljava/lang/String;

    goto :goto_1

    .line 40
    :cond_3
    const-string/jumbo v0, "sip_server"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 41
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_server:Ljava/lang/String;

    goto :goto_1

    .line 42
    :cond_4
    const-string/jumbo v0, "sip_port"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 43
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_port:Ljava/lang/String;

    goto :goto_1

    .line 44
    :cond_5
    const-string/jumbo v0, "pwd"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 45
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->pwd:Ljava/lang/String;

    goto :goto_1

    .line 46
    :cond_6
    const-string/jumbo v0, "message"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 47
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->message:Ljava/lang/String;

    goto :goto_1

    .line 48
    :cond_7
    const-string/jumbo v0, "sip_number"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 49
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_number:Ljava/lang/String;

    goto/16 :goto_1

    .line 50
    :cond_8
    const-string/jumbo v0, "session_id"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 51
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->session_id:Ljava/lang/String;

    goto/16 :goto_1

    .line 52
    :cond_9
    const-string/jumbo v0, "sip_server_ilbc"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 53
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_server_ilbc:Ljava/lang/String;

    goto/16 :goto_1

    .line 54
    :cond_a
    const-string/jumbo v0, "sip_port_ilbc"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 55
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_port_ilbc:Ljava/lang/String;

    goto/16 :goto_1

    .line 56
    :cond_b
    const-string/jumbo v0, "sip_tunnel_enable"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 57
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    const-string/jumbo v1, "true"

    iget-object v2, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_enable:Z

    goto/16 :goto_1

    .line 58
    :cond_c
    const-string/jumbo v0, "sip_tunnel_server_1"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 59
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_host_1:Ljava/lang/String;

    goto/16 :goto_1

    .line 60
    :cond_d
    const-string/jumbo v0, "sip_tunnel_server_2"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 61
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_host_2:Ljava/lang/String;

    goto/16 :goto_1

    .line 62
    :cond_e
    const-string/jumbo v0, "dn"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 63
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->dn:Ljava/lang/String;

    goto/16 :goto_1

    .line 64
    :cond_f
    const-string/jumbo v0, "is_HK"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 65
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    const-string/jumbo v1, "true"

    iget-object v2, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->is_hk:Z

    goto/16 :goto_1

    .line 66
    :cond_10
    const-string/jumbo v0, "echo_server"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 67
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->echo_server:Ljava/lang/String;

    goto/16 :goto_1

    .line 68
    :cond_11
    const-string/jumbo v0, "is_daypass_sub"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 69
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    const-string/jumbo v1, "true"

    iget-object v2, p0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/pccw/mobile/sip/service/LoginResponse;->is_daypass_sub:Z

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
