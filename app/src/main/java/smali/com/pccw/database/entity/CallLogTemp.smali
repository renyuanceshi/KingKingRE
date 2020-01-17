.class public Lcom/pccw/database/entity/CallLogTemp;
.super Ljava/lang/Object;
.source "CallLogTemp.java"


# instance fields
.field private callDate:Ljava/lang/String;

.field private callType:Ljava/lang/String;

.field private chatNumber:Ljava/lang/String;

.field private contactNumber:Ljava/lang/String;

.field private duration:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "callType"    # Ljava/lang/String;
    .param p3, "callDate"    # Ljava/lang/String;
    .param p4, "duration"    # Ljava/lang/String;
    .param p5, "contactKey"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/pccw/database/entity/CallLogTemp;->chatNumber:Ljava/lang/String;

    .line 15
    iput-object p2, p0, Lcom/pccw/database/entity/CallLogTemp;->callType:Ljava/lang/String;

    .line 16
    iput-object p3, p0, Lcom/pccw/database/entity/CallLogTemp;->callDate:Ljava/lang/String;

    .line 17
    iput-object p4, p0, Lcom/pccw/database/entity/CallLogTemp;->duration:Ljava/lang/String;

    .line 18
    iput-object p5, p0, Lcom/pccw/database/entity/CallLogTemp;->contactNumber:Ljava/lang/String;

    .line 20
    return-void
.end method


# virtual methods
.method public getCallDate()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/pccw/database/entity/CallLogTemp;->callDate:Ljava/lang/String;

    return-object v0
.end method

.method public getCallType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/pccw/database/entity/CallLogTemp;->callType:Ljava/lang/String;

    return-object v0
.end method

.method public getChatNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/pccw/database/entity/CallLogTemp;->chatNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getContactNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/pccw/database/entity/CallLogTemp;->contactNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getDuration()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/pccw/database/entity/CallLogTemp;->duration:Ljava/lang/String;

    return-object v0
.end method

.method public setCallDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "callDate"    # Ljava/lang/String;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/pccw/database/entity/CallLogTemp;->callDate:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public setCallType(Ljava/lang/String;)V
    .locals 0
    .param p1, "callType"    # Ljava/lang/String;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/pccw/database/entity/CallLogTemp;->callType:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public setChatNumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "chatNumber"    # Ljava/lang/String;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/pccw/database/entity/CallLogTemp;->chatNumber:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public setContactNumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "contactNumber"    # Ljava/lang/String;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/pccw/database/entity/CallLogTemp;->contactNumber:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public setDuration(Ljava/lang/String;)V
    .locals 0
    .param p1, "duration"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/pccw/database/entity/CallLogTemp;->duration:Ljava/lang/String;

    .line 51
    return-void
.end method
