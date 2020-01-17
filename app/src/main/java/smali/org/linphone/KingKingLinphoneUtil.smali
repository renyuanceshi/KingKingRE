.class public Lorg/linphone/KingKingLinphoneUtil;
.super Ljava/lang/Object;
.source "KingKingLinphoneUtil.java"


# static fields
.field private static instance:Lorg/linphone/KingKingLinphoneUtil;


# instance fields
.field private contact:Lcom/pccw/mobile/sip/util/Contact;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/4 v0, 0x0

    sput-object v0, Lorg/linphone/KingKingLinphoneUtil;->instance:Lorg/linphone/KingKingLinphoneUtil;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method public static cpuSupportNeon()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    new-instance v1, Ljava/io/FileInputStream;

    const-string/jumbo v5, "/proc/cpuinfo"

    invoke-direct {v1, v5}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 45
    .local v1, "fis":Ljava/io/FileInputStream;
    new-instance v4, Ljava/util/Scanner;

    invoke-direct {v4, v1}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    .line 46
    .local v4, "scanner":Ljava/util/Scanner;
    const-string/jumbo v5, "line.separator"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "NL":Ljava/lang/String;
    const/4 v2, 0x0

    .line 49
    .local v2, "line":Ljava/lang/String;
    const/4 v3, 0x0

    .line 54
    .local v3, "neon":Z
    :goto_0
    :try_start_0
    invoke-virtual {v4}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 56
    if-nez v3, :cond_0

    const-string/jumbo v5, "neon"

    invoke-virtual {v4, v5}, Ljava/util/Scanner;->findInLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 57
    const/4 v3, 0x1

    .line 59
    :cond_0
    invoke-virtual {v4}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    goto :goto_0

    .line 64
    :cond_1
    invoke-virtual {v4}, Ljava/util/Scanner;->close()V

    .line 67
    const-string/jumbo v5, "linphone"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "canSupportNeon return "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    return v3

    .line 64
    :catchall_0
    move-exception v5

    invoke-virtual {v4}, Ljava/util/Scanner;->close()V

    throw v5
.end method

.method public static getInstance()Lorg/linphone/KingKingLinphoneUtil;
    .locals 2

    .prologue
    .line 21
    sget-object v0, Lorg/linphone/KingKingLinphoneUtil;->instance:Lorg/linphone/KingKingLinphoneUtil;

    if-nez v0, :cond_1

    .line 22
    const-class v1, Lorg/linphone/KingKingLinphoneUtil;

    monitor-enter v1

    .line 23
    :try_start_0
    sget-object v0, Lorg/linphone/KingKingLinphoneUtil;->instance:Lorg/linphone/KingKingLinphoneUtil;

    if-nez v0, :cond_0

    .line 24
    new-instance v0, Lorg/linphone/KingKingLinphoneUtil;

    invoke-direct {v0}, Lorg/linphone/KingKingLinphoneUtil;-><init>()V

    sput-object v0, Lorg/linphone/KingKingLinphoneUtil;->instance:Lorg/linphone/KingKingLinphoneUtil;

    .line 26
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    :cond_1
    sget-object v0, Lorg/linphone/KingKingLinphoneUtil;->instance:Lorg/linphone/KingKingLinphoneUtil;

    return-object v0

    .line 26
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static hasNeonInCpuFeatures()Z
    .locals 2

    .prologue
    .line 34
    :try_start_0
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->cpuSupportNeon()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 38
    :goto_0
    return v1

    .line 35
    :catch_0
    move-exception v0

    .line 37
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 38
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getContact()Lcom/pccw/mobile/sip/util/Contact;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/linphone/KingKingLinphoneUtil;->contact:Lcom/pccw/mobile/sip/util/Contact;

    return-object v0
.end method

.method public setContact(Lcom/pccw/mobile/sip/util/Contact;)V
    .locals 0
    .param p1, "contact"    # Lcom/pccw/mobile/sip/util/Contact;

    .prologue
    .line 76
    iput-object p1, p0, Lorg/linphone/KingKingLinphoneUtil;->contact:Lcom/pccw/mobile/sip/util/Contact;

    .line 77
    return-void
.end method
