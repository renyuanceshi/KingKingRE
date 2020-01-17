.class public Lorg/linphone/OutgoingCallReceiver;
.super Landroid/content/BroadcastReceiver;
.source "OutgoingCallReceiver.java"


# static fields
.field public static TAG:Ljava/lang/String;

.field public static key_always:Ljava/lang/String;

.field public static key_off:Ljava/lang/String;

.field public static key_on_demand:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-string/jumbo v0, ";0000000"

    sput-object v0, Lorg/linphone/OutgoingCallReceiver;->TAG:Ljava/lang/String;

    .line 33
    const-string/jumbo v0, "off"

    sput-object v0, Lorg/linphone/OutgoingCallReceiver;->key_off:Ljava/lang/String;

    .line 34
    const-string/jumbo v0, "ask_for_outcall_interception"

    sput-object v0, Lorg/linphone/OutgoingCallReceiver;->key_on_demand:Ljava/lang/String;

    .line 35
    const-string/jumbo v0, "alway_intercept_out_call"

    sput-object v0, Lorg/linphone/OutgoingCallReceiver;->key_always:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, -0x1

    const/4 v4, 0x0

    .line 39
    const-string/jumbo v2, "android.intent.extra.PHONE_NUMBER"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 41
    .local v1, "to":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string/jumbo v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 69
    :cond_0
    :goto_0
    return-void

    .line 43
    :cond_1
    sget-object v2, Lorg/linphone/OutgoingCallReceiver;->TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 44
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 45
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v2

    invoke-virtual {v2}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 49
    :cond_2
    invoke-virtual {p0, v5, v4, v4}, Lorg/linphone/OutgoingCallReceiver;->setResult(ILjava/lang/String;Landroid/os/Bundle;)V

    .line 50
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 52
    .local v0, "lIntent":Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const v3, 0x7f07025e

    .line 53
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lorg/linphone/OutgoingCallReceiver;->key_on_demand:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lorg/linphone/OutgoingCallReceiver;->key_always:Ljava/lang/String;

    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 56
    const-class v2, Lorg/linphone/LinphoneActivity;

    invoke-virtual {v0, p1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 62
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "tel://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lorg/linphone/OutgoingCallReceiver;->TAG:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 63
    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 64
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 59
    :cond_3
    const-string/jumbo v2, "android.intent.action.CALL"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 67
    .end local v0    # "lIntent":Landroid/content/Intent;
    :cond_4
    sget-object v2, Lorg/linphone/OutgoingCallReceiver;->TAG:Ljava/lang/String;

    const-string/jumbo v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v5, v2, v4}, Lorg/linphone/OutgoingCallReceiver;->setResult(ILjava/lang/String;Landroid/os/Bundle;)V

    goto/16 :goto_0
.end method
