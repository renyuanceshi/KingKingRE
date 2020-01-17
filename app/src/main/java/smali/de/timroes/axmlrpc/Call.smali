.class public Lde/timroes/axmlrpc/Call;
.super Ljava/lang/Object;
.source "Call.java"


# instance fields
.field private method:Ljava/lang/String;

.field private params:[Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lde/timroes/axmlrpc/Call;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lde/timroes/axmlrpc/Call;->method:Ljava/lang/String;

    .line 35
    iput-object p2, p0, Lde/timroes/axmlrpc/Call;->params:[Ljava/lang/Object;

    .line 36
    return-void
.end method

.method private getXMLParam(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 79
    new-instance v0, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v2, "param"

    invoke-direct {v0, v2}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 80
    .local v0, "param":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    new-instance v1, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v2, "value"

    invoke-direct {v1, v2}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 81
    .local v1, "value":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    invoke-virtual {v0, v1}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 82
    invoke-static {}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->getDefault()Lde/timroes/axmlrpc/serializer/SerializerHandler;

    move-result-object v2

    invoke-virtual {v2, p1}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    move-result-object v2

    invoke-virtual {v1, v2}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 83
    return-object v0
.end method


# virtual methods
.method public getXML()Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 50
    new-instance v1, Lde/timroes/axmlrpc/xmlcreator/SimpleXMLCreator;

    invoke-direct {v1}, Lde/timroes/axmlrpc/xmlcreator/SimpleXMLCreator;-><init>()V

    .line 52
    .local v1, "creator":Lde/timroes/axmlrpc/xmlcreator/SimpleXMLCreator;
    new-instance v4, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v8, "methodCall"

    invoke-direct {v4, v8}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 53
    .local v4, "methodCall":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    invoke-virtual {v1, v4}, Lde/timroes/axmlrpc/xmlcreator/SimpleXMLCreator;->setRootElement(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 55
    new-instance v5, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v8, "methodName"

    invoke-direct {v5, v8}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 56
    .local v5, "methodName":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    iget-object v8, p0, Lde/timroes/axmlrpc/Call;->method:Ljava/lang/String;

    invoke-virtual {v5, v8}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->setContent(Ljava/lang/String;)V

    .line 57
    invoke-virtual {v4, v5}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 59
    iget-object v8, p0, Lde/timroes/axmlrpc/Call;->params:[Ljava/lang/Object;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lde/timroes/axmlrpc/Call;->params:[Ljava/lang/Object;

    array-length v8, v8

    if-lez v8, :cond_0

    .line 60
    new-instance v7, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v8, "params"

    invoke-direct {v7, v8}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    .line 61
    .local v7, "params":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    invoke-virtual {v4, v7}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 63
    iget-object v0, p0, Lde/timroes/axmlrpc/Call;->params:[Ljava/lang/Object;

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v6, v0, v2

    .line 64
    .local v6, "o":Ljava/lang/Object;
    invoke-direct {p0, v6}, Lde/timroes/axmlrpc/Call;->getXMLParam(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    move-result-object v8

    invoke-virtual {v7, v8}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;->addChildren(Lde/timroes/axmlrpc/xmlcreator/XmlElement;)V

    .line 63
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 68
    .end local v0    # "arr$":[Ljava/lang/Object;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v6    # "o":Ljava/lang/Object;
    .end local v7    # "params":Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    :cond_0
    invoke-virtual {v1}, Lde/timroes/axmlrpc/xmlcreator/SimpleXMLCreator;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method
