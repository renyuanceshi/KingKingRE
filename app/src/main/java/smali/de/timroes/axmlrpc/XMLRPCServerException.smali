.class public Lde/timroes/axmlrpc/XMLRPCServerException;
.super Lde/timroes/axmlrpc/XMLRPCException;
.source "XMLRPCServerException.java"


# instance fields
.field private errornr:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "ex"    # Ljava/lang/String;
    .param p2, "errnr"    # I

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    .line 15
    iput p2, p0, Lde/timroes/axmlrpc/XMLRPCServerException;->errornr:I

    .line 16
    return-void
.end method


# virtual methods
.method public getErrorNr()I
    .locals 1

    .prologue
    .line 35
    iget v0, p0, Lde/timroes/axmlrpc/XMLRPCServerException;->errornr:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 2

    .prologue
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lde/timroes/axmlrpc/XMLRPCException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lde/timroes/axmlrpc/XMLRPCServerException;->errornr:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
