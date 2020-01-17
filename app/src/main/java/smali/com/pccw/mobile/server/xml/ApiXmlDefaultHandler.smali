.class public abstract Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "ApiXmlDefaultHandler.java"


# instance fields
.field protected resp:Lcom/pccw/mobile/server/api/ApiResponse;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public getResponse()Lcom/pccw/mobile/server/api/ApiResponse;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;->resp:Lcom/pccw/mobile/server/api/ApiResponse;

    return-object v0
.end method

.method public setResponse(Lcom/pccw/mobile/server/api/ApiResponse;)V
    .locals 0
    .param p1, "resp"    # Lcom/pccw/mobile/server/api/ApiResponse;

    .prologue
    .line 12
    iput-object p1, p0, Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;->resp:Lcom/pccw/mobile/server/api/ApiResponse;

    .line 13
    return-void
.end method
