.class public abstract Lcom/pccw/mobile/server/api/SyncApiServerConnection;
.super Ljava/lang/Object;
.source "SyncApiServerConnection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;
    }
.end annotation


# instance fields
.field protected apiResponse:Lcom/pccw/mobile/server/api/ApiResponse;

.field protected sb:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract XmlElement(Ljava/lang/String;Ljava/lang/StringBuilder;)V
.end method

.method public apiResponseXmlHandler(Ljava/lang/String;)V
    .locals 7
    .param p1, "hlContent"    # Ljava/lang/String;

    .prologue
    .line 26
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v2

    .line 27
    .local v2, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    .line 28
    .local v1, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v4

    .line 29
    .local v4, "xr":Lorg/xml/sax/XMLReader;
    new-instance v3, Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;

    const/4 v5, 0x0

    invoke-direct {v3, p0, v5}, Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;-><init>(Lcom/pccw/mobile/server/api/SyncApiServerConnection;Lcom/pccw/mobile/server/api/SyncApiServerConnection$1;)V

    .line 30
    .local v3, "xmlHandler":Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;
    invoke-interface {v4, v3}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 31
    new-instance v5, Lorg/xml/sax/InputSource;

    new-instance v6, Ljava/io/StringReader;

    invoke-direct {v6, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface {v4, v5}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 39
    .end local v1    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v2    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v3    # "xmlHandler":Lcom/pccw/mobile/server/api/SyncApiServerConnection$ApiResponseXmlHandler;
    .end local v4    # "xr":Lorg/xml/sax/XMLReader;
    :goto_0
    return-void

    .line 32
    :catch_0
    move-exception v0

    .line 33
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v0}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_0

    .line 34
    .end local v0    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v0

    .line 35
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0

    .line 36
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    :catch_2
    move-exception v0

    .line 37
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public abstract postToServer()Lcom/pccw/mobile/server/api/ApiResponse;
.end method
