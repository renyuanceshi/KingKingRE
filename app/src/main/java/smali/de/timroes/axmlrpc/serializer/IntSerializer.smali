.class public Lde/timroes/axmlrpc/serializer/IntSerializer;
.super Ljava/lang/Object;
.source "IntSerializer.java"

# interfaces
.implements Lde/timroes/axmlrpc/serializer/Serializer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lorg/w3c/dom/Element;)Ljava/lang/Object;
    .locals 1
    .param p1, "content"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 15
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-static {v0}, Lde/timroes/axmlrpc/XMLUtil;->getOnlyTextContent(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 19
    const-string/jumbo v0, "int"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lde/timroes/axmlrpc/XMLUtil;->makeXmlTag(Ljava/lang/String;Ljava/lang/String;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    move-result-object v0

    return-object v0
.end method
