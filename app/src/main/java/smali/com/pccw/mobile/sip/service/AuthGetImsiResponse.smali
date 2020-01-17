.class public Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;
.super Ljava/lang/Object;
.source "AuthGetImsiResponse.java"


# instance fields
.field public encryptedImsi:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;->resultcode:Ljava/lang/String;

    .line 6
    iput-object v0, p0, Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;->message:Ljava/lang/String;

    .line 7
    iput-object v0, p0, Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;->encryptedImsi:Ljava/lang/String;

    return-void
.end method
