.class Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "TAndCActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ServerTCResponseXmlHandler"
.end annotation


# instance fields
.field private sb:Ljava/lang/StringBuilder;

.field final synthetic this$1:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;


# direct methods
.method private constructor <init>(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)V
    .locals 0

    .prologue
    .line 859
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;Lcom/pccw/mobile/sip/TAndCActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;
    .param p2, "x1"    # Lcom/pccw/mobile/sip/TAndCActivity$1;

    .prologue
    .line 859
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;-><init>(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)V

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
    .line 871
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 872
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 874
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 875
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
    .line 879
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 886
    :goto_0
    return-void

    .line 881
    :cond_0
    const-string/jumbo v0, "resultcode"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 882
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->access$2602(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;Ljava/lang/String;)Ljava/lang/String;

    .line 885
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;->sb:Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
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
    .line 865
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 866
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;->sb:Ljava/lang/StringBuilder;

    .line 867
    return-void
.end method
