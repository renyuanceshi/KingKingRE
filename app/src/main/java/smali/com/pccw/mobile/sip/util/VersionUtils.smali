.class public Lcom/pccw/mobile/sip/util/VersionUtils;
.super Ljava/lang/Object;
.source "VersionUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/util/VersionUtils$Version;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isNewerMajorVersion(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "version1String"    # Ljava/lang/String;
    .param p1, "version2String"    # Ljava/lang/String;

    .prologue
    .line 82
    new-instance v0, Lcom/pccw/mobile/sip/util/VersionUtils$Version;

    invoke-direct {v0, p0}, Lcom/pccw/mobile/sip/util/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/pccw/mobile/sip/util/VersionUtils$Version;

    invoke-direct {v1, p1}, Lcom/pccw/mobile/sip/util/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/util/VersionUtils$Version;->isNewerMajorVersion(Lcom/pccw/mobile/sip/util/VersionUtils$Version;)Z

    move-result v0

    return v0
.end method

.method public static isNewerMinorVersion(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "version1String"    # Ljava/lang/String;
    .param p1, "version2String"    # Ljava/lang/String;

    .prologue
    .line 98
    new-instance v0, Lcom/pccw/mobile/sip/util/VersionUtils$Version;

    invoke-direct {v0, p0}, Lcom/pccw/mobile/sip/util/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/pccw/mobile/sip/util/VersionUtils$Version;

    invoke-direct {v1, p1}, Lcom/pccw/mobile/sip/util/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/util/VersionUtils$Version;->isNewerMinorVersion(Lcom/pccw/mobile/sip/util/VersionUtils$Version;)Z

    move-result v0

    return v0
.end method

.method public static isNewerRevision(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "version1String"    # Ljava/lang/String;
    .param p1, "version2String"    # Ljava/lang/String;

    .prologue
    .line 114
    new-instance v0, Lcom/pccw/mobile/sip/util/VersionUtils$Version;

    invoke-direct {v0, p0}, Lcom/pccw/mobile/sip/util/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/pccw/mobile/sip/util/VersionUtils$Version;

    invoke-direct {v1, p1}, Lcom/pccw/mobile/sip/util/VersionUtils$Version;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/util/VersionUtils$Version;->isNewerRevision(Lcom/pccw/mobile/sip/util/VersionUtils$Version;)Z

    move-result v0

    return v0
.end method

.method public static isNewerVersion(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p0, "version1String"    # Ljava/lang/String;
    .param p1, "version2String"    # Ljava/lang/String;

    .prologue
    .line 140
    invoke-static {p0}, Lcom/pccw/mobile/sip/util/VersionUtils;->versionNumToNumeric(Ljava/lang/String;)I

    move-result v0

    .line 141
    .local v0, "version1Int":I
    invoke-static {p1}, Lcom/pccw/mobile/sip/util/VersionUtils;->versionNumToNumeric(Ljava/lang/String;)I

    move-result v1

    .line 142
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
    .line 152
    const-string/jumbo v2, "\\."

    const-string/jumbo v3, ""

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 153
    const-string/jumbo v1, "0"

    .line 155
    .local v1, "zero":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 156
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 157
    .local v0, "str_bufferBuffer":Ljava/lang/StringBuffer;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 158
    const-string/jumbo v2, "0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 159
    const-string/jumbo v2, "0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 160
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 167
    .end local v0    # "str_bufferBuffer":Ljava/lang/StringBuffer;
    :goto_0
    return v2

    .line 161
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 162
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 163
    .restart local v0    # "str_bufferBuffer":Ljava/lang/StringBuffer;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 164
    const-string/jumbo v2, "0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 165
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_0

    .line 167
    .end local v0    # "str_bufferBuffer":Ljava/lang/StringBuffer;
    :cond_1
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_0
.end method
