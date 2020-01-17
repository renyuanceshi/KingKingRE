.class public Lcom/pccw/exception/NoNetworkException;
.super Ljava/lang/Exception;
.source "NoNetworkException.java"


# instance fields
.field message:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/pccw/exception/NoNetworkException;->message:Ljava/lang/String;

    .line 10
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 13
    iget-object v0, p0, Lcom/pccw/exception/NoNetworkException;->message:Ljava/lang/String;

    return-object v0
.end method
