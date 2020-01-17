.class public Lcom/pccw/mobile/server/response/IMRegistrationResponse;
.super Lcom/pccw/mobile/server/api/ApiResponse;
.source "IMRegistrationResponse.java"


# instance fields
.field public host:Ljava/lang/String;

.field public loginID:Ljava/lang/String;

.field public password:Ljava/lang/String;

.field public port:Ljava/lang/String;

.field public resultCode:Ljava/lang/String;

.field public resultDescription:Ljava/lang/String;

.field public xmppDomain:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 5
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/ApiResponse;-><init>()V

    .line 6
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/IMRegistrationResponse;->resultCode:Ljava/lang/String;

    .line 7
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/IMRegistrationResponse;->resultDescription:Ljava/lang/String;

    .line 8
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/IMRegistrationResponse;->loginID:Ljava/lang/String;

    .line 9
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/IMRegistrationResponse;->password:Ljava/lang/String;

    .line 10
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/IMRegistrationResponse;->host:Ljava/lang/String;

    .line 11
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/IMRegistrationResponse;->port:Ljava/lang/String;

    .line 12
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/IMRegistrationResponse;->xmppDomain:Ljava/lang/String;

    return-void
.end method
