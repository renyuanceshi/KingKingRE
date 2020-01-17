.class Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;
.super Lcom/pccw/mobile/server/api/ResponseXmlHandler;
.source "SyncApiServerConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/server/api/SyncApiServerConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ApiResponseXmlHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/server/api/SyncApiServerConnection;


# direct methods
.method private constructor <init>(Lcom/pccw/mobile/server/api/SyncApiServerConnection;)V
    .locals 0

    .prologue
    .line 41
    iput-object p1, p0, Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;->this$0:Lcom/pccw/mobile/server/api/SyncApiServerConnection;

    invoke-direct {p0}, Lcom/pccw/mobile/server/api/ResponseXmlHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/pccw/mobile/server/api/SyncApiServerConnection;Lcom/pccw/mobile/server/api/SyncApiServerConnection$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/pccw/mobile/server/api/SyncApiServerConnection;
    .param p2, "x1"    # Lcom/pccw/mobile/server/api/SyncApiServerConnection$1;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;-><init>(Lcom/pccw/mobile/server/api/SyncApiServerConnection;)V

    return-void
.end method


# virtual methods
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
    .line 46
    iget-object v0, p0, Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;->sb:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 51
    :goto_0
    return-void

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;->this$0:Lcom/pccw/mobile/server/api/SyncApiServerConnection;

    iget-object v1, p0, Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2, v1}, Lcom/pccw/mobile/server/api/SyncApiServerConnection;->XmlElement(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;->sb:Ljava/lang/StringBuilder;

    goto :goto_0
.end method
