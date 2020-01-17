.class public Lcom/pccw/database/entity/AllHistoryTemp;
.super Ljava/lang/Object;
.source "AllHistoryTemp.java"


# instance fields
.field private cached_name:Ljava/lang/String;

.field private cached_number_label:Ljava/lang/String;

.field private cached_number_type:Ljava/lang/String;

.field private chatnumber:Ljava/lang/String;

.field private contactnumber:Ljava/lang/String;

.field private date:Ljava/lang/String;

.field private duration:Ljava/lang/String;

.field private type:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "chatnumber"    # Ljava/lang/String;
    .param p2, "type"    # I
    .param p3, "date"    # Ljava/lang/String;
    .param p4, "duration"    # Ljava/lang/String;
    .param p5, "cached_name"    # Ljava/lang/String;
    .param p6, "cached_number_type"    # Ljava/lang/String;
    .param p7, "cached_number_label"    # Ljava/lang/String;
    .param p8, "contactnumber"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/pccw/database/entity/AllHistoryTemp;->chatnumber:Ljava/lang/String;

    .line 16
    iput p2, p0, Lcom/pccw/database/entity/AllHistoryTemp;->type:I

    .line 17
    iput-object p3, p0, Lcom/pccw/database/entity/AllHistoryTemp;->date:Ljava/lang/String;

    .line 18
    iput-object p4, p0, Lcom/pccw/database/entity/AllHistoryTemp;->duration:Ljava/lang/String;

    .line 19
    iput-object p5, p0, Lcom/pccw/database/entity/AllHistoryTemp;->cached_name:Ljava/lang/String;

    .line 20
    iput-object p6, p0, Lcom/pccw/database/entity/AllHistoryTemp;->cached_number_type:Ljava/lang/String;

    .line 21
    iput-object p7, p0, Lcom/pccw/database/entity/AllHistoryTemp;->cached_number_label:Ljava/lang/String;

    .line 22
    iput-object p8, p0, Lcom/pccw/database/entity/AllHistoryTemp;->contactnumber:Ljava/lang/String;

    .line 23
    return-void
.end method


# virtual methods
.method public getCached_name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/pccw/database/entity/AllHistoryTemp;->cached_name:Ljava/lang/String;

    return-object v0
.end method

.method public getCached_number_label()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/pccw/database/entity/AllHistoryTemp;->cached_number_label:Ljava/lang/String;

    return-object v0
.end method

.method public getCached_number_type()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/pccw/database/entity/AllHistoryTemp;->cached_number_type:Ljava/lang/String;

    return-object v0
.end method

.method public getChatnumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/pccw/database/entity/AllHistoryTemp;->chatnumber:Ljava/lang/String;

    return-object v0
.end method

.method public getContactNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/pccw/database/entity/AllHistoryTemp;->contactnumber:Ljava/lang/String;

    return-object v0
.end method

.method public getDate()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/pccw/database/entity/AllHistoryTemp;->date:Ljava/lang/String;

    return-object v0
.end method

.method public getDuration()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/pccw/database/entity/AllHistoryTemp;->duration:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lcom/pccw/database/entity/AllHistoryTemp;->type:I

    return v0
.end method

.method public setCached_name(Ljava/lang/String;)V
    .locals 0
    .param p1, "cached_name"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/pccw/database/entity/AllHistoryTemp;->cached_name:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public setCached_number_label(Ljava/lang/String;)V
    .locals 0
    .param p1, "cached_number_label"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/pccw/database/entity/AllHistoryTemp;->cached_number_label:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public setCached_number_type(Ljava/lang/String;)V
    .locals 0
    .param p1, "cached_number_type"    # Ljava/lang/String;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/pccw/database/entity/AllHistoryTemp;->cached_number_type:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public setChatnumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "chatnumber"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/pccw/database/entity/AllHistoryTemp;->chatnumber:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public setContactNumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "contactnumber"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/pccw/database/entity/AllHistoryTemp;->contactnumber:Ljava/lang/String;

    .line 87
    return-void
.end method

.method public setDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "date"    # Ljava/lang/String;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/pccw/database/entity/AllHistoryTemp;->date:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public setDuration(Ljava/lang/String;)V
    .locals 0
    .param p1, "duration"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/pccw/database/entity/AllHistoryTemp;->duration:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public setType(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 54
    iput p1, p0, Lcom/pccw/database/entity/AllHistoryTemp;->type:I

    .line 55
    return-void
.end method
