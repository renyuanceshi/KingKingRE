.class public Lde/timroes/axmlrpc/serializer/ArraySerializer;
.super Ljava/lang/Object;
.source "ArraySerializer.java"

# interfaces
.implements Lde/timroes/axmlrpc/serializer/Serializer;


# static fields
.field private static final ARRAY_DATA:Ljava/lang/String; = "data"

.field private static final ARRAY_VALUE:Ljava/lang/String; = "value"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lorg/w3c/dom/Element;)Ljava/lang/Object;
    .locals 6
    .param p1, "content"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 23
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-static {v4}, Lde/timroes/axmlrpc/XMLUtil;->getOnlyChildElement(Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 27
    .local v0, "data":Lorg/w3c/dom/Element;
    const-string/jumbo v4, "data"

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 28
    new-instance v4, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v5, "The array must contain one data tag."

    invoke-direct {v4, v5}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 33
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-ge v1, v4, :cond_5

    .line 35
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-interface {v4, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-static {v4}, Lde/timroes/axmlrpc/XMLUtil;->getOnlyChildElement(Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 37
    .local v3, "value":Lorg/w3c/dom/Element;
    if-nez v3, :cond_2

    .line 33
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 41
    :cond_2
    invoke-interface {v3}, Lorg/w3c/dom/Element;->getNodeType()S

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_3

    invoke-interface {v3}, Lorg/w3c/dom/Element;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    :cond_3
    invoke-interface {v3}, Lorg/w3c/dom/Element;->getNodeType()S

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_1

    .line 46
    invoke-interface {v3}, Lorg/w3c/dom/Element;->getNodeType()S

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_4

    .line 47
    new-instance v4, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v5, "An array can only contain value tags."

    invoke-direct {v4, v5}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 50
    :cond_4
    invoke-static {}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->getDefault()Lde/timroes/axmlrpc/serializer/SerializerHandler;

    move-result-object v4

    invoke-virtual {v4, v3}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->deserialize(Lorg/w3c/dom/Element;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 54
    .end local v3    # "value":Lorg/w3c/dom/Element;
    :cond_5
    invoke-interface {v2}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v4

    return-object v4
.end method

.method public serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    .locals 10
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 59
    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "object":Ljava/lang/Object;
    move-object v7, p1

    check-cast v7, [Ljava/lang/Object;

    .line 60
    .local v7, "o":[Ljava/lang/Object;
    new-instance v1, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v9, "array"

    invoke-direct {v1, v9}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 61
    .local v1, "array":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    new-instance v2, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v9, "data"

    invoke-direct {v2, v9}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 62
    .local v2, "data":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    invoke-virtual {v1, v2}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 67
    move-object v0, v7

    .local v0, "arr$":[Ljava/lang/Object;
    :try_start_0
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_0

    aget-object v8, v0, v5

    .line 68
    .local v8, "obj":Ljava/lang/Object;
    new-instance v3, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v9, "value"

    invoke-direct {v3, v9}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 69
    .local v3, "e":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    invoke-static {}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->getDefault()Lde/timroes/axmlrpc/serializer/SerializerHandler;

    move-result-object v9

    invoke-virtual {v9, v8}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    move-result-object v9

    invoke-virtual {v3, v9}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 70
    invoke-virtual {v2, v3}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V
    :try_end_0
    .catch Lde/timroes/axmlrpc/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 73
    .end local v3    # "e":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v8    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v4

    .line 74
    .local v4, "ex":Lde/timroes/axmlrpc/XMLRPCException;
    new-instance v9, Lde/timroes/axmlrpc/XMLRPCRuntimeException;

    invoke-direct {v9, v4}, Lde/timroes/axmlrpc/XMLRPCRuntimeException;-><init>(Ljava/lang/Exception;)V

    throw v9

    .line 77
    .end local v4    # "ex":Lde/timroes/axmlrpc/XMLRPCException;
    .restart local v5    # "i$":I
    .restart local v6    # "len$":I
    :cond_0
    return-object v1
.end method
