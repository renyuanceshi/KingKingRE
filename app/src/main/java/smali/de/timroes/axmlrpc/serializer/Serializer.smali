.class public interface abstract Lde/timroes/axmlrpc/serializer/Serializer;
.super Ljava/lang/Object;
.source "Serializer.java"


# virtual methods
.method public abstract deserialize(Lorg/w3c/dom/Element;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation
.end method

.method public abstract serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;
.end method
