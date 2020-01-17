.class public Lde/timroes/axmlrpc/XMLUtil;
.super Ljava/lang/Object;
.source "XMLUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getOnlyChildElement(Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Element;
    .locals 5
    .param p0, "list"    # Lorg/w3c/dom/NodeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 27
    const/4 v0, 0x0

    .line 29
    .local v0, "e":Lorg/w3c/dom/Element;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_5

    .line 30
    invoke-interface {p0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 32
    .local v2, "n":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    :cond_0
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_2

    .line 29
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 38
    :cond_2
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_3

    .line 39
    new-instance v3, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v4, "Only element nodes allowed."

    invoke-direct {v3, v4}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 43
    :cond_3
    if-eqz v0, :cond_4

    .line 44
    new-instance v3, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v4, "Element has more than one children."

    invoke-direct {v3, v4}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_4
    move-object v0, v2

    .line 47
    check-cast v0, Lorg/w3c/dom/Element;

    goto :goto_1

    .line 51
    .end local v2    # "n":Lorg/w3c/dom/Node;
    :cond_5
    return-object v0
.end method

.method public static getOnlyTextContent(Lorg/w3c/dom/NodeList;)Ljava/lang/String;
    .locals 5
    .param p0, "list"    # Lorg/w3c/dom/NodeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 70
    invoke-interface {p0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 73
    .local v2, "n":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_0

    .line 69
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 77
    :cond_0
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_1

    .line 78
    new-instance v3, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v4, "Element must contain only text elements."

    invoke-direct {v3, v4}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 81
    :cond_1
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 85
    .end local v2    # "n":Lorg/w3c/dom/Node;
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static makeXmlTag(Ljava/lang/String;Ljava/lang/String;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    .locals 1
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 97
    new-instance v0, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    invoke-direct {v0, p0}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 98
    .local v0, "xml":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    invoke-virtual {v0, p1}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->setContent(Ljava/lang/String;)V

    .line 99
    return-object v0
.end method
