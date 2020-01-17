.class Lde/timroes/axmlrpc/ResponseParser;
.super Ljava/lang/Object;
.source "ResponseParser.java"


# static fields
.field private static final FAULT_CODE:Ljava/lang/String; = "faultCode"

.field private static final FAULT_STRING:Ljava/lang/String; = "faultString"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getReturnValueFromElement(Lorg/w3c/dom/Element;)Ljava/lang/Object;
    .locals 2
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-static {v0}, Lde/timroes/axmlrpc/XMLUtil;->getOnlyChildElement(Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Element;

    move-result-object p1

    .line 91
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "value"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v1, "The param tag must contain a value tag."

    invoke-direct {v0, v1}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_0
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-static {v0}, Lde/timroes/axmlrpc/XMLUtil;->getOnlyChildElement(Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Element;

    move-result-object p1

    .line 97
    invoke-static {}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->getDefault()Lde/timroes/axmlrpc/serializer/SerializerHandler;

    move-result-object v0

    invoke-virtual {v0, p1}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->deserialize(Lorg/w3c/dom/Element;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public parse(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 9
    .param p1, "response"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 34
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v4

    .line 35
    .local v4, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v4}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 36
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v0, p1}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 37
    .local v1, "dom":Lorg/w3c/dom/Document;
    invoke-interface {v1}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v2

    .line 40
    .local v2, "e":Lorg/w3c/dom/Element;
    invoke-interface {v2}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "methodResponse"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 41
    new-instance v6, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v7, "MethodResponse root tag is missing."

    invoke-direct {v6, v7}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v1    # "dom":Lorg/w3c/dom/Document;
    .end local v2    # "e":Lorg/w3c/dom/Element;
    .end local v4    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    :catch_0
    move-exception v3

    .line 69
    .local v3, "ex":Ljava/lang/Exception;
    instance-of v6, v3, Lde/timroes/axmlrpc/XMLRPCServerException;

    if-eqz v6, :cond_4

    .line 70
    check-cast v3, Lde/timroes/axmlrpc/XMLRPCServerException;

    .end local v3    # "ex":Ljava/lang/Exception;
    throw v3

    .line 44
    .restart local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v1    # "dom":Lorg/w3c/dom/Document;
    .restart local v2    # "e":Lorg/w3c/dom/Element;
    .restart local v4    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    :cond_0
    :try_start_1
    invoke-interface {v2}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-static {v6}, Lde/timroes/axmlrpc/XMLUtil;->getOnlyChildElement(Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 46
    invoke-interface {v2}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "params"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 48
    invoke-interface {v2}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-static {v6}, Lde/timroes/axmlrpc/XMLUtil;->getOnlyChildElement(Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 50
    invoke-interface {v2}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "param"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 51
    new-instance v6, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v7, "The params tag must contain a param tag."

    invoke-direct {v6, v7}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 54
    :cond_1
    invoke-direct {p0, v2}, Lde/timroes/axmlrpc/ResponseParser;->getReturnValueFromElement(Lorg/w3c/dom/Element;)Ljava/lang/Object;

    move-result-object v6

    return-object v6

    .line 56
    :cond_2
    invoke-interface {v2}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "fault"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 59
    invoke-direct {p0, v2}, Lde/timroes/axmlrpc/ResponseParser;->getReturnValueFromElement(Lorg/w3c/dom/Element;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 61
    .local v5, "o":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v8, Lde/timroes/axmlrpc/XMLRPCServerException;

    const-string/jumbo v6, "faultString"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string/jumbo v7, "faultCode"

    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-direct {v8, v6, v7}, Lde/timroes/axmlrpc/XMLRPCServerException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 65
    .end local v5    # "o":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_3
    new-instance v6, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v7, "The methodResponse tag must contain a fault or params tag."

    invoke-direct {v6, v7}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 72
    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v1    # "dom":Lorg/w3c/dom/Document;
    .end local v2    # "e":Lorg/w3c/dom/Element;
    .end local v4    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v3    # "ex":Ljava/lang/Exception;
    :cond_4
    new-instance v6, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v7, "Error getting result from server."

    invoke-direct {v6, v7, v3}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
.end method
