.class public Lde/timroes/axmlrpc/XMLRPCClient;
.super Ljava/lang/Object;
.source "XMLRPCClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/timroes/axmlrpc/XMLRPCClient$1;,
        Lde/timroes/axmlrpc/XMLRPCClient$CancelException;,
        Lde/timroes/axmlrpc/XMLRPCClient$Caller;
    }
.end annotation


# static fields
.field static final CONTENT_LENGTH:Ljava/lang/String; = "Content-Length"

.field static final CONTENT_TYPE:Ljava/lang/String; = "Content-Type"

.field private static final DEFAULT_USER_AGENT:Ljava/lang/String; = "aXMLRPC"

.field static final FAULT:Ljava/lang/String; = "fault"

.field public static final FLAGS_8BYTE_INT:I = 0x2

.field public static final FLAGS_ENABLE_COOKIES:I = 0x4

.field public static final FLAGS_IGNORE_STATUSCODE:I = 0x10

.field public static final FLAGS_NIL:I = 0x8

.field public static final FLAGS_NONE:I = 0x0

.field public static final FLAGS_STRICT:I = 0x1

.field static final HOST:Ljava/lang/String; = "Host"

.field static final HTTP_POST:Ljava/lang/String; = "POST"

.field static final METHOD_CALL:Ljava/lang/String; = "methodCall"

.field static final METHOD_NAME:Ljava/lang/String; = "methodName"

.field static final METHOD_RESPONSE:Ljava/lang/String; = "methodResponse"

.field static final PARAM:Ljava/lang/String; = "param"

.field static final PARAMS:Ljava/lang/String; = "params"

.field static final STRUCT_MEMBER:Ljava/lang/String; = "member"

.field static final TYPE_XML:Ljava/lang/String; = "text/xml"

.field static final USER_AGENT:Ljava/lang/String; = "User-Agent"

.field static final VALUE:Ljava/lang/String; = "value"


# instance fields
.field private authManager:Lde/timroes/axmlrpc/AuthenticationManager;

.field private backgroundCalls:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lde/timroes/axmlrpc/XMLRPCClient$Caller;",
            ">;"
        }
    .end annotation
.end field

.field private cookieManager:Lde/timroes/axmlrpc/CookieManager;

.field private flags:I

.field private httpParameters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private responseParser:Lde/timroes/axmlrpc/ResponseParser;

.field private url:Ljava/net/URL;


# direct methods
.method public constructor <init>(Ljava/net/URL;)V
    .locals 2
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 160
    const-string/jumbo v0, "aXMLRPC"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lde/timroes/axmlrpc/XMLRPCClient;-><init>(Ljava/net/URL;Ljava/lang/String;I)V

    .line 161
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;I)V
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "flags"    # I

    .prologue
    .line 138
    const-string/jumbo v0, "aXMLRPC"

    invoke-direct {p0, p1, v0, p2}, Lde/timroes/axmlrpc/XMLRPCClient;-><init>(Ljava/net/URL;Ljava/lang/String;I)V

    .line 139
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 149
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lde/timroes/axmlrpc/XMLRPCClient;-><init>(Ljava/net/URL;Ljava/lang/String;I)V

    .line 150
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Ljava/lang/String;I)V
    .locals 3
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "userAgent"    # Ljava/lang/String;
    .param p3, "flags"    # I

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->httpParameters:Ljava/util/Map;

    .line 99
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->backgroundCalls:Ljava/util/Map;

    .line 114
    invoke-static {p3}, Lde/timroes/axmlrpc/serializer/SerializerHandler;->initialize(I)V

    .line 116
    iput-object p1, p0, Lde/timroes/axmlrpc/XMLRPCClient;->url:Ljava/net/URL;

    .line 118
    iput p3, p0, Lde/timroes/axmlrpc/XMLRPCClient;->flags:I

    .line 120
    new-instance v0, Lde/timroes/axmlrpc/ResponseParser;

    invoke-direct {v0}, Lde/timroes/axmlrpc/ResponseParser;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->responseParser:Lde/timroes/axmlrpc/ResponseParser;

    .line 122
    new-instance v0, Lde/timroes/axmlrpc/CookieManager;

    invoke-direct {v0, p3}, Lde/timroes/axmlrpc/CookieManager;-><init>(I)V

    iput-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->cookieManager:Lde/timroes/axmlrpc/CookieManager;

    .line 123
    new-instance v0, Lde/timroes/axmlrpc/AuthenticationManager;

    invoke-direct {v0}, Lde/timroes/axmlrpc/AuthenticationManager;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->authManager:Lde/timroes/axmlrpc/AuthenticationManager;

    .line 125
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->httpParameters:Ljava/util/Map;

    const-string/jumbo v1, "Content-Type"

    const-string/jumbo v2, "text/xml"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->httpParameters:Ljava/util/Map;

    const-string/jumbo v1, "User-Agent"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    return-void
