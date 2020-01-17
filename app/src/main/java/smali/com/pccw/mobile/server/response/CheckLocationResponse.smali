.class public Lcom/pccw/mobile/server/response/CheckLocationResponse;
.super Lcom/pccw/mobile/server/api/ApiResponse;
.source "CheckLocationResponse.java"


# instance fields
.field public country:Ljava/lang/String;

.field public isHK:Ljava/lang/String;

.field public resultCode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 5
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/ApiResponse;-><init>()V

    .line 6
    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckLocationResponse;->resultCode:Ljava/lang/String;

    .line 8
    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckLocationResponse;->country:Ljava/lang/String;

    .line 10
    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckLocationResponse;->isHK:Ljava/lang/String;

    return-void
.end method
