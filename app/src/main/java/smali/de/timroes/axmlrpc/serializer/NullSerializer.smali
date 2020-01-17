.class public Lde/timroes/axmlrpc/serializer/NullSerializer;
.super Ljava/lang/Object;
.source "NullSerializer.java"

# interfaces
.implements Lde/timroes/axmlrpc/serializer/Serializer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
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
    .line 14
    const/4 v0, 0x0

    return-object v0
.end method

.method public serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 18
    new-instance v0, Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    const-string/jumbo v1, "nil"

    invoke-direct {v0, v1}, Lde/timroes/axmlrpc/xmlcreator/XmlElement;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
