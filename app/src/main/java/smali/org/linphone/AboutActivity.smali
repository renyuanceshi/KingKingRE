.class public Lorg/linphone/AboutActivity;
.super Lcom/pccw/mobile/sip/BaseActivity;
.source "AboutActivity.java"


# instance fields
.field aboutText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 36
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    const v1, 0x7f04001b

    invoke-virtual {p0, v1}, Lorg/linphone/AboutActivity;->setContentView(I)V

    .line 38
    const v1, 0x7f0e006d

    invoke-virtual {p0, v1}, Lorg/linphone/AboutActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lorg/linphone/AboutActivity;->aboutText:Landroid/widget/TextView;

    .line 40
    :try_start_0
    iget-object v1, p0, Lorg/linphone/AboutActivity;->aboutText:Landroid/widget/TextView;

    const v2, 0x7f07023f

    invoke-virtual {p0, v2}, Lorg/linphone/AboutActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lorg/linphone/AboutActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 41
    invoke-virtual {p0}, Lorg/linphone/AboutActivity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    aput-object v5, v3, v4

    .line 40
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    :goto_0
    return-void

    .line 42
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-array v1, v9, [Ljava/lang/Object;

    const-string/jumbo v2, "cannot get version name"

    aput-object v2, v1, v8

    invoke-static {v0, v1}, Lorg/linphone/core/Log;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
