.class public Lcom/pccw/mobile/sip/AddCallActivity;
.super Lcom/pccw/mobile/sip/BaseActionBarActivity;
.source "AddCallActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/AddCallActivity$TabListener;
    }
.end annotation


# static fields
.field private static final BAR_TAG_CONTACT:Ljava/lang/String; = "CONTACT"

.field private static final BAR_TAG_DAILPAD:Ljava/lang/String; = "DAILPAD"

.field private static final BAR_TAG_HISTORY:Ljava/lang/String; = "HISTORY"

.field private static activity:Lcom/pccw/mobile/sip/AddCallActivity;


# instance fields
.field actionBar:Landroid/support/v7/app/ActionBar;

.field private mDialUri:Landroid/net/Uri;

.field private mMainFrame:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;-><init>()V

    return-void
.end method

.method public static getActivity()Lcom/pccw/mobile/sip/AddCallActivity;
    .locals 1

    .prologue
    .line 74
    sget-object v0, Lcom/pccw/mobile/sip/AddCallActivity;->activity:Lcom/pccw/mobile/sip/AddCallActivity;

    if-nez v0, :cond_0

    .line 75
    const/4 v0, 0x0

    .line 77
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/pccw/mobile/sip/AddCallActivity;->activity:Lcom/pccw/mobile/sip/AddCallActivity;

    goto :goto_0
.end method

.method private setCurrentTagByIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 149
    const-string/jumbo v1, "com.pccw.mobile.sip.service.intent.dial"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 150
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 154
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "tel:"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 155
    .local v0, "number":Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 156
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/AddCallActivity;->setupDialUri(Landroid/content/Intent;)V

    .line 157
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 161
    .end local v0    # "number":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private setupDialUri(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 234
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v0

    const/high16 v1, 0x100000

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 238
    :goto_0
    return-void

    .line 237
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallActivity;->mDialUri:Landroid/net/Uri;

    goto :goto_0
.end method


# virtual methods
.method public callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
    .locals 3
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p4, "message"    # Ljava/lang/String;

    .prologue
    .line 208
    :try_start_0
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v1

    invoke-virtual {v1}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v1

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 209
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    :cond_0
    :goto_0
    return-void

    .line 212
    :catch_0
    move-exception v0

    .line 213
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallActivity;->finish()V

    goto :goto_0
.end method

.method public getAndClearDialUri()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 221
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallActivity;->mDialUri:Landroid/net/Uri;

    .line 222
    .local v0, "dialUri":Landroid/net/Uri;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->mDialUri:Landroid/net/Uri;

    .line 223
    return-object v0
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 199
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallActivity;->finish()V

    .line 200
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    .line 84
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 85
    const v1, 0x7f040055

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/AddCallActivity;->setContentView(I)V

    .line 87
    const v1, 0x7f0e0181

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/AddCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->mMainFrame:Landroid/widget/FrameLayout;

    .line 90
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 91
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar;->setNavigationMode(I)V

    .line 92
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 95
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-static {v1, v5}, Lcom/pccw/android/common/widget/ActionBarUtils;->setHasEmbeddedTabs(Ljava/lang/Object;Z)V

    .line 97
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 98
    invoke-virtual {v1}, Landroid/support/v7/app/ActionBar;->newTab()Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    const v2, 0x7f02045a

    .line 99
    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar$Tab;->setIcon(I)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    const-string/jumbo v2, "DAILPAD"

    .line 100
    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar$Tab;->setTag(Ljava/lang/Object;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    new-instance v2, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;

    const-string/jumbo v3, "DAILPAD"

    const-class v4, Lorg/linphone/DailPadActivityForAddCall;

    invoke-direct {v2, p0, v3, v4}, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Class;)V

    .line 101
    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar$Tab;->setTabListener(Landroid/support/v7/app/ActionBar$TabListener;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v0

    .line 104
    .local v0, "tab":Landroid/support/v7/app/ActionBar$Tab;
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v1, v0}, Landroid/support/v7/app/ActionBar;->addTab(Landroid/support/v7/app/ActionBar$Tab;)V

    .line 106
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 107
    invoke-virtual {v1}, Landroid/support/v7/app/ActionBar;->newTab()Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    const v2, 0x7f020456

    .line 108
    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar$Tab;->setIcon(I)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    const-string/jumbo v2, "CONTACT"

    .line 109
    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar$Tab;->setTag(Ljava/lang/Object;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    new-instance v2, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;

    const-string/jumbo v3, "CONTACT"

    const-class v4, Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-direct {v2, p0, v3, v4}, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Class;)V

    .line 110
    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar$Tab;->setTabListener(Landroid/support/v7/app/ActionBar$TabListener;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v0

    .line 113
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v1, v0}, Landroid/support/v7/app/ActionBar;->addTab(Landroid/support/v7/app/ActionBar$Tab;)V

    .line 115
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 116
    invoke-virtual {v1}, Landroid/support/v7/app/ActionBar;->newTab()Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    const v2, 0x7f020458

    .line 117
    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar$Tab;->setIcon(I)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    const-string/jumbo v2, "HISTORY"

    .line 118
    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar$Tab;->setTag(Ljava/lang/Object;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    new-instance v2, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;

    const-string/jumbo v3, "HISTORY"

    const-class v4, Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    invoke-direct {v2, p0, v3, v4}, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Class;)V

    .line 119
    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar$Tab;->setTabListener(Landroid/support/v7/app/ActionBar$TabListener;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v0

    .line 122
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v1, v0}, Landroid/support/v7/app/ActionBar;->addTab(Landroid/support/v7/app/ActionBar$Tab;)V

    .line 124
    if-eqz p1, :cond_0

    .line 125
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    const-string/jumbo v2, "tab"

    invoke-virtual {p1, v2, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 128
    :cond_0
    sput-object p0, Lcom/pccw/mobile/sip/AddCallActivity;->activity:Lcom/pccw/mobile/sip/AddCallActivity;

    .line 129
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 192
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onDestroy()V

    .line 193
    const/4 v0, 0x0

    sput-object v0, Lcom/pccw/mobile/sip/AddCallActivity;->activity:Lcom/pccw/mobile/sip/AddCallActivity;

    .line 194
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 165
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 166
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/AddCallActivity;->setIntent(Landroid/content/Intent;)V

    .line 167
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/AddCallActivity;->setCurrentTagByIntent(Landroid/content/Intent;)V

    .line 173
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 178
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onPause()V

    .line 180
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    .line 133
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onResume()V

    .line 138
    :try_start_0
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v1

    invoke-virtual {v1}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v1

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 139
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :cond_0
    :goto_0
    return-void

    .line 142
    :catch_0
    move-exception v0

    .line 143
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallActivity;->finish()V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 69
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 70
    const-string/jumbo v0, "tab"

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBar;->getSelectedNavigationIndex()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 71
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 185
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onStop()V

    .line 186
    return-void
.end method
