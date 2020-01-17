.class Lcom/pccwmobile/common/utilities/VersionUtils$Version;
.super Ljava/lang/Object;
.source "VersionUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccwmobile/common/utilities/VersionUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Version"
.end annotation


# instance fields
.field private majorVersion:I

.field private minorVersion:I

.field private revision:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "versionString"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput v2, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->majorVersion:I

    .line 12
    iput v2, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->minorVersion:I

    .line 13
    iput v2, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->revision:I

    .line 17
    const/4 v0, 0x0

    .line 18
    .local v0, "lastDotPos":I
    const/4 v1, 0x0

    .line 19
    .local v1, "nextDotPos":I
    const-string/jumbo v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 20
    if-ltz v1, :cond_1

    .line 24
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->majorVersion:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .line 30
    :goto_0
    move v0, v1

    .line 31
    const-string/jumbo v2, "."

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 32
    if-ltz v1, :cond_0

    .line 36
    add-int/lit8 v2, v0, 0x1

    .line 37
    :try_start_1
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 36
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->minorVersion:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 44
    :goto_1
    add-int/lit8 v2, v1, 0x1

    :try_start_2
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 45
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 44
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->revision:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 74
    :goto_2
    return-void

    .line 55
    :cond_0
    add-int/lit8 v2, v0, 0x1

    .line 56
    :try_start_3
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 55
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->minorVersion:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    .line 58
    :catch_0
    move-exception v2

    goto :goto_2

    .line 67
    :cond_1
    :try_start_4
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->majorVersion:I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    .line 69
    :catch_1
    move-exception v2

    goto :goto_2

    .line 47
    :catch_2
    move-exception v2

    goto :goto_2

    .line 39
    :catch_3
    move-exception v2

    goto :goto_1

    .line 27
    :catch_4
    move-exception v2

    goto :goto_0
.end method


# virtual methods
.method public isNewerMajorVersion(Lcom/pccwmobile/common/utilities/VersionUtils$Version;)Z
    .locals 2
    .param p1, "testVersion"    # Lcom/pccwmobile/common/utilities/VersionUtils$Version;

    .prologue
    .line 78
    iget v0, p1, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->majorVersion:I

    iget v1, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->majorVersion:I

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isNewerMinorVersion(Lcom/pccwmobile/common/utilities/VersionUtils$Version;)Z
    .locals 2
    .param p1, "testVersion"    # Lcom/pccwmobile/common/utilities/VersionUtils$Version;

    .prologue
    .line 83
    iget v0, p1, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->majorVersion:I

    iget v1, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->majorVersion:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->minorVersion:I

    iget v1, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->minorVersion:I

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isNewerRevision(Lcom/pccwmobile/common/utilities/VersionUtils$Version;)Z
    .locals 2
    .param p1, "testVersion"    # Lcom/pccwmobile/common/utilities/VersionUtils$Version;

    .prologue
    .line 88
    iget v0, p1, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->majorVersion:I

    iget v1, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->majorVersion:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->minorVersion:I

    iget v1, p1, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->minorVersion:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->revision:I

    iget v1, p0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->revision:I

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
