.class public final Lorg/linphone/core/Log;
.super Ljava/lang/Object;
.source "Log.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "PCCW_MOBILE_SIP"

.field private static final useIsLoggable:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs d(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 1
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 66
    const/4 v0, 0x3

    invoke-static {v0}, Lorg/linphone/core/Log;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    :cond_0
    return-void
.end method

.method public static varargs d([Ljava/lang/Object;)V
    .locals 1
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 59
    const/4 v0, 0x3

    invoke-static {v0}, Lorg/linphone/core/Log;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    :cond_0
    return-void
.end method

.method public static varargs e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 1
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 94
    const/4 v0, 0x6

    invoke-static {v0}, Lorg/linphone/core/Log;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    :cond_0
    return-void
.end method

.method public static varargs e([Ljava/lang/Object;)V
    .locals 1
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 87
    const/4 v0, 0x6

    invoke-static {v0}, Lorg/linphone/core/Log;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    :cond_0
    return-void
.end method

.method public static varargs f(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 3
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 114
    const/4 v0, 0x6

    invoke-static {v0}, Lorg/linphone/core/Log;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    const-string/jumbo v0, "PCCW_MOBILE_SIP"

    invoke-static {p1}, Lorg/linphone/core/Log;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 116
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Fatal error : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lorg/linphone/core/Log;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 118
    :cond_0
    return-void
.end method

.method public static varargs f([Ljava/lang/Object;)V
    .locals 3
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 104
    const/4 v0, 0x6

    invoke-static {v0}, Lorg/linphone/core/Log;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    const-string/jumbo v0, "PCCW_MOBILE_SIP"

    invoke-static {p0}, Lorg/linphone/core/Log;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Fatal error : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Lorg/linphone/core/Log;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_0
    return-void
.end method

.method public static varargs i(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 1
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 52
    const/4 v0, 0x4

    invoke-static {v0}, Lorg/linphone/core/Log;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    :cond_0
    return-void
.end method

.method public static varargs i([Ljava/lang/Object;)V
    .locals 1
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 45
    const/4 v0, 0x4

    invoke-static {v0}, Lorg/linphone/core/Log;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    :cond_0
    return-void
.end method

.method private static isLoggable(I)Z
    .locals 1
    .param p0, "level"    # I

    .prologue
    .line 41
    const/4 v0, 0x1

    return v0
.end method

.method private static varargs toString([Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 121
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .local v1, "sb":Ljava/lang/StringBuilder;
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v0, p0, v2

    .line 123
    .local v0, "o":Ljava/lang/Object;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 122
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 125
    .end local v0    # "o":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static varargs w(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 1
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 80
    const/4 v0, 0x5

    invoke-static {v0}, Lorg/linphone/core/Log;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 84
    :cond_0
    return-void
.end method

.method public static varargs w([Ljava/lang/Object;)V
    .locals 1
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 73
    const/4 v0, 0x5

    invoke-static {v0}, Lorg/linphone/core/Log;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    :cond_0
    return-void
.end method
