.class public Lcom/pccw/mobile/sip/util/IntentUtils;
.super Ljava/lang/Object;
.source "IntentUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final genDialScreenIntent(Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 14
    const-string/jumbo v1, "tel"

    const/4 v2, 0x0

    invoke-static {v1, p0, v2}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 15
    .local v0, "numberUri":Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.pccw.mobile.sip.service.intent.dial"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    return-object v1
.end method

.method public static final genDialScreenIntent(Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;
    .locals 4
    .param p0, "number"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 25
    const-string/jumbo v2, "tel"

    const/4 v3, 0x0

    invoke-static {v2, p0, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 26
    .local v1, "numberUri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lorg/linphone/LinphoneActivity;

    invoke-direct {v0, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 27
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v2, "com.pccw.mobile.sip.service.intent.dial"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 30
    return-object v0
.end method

.method public static final genSipCallIntent(Ljava/lang/String;)Landroid/content/Intent;
    .locals 4
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 19
    const-string/jumbo v2, "sip"

    const/4 v3, 0x0

    invoke-static {v2, p0, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 20
    .local v1, "numberUri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.CALL"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 21
    .local v0, "i":Landroid/content/Intent;
    return-object v0
.end method
