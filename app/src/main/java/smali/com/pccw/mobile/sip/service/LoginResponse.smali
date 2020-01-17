.class public Lcom/pccw/mobile/sip/service/LoginResponse;
.super Ljava/lang/Object;
.source "LoginResponse.java"


# instance fields
.field public dn:Ljava/lang/String;

.field public echo_server:Ljava/lang/String;

.field public is_daypass_sub:Z

.field public is_hk:Z

.field public message:Ljava/lang/String;

.field public pwd:Ljava/lang/String;

.field public resultcode:Ljava/lang/String;

.field public session_id:Ljava/lang/String;

.field public sip_domain:Ljava/lang/String;

.field public sip_number:Ljava/lang/String;

.field public sip_port:Ljava/lang/String;

.field public sip_port_ilbc:Ljava/lang/String;

.field public sip_server:Ljava/lang/String;

.field public sip_server_ilbc:Ljava/lang/String;

.field public tunnel_enable:Z

.field public tunnel_host_1:Ljava/lang/String;

.field public tunnel_host_2:Ljava/lang/String;

.field public tunnel_port:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->resultcode:Ljava/lang/String;

    .line 6
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_server:Ljava/lang/String;

    .line 7
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_port:Ljava/lang/String;

    .line 8
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->pwd:Ljava/lang/String;

    .line 9
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->message:Ljava/lang/String;

    .line 11
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_number:Ljava/lang/String;

    .line 12
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->session_id:Ljava/lang/String;

    .line 13
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_host_1:Ljava/lang/String;

    .line 14
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_host_2:Ljava/lang/String;

    .line 15
    const-string/jumbo v0, "443"

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_port:Ljava/lang/String;

    .line 16
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_enable:Z

    .line 17
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_server_ilbc:Ljava/lang/String;

    .line 18
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_port_ilbc:Ljava/lang/String;

    .line 19
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->dn:Ljava/lang/String;

    .line 20
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->is_hk:Z

    .line 21
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->echo_server:Ljava/lang/String;

    .line 22
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/LoginResponse;->is_daypass_sub:Z

    return-void
.end method
