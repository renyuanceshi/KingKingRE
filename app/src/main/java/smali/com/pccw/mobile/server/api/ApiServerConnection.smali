.class public abstract Lcom/pccw/mobile/server/api/ApiServerConnection;
.super Landroid/os/AsyncTask;
.source "ApiServerConnection.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Lcom/pccw/mobile/server/api/ApiResponse;",
        ">;"
    }
.end annotation


# instance fields
.field protected apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

.field protected handler:Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;

.field protected sb:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;)V
    .locals 0
    .param p1, "handler"    # Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/pccw/mobile/server/api/ApiServerConnection;->handler:Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;

    .line 30
    return-void
.end method

.method private apiResponseXmlHandler(Ljava/lang/String;)V
    .locals 6
    .param p1, "hlContent"    # Ljava/lang/String;

    .prologue
    .line 58
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v2

    .line 59
    .local v2, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    .line 60
    .local v1, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v3

    .line 61
    .local v3, "xr":Lorg/xml/sax/XMLReader;
    iget-object v4, p0, Lcom/pccw/mobile/server/api/ApiServerConnection;->handler:Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;

    invoke-interface {v3, v4}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 62
    new-instance v4, Lorg/xml/sax/InputSource;

    new-instance v5, Ljava/io/StringReader;

    invoke-direct {v5, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface {v3, v4}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 66
    .end local v1    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v2    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v3    # "xr":Lorg/xml/sax/XMLReader;
    :goto_0
    return-void

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 63
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Lcom/pccw/mobile/server/api/ApiResponse;
    .locals 3
    .param p1, "input"    # [Ljava/lang/String;

    .prologue
    .line 36
    invoke-virtual {p0}, Lcom/pccw/mobile/server/api/ApiServerConnection;->postToServer()Ljava/lang/String;

    move-result-object v1

    .line 37
    .local v1, "xmlContent":Ljava/lang/String;
    invoke-static {v1}, Lorg/apache/http/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 38
    invoke-direct {p0, v1}, Lcom/pccw/mobile/server/api/ApiServerConnection;->apiResponseXmlHandler(Ljava/lang/String;)V

    .line 40
    :cond_0
    iget-object v2, p0, Lcom/pccw/mobile/server/api/ApiServerConnection;->handler:Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;

    invoke-virtual {v2}, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;->getResponse()Lcom/pccw/mobile/server/api/ApiResponse;

    move-result-object v0

    .line 41
    .local v0, "resp":Lcom/pccw/mobile/server/api/ApiResponse;
    if-eqz v0, :cond_1

    .line 42
    iget-object v2, p0, Lcom/pccw/mobile/server/api/ApiServerConnection;->apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

    invoke-interface {v2, v0}, Lcom/pccw/mobile/server/api/ApiResponseListener;->onResponseSuccess(Lcom/pccw/mobile/server/api/ApiResponse;)V

    .line 46
    :goto_0
    return-object v0

    .line 44
    :cond_1
    iget-object v2, p0, Lcom/pccw/mobile/server/api/ApiServerConnection;->apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

    invoke-interface {v2}, Lcom/pccw/mobile/server/api/ApiResponseListener;->onResponseFailed()V

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 20
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/server/api/ApiServerConnection;->doInBackground([Ljava/lang/String;)Lcom/pccw/mobile/server/api/ApiResponse;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/pccw/mobile/server/api/ApiResponse;)V
    .locals 0
    .param p1, "response"    # Lcom/pccw/mobile/server/api/ApiResponse;

    .prologue
    .line 51
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 52
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 20
    check-cast p1, Lcom/pccw/mobile/server/api/ApiResponse;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/server/api/ApiServerConnection;->onPostExecute(Lcom/pccw/mobile/server/api/ApiResponse;)V

    return-void
.end method

.method public abstract postToServer()Ljava/lang/String;
.end method
