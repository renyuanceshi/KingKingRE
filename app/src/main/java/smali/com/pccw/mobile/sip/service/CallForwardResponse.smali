.class public Lcom/pccw/mobile/sip/service/CallForwardResponse;
.super Ljava/lang/Object;
.source "CallForwardResponse.java"


# instance fields
.field public fw_number:Ljava/lang/String;

.field public fw_status:Ljava/lang/String;

.field public message:Ljava/lang/String;

.field public resultCode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput-object v0, p0, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    .line 6
    iput-object v0, p0, Lcom/pccw/mobile/sip/service/CallForwardResponse;->fw_status:Ljava/lang/String;

    .line 7
    iput-object v0, p0, Lcom/pccw/mobile/sip/service/CallForwardResponse;->fw_number:Ljava/lang/String;

    .line 8
    iput-object v0, p0, Lcom/pccw/mobile/sip/service/CallForwardResponse;->message:Ljava/lang/String;

    return-void
.end method
