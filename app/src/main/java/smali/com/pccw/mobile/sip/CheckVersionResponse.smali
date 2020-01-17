.class public Lcom/pccw/mobile/sip/CheckVersionResponse;
.super Ljava/lang/Object;
.source "CheckVersionResponse.java"


# instance fields
.field public app_link:Ljava/lang/String;

.field public app_version:Ljava/lang/String;

.field public message:Ljava/lang/String;

.field public msg_url:Ljava/lang/String;

.field public msg_url_1010:Ljava/lang/String;

.field public msg_url_csl_prepaid:Ljava/lang/String;

.field public msg_url_one2free:Ljava/lang/String;

.field public msg_version:Ljava/lang/String;

.field public msg_version_1010:Ljava/lang/String;

.field public msg_version_csl_prepaid:Ljava/lang/String;

.field public msg_version_one2free:Ljava/lang/String;

.field public resultcode:Ljava/lang/String;

.field public t_and_c_url_c:Ljava/lang/String;

.field public t_and_c_url_c_1010:Ljava/lang/String;

.field public t_and_c_url_c_csl_prepaid:Ljava/lang/String;

.field public t_and_c_url_c_one2free:Ljava/lang/String;

.field public t_and_c_url_c_prepaid:Ljava/lang/String;

.field public t_and_c_url_e:Ljava/lang/String;

.field public t_and_c_url_e_1010:Ljava/lang/String;

.field public t_and_c_url_e_csl_prepaid:Ljava/lang/String;

.field public t_and_c_url_e_one2free:Ljava/lang/String;

.field public t_and_c_url_e_prepaid:Ljava/lang/String;

.field public t_and_c_version:Ljava/lang/String;

.field public t_and_c_version_1010:Ljava/lang/String;

.field public t_and_c_version_csl_prepaid:Ljava/lang/String;

.field public t_and_c_version_one2free:Ljava/lang/String;

.field public t_and_c_version_prepaid:Ljava/lang/String;

.field public timestamp:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->resultcode:Ljava/lang/String;

    .line 6
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->app_version:Ljava/lang/String;

    .line 7
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->app_link:Ljava/lang/String;

    .line 8
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version:Ljava/lang/String;

    .line 9
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c:Ljava/lang/String;

    .line 10
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e:Ljava/lang/String;

    .line 11
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_prepaid:Ljava/lang/String;

    .line 12
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_prepaid:Ljava/lang/String;

    .line 13
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_prepaid:Ljava/lang/String;

    .line 14
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_one2free:Ljava/lang/String;

    .line 15
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_one2free:Ljava/lang/String;

    .line 16
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_one2free:Ljava/lang/String;

    .line 17
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_1010:Ljava/lang/String;

    .line 18
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_1010:Ljava/lang/String;

    .line 19
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_1010:Ljava/lang/String;

    .line 20
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_csl_prepaid:Ljava/lang/String;

    .line 21
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_csl_prepaid:Ljava/lang/String;

    .line 22
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_csl_prepaid:Ljava/lang/String;

    .line 23
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version:Ljava/lang/String;

    .line 24
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version_one2free:Ljava/lang/String;

    .line 25
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version_1010:Ljava/lang/String;

    .line 26
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version_csl_prepaid:Ljava/lang/String;

    .line 27
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url:Ljava/lang/String;

    .line 28
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url_one2free:Ljava/lang/String;

    .line 29
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url_1010:Ljava/lang/String;

    .line 30
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url_csl_prepaid:Ljava/lang/String;

    .line 31
    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->message:Ljava/lang/String;

    .line 32
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->timestamp:J

    return-void
.end method
