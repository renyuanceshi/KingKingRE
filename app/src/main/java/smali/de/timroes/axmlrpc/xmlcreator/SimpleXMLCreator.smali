.class public Lde/timroes/axmlrpc/xmlcreator/SimpleXMLCreator;
.super Ljava/lang/Object;
.source "SimpleXMLCreator.java"


# instance fields
.field private root:Lde/timroes/axmlrpc/xmlcreator/XmlElement;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setRootElement(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V
    .locals 0
    .param p1, "element"    # Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    .prologue
    .line 19
    iput-object p1, p0, Lde/timroes/axmlrpc/xmlcreator/SimpleXMLCreator;->root:Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    .line 20
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "<?xml version=\"1.0\"?>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lde/timroes/axmlrpc/xmlcreator/SimpleXMLCreator;->root:Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    invoke-virtual {v1}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
