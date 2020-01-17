.class public Lcom/pccw/mobile/util/ErrorMsgUtil;
.super Ljava/lang/Object;
.source "ErrorMsgUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;
    }
.end annotation


# static fields
.field static oversea:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    sget-object v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->LOCAL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    sput-object v0, Lcom/pccw/mobile/util/ErrorMsgUtil;->oversea:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLocalErrorMsg(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .param p0, "errorPrefix"    # Ljava/lang/String;
    .param p1, "resultCode"    # Ljava/lang/String;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 27
    const-string/jumbo v1, ""

    .line 29
    .local v1, "errorMsg":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "string"

    .line 30
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 29
    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 31
    .local v2, "res":I
    invoke-virtual {p2, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 38
    .end local v2    # "res":I
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, p2}, Lcom/pccw/mobile/util/ErrorMsgUtil;->getOverseaLocalErrorMsgIfNeeded(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 39
    if-eqz v1, :cond_0

    const-string/jumbo v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 40
    :cond_0
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f070244

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 41
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 43
    :cond_1
    return-object v1

    .line 32
    :catch_0
    move-exception v0

    .line 33
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getOverseaLocalErrorMsgIfNeeded(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "errorMsg"    # Ljava/lang/String;
    .param p1, "errorKey"    # Ljava/lang/String;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 48
    const-string/jumbo v2, "2512-3123"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "2888-1000"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 49
    :cond_0
    invoke-static {p2}, Lcom/pccw/mobile/util/ErrorMsgUtil;->isOversea(Landroid/content/Context;)Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    move-result-object v2

    sget-object v3, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->OVERSEA:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    if-ne v2, v3, :cond_1

    .line 50
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_oversea"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 52
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string/jumbo v3, "string"

    .line 53
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 52
    invoke-virtual {v2, p1, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 54
    .local v1, "res":I
    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    .line 60
    .end local v1    # "res":I
    :cond_1
    :goto_0
    return-object p0

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static isOversea(Landroid/content/Context;)Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 86
    sget-object v3, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->LOCAL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    sput-object v3, Lcom/pccw/mobile/util/ErrorMsgUtil;->oversea:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    .line 87
    new-instance v1, Lcom/pccw/mobile/util/ErrorMsgUtil$1;

    invoke-direct {v1}, Lcom/pccw/mobile/util/ErrorMsgUtil$1;-><init>()V

    .line 114
    .local v1, "checkLocationResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    new-instance v0, Lcom/pccw/mobile/server/CheckLocationApi;

    invoke-direct {v0, v1, p0}, Lcom/pccw/mobile/server/CheckLocationApi;-><init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;)V

    .line 118
    .local v0, "checkLocationApi":Lcom/pccw/mobile/server/CheckLocationApi;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    aput-object v5, v3, v4

    invoke-virtual {v0, v3}, Lcom/pccw/mobile/server/CheckLocationApi;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1

    .line 127
    :goto_0
    sget-object v3, Lcom/pccw/mobile/util/ErrorMsgUtil;->oversea:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    return-object v3

    .line 119
    :catch_0
    move-exception v2

    .line 120
    .local v2, "e":Ljava/lang/InterruptedException;
    sget-object v3, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->FAIL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    sput-object v3, Lcom/pccw/mobile/util/ErrorMsgUtil;->oversea:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    .line 121
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 122
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v2

    .line 123
    .local v2, "e":Ljava/util/concurrent/ExecutionException;
    sget-object v3, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->FAIL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    sput-object v3, Lcom/pccw/mobile/util/ErrorMsgUtil;->oversea:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    .line 124
    invoke-virtual {v2}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_0
.end method

.method public static shouldShowOverseaXmlErrorMsg(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 3
    .param p0, "errorMsg"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 64
    const-string/jumbo v1, "2512-3123"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "2888-1010"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 65
    :cond_0
    sget-object v1, Lcom/pccw/mobile/util/ErrorMsgUtil$2;->$SwitchMap$com$pccw$mobile$util$ErrorMsgUtil$CheckOverseaResult:[I

    invoke-static {p1}, Lcom/pccw/mobile/util/ErrorMsgUtil;->isOversea(Landroid/content/Context;)Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    move-result-object v2

    invoke-virtual {v2}, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 74
    :cond_1
    :goto_0
    :pswitch_0
    return v0

    .line 67
    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    .line 65
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static shouldShowOverseaXmlErrorMsgWithFailCase(Ljava/lang/String;Landroid/content/Context;)Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;
    .locals 1
    .param p0, "errorMsg"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 78
    const-string/jumbo v0, "2512-3123"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "2888-1010"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 79
    :cond_0
    invoke-static {p1}, Lcom/pccw/mobile/util/ErrorMsgUtil;->isOversea(Landroid/content/Context;)Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    move-result-object v0

    .line 81
    :goto_0
    return-object v0

    :cond_1
    sget-object v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->LOCAL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    goto :goto_0
.end method
