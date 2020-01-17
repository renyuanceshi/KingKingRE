.class public Lcom/pccwmobile/common/utilities/XmlUtilities;
.super Ljava/lang/Object;
.source "XmlUtilities.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNodeListByXPath(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;
    .locals 7
    .param p0, "xml"    # Ljava/lang/String;
    .param p1, "xPath"    # Ljava/lang/String;

    .prologue
    .line 65
    const/4 v4, 0x0

    .line 66
    .local v4, "result":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    .line 67
    .local v5, "xpath":Ljavax/xml/xpath/XPath;
    const/4 v2, 0x0

    .line 70
    .local v2, "inputSource":Lorg/xml/sax/InputSource;
    :try_start_0
    invoke-static {}, Ljavax/xml/xpath/XPathFactory;->newInstance()Ljavax/xml/xpath/XPathFactory;

    move-result-object v6

    invoke-virtual {v6}, Ljavax/xml/xpath/XPathFactory;->newXPath()Ljavax/xml/xpath/XPath;

    move-result-object v5

    .line 71
    new-instance v3, Lorg/xml/sax/InputSource;

    invoke-static {p0}, Lcom/pccwmobile/common/utilities/XmlUtilities;->str2Stream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v3, v6}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .end local v2    # "inputSource":Lorg/xml/sax/InputSource;
    .local v3, "inputSource":Lorg/xml/sax/InputSource;
    :try_start_1
    sget-object v6, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    invoke-interface {v5, p1, v3, v6}, Ljavax/xml/xpath/XPath;->evaluate(Ljava/lang/String;Lorg/xml/sax/InputSource;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Lorg/w3c/dom/NodeList;

    move-object v4, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v2, v3

    .line 80
    .end local v3    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v2    # "inputSource":Lorg/xml/sax/InputSource;
    :goto_0
    const/4 v5, 0x0

    .line 81
    const/4 v2, 0x0

    .line 82
    return-object v4

    .line 74
    :catch_0
    move-exception v1

    .line 76
    .local v1, "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 74
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v3    # "inputSource":Lorg/xml/sax/InputSource;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v2    # "inputSource":Lorg/xml/sax/InputSource;
    goto :goto_1
.end method

.method public static getNodeValueByXPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "xml"    # Ljava/lang/String;
    .param p1, "xPath"    # Ljava/lang/String;

    .prologue
    .line 38
    const/4 v4, 0x0

    .line 39
    .local v4, "result":Ljava/lang/String;
    const/4 v5, 0x0

    .line 40
    .local v5, "xpath":Ljavax/xml/xpath/XPath;
    const/4 v2, 0x0

    .line 43
    .local v2, "inputSource":Lorg/xml/sax/InputSource;
    :try_start_0
    invoke-static {}, Ljavax/xml/xpath/XPathFactory;->newInstance()Ljavax/xml/xpath/XPathFactory;

    move-result-object v6

    invoke-virtual {v6}, Ljavax/xml/xpath/XPathFactory;->newXPath()Ljavax/xml/xpath/XPath;

    move-result-object v5

    .line 44
    new-instance v3, Lorg/xml/sax/InputSource;

    invoke-static {p0}, Lcom/pccwmobile/common/utilities/XmlUtilities;->str2Stream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v3, v6}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .end local v2    # "inputSource":Lorg/xml/sax/InputSource;
    .local v3, "inputSource":Lorg/xml/sax/InputSource;
    :try_start_1
    sget-object v6, Ljavax/xml/xpath/XPathConstants;->STRING:Ljavax/xml/namespace/QName;

    invoke-interface {v5, p1, v3, v6}, Ljavax/xml/xpath/XPath;->evaluate(Ljava/lang/String;Lorg/xml/sax/InputSource;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v4, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v2, v3

    .line 52
    .end local v3    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v2    # "inputSource":Lorg/xml/sax/InputSource;
    :goto_0
    const/4 v5, 0x0

    .line 53
    const/4 v2, 0x0

    .line 54
    return-object v4

    .line 47
    :catch_0
    move-exception v1

    .line 48
    .local v1, "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 47
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v3    # "inputSource":Lorg/xml/sax/InputSource;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v2    # "inputSource":Lorg/xml/sax/InputSource;
    goto :goto_1
.end method

.method public static getValueInNodeListByXpath(Lorg/w3c/dom/NodeList;Ljava/lang/String;)Ljava/util/List;
    .locals 9
    .param p0, "nodeList"    # Lorg/w3c/dom/NodeList;
    .param p1, "xPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/NodeList;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 94
    const/4 v4, 0x0

    .line 95
    .local v4, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v7, 0x0

    .line 96
    .local v7, "xpath":Ljavax/xml/xpath/XPath;
    const/4 v2, 0x0

    .line 97
    .local v2, "element":Lorg/w3c/dom/Element;
    const/4 v6, 0x0

    .line 100
    .local v6, "tempValue":Ljava/lang/String;
    :try_start_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .end local v4    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v5, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_1
    invoke-static {}, Ljavax/xml/xpath/XPathFactory;->newInstance()Ljavax/xml/xpath/XPathFactory;

    move-result-object v8

    invoke-virtual {v8}, Ljavax/xml/xpath/XPathFactory;->newXPath()Ljavax/xml/xpath/XPath;

    move-result-object v7

    .line 103
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v3, v8, :cond_0

    .line 104
    invoke-interface {p0, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Lorg/w3c/dom/Element;

    move-object v2, v0

    .line 105
    invoke-interface {v7, p1, v2}, Ljavax/xml/xpath/XPath;->evaluate(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 106
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 103
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    move-object v4, v5

    .line 113
    .end local v3    # "i":I
    .end local v5    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v4    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    const/4 v7, 0x0

    .line 114
    const/4 v2, 0x0

    .line 115
    const/4 v6, 0x0

    .line 117
    return-object v4

    .line 108
    :catch_0
    move-exception v1

    .line 109
    .local v1, "e":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 108
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v5    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_1
    move-exception v1

    move-object v4, v5

    .end local v5    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v4    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_2
.end method

.method private static str2Stream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 4
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 121
    const/4 v1, 0x0

    .line 123
    .local v1, "is":Ljava/io/InputStream;
    :try_start_0
    new-instance v2, Ljava/io/ByteArrayInputStream;

    const-string/jumbo v3, "UTF-8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "is":Ljava/io/InputStream;
    .local v2, "is":Ljava/io/InputStream;
    move-object v1, v2

    .line 127
    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    :goto_0
    return-object v1

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method
