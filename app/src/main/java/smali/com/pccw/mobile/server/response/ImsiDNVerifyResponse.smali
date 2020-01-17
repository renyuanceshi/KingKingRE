.class public Lcom/pccw/mobile/server/response/ImsiDNVerifyResponse;
.super Lcom/pccw/mobile/server/api/ApiResponse;
.source "ImsiDNVerifyResponse.java"


# instance fields
.field public message:Ljava/lang/String;

.field public resultCode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 5
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/ApiResponse;-><init>()V

    .line 6
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/ImsiDNVerifyResponse;->resultCode:Ljava/lang/String;

    .line 7
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/ImsiDNVerifyResponse;->message:Ljava/lang/String;

    return-void
.end method
