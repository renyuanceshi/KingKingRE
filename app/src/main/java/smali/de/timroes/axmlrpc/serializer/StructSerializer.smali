.class public Lde/timroes/axmlrpc/serializer/StructSerializer;
.super Ljava/lang/Object;
.source "StructSerializer.java"

# interfaces
.implements Lde/timroes/axmlrpc/serializer/Serializer;


# static fields
.field private static final STRUCT_MEMBER:Ljava/lang/String; = "member"

.field private static final STRUCT_NAME:Ljava/lang/String; = "name"

.field private static final STRUCT_VALUE:Ljava/lang/String; = "value"


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
    .locals 11
    .param p1, "content"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x8

    const/4 v9, 0x3

    .line 24
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 29
    .local v3, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v0, v7, :cond_d

    .line 31
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-interface {v7, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 34
    .local v4, "n":Lorg/w3c/dom/Node;
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v7

    if-ne v7, v9, :cond_0

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_1

    :cond_0
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v7

    if-ne v7, v10, :cond_2

    .line 29
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 39
    :cond_2
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_3

    const-string/jumbo v7, "member"

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 41
    :cond_3
    new-instance v7, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v8, "Only struct members allowed within a struct."

    invoke-direct {v7, v8}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 45
    :cond_4
    const/4 v6, 0x0

    .local v6, "s":Ljava/lang/String;
    const/4 v5, 0x0

    .line 46
    .local v5, "o":Ljava/lang/Object;
    const/4 v1, 0x0

    .end local v5    # "o":Ljava/lang/Object;
    .local v1, "j":I
    :goto_2
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v1, v7, :cond_c

    .line 47
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-interface {v7, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 50
    .local v2, "m":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v7

    if-ne v7, v9, :cond_5

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_6

    :cond_5
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v7

    if-ne v7, v10, :cond_7

    .line 46
    :cond_6
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 55
    :cond_7
    const-string/jumbo v7, "name"

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 56
    if-eqz v6, :cond_8

    .line 57
    new-instance v7, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v8, "Name of a struct member cannot be set twice."

    invoke-direct {v7, v8}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 59
    :cond_8
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-static {v7}, Lde/timroes/axmlrpc/XMLUtil;->getOnlyTextContent(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v6

    goto :goto_3

    .line 61
    :cond_9
    const-string/jumbo v7, "value"

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 62
    if-eqz v5, :cond_a

    .line 63
    new-instance v7, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v8, "Value of a struct member cannot be set twice."

    invoke-direct {v7, v8}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 65
    :cond_a
    invoke-static {}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->getDefault()Lde/timroes/axmlrpc/serializer/SerializerHandler;

    move-result-object v7

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v8

    invoke-static {v8}, Lde/timroes/axmlrpc/XMLUtil;->getOnlyChildElement(Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Element;

    move-result-object v8

    invoke-virtual {v7, v8}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->deserialize(Lorg/w3c/dom/Element;)Ljava/lang/Object;

    move-result-object v5

    .restart local v5    # "o":Ljava/lang/Object;
    goto :goto_3

    .line 69
    .end local v5    # "o":Ljava/lang/Object;
    :cond_b
    new-instance v7, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v8, "A struct member must only contain one name and one value."

    invoke-direct {v7, v8}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 74
    .end local v2    # "m":Lorg/w3c/dom/Node;
    :cond_c
    invoke-interface {v3, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 78
    .end local v1    # "j":I
    .end local v4    # "n":Lorg/w3c/dom/Node;
    .end local v6    # "s":Ljava/lang/String;
    :cond_d
    return-object v3
.end method

.method public serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    .locals 11
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 84
    new-instance v7, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v9, "struct"

    invoke-direct {v7, v9}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 93
    .local v7, "struct":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    :try_start_0
    move-object v0, p1

    check-cast v0, Ljava/util/Map;

    move-object v4, v0

    .line 95
    .local v4, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 96
    .local v5, "member":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v9, "member"

    invoke-direct {v1, v9}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 97
    .local v1, "entry":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    new-instance v6, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v9, "name"

    invoke-direct {v6, v9}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 98
    .local v6, "name":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    new-instance v8, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v9, "value"

    invoke-direct {v8, v9}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 99
    .local v8, "value":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    invoke-static {}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->getDefault()Lde/timroes/axmlrpc/serializer/SerializerHandler;

    move-result-object v9

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    move-result-object v9

    invoke-virtual {v6, v9}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 100
    invoke-static {}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->getDefault()Lde/timroes/axmlrpc/serializer/SerializerHandler;

    move-result-object v9

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    move-result-object v9

    invoke-virtual {v8, v9}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 101
    invoke-virtual {v1, v6}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 102
    invoke-virtual {v1, v8}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 103
    invoke-virtual {v7, v1}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V
    :try_end_0
    .catch Lde/timroes/axmlrpc/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 106
    .end local v1    # "entry":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "member":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v6    # "name":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    .end local v8    # "value":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    :catch_0
    move-exception v2

    .line 107
    .local v2, "ex":Lde/timroes/axmlrpc/XMLRPCException;
    new-instance v9, Lde/timroes/axmlrpc/XMLRPCRuntimeException;

    invoke-direct {v9, v2}, Lde/timroes/axmlrpc/XMLRPCRuntimeException;-><init>(Ljava/lang/Exception;)V

    throw v9

    .line 110
    .end local v2    # "ex":Lde/timroes/axmlrpc/XMLRPCException;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-object v7
.end method
