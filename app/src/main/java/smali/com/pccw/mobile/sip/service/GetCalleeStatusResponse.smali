.class public Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;
.super Ljava/lang/Object;
.source "GetCalleeStatusResponse.java"


# instance fields
.field public resultCode:Ljava/lang/String;

.field public sip_number:Ljava/lang/String;

.field public status:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;->resultCode:Ljava/lang/String;

    .line 6
    iput-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;->status:Ljava/lang/String;

    .line 7
    iput-object v0, p0, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;->sip_number:Ljava/lang/String;

    return-void
.end method
