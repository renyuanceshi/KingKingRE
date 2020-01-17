.class public Lcom/pccw/mobile/util/PermissionUtils;
.super Ljava/lang/Object;
.source "PermissionUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;,
        Lcom/pccw/mobile/util/PermissionUtils$PermissionRequestSuccessCallBack;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkAndRequestMorePermissions(Landroid/content/Context;[Ljava/lang/String;I)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "requestCode"    # I

    .prologue
    .line 94
    invoke-static {p0, p1}, Lcom/pccw/mobile/util/PermissionUtils;->checkMorePermissions(Landroid/content/Context;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 95
    .local v0, "permissionList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p0, v0, p2}, Lcom/pccw/mobile/util/PermissionUtils;->requestMorePermissions(Landroid/content/Context;Ljava/util/List;I)V

    .line 96
    return-void
.end method

.method public static checkAndRequestMorePermissions(Landroid/content/Context;[Ljava/lang/String;ILcom/pccw/mobile/util/PermissionUtils$PermissionRequestSuccessCallBack;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "requestCode"    # I
    .param p3, "callBack"    # Lcom/pccw/mobile/util/PermissionUtils$PermissionRequestSuccessCallBack;

    .prologue
    .line 158
    invoke-static {p0, p1}, Lcom/pccw/mobile/util/PermissionUtils;->checkMorePermissions(Landroid/content/Context;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 159
    .local v0, "permissionList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 160
    invoke-interface {p3}, Lcom/pccw/mobile/util/PermissionUtils$PermissionRequestSuccessCallBack;->onHasPermission()V

    .line 164
    :goto_0
    return-void

    .line 162
    :cond_0
    invoke-static {p0, v0, p2}, Lcom/pccw/mobile/util/PermissionUtils;->requestMorePermissions(Landroid/content/Context;Ljava/util/List;I)V

    goto :goto_0
.end method

.method public static checkAndRequestPermission(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permission"    # Ljava/lang/String;
    .param p2, "requestCode"    # I

    .prologue
    .line 85
    invoke-static {p0, p1}, Lcom/pccw/mobile/util/PermissionUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 86
    invoke-static {p0, p1, p2}, Lcom/pccw/mobile/util/PermissionUtils;->requestPermission(Landroid/content/Context;Ljava/lang/String;I)V

    .line 88
    :cond_0
    return-void
.end method

.method public static checkAndRequestPermission(Landroid/content/Context;Ljava/lang/String;ILcom/pccw/mobile/util/PermissionUtils$PermissionRequestSuccessCallBack;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permission"    # Ljava/lang/String;
    .param p2, "requestCode"    # I
    .param p3, "callBack"    # Lcom/pccw/mobile/util/PermissionUtils$PermissionRequestSuccessCallBack;

    .prologue
    .line 147
    invoke-static {p0, p1}, Lcom/pccw/mobile/util/PermissionUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    invoke-interface {p3}, Lcom/pccw/mobile/util/PermissionUtils$PermissionRequestSuccessCallBack;->onHasPermission()V

    .line 152
    :goto_0
    return-void

    .line 150
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/pccw/mobile/util/PermissionUtils;->requestPermission(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public static checkMorePermissions(Landroid/content/Context;[Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permissions"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .local v1, "permissionList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_1

    .line 36
    aget-object v2, p1, v0

    invoke-static {p0, v2}, Lcom/pccw/mobile/util/PermissionUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 37
    aget-object v2, p1, v0

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 39
    :cond_1
    return-object v1
.end method

.method public static checkMorePermissions(Landroid/content/Context;[Ljava/lang/String;Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "callBack"    # Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;

    .prologue
    .line 121
    invoke-static {p0, p1}, Lcom/pccw/mobile/util/PermissionUtils;->checkMorePermissions(Landroid/content/Context;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 122
    .local v3, "permissionList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_0

    .line 123
    invoke-interface {p2}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onHasPermission()V

    .line 140
    :goto_0
    return-void

    .line 125
    :cond_0
    const/4 v1, 0x1

    .line 126
    .local v1, "isFirst":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_1

    .line 127
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 128
    .local v2, "permission":Ljava/lang/String;
    invoke-static {p0, v2}, Lcom/pccw/mobile/util/PermissionUtils;->judgePermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 129
    const/4 v1, 0x0

    .line 133
    .end local v2    # "permission":Ljava/lang/String;
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    move-object v4, v5

    check-cast v4, [Ljava/lang/String;

    .line 134
    .local v4, "unauthorizedMorePermissions":[Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 135
    invoke-interface {p2, v4}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onUserHasAlreadyTurnedDownAndDontAsk([Ljava/lang/String;)V

    goto :goto_0

    .line 126
    .end local v4    # "unauthorizedMorePermissions":[Ljava/lang/String;
    .restart local v2    # "permission":Ljava/lang/String;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 137
    .end local v2    # "permission":Ljava/lang/String;
    .restart local v4    # "unauthorizedMorePermissions":[Ljava/lang/String;
    :cond_3
    invoke-interface {p2, v4}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onUserHasAlreadyTurnedDown([Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static checkPermission(Landroid/content/Context;Ljava/lang/String;Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permission"    # Ljava/lang/String;
    .param p2, "callBack"    # Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 105
    invoke-static {p0, p1}, Lcom/pccw/mobile/util/PermissionUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    invoke-interface {p2}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onHasPermission()V

    .line 113
    :goto_0
    return-void

    .line 108
    :cond_0
    invoke-static {p0, p1}, Lcom/pccw/mobile/util/PermissionUtils;->judgePermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 109
    new-array v0, v2, [Ljava/lang/String;

    aput-object p1, v0, v1

    invoke-interface {p2, v0}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onUserHasAlreadyTurnedDown([Ljava/lang/String;)V

    goto :goto_0

    .line 111
    :cond_1
    new-array v0, v2, [Ljava/lang/String;

    aput-object p1, v0, v1

    invoke-interface {p2, v0}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onUserHasAlreadyTurnedDownAndDontAsk([Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static checkPermission(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permission"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-static {p0, p1}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 23
    const/4 v0, 0x1

    .line 25
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPermissionRequestSuccess([I)Z
    .locals 2
    .param p0, "grantResults"    # [I

    .prologue
    const/4 v0, 0x0

    .line 170
    array-length v1, p0

    if-lez v1, :cond_0

    aget v1, p0, v0

    if-nez v1, :cond_0

    .line 172
    const/4 v0, 0x1

    .line 174
    :cond_0
    return v0
.end method

.method public static judgePermission(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permission"    # Ljava/lang/String;

    .prologue
    .line 75
    check-cast p0, Landroid/app/Activity;

    .end local p0    # "context":Landroid/content/Context;
    invoke-static {p0, p1}, Landroid/support/v4/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    const/4 v0, 0x1

    .line 78
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static onRequestMorePermissionsResult(Landroid/content/Context;[Ljava/lang/String;Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "callback"    # Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;

    .prologue
    .line 196
    const/4 v1, 0x0

    .line 197
    .local v1, "isBannedPermission":Z
    invoke-static {p0, p1}, Lcom/pccw/mobile/util/PermissionUtils;->checkMorePermissions(Landroid/content/Context;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 198
    .local v2, "permissionList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_0

    .line 199
    invoke-interface {p2}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onHasPermission()V

    .line 214
    :goto_0
    return-void

    .line 201
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 202
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {p0, v3}, Lcom/pccw/mobile/util/PermissionUtils;->judgePermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 203
    const/4 v1, 0x1

    .line 208
    :cond_1
    if-eqz v1, :cond_3

    .line 209
    invoke-interface {p2, p1}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onUserHasAlreadyTurnedDownAndDontAsk([Ljava/lang/String;)V

    goto :goto_0

    .line 201
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 211
    :cond_3
    invoke-interface {p2, p1}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onUserHasAlreadyTurnedDown([Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static onRequestPermissionResult(Landroid/content/Context;Ljava/lang/String;[ILcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permission"    # Ljava/lang/String;
    .param p2, "grantResults"    # [I
    .param p3, "callback"    # Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 181
    invoke-static {p2}, Lcom/pccw/mobile/util/PermissionUtils;->isPermissionRequestSuccess([I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    invoke-interface {p3}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onHasPermission()V

    .line 190
    :goto_0
    return-void

    .line 184
    :cond_0
    invoke-static {p0, p1}, Lcom/pccw/mobile/util/PermissionUtils;->judgePermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 185
    new-array v0, v2, [Ljava/lang/String;

    aput-object p1, v0, v1

    invoke-interface {p3, v0}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onUserHasAlreadyTurnedDown([Ljava/lang/String;)V

    goto :goto_0

    .line 187
    :cond_1
    new-array v0, v2, [Ljava/lang/String;

    aput-object p1, v0, v1

    invoke-interface {p3, v0}, Lcom/pccw/mobile/util/PermissionUtils$PermissionCheckCallBack;->onUserHasAlreadyTurnedDownAndDontAsk([Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static requestMorePermissions(Landroid/content/Context;Ljava/util/List;I)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permissionList"    # Ljava/util/List;
    .param p2, "requestCode"    # I

    .prologue
    .line 53
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 57
    :cond_0
    :goto_0
    return-void

    .line 55
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    move-object v0, v1

    check-cast v0, [Ljava/lang/String;

    .line 56
    .local v0, "permissions":[Ljava/lang/String;
    invoke-static {p0, v0, p2}, Lcom/pccw/mobile/util/PermissionUtils;->requestMorePermissions(Landroid/content/Context;[Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public static requestMorePermissions(Landroid/content/Context;[Ljava/lang/String;I)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "requestCode"    # I

    .prologue
    .line 63
    check-cast p0, Landroid/app/Activity;

    .end local p0    # "context":Landroid/content/Context;
    invoke-static {p0, p1, p2}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 64
    return-void
.end method

.method public static requestPermission(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permission"    # Ljava/lang/String;
    .param p2, "requestCode"    # I

    .prologue
    .line 46
    check-cast p0, Landroid/app/Activity;

    .end local p0    # "context":Landroid/content/Context;
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {p0, v0, p2}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 47
    return-void
.end method

.method public static toAppSetting(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 221
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 222
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 223
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-lt v1, v2, :cond_1

    .line 224
    const-string/jumbo v1, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 225
    const-string/jumbo v1, "package"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 231
    :cond_0
    :goto_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 232
    return-void

    .line 226
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x8

    if-gt v1, v2, :cond_0

    .line 227
    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 228
    const-string/jumbo v1, "com.android.settings"

    const-string/jumbo v2, "com.android.settings.InstalledAppDetails"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 229
    const-string/jumbo v1, "com.android.settings.ApplicationPkgName"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method
