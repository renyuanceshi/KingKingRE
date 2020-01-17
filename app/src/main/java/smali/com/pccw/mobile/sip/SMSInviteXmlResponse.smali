.class public Lcom/pccw/mobile/sip/SMSInviteXmlResponse;
.super Ljava/lang/Object;
.source "SMSInviteXmlResponse.java"


# instance fields
.field public message:Ljava/lang/String;

.field public resultcode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteXmlResponse;->message:Ljava/lang/String;

    .line 6
    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteXmlResponse;->resultcode:Ljava/lang/String;

    return-void
.end method