.end method

.method static synthetic access$000(Lde/timroes/axmlrpc/XMLRPCClient;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lde/timroes/axmlrpc/XMLRPCClient;

    .prologue
    .line 25
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->backgroundCalls:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$100(Lde/timroes/axmlrpc/XMLRPCClient;Ljava/lang/String;[Ljava/lang/Object;)Lde/timroes/axmlrpc/Call;
    .locals 1
    .param p0, "x0"    # Lde/timroes/axmlrpc/XMLRPCClient;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # [Ljava/lang/Object;

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lde/timroes/axmlrpc/XMLRPCClient;->createCall(Ljava/lang/String;[Ljava/lang/Object;)Lde/timroes/axmlrpc/Call;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lde/timroes/axmlrpc/XMLRPCClient;)Ljava/net/URL;
    .locals 1
    .param p0, "x0"    # Lde/timroes/axmlrpc/XMLRPCClient;

    .prologue
    .line 25
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->url:Ljava/net/URL;

    return-object v0
.end method

.method static synthetic access$300(Lde/timroes/axmlrpc/XMLRPCClient;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lde/timroes/axmlrpc/XMLRPCClient;

    .prologue
    .line 25
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->httpParameters:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$400(Lde/timroes/axmlrpc/XMLRPCClient;)Lde/timroes/axmlrpc/AuthenticationManager;
    .locals 1
    .param p0, "x0"    # Lde/timroes/axmlrpc/XMLRPCClient;

    .prologue
    .line 25
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->authManager:Lde/timroes/axmlrpc/AuthenticationManager;

    return-object v0
.end method

.method static synthetic access$500(Lde/timroes/axmlrpc/XMLRPCClient;)Lde/timroes/axmlrpc/CookieManager;
    .locals 1
    .param p0, "x0"    # Lde/timroes/axmlrpc/XMLRPCClient;

    .prologue
    .line 25
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->cookieManager:Lde/timroes/axmlrpc/CookieManager;

    return-object v0
.end method

.method static synthetic access$600(Lde/timroes/axmlrpc/XMLRPCClient;I)Z
    .locals 1
    .param p0, "x0"    # Lde/timroes/axmlrpc/XMLRPCClient;
    .param p1, "x1"    # I

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lde/timroes/axmlrpc/XMLRPCClient;->isFlagSet(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lde/timroes/axmlrpc/XMLRPCClient;)Lde/timroes/axmlrpc/ResponseParser;
    .locals 1
    .param p0, "x0"    # Lde/timroes/axmlrpc/XMLRPCClient;

    .prologue
    .line 25
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->responseParser:Lde/timroes/axmlrpc/ResponseParser;

    return-object v0
.end method

.method private createCall(Ljava/lang/String;[Ljava/lang/Object;)Lde/timroes/axmlrpc/Call;
    .locals 2
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 484
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lde/timroes/axmlrpc/XMLRPCClient;->isFlagSet(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "^[A-Za-z0-9\\._:/]*$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 485
    new-instance v0, Lde/timroes/axmlrpc/XMLRPCRuntimeException;

    const-string/jumbo v1, "Method name must only contain A-Z a-z . : _ / "

    invoke-direct {v0, v1}, Lde/timroes/axmlrpc/XMLRPCRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 488
    :cond_0
    new-instance v0, Lde/timroes/axmlrpc/Call;

    invoke-direct {v0, p1, p2}, Lde/timroes/axmlrpc/Call;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method private isFlagSet(I)Z
    .locals 1
    .param p1, "flag"    # I

    .prologue
    .line 499
    iget v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->flags:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public call(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 242
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/timroes/axmlrpc/XMLRPCClient;->call(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "param1"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 260
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-virtual {p0, p1, v0}, Lde/timroes/axmlrpc/XMLRPCClient;->call(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "param1"    # Ljava/lang/Object;
    .param p3, "param2"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 279
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    invoke-virtual {p0, p1, v0}, Lde/timroes/axmlrpc/XMLRPCClient;->call(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "param1"    # Ljava/lang/Object;
    .param p3, "param2"    # Ljava/lang/Object;
    .param p4, "param3"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 300
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    const/4 v1, 0x2

    aput-object p4, v0, v1

    invoke-virtual {p0, p1, v0}, Lde/timroes/axmlrpc/XMLRPCClient;->call(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "param1"    # Ljava/lang/Object;
    .param p3, "param2"    # Ljava/lang/Object;
    .param p4, "param3"    # Ljava/lang/Object;
    .param p5, "param4"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 322
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    const/4 v1, 0x2

    aput-object p4, v0, v1

    const/4 v1, 0x3

    aput-object p5, v0, v1

    invoke-virtual {p0, p1, v0}, Lde/timroes/axmlrpc/XMLRPCClient;->call(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public call(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 225
    new-instance v0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;

    invoke-direct {v0, p0}, Lde/timroes/axmlrpc/XMLRPCClient$Caller;-><init>(Lde/timroes/axmlrpc/XMLRPCClient;)V

    invoke-virtual {v0, p1, p2}, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->call(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public callAsync(Lde/timroes/axmlrpc/XMLRPCCallback;Ljava/lang/String;)J
    .locals 2
    .param p1, "listener"    # Lde/timroes/axmlrpc/XMLRPCCallback;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 362
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lde/timroes/axmlrpc/XMLRPCClient;->callAsync(Lde/timroes/axmlrpc/XMLRPCCallback;Ljava/lang/String;[Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public callAsync(Lde/timroes/axmlrpc/XMLRPCCallback;Ljava/lang/String;Ljava/lang/Object;)J
    .locals 2
    .param p1, "listener"    # Lde/timroes/axmlrpc/XMLRPCCallback;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "param1"    # Ljava/lang/Object;

    .prologue
    .line 381
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    invoke-virtual {p0, p1, p2, v0}, Lde/timroes/axmlrpc/XMLRPCClient;->callAsync(Lde/timroes/axmlrpc/XMLRPCCallback;Ljava/lang/String;[Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public callAsync(Lde/timroes/axmlrpc/XMLRPCCallback;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)J
    .locals 2
    .param p1, "listener"    # Lde/timroes/axmlrpc/XMLRPCCallback;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "param1"    # Ljava/lang/Object;
    .param p4, "param2"    # Ljava/lang/Object;

    .prologue
    .line 402
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    const/4 v1, 0x1

    aput-object p4, v0, v1

    invoke-virtual {p0, p1, p2, v0}, Lde/timroes/axmlrpc/XMLRPCClient;->callAsync(Lde/timroes/axmlrpc/XMLRPCCallback;Ljava/lang/String;[Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public callAsync(Lde/timroes/axmlrpc/XMLRPCCallback;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)J
    .locals 2
    .param p1, "listener"    # Lde/timroes/axmlrpc/XMLRPCCallback;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "param1"    # Ljava/lang/Object;
    .param p4, "param2"    # Ljava/lang/Object;
    .param p5, "param3"    # Ljava/lang/Object;

    .prologue
    .line 424
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    const/4 v1, 0x1

    aput-object p4, v0, v1

    const/4 v1, 0x2

    aput-object p5, v0, v1

    invoke-virtual {p0, p1, p2, v0}, Lde/timroes/axmlrpc/XMLRPCClient;->callAsync(Lde/timroes/axmlrpc/XMLRPCCallback;Ljava/lang/String;[Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public callAsync(Lde/timroes/axmlrpc/XMLRPCCallback;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)J
    .locals 2
    .param p1, "listener"    # Lde/timroes/axmlrpc/XMLRPCCallback;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "param1"    # Ljava/lang/Object;
    .param p4, "param2"    # Ljava/lang/Object;
    .param p5, "param3"    # Ljava/lang/Object;
    .param p6, "param4"    # Ljava/lang/Object;

    .prologue
    .line 447
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    const/4 v1, 0x1

    aput-object p4, v0, v1

    const/4 v1, 0x2

    aput-object p5, v0, v1

    const/4 v1, 0x3

    aput-object p6, v0, v1

    invoke-virtual {p0, p1, p2, v0}, Lde/timroes/axmlrpc/XMLRPCClient;->callAsync(Lde/timroes/axmlrpc/XMLRPCCallback;Ljava/lang/String;[Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public callAsync(Lde/timroes/axmlrpc/XMLRPCCallback;Ljava/lang/String;[Ljava/lang/Object;)J
    .locals 8
    .param p1, "listener"    # Lde/timroes/axmlrpc/XMLRPCCallback;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "params"    # [Ljava/lang/Object;

    .prologue
    .line 342
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 343
    .local v4, "id":J
    new-instance v1, Lde/timroes/axmlrpc/XMLRPCClient$Caller;

    move-object v2, p0

    move-object v3, p1

    move-object v6, p2

    move-object v7, p3

    invoke-direct/range {v1 .. v7}, Lde/timroes/axmlrpc/XMLRPCClient$Caller;-><init>(Lde/timroes/axmlrpc/XMLRPCClient;Lde/timroes/axmlrpc/XMLRPCCallback;JLjava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v1}, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->start()V

    .line 344
    return-wide v4
.end method

.method public cancel(J)V
    .locals 3
    .param p1, "id"    # J

    .prologue
    .line 458
    iget-object v1, p0, Lde/timroes/axmlrpc/XMLRPCClient;->backgroundCalls:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;

    .line 459
    .local v0, "cancel":Lde/timroes/axmlrpc/XMLRPCClient$Caller;
    if-nez v0, :cond_0

    .line 473
    :goto_0
    return-void

    .line 464
    :cond_0
    invoke-virtual {v0}, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->cancel()V

    .line 468
    :try_start_0
    invoke-virtual {v0}, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 469
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public clearCookies()V
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->cookieManager:Lde/timroes/axmlrpc/CookieManager;

    invoke-virtual {v0}, Lde/timroes/axmlrpc/CookieManager;->clearCookies()V

    .line 208
    return-void
.end method

.method public setCustomHttpHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "headerName"    # Ljava/lang/String;
    .param p2, "headerValue"    # Ljava/lang/String;

    .prologue
    .line 183
    const-string/jumbo v0, "Content-Type"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "Host"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "Content-Length"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 185
    :cond_0
    new-instance v0, Lde/timroes/axmlrpc/XMLRPCRuntimeException;

    const-string/jumbo v1, "You cannot modify the Host, Content-Type or Content-Length header."

    invoke-direct {v0, v1}, Lde/timroes/axmlrpc/XMLRPCRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 187
    :cond_1
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->httpParameters:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    return-void
.end method

.method public setLoginData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "pass"    # Ljava/lang/String;

    .prologue
    .line 198
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->authManager:Lde/timroes/axmlrpc/AuthenticationManager;

    invoke-virtual {v0, p1, p2}, Lde/timroes/axmlrpc/AuthenticationManager;->setAuthData(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    return-void
.end method

.method public setUserAgentString(Ljava/lang/String;)V
    .locals 2
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 171
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient;->httpParameters:Ljava/util/Map;

    const-string/jumbo v1, "User-Agent"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    return-void
.end method
