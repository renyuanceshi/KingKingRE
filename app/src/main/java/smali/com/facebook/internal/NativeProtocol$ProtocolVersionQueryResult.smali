.class public Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;
.super Ljava/lang/Object;
.source "NativeProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/NativeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProtocolVersionQueryResult"
.end annotation


# instance fields
.field private nativeAppInfo:Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

.field private protocolVersion:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 972
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 973
    return-void
.end method

.method static synthetic access$600(Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;)Lcom/facebook/internal/NativeProtocol$NativeAppInfo;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;

    .prologue
    .line 951
    iget-object v0, p0, Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;->nativeAppInfo:Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    return-object v0
.end method

.method static synthetic access$700(Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;)I
    .locals 1
    .param p0, "x0"    # Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;

    .prologue
    .line 951
    iget v0, p0, Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;->protocolVersion:I

    return v0
.end method

.method public static create(Lcom/facebook/internal/NativeProtocol$NativeAppInfo;I)Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;
    .locals 1
    .param p0, "nativeAppInfo"    # Lcom/facebook/internal/NativeProtocol$NativeAppInfo;
    .param p1, "protocolVersion"    # I

    .prologue
    .line 958
    new-instance v0, Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;

    invoke-direct {v0}, Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;-><init>()V

    .line 959
    .local v0, "result":Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;
    iput-object p0, v0, Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;->nativeAppInfo:Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    .line 960
    iput p1, v0, Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;->protocolVersion:I

    .line 962
    return-object v0
.end method

.method public static createEmpty()Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;
    .locals 2

    .prologue
    .line 966
    new-instance v0, Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;

    invoke-direct {v0}, Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;-><init>()V

    .line 967
    .local v0, "result":Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;
    const/4 v1, -0x1

    iput v1, v0, Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;->protocolVersion:I

    .line 969
    return-object v0
.end method


# virtual methods
.method public getAppInfo()Lcom/facebook/internal/NativeProtocol$NativeAppInfo;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 976
    iget-object v0, p0, Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;->nativeAppInfo:Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    return-object v0
.end method

.method public getProtocolVersion()I
    .locals 1

    .prologue
    .line 980
    iget v0, p0, Lcom/facebook/internal/NativeProtocol$ProtocolVersionQueryResult;->protocolVersion:I

    return v0
.end method
