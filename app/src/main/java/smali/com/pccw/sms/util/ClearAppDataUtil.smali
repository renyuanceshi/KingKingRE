.class public Lcom/pccw/sms/util/ClearAppDataUtil;
.super Ljava/lang/Object;
.source "ClearAppDataUtil.java"


# static fields
.field public static context:Landroid/content/Context;


# instance fields
.field public final LOG_TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-string/jumbo v0, "ClearAppDataUtil"

    iput-object v0, p0, Lcom/pccw/sms/util/ClearAppDataUtil;->LOG_TAG:Ljava/lang/String;

    .line 18
    sput-object p1, Lcom/pccw/sms/util/ClearAppDataUtil;->context:Landroid/content/Context;

    .line 19
    return-void
.end method

.method public static clearAppDataUtil(Landroid/content/Context;)V
    .locals 11
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x0

    .line 27
    invoke-static {p0}, Lcom/pccw/database/helper/DBHelper;->deleteWholeDatabase(Landroid/content/Context;)V

    .line 32
    const/4 v7, 0x5

    new-array v6, v7, [Ljava/lang/String;

    const-string/jumbo v7, "com.pccw.im"

    aput-object v7, v6, v8

    const/4 v7, 0x1

    const-string/jumbo v9, "NETWORK_SHARE_PREF"

    aput-object v9, v6, v7

    const/4 v7, 0x2

    const-string/jumbo v9, "RemovedShortcut"

    aput-object v9, v6, v7

    const/4 v7, 0x3

    sget-object v9, Lcom/pccw/sms/bean/SMSConstants;->mainPref:Ljava/lang/String;

    aput-object v9, v6, v7

    const/4 v7, 0x4

    const-string/jumbo v9, "FacebookShare"

    aput-object v9, v6, v7

    .line 33
    .local v6, "spNameArr":[Ljava/lang/String;
    array-length v9, v6

    move v7, v8

    :goto_0
    if-ge v7, v9, :cond_0

    aget-object v5, v6, v7

    .line 34
    .local v5, "spName":Ljava/lang/String;
    invoke-virtual {p0, v5, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 35
    .local v2, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 33
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 38
    .end local v2    # "pref":Landroid/content/SharedPreferences;
    .end local v5    # "spName":Ljava/lang/String;
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 39
    .restart local v2    # "pref":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 48
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/pccw/sms/bean/SMSConstants;->INTERNAL_FILES_DIR(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "/KingKing/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "Media/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 49
    .local v1, "mediaFolderPath":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/pccw/sms/bean/SMSConstants;->INTERNAL_FILES_DIR(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "/KingKing/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "Profile/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 51
    .local v4, "profileFolderPath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 53
    .local v0, "mediaFolder":Ljava/io/File;
    invoke-static {v0}, Lcom/pccw/sms/util/ClearAppDataUtil;->deleteDir(Ljava/io/File;)Z

    .line 55
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 57
    .local v3, "profileFolder":Ljava/io/File;
    invoke-static {v3}, Lcom/pccw/sms/util/ClearAppDataUtil;->deleteDir(Ljava/io/File;)Z

    .line 64
    return-void
.end method

.method public static deleteDir(Ljava/io/File;)Z
    .locals 6
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    const/4 v3, 0x0

    .line 67
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 68
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "children":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v0

    if-ge v1, v4, :cond_2

    .line 71
    new-instance v4, Ljava/io/File;

    aget-object v5, v0, v1

    invoke-direct {v4, p0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v4}, Lcom/pccw/sms/util/ClearAppDataUtil;->deleteDir(Ljava/io/File;)Z

    move-result v2

    .line 72
    .local v2, "success":Z
    if-nez v2, :cond_1

    .line 80
    .end local v0    # "children":[Ljava/lang/String;
    .end local v1    # "i":I
    .end local v2    # "success":Z
    :cond_0
    :goto_1
    return v3

    .line 69
    .restart local v0    # "children":[Ljava/lang/String;
    .restart local v1    # "i":I
    .restart local v2    # "success":Z
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 77
    .end local v2    # "success":Z
    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v3

    goto :goto_1
.end method
