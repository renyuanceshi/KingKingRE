.class public Lcom/pccwmobile/common/utilities/VersionUtils;
.super Ljava/lang/Object;
.source "VersionUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccwmobile/common/utilities/VersionUtils$Version;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getClientVersionNum(Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    .param p0, "mContext"    # Landroid/content/Context;

    .prologue
    .line 186
    const/4 v2, 0x0

    .line 187
    .local v2, "versionName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 190
    .local v1, "packageInfo":Landroid/content/pm/PackageInfo;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 191
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    .line 190
    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 192
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    const/4 v1, 0x0

    .line 200
    :goto_0
    return-object v2

    .line 196
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static isNewerMajorVersion(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "version1String"    # Ljava/lang/String;
    .param p1, "version2String"    # Ljava/lang/String;

    .prologue
    .line 102
    new-instance v0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;

    invoke-direct {v0, p0}, Lcom/pccwmobile/common/utilities/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/pccwmobile/common/utilities/VersionUtils$Version;

    invoke-direct {v1, p1}, Lcom/pccwmobile/common/utilities/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->isNewerMajorVersion(Lcom/pccwmobile/common/utilities/VersionUtils$Version;)Z

    move-result v0

    return v0
.end method

.method public static isNewerMinorVersion(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "version1String"    # Ljava/lang/String;
    .param p1, "version2String"    # Ljava/lang/String;

    .prologue
    .line 115
    new-instance v0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;

    invoke-direct {v0, p0}, Lcom/pccwmobile/common/utilities/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/pccwmobile/common/utilities/VersionUtils$Version;

    invoke-direct {v1, p1}, Lcom/pccwmobile/common/utilities/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->isNewerMinorVersion(Lcom/pccwmobile/common/utilities/VersionUtils$Version;)Z

    move-result v0

    return v0
.end method

.method public static isNewerRevision(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "version1String"    # Ljava/lang/String;
    .param p1, "version2String"    # Ljava/lang/String;

    .prologue
    .line 128
    new-instance v0, Lcom/pccwmobile/common/utilities/VersionUtils$Version;

    invoke-direct {v0, p0}, Lcom/pccwmobile/common/utilities/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/pccwmobile/common/utilities/VersionUtils$Version;

    invoke-direct {v1, p1}, Lcom/pccwmobile/common/utilities/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/pccwmobile/common/utilities/VersionUtils$Version;->isNewerRevision(Lcom/pccwmobile/common/utilities/VersionUtils$Version;)Z

    move-result v0

    return v0
.end method

.method public static isNewerVersion(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p0, "version1String"    # Ljava/lang/String;
    .param p1, "version2String"    # Ljava/lang/String;

    .prologue
    .line 141
    invoke-static {p0}, Lcom/pccwmobile/common/utilities/VersionUtils;->versionNumToNumeric(Ljava/lang/String;)I

    move-result v0

    .line 142
    .local v0, "version1Int":I
    invoke-static {p1}, Lcom/pccwmobile/common/utilities/VersionUtils;->versionNumToNumeric(Ljava/lang/String;)I

    move-result v1

    .line 143
    .local v1, "version2Int":I
    if-le v1, v0, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static versionNumToNumeric(Ljava/lang/String;)I
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 155
    const-string/jumbo v2, "\\."

    const-string/jumbo v3, ""

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 156
    const-string/jumbo v1, "0"

    .line 158
    .local v1, "zero":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 160
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 161
    .local v0, "str_bufferBuffer":Ljava/lang/StringBuffer;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 162
    const-string/jumbo v2, "0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 163
    const-string/jumbo v2, "0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 164
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 175
    .end local v0    # "str_bufferBuffer":Ljava/lang/StringBuffer;
    :goto_0
    return v2

    .line 166
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 168
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 169
    .restart local v0    # "str_bufferBuffer":Ljava/lang/StringBuffer;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 170
    const-string/jumbo v2, "0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 171
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_0

    .line 175
    .end local v0    # "str_bufferBuffer":Ljava/lang/StringBuffer;
    :cond_1
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_0
.end method
