.class public final Lorg/linphone/mediastream/Log;
.super Ljava/lang/Object;
.source "Log.java"


# static fields
.field private static logger:Lorg/linphone/mediastream/Log;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "enable"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method private native d(Ljava/lang/String;)V
.end method

.method public static varargs d([Ljava/lang/Object;)V
    .locals 2
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 41
    invoke-static {}, Lorg/linphone/mediastream/Log;->instance()Lorg/linphone/mediastream/Log;

    move-result-object v0

    invoke-static {p0}, Lorg/linphone/mediastream/Log;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/linphone/mediastream/Log;->d(Ljava/lang/String;)V

    .line 42
    return-void
.end method

.method private native e(Ljava/lang/String;)V
.end method

.method public static varargs e([Ljava/lang/Object;)V
    .locals 2
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 56
    invoke-static {}, Lorg/linphone/mediastream/Log;->instance()Lorg/linphone/mediastream/Log;

    move-result-object v0

    invoke-static {p0}, Lorg/linphone/mediastream/Log;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/linphone/mediastream/Log;->e(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method private native i(Ljava/lang/String;)V
.end method

.method public static varargs i([Ljava/lang/Object;)V
    .locals 2
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 46
    invoke-static {}, Lorg/linphone/mediastream/Log;->instance()Lorg/linphone/mediastream/Log;

    move-result-object v0

    invoke-static {p0}, Lorg/linphone/mediastream/Log;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/linphone/mediastream/Log;->i(Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method private static instance()Lorg/linphone/mediastream/Log;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lorg/linphone/mediastream/Log;->logger:Lorg/linphone/mediastream/Log;

    if-nez v0, :cond_0

    .line 25
    new-instance v0, Lorg/linphone/mediastream/Log;

    invoke-direct {v0}, Lorg/linphone/mediastream/Log;-><init>()V

    sput-object v0, Lorg/linphone/mediastream/Log;->logger:Lorg/linphone/mediastream/Log;

    .line 27
    :cond_0
    sget-object v0, Lorg/linphone/mediastream/Log;->logger:Lorg/linphone/mediastream/Log;

    return-object v0
.end method

.method private static varargs toString([Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .local v1, "sb":Ljava/lang/StringBuilder;
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v0, p0, v2

    .line 62
    .local v0, "o":Ljava/lang/Object;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 64
    .end local v0    # "o":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private native w(Ljava/lang/String;)V
.end method

.method public static varargs w([Ljava/lang/Object;)V
    .locals 2
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 51
    invoke-static {}, Lorg/linphone/mediastream/Log;->instance()Lorg/linphone/mediastream/Log;

    move-result-object v0

    invoke-static {p0}, Lorg/linphone/mediastream/Log;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/linphone/mediastream/Log;->w(Ljava/lang/String;)V

    .line 52
    return-void
.end method
