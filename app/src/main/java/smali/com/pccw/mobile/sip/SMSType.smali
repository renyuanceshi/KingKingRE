.class public Lcom/pccw/mobile/sip/SMSType;
.super Ljava/lang/Object;
.source "SMSType.java"


# instance fields
.field public msisdn:Ljava/lang/String;

.field public type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSType;->msisdn:Ljava/lang/String;

    .line 5
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSType;->type:Ljava/lang/String;

    .line 7
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "msisdnString"    # Ljava/lang/String;
    .param p2, "typeString"    # Ljava/lang/String;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSType;->msisdn:Ljava/lang/String;

    .line 5
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSType;->type:Ljava/lang/String;

    .line 10
    iput-object p1, p0, Lcom/pccw/mobile/sip/SMSType;->msisdn:Ljava/lang/String;

    .line 11
    iput-object p2, p0, Lcom/pccw/mobile/sip/SMSType;->type:Ljava/lang/String;

    .line 12
    return-void
.end method
