.class public Lcom/pccw/database/entity/KKSMSType;
.super Ljava/lang/Object;
.source "KKSMSType.java"


# instance fields
.field private msisdn:Ljava/lang/String;

.field private smsType:Ljava/lang/String;

.field private updateTime:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "msisdnString"    # Ljava/lang/String;
    .param p2, "smsTypeString"    # Ljava/lang/String;
    .param p3, "updateTimeString"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/pccw/database/entity/KKSMSType;->msisdn:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lcom/pccw/database/entity/KKSMSType;->smsType:Ljava/lang/String;

    .line 14
    iput-object p3, p0, Lcom/pccw/database/entity/KKSMSType;->updateTime:Ljava/lang/String;

    .line 15
    return-void
.end method


# virtual methods
.method public getMsisdn()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/pccw/database/entity/KKSMSType;->msisdn:Ljava/lang/String;

    return-object v0
.end method

.method public getSmsType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/pccw/database/entity/KKSMSType;->smsType:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdateTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/pccw/database/entity/KKSMSType;->updateTime:Ljava/lang/String;

    return-object v0
.end method

.method public setMsisdn(Ljava/lang/String;)V
    .locals 0
    .param p1, "msisdn"    # Ljava/lang/String;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/pccw/database/entity/KKSMSType;->msisdn:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public setSmsType(Ljava/lang/String;)V
    .locals 0
    .param p1, "smsType"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/pccw/database/entity/KKSMSType;->smsType:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public setUpdateTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "updateTime"    # Ljava/lang/String;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/pccw/database/entity/KKSMSType;->updateTime:Ljava/lang/String;

    .line 39
    return-void
.end method
