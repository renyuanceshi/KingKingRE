.class public Lorg/linphone/LinphoneConfigException;
.super Lorg/linphone/LinphoneException;
.source "LinphoneConfigException.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/linphone/LinphoneException;-><init>()V

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "detailMessage"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/linphone/LinphoneException;-><init>(Ljava/lang/String;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "detailMessage"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Lorg/linphone/LinphoneException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lorg/linphone/LinphoneException;-><init>(Ljava/lang/Throwable;)V

    .line 39
    return-void
.end method
