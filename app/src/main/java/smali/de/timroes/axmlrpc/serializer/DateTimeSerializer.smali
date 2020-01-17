.class public Lde/timroes/axmlrpc/serializer/DateTimeSerializer;
.super Ljava/lang/Object;
.source "DateTimeSerializer.java"

# interfaces
.implements Lde/timroes/axmlrpc/serializer/Serializer;


# static fields
.field private static final DATETIME_FORMAT:Ljava/lang/String; = "yyyyMMdd\'T\'HH:mm:ss"

.field private static final DATE_FORMATER:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 17
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyyMMdd\'T\'HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lde/timroes/axmlrpc/serializer/DateTimeSerializer;->DATE_FORMATER:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lorg/w3c/dom/Element;)Ljava/lang/Object;
    .locals 3
    .param p1, "content"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 21
    :try_start_0
    sget-object v1, Lde/timroes/axmlrpc/serializer/DateTimeSerializer;->DATE_FORMATER:Ljava/text/SimpleDateFormat;

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-static {v2}, Lde/timroes/axmlrpc/XMLUtil;->getOnlyTextContent(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 22
    :catch_0
    move-exception v0

    .line 23
    .local v0, "ex":Ljava/text/ParseException;
    new-instance v1, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v2, "Unable to parse given date."

    invoke-direct {v1, v2, v0}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 28
    const-string/jumbo v0, "dateTime.iso8601"

    sget-object v1, Lde/timroes/axmlrpc/serializer/DateTimeSerializer;->DATE_FORMATER:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lde/timroes/axmlrpc/XMLUtil;->makeXmlTag(Ljava/lang/String;Ljava/lang/String;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    move-result-object v0

    return-object v0
.end method
