.class public Lcom/pccw/mobile/sip/MoreActivity;
.super Landroid/support/v4/app/Fragment;
.source "MoreActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static final DEFAULT_SCREEN:Z = false

.field private static DlgAbout:Landroid/app/AlertDialog; = null

.field public static final PREF_SCREEN:Ljava/lang/String; = "PREF_SCREEN"

.field private static noWiFiDialog:Landroid/app/AlertDialog;


# instance fields
.field private aboutTextView:Landroid/widget/TextView;

.field private accountBalanceTextView:Landroid/widget/TextView;

.field activity:Landroid/support/v4/app/FragmentActivity;

.field private autoLoginTextView:Landroid/widget/TextView;

.field private checkBalanceNotic:Landroid/widget/TextView;

.field private checkBalanceNoticBar:Landroid/view/View;

.field ctx:Landroid/content/Context;

.field private facebookLogoutTextView:Landroid/widget/TextView;

.field private facebookShareBar:Landroid/view/View;

.field private facebookShareTextView:Landroid/widget/TextView;

.field private faqTextView:Landroid/widget/TextView;

.field private ilbcCodecsBar:Landroid/view/View;

.field private ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

.field private isRunningCheckBalanceTread:Z

.field private mobileNumberTextView:Landroid/widget/TextView;

.field private screenCheckedTextView:Landroid/widget/CheckedTextView;

.field private smsInviteBar:Landroid/view/View;

.field private smsInviteTextView:Landroid/widget/TextView;

.field private switchAccountButton:Landroid/widget/Button;

.field private topupByCallingTextView:Landroid/widget/TextView;

.field private topupOnlineTextView:Landroid/widget/TextView;

.field private updateTimeTextView:Landroid/widget/TextView;

