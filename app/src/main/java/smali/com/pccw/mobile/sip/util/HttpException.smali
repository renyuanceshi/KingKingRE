.class public Lcom/pccw/mobile/sip/util/HttpException;
.super Ljava/lang/RuntimeException;
.source "HttpException.java"


# instance fields
.field public httpStatusCode:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "httpStatusCode"    # I

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 9
    iput p1, p0, Lcom/pccw/mobile/sip/util/HttpException;->httpStatusCode:I

    .line 10
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "httpStatusCode"    # I
    .param p2, "detailMessage"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct {p0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 19
    iput p1, p0, Lcom/pccw/mobile/sip/util/HttpException;->httpStatusCode:I

    .line 20
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "httpStatusCode"    # I
    .param p2, "detailMessage"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 13
    invoke-direct {p0, p2, p3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 14
    iput p1, p0, Lcom/pccw/mobile/sip/util/HttpException;->httpStatusCode:I

    .line 15
    return-void
.end method

.method public constructor <init>(ILjava/lang/Throwable;)V
    .locals 0
    .param p1, "httpStatusCode"    # I
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 23
    invoke-direct {p0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 24
    iput p1, p0, Lcom/pccw/mobile/sip/util/HttpException;->httpStatusCode:I

    .line 25
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/RuntimeException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/pccw/mobile/sip/util/HttpException;->httpStatusCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
