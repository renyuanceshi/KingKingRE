.class public Lcom/pccw/mobile/server/response/RoamSaveAuthenResponse;
.super Lcom/pccw/mobile/server/api/ApiResponse;
.source "RoamSaveAuthenResponse.java"


# instance fields
.field public resultcode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 5
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/ApiResponse;-><init>()V

    .line 6
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/RoamSaveAuthenResponse;->resultcode:Ljava/lang/String;

    return-void
.end method