.field private userGuideTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method private static getVersion(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 198
    const-string/jumbo v0, "Unknown"

    .line 200
    .local v0, "unknown":Ljava/lang/String;
    if-nez p0, :cond_0

    .line 201
    const-string/jumbo v1, "Unknown"

    .line 209
    :goto_0
    return-object v1

    .line 205
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 206
    :catch_0
    move-exception v1

    .line 209
    const-string/jumbo v1, "Unknown"

    goto :goto_0
.end method

.method private showAlertDialog(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 418
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/pccw/mobile/sip/MoreActivity;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 419
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f020436

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f07006a

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 420
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 421
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    const v3, 0x104000a

    .line 422
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/MoreActivity$6;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/MoreActivity$6;-><init>(Lcom/pccw/mobile/sip/MoreActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 428
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 429
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 18
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 214
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->aboutTextView:Landroid/widget/TextView;

    move-object/from16 v0, p1

    if-ne v0, v1, :cond_2

    .line 215
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->DlgAbout:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 216
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->DlgAbout:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 218
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v12

    .line 219
    .local v12, "inflater":Landroid/view/LayoutInflater;
    const v1, 0x7f04005e

    const/4 v2, 0x0

    invoke-virtual {v12, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v10

    .line 221
    .local v10, "dialogview":Landroid/view/View;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/MoreActivity;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v10}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f070173

    .line 222
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/pccw/mobile/sip/MoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x104000a

    .line 223
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/pccw/mobile/sip/MoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 224
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    sput-object v1, Lcom/pccw/mobile/sip/MoreActivity;->DlgAbout:Landroid/app/AlertDialog;

    .line 226
    const v1, 0x7f0e00c8

    invoke-virtual {v10, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 227
    .local v8, "currentVersionTV":Landroid/widget/TextView;
    const v1, 0x7f070056

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/MoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "\\n"

    const-string/jumbo v3, "\n"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "${VERSION}"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    .line 228
    invoke-static {v3}, Lcom/pccw/mobile/sip/MoreActivity;->getVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 227
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 380
    .end local v8    # "currentVersionTV":Landroid/widget/TextView;
    .end local v10    # "dialogview":Landroid/view/View;
    .end local v12    # "inflater":Landroid/view/LayoutInflater;
    :cond_1
    :goto_0
    return-void

    .line 229
    :cond_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->userGuideTextView:Landroid/widget/TextView;

    move-object/from16 v0, p1

    if-ne v0, v1, :cond_6

    .line 230
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_3

    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 231
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 233
    :cond_3
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 234
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_4

    .line 235
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 237
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/MoreActivity;->onCreateNoWiFiDialog()Landroid/app/Dialog;

    move-result-object v1

    check-cast v1, Landroid/app/AlertDialog;

    sput-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    .line 238
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 241
    :cond_5
    new-instance v11, Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    const-class v2, Lcom/pccw/mobile/sip/WebViewActivity;

    invoke-direct {v11, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 242
    .local v11, "i":Landroid/content/Intent;
    const-string/jumbo v1, "Type"

    const/4 v2, 0x0

    invoke-virtual {v11, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 243
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/pccw/mobile/sip/MoreActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 245
    .end local v11    # "i":Landroid/content/Intent;
    :cond_6
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->faqTextView:Landroid/widget/TextView;

    move-object/from16 v0, p1

    if-ne v0, v1, :cond_a

    .line 246
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_7

    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 247
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 249
    :cond_7
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 250
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_8

    .line 251
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 253
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/MoreActivity;->onCreateNoWiFiDialog()Landroid/app/Dialog;

    move-result-object v1

    check-cast v1, Landroid/app/AlertDialog;

    sput-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    .line 254
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 257
    :cond_9
    new-instance v11, Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    const-class v2, Lcom/pccw/mobile/sip/WebViewActivity;

    invoke-direct {v11, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 258
    .restart local v11    # "i":Landroid/content/Intent;
    const-string/jumbo v1, "Type"

    const/4 v2, 0x1

    invoke-virtual {v11, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 259
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/pccw/mobile/sip/MoreActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 261
    .end local v11    # "i":Landroid/content/Intent;
    :cond_a
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->screenCheckedTextView:Landroid/widget/CheckedTextView;

    move-object/from16 v0, p1

    if-ne v0, v1, :cond_b

    .line 262
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->screenCheckedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {v1}, Landroid/widget/CheckedTextView;->toggle()V

    .line 263
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "PREF_SCREEN"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pccw/mobile/sip/MoreActivity;->screenCheckedTextView:Landroid/widget/CheckedTextView;

    .line 264
    invoke-virtual {v3}, Landroid/widget/CheckedTextView;->isChecked()Z

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_0

    .line 265
    :cond_b
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    move-object/from16 v0, p1

    if-ne v0, v1, :cond_d

    .line 266
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {v1}, Landroid/widget/CheckedTextView;->toggle()V

    .line 267
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    const v3, 0x7f070251

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    .line 268
    invoke-virtual {v4}, Landroid/widget/CheckedTextView;->isChecked()Z

    move-result v4

    .line 267
    invoke-virtual {v1, v2, v3, v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->enableDisableAudioCodec(Landroid/content/Context;IZ)V

    .line 269
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    const v4, 0x7f070253

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    .line 270
    invoke-virtual {v1}, Landroid/widget/CheckedTextView;->isChecked()Z

    move-result v1

    if-nez v1, :cond_c

    const/4 v1, 0x1

    .line 269
    :goto_1
    invoke-virtual {v2, v3, v4, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->enableDisableAudioCodec(Landroid/content/Context;IZ)V

    goto/16 :goto_0

    .line 270
    :cond_c
    const/4 v1, 0x0

    goto :goto_1

    .line 281
    :cond_d
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->switchAccountButton:Landroid/widget/Button;

    move-object/from16 v0, p1

    if-ne v0, v1, :cond_e

    .line 282
    new-instance v7, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-direct {v7, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 283
    .local v7, "confirmSwitchAccountDlgBuilder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f020436

    invoke-virtual {v7, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f07006a

    .line 284
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0700b6

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    .line 285
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f070231

    new-instance v3, Lcom/pccw/mobile/sip/MoreActivity$2;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/pccw/mobile/sip/MoreActivity$2;-><init>(Lcom/pccw/mobile/sip/MoreActivity;)V

    .line 286
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0701c3

    new-instance v3, Lcom/pccw/mobile/sip/MoreActivity$1;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/pccw/mobile/sip/MoreActivity$1;-><init>(Lcom/pccw/mobile/sip/MoreActivity;)V

    .line 298
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 303
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 304
    .end local v7    # "confirmSwitchAccountDlgBuilder":Landroid/app/AlertDialog$Builder;
    :cond_e
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->facebookShareTextView:Landroid/widget/TextView;

    move-object/from16 v0, p1

    if-ne v0, v1, :cond_12

    .line 305
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_f

    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 306
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 308
    :cond_f
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_11

    .line 309
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_10

    .line 310
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 312
    :cond_10
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/MoreActivity;->onCreateNoWiFiDialog()Landroid/app/Dialog;

    move-result-object v1

    check-cast v1, Landroid/app/AlertDialog;

    sput-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    .line 313
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 316
    :cond_11
    new-instance v14, Lcom/pccw/mobile/sip/FacebookShareActivity;

    invoke-direct {v14}, Lcom/pccw/mobile/sip/FacebookShareActivity;-><init>()V

    .line 317
    .local v14, "mFacebookShareActivity":Lcom/pccw/mobile/sip/FacebookShareActivity;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->activity:Landroid/support/v4/app/FragmentActivity;

    .line 318
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 317
    invoke-virtual {v14, v1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->promptShareToFacebookDialog(Landroid/support/v4/app/FragmentManager;)V

    goto/16 :goto_0

    .line 320
    .end local v14    # "mFacebookShareActivity":Lcom/pccw/mobile/sip/FacebookShareActivity;
    :cond_12
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->facebookLogoutTextView:Landroid/widget/TextView;

    move-object/from16 v0, p1

    if-eq v0, v1, :cond_1

    .line 328
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->smsInviteTextView:Landroid/widget/TextView;

    move-object/from16 v0, p1

    if-ne v0, v1, :cond_17

    .line 329
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_13

    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_13

    .line 330
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 332
    :cond_13
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_15

    .line 333
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_14

    .line 334
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 336
    :cond_14
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/MoreActivity;->onCreateNoWiFiDialog()Landroid/app/Dialog;

    move-result-object v1

    check-cast v1, Landroid/app/AlertDialog;

    sput-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    .line 337
    sget-object v1, Lcom/pccw/mobile/sip/MoreActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 340
    :cond_15
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->activity:Landroid/support/v4/app/FragmentActivity;

    sget-object v2, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/support/v4/app/FragmentActivity;->managedQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 342
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-eqz v1, :cond_16

    .line 343
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/pccw/mobile/sip/SMSInviteActivity;->newInstance(I)Lcom/pccw/mobile/sip/SMSInviteActivity;

    move-result-object v15

    .line 344
    .local v15, "newFragment":Landroid/support/v4/app/DialogFragment;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string/jumbo v2, "smssharedialog"

    invoke-virtual {v15, v1, v2}, Landroid/support/v4/app/DialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 346
    .end local v15    # "newFragment":Landroid/support/v4/app/DialogFragment;
    :cond_16
    const v1, 0x7f070215

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/MoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/MoreActivity;->showAlertDialog(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 349
    .end local v9    # "cursor":Landroid/database/Cursor;
    :cond_17
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->autoLoginTextView:Landroid/widget/TextView;

    move-object/from16 v0, p1

    if-ne v0, v1, :cond_18

    .line 350
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->newInstance(I)Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    move-result-object v15

    .line 351
    .restart local v15    # "newFragment":Landroid/support/v4/app/DialogFragment;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string/jumbo v2, "autologindialog"

    invoke-virtual {v15, v1, v2}, Landroid/support/v4/app/DialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 352
    .end local v15    # "newFragment":Landroid/support/v4/app/DialogFragment;
    :cond_18
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->topupOnlineTextView:Landroid/widget/TextView;

    move-object/from16 v0, p1

    if-ne v0, v1, :cond_1b

    .line 353
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_19

    .line 354
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/MoreActivity;->onCreateNoWiFiDialog()Landroid/app/Dialog;

    goto/16 :goto_0

    .line 355
    :cond_19
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    iget v1, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-eqz v1, :cond_1a

    .line 356
    const v1, 0x7f0701c5

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/MoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/MoreActivity;->showAlertDialog(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 359
    :cond_1a
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->generateTopupURL(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v17

    .line 360
    .local v17, "url":Ljava/lang/String;
    new-instance v13, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-static/range {v17 .. v17}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v13, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 361
    .local v13, "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/pccw/mobile/sip/MoreActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 363
    .end local v13    # "intent":Landroid/content/Intent;
    .end local v17    # "url":Ljava/lang/String;
    :cond_1b
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->topupByCallingTextView:Landroid/widget/TextView;

    move-object/from16 v0, p1

    if-ne v0, v1, :cond_1

    .line 364
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1c

    .line 365
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/MoreActivity;->onCreateNoWiFiDialog()Landroid/app/Dialog;

    goto/16 :goto_0

    .line 366
    :cond_1c
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    iget v1, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-eqz v1, :cond_1d

    .line 367
    const v1, 0x7f0701c5

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/MoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/MoreActivity;->showAlertDialog(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 369
    :cond_1d
    const-string/jumbo v16, ""

    .line 370
    .local v16, "topUpNum":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isHelloPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 371
    const-string/jumbo v16, "1833808"

    .line 377
    :cond_1e
    :goto_2
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    const/4 v3, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v1, v0, v2, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->call(Ljava/lang/String;Landroid/content/Context;Z)Z

    goto/16 :goto_0

    .line 372
    :cond_1f
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isNormalPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 373
    const-string/jumbo v16, "1833803"

    goto :goto_2

    .line 374
    :cond_20
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 375
    const-string/jumbo v16, "179179"

    goto :goto_2
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 71
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 73
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/MoreActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    .line 74
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/MoreActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->activity:Landroid/support/v4/app/FragmentActivity;

    .line 75
    return-void
.end method

.method protected onCreateNoContactDialog()Landroid/app/Dialog;
    .locals 4

    .prologue
    .line 405
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/pccw/mobile/sip/MoreActivity;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 406
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f070215

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 407
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    const v3, 0x104000a

    .line 408
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/MoreActivity$5;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/MoreActivity$5;-><init>(Lcom/pccw/mobile/sip/MoreActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 414
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1
.end method

.method protected onCreateNoWiFiDialog()Landroid/app/Dialog;
    .locals 4

    .prologue
    .line 385
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/pccw/mobile/sip/MoreActivity;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 386
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    const v2, 0x7f07006b

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 387
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    const/high16 v3, 0x1040000

    .line 388
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/MoreActivity$4;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/MoreActivity$4;-><init>(Lcom/pccw/mobile/sip/MoreActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f07015b

    .line 394
    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/MoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/MoreActivity$3;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/MoreActivity$3;-><init>(Lcom/pccw/mobile/sip/MoreActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 401
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0x8

    .line 80
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/MoreActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    check-cast v2, Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v2}, Landroid/support/v7/app/ActionBarActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 81
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    const/16 v2, 0x18

    invoke-virtual {v0, v4, v2}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(II)V

    .line 83
    const v2, 0x7f070064

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/MoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 85
    const/4 v1, 0x0

    .line 87
    .local v1, "v":Landroid/view/View;
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 88
    const v2, 0x7f04005d

    invoke-virtual {p1, v2, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 93
    :goto_0
    const v2, 0x7f0e0194

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->aboutTextView:Landroid/widget/TextView;

    .line 94
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->aboutTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    const v2, 0x7f0e0189

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->userGuideTextView:Landroid/widget/TextView;

    .line 96
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->userGuideTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    const v2, 0x7f0e018a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->faqTextView:Landroid/widget/TextView;

    .line 98
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->faqTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    const v2, 0x7f0e0196

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckedTextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->screenCheckedTextView:Landroid/widget/CheckedTextView;

    .line 100
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->screenCheckedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {v2, p0}, Landroid/widget/CheckedTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    const v2, 0x7f0e0198

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckedTextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    .line 103
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {v2, p0}, Landroid/widget/CheckedTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    const v2, 0x7f0e0199

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsBar:Landroid/view/View;

    .line 107
    const v2, 0x7f0e019a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->switchAccountButton:Landroid/widget/Button;

    .line 108
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->switchAccountButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    const v2, 0x7f0e018c

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->facebookShareTextView:Landroid/widget/TextView;

    .line 111
    const v2, 0x7f0e018d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->facebookShareBar:Landroid/view/View;

    .line 113
    const v2, 0x7f0e018e

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->facebookLogoutTextView:Landroid/widget/TextView;

    .line 114
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->facebookLogoutTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    const v2, 0x7f0e0190

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->smsInviteTextView:Landroid/widget/TextView;

    .line 117
    const v2, 0x7f0e0191

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->smsInviteBar:Landroid/view/View;

    .line 119
    const v2, 0x7f0e0192

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->autoLoginTextView:Landroid/widget/TextView;

    .line 120
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->autoLoginTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 123
    const v2, 0x7f0e019f

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->mobileNumberTextView:Landroid/widget/TextView;

    .line 124
    const v2, 0x7f0e01a2

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->accountBalanceTextView:Landroid/widget/TextView;

    .line 125
    const v2, 0x7f0e01a5

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->updateTimeTextView:Landroid/widget/TextView;

    .line 126
    const v2, 0x7f0e01a7

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->checkBalanceNotic:Landroid/widget/TextView;

    .line 127
    const v2, 0x7f0e01a6

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->checkBalanceNoticBar:Landroid/view/View;

    .line 129
    const v2, 0x7f0e01aa

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->topupOnlineTextView:Landroid/widget/TextView;

    .line 130
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->topupOnlineTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    const v2, 0x7f0e01ac

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->topupByCallingTextView:Landroid/widget/TextView;

    .line 133
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->isHelloPrepaid(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 134
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->topupByCallingTextView:Landroid/widget/TextView;

    const v3, 0x7f070058

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 141
    :cond_0
    :goto_1
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->topupByCallingTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    :cond_1
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSL(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 146
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->facebookShareTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 147
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->smsInviteTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 148
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->facebookShareBar:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 149
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->smsInviteBar:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 156
    :goto_2
    iput-boolean v5, p0, Lcom/pccw/mobile/sip/MoreActivity;->isRunningCheckBalanceTread:Z

    .line 158
    return-object v1

    .line 90
    :cond_2
    const v2, 0x7f04005c

    invoke-virtual {p1, v2, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    goto/16 :goto_0

    .line 135
    :cond_3
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->isNormalPrepaid(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 136
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->topupByCallingTextView:Landroid/widget/TextView;

    const v3, 0x7f070059

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 137
    :cond_4
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 138
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->topupByCallingTextView:Landroid/widget/TextView;

    const v3, 0x7f070057

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 152
    :cond_5
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->facebookShareTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity;->smsInviteTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2
.end method

.method public onResume()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 163
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 165
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->facebookLogoutTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 167
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->screenCheckedTextView:Landroid/widget/CheckedTextView;

    iget-object v1, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v2, "PREF_SCREEN"

    .line 168
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 167
    invoke-virtual {v0, v1}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 169
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    iget-object v1, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const v2, 0x7f070251

    .line 170
    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/MoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 169
    invoke-virtual {v0, v1}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 171
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoCodecSelection()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 172
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {v0, v4}, Landroid/widget/CheckedTextView;->setVisibility(I)V

    .line 173
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsBar:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 178
    :goto_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 179
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isDisconnecting()Z

    move-result v0

    if-nez v0, :cond_0

    .line 180
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    const/16 v1, -0x64

    if-eq v0, v1, :cond_3

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {v0, v3}, Landroid/widget/CheckedTextView;->setEnabled(Z)V

    .line 182
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {v0, v3}, Landroid/widget/CheckedTextView;->setClickable(Z)V

    .line 189
    :goto_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->switchAccountButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 192
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 193
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->mobileNumberTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 195
    :cond_1
    return-void

    .line 175
    :cond_2
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {v0, v3}, Landroid/widget/CheckedTextView;->setVisibility(I)V

    .line 176
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsBar:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 184
    :cond_3
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {v0, v5}, Landroid/widget/CheckedTextView;->setEnabled(Z)V

    .line 185
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity;->ilbcCodecsCheckedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {v0, v5}, Landroid/widget/CheckedTextView;->setClickable(Z)V

    goto :goto_1
.end method
