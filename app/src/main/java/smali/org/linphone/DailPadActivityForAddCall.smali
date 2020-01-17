.class public Lorg/linphone/DailPadActivityForAddCall;
.super Landroid/support/v4/app/Fragment;
.source "DailPadActivityForAddCall.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/view/View$OnKeyListener;
.implements Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$KKDialogResponses;


# static fields
.field private static final DIAL_TONE_STREAM_TYPE:I = 0x3

.field private static final SHOW_IDD_CHARGE_MESSAGE:Ljava/lang/String; = "SHOW_IDD_CHARGE_MESSAGE"

.field private static final TAG:Ljava/lang/String; = "PCCW_MOBILE_SIP"

.field private static final TONE_LENGTH_MS:I = 0x96

.field private static final TONE_RELATIVE_VOLUME:I = 0x50

.field private static final VIBRATE_NO_REPEAT:I = -0x1

.field private static final promptNoWifiDialog:I = 0x1

.field private static theDailPad:Lorg/linphone/DailPadActivityForAddCall;


# instance fields
.field activity:Landroid/app/Activity;

.field ctx:Landroid/content/Context;

.field private dialOutNumber:Ljava/lang/String;

.field private fragmentManager:Landroid/support/v4/app/FragmentManager;

.field handler:Landroid/os/Handler;

.field private mDTMFToneEnabled:Z

.field private mDelete:Landroid/widget/ImageButton;

.field private mDialButton:Landroid/widget/ImageButton;

.field private mDigitsBackground:Landroid/graphics/drawable/Drawable;

.field private mDigitsEmptyBackground:Landroid/graphics/drawable/Drawable;

.field private mDisplayName:Ljava/lang/String;

.field private mPref:Landroid/content/SharedPreferences;

.field private mToneGenerator:Landroid/media/ToneGenerator;

.field private mToneGeneratorLock:Ljava/lang/Object;

.field private mVibrateOn:Z

.field private mVibratePattern:[J

.field private mVibrator:Landroid/os/Vibrator;

.field private m_AlertDlg:Landroid/app/AlertDialog;

.field private sip_uri_box:Landroid/widget/EditText;

.field v:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 65
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 85
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->mToneGeneratorLock:Ljava/lang/Object;

    .line 116
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->dialOutNumber:Ljava/lang/String;

    .line 119
    new-instance v0, Lorg/linphone/DailPadActivityForAddCall$1;

    invoke-direct {v0, p0}, Lorg/linphone/DailPadActivityForAddCall$1;-><init>(Lorg/linphone/DailPadActivityForAddCall;)V

    iput-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->handler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lorg/linphone/DailPadActivityForAddCall;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivityForAddCall;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->mToneGeneratorLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lorg/linphone/DailPadActivityForAddCall;)Landroid/media/ToneGenerator;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivityForAddCall;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->mToneGenerator:Landroid/media/ToneGenerator;

    return-object v0
.end method

.method static synthetic access$200(Lorg/linphone/DailPadActivityForAddCall;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivityForAddCall;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$300(Lorg/linphone/DailPadActivityForAddCall;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivityForAddCall;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lorg/linphone/DailPadActivityForAddCall;->performCallWithAddress(Ljava/lang/String;)V

    return-void
.end method

.method private call(Ljava/lang/String;)Z
    .locals 2
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 713
    iput-object p1, p0, Lorg/linphone/DailPadActivityForAddCall;->dialOutNumber:Ljava/lang/String;

    .line 714
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    invoke-virtual {v0, p1, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->addCall(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static getDailPad()Lorg/linphone/DailPadActivityForAddCall;
    .locals 1

    .prologue
    .line 214
    sget-object v0, Lorg/linphone/DailPadActivityForAddCall;->theDailPad:Lorg/linphone/DailPadActivityForAddCall;

    if-nez v0, :cond_0

    .line 215
    const/4 v0, 0x0

    .line 217
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/linphone/DailPadActivityForAddCall;->theDailPad:Lorg/linphone/DailPadActivityForAddCall;

    goto :goto_0
.end method

.method private getlastCall()Ljava/lang/String;
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 560
    sget-object v1, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const/16 v2, 0x8

    if-ge v1, v2, :cond_4

    .line 561
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 562
    .local v0, "resolver":Landroid/content/ContentResolver;
    const/4 v6, 0x0

    .line 565
    .local v6, "c":Landroid/database/Cursor;
    :try_start_0
    sget-object v1, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "number"

    aput-object v4, v2, v3

    const-string/jumbo v3, "type = 2"

    const/4 v4, 0x0

    const-string/jumbo v5, "date DESC LIMIT 1"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 569
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-nez v1, :cond_2

    .line 570
    :cond_0
    const-string/jumbo v7, ""
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 575
    .local v7, "lastCall":Ljava/lang/String;
    :goto_0
    if-eqz v6, :cond_1

    .line 576
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 581
    .end local v0    # "resolver":Landroid/content/ContentResolver;
    .end local v6    # "c":Landroid/database/Cursor;
    :cond_1
    :goto_1
    return-object v7

    .line 572
    .end local v7    # "lastCall":Ljava/lang/String;
    .restart local v0    # "resolver":Landroid/content/ContentResolver;
    .restart local v6    # "c":Landroid/database/Cursor;
    :cond_2
    const/4 v1, 0x0

    :try_start_1
    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v7

    .restart local v7    # "lastCall":Ljava/lang/String;
    goto :goto_0

    .line 575
    .end local v7    # "lastCall":Ljava/lang/String;
    :catchall_0
    move-exception v1

    if-eqz v6, :cond_3

    .line 576
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v1

    .line 579
    .end local v0    # "resolver":Landroid/content/ContentResolver;
    .end local v6    # "c":Landroid/database/Cursor;
    :cond_4
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    invoke-static {v1}, Landroid/provider/CallLog$Calls;->getLastOutgoingCall(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    .restart local v7    # "lastCall":Ljava/lang/String;
    goto :goto_1
.end method

.method static handleChars(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 360
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/linphone/DailPadActivityForAddCall;->handleChars(Landroid/content/Context;Ljava/lang/String;ZLandroid/widget/EditText;)Z

    move-result v0

    return v0
.end method

.method static handleChars(Landroid/content/Context;Ljava/lang/String;Landroid/widget/EditText;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "textField"    # Landroid/widget/EditText;

    .prologue
    .line 356
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lorg/linphone/DailPadActivityForAddCall;->handleChars(Landroid/content/Context;Ljava/lang/String;ZLandroid/widget/EditText;)Z

    move-result v0

    return v0
.end method

.method static handleChars(Landroid/content/Context;Ljava/lang/String;ZLandroid/widget/EditText;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "useSystemWindow"    # Z
    .param p3, "textField"    # Landroid/widget/EditText;

    .prologue
    .line 367
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 376
    .local v0, "dialString":Ljava/lang/String;
    const/4 v1, 0x0

    return v1
.end method

.method private handleIntent(Landroid/content/Intent;)V
    .locals 9
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x0

    const/4 v3, 0x0

    .line 307
    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v7

    .line 308
    .local v7, "type":Ljava/lang/String;
    const-string/jumbo v0, "vnd.android.cursor.item/person"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "vnd.android.cursor.item/phone"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 310
    :cond_0
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string/jumbo v4, "number"

    aput-object v4, v2, v8

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 313
    .local v6, "c":Landroid/database/Cursor;
    if-eqz v6, :cond_2

    .line 314
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 316
    invoke-interface {v6, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->setFormattedDigits(Ljava/lang/String;)V

    .line 318
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 321
    .end local v6    # "c":Landroid/database/Cursor;
    :cond_2
    return-void
.end method

.method private keyPressed(I)V
    .locals 2
    .param p1, "keyCode"    # I

    .prologue
    .line 621
    invoke-direct {p0}, Lorg/linphone/DailPadActivityForAddCall;->vibrate()V

    .line 622
    new-instance v0, Landroid/view/KeyEvent;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1}, Landroid/view/KeyEvent;-><init>(II)V

    .line 623
    .local v0, "event":Landroid/view/KeyEvent;
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v1, p1, v0}, Landroid/widget/EditText;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 624
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivityForAddCall;->afterTextChanged(Landroid/text/Editable;)V

    .line 625
    return-void
.end method

.method private performCall()V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 496
    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 497
    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 498
    .local v0, "aTo":Ljava/lang/String;
    invoke-static {v0}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    .line 500
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    iget-object v5, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    invoke-virtual {v4, v0, v5}, Lcom/pccw/mobile/sip/service/MobileSipService;->startCallChecking(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 502
    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    invoke-static {v0, v4}, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->hasIDDPrefix(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    .line 503
    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string/jumbo v5, "SHOW_IDD_CHARGE_MESSAGE"

    const/4 v6, 0x1

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 506
    :try_start_0
    new-instance v2, Landroid/widget/CheckBox;

    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    invoke-direct {v2, v4}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 507
    .local v2, "doNotShowAgainBox":Landroid/widget/CheckBox;
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 508
    const v4, 0x7f070106

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setText(I)V

    .line 510
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    invoke-direct {v1, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 511
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const v4, 0x7f020436

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f07006a

    .line 512
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f070169

    .line 513
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 514
    invoke-virtual {v4, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const/high16 v5, 0x1040000

    new-instance v6, Lorg/linphone/DailPadActivityForAddCall$4;

    invoke-direct {v6, p0}, Lorg/linphone/DailPadActivityForAddCall$4;-><init>(Lorg/linphone/DailPadActivityForAddCall;)V

    .line 515
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x104000a

    new-instance v6, Lorg/linphone/DailPadActivityForAddCall$3;

    invoke-direct {v6, p0, v2}, Lorg/linphone/DailPadActivityForAddCall$3;-><init>(Lorg/linphone/DailPadActivityForAddCall;Landroid/widget/CheckBox;)V

    .line 522
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 538
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 555
    .end local v0    # "aTo":Ljava/lang/String;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v2    # "doNotShowAgainBox":Landroid/widget/CheckBox;
    :cond_0
    :goto_0
    return-void

    .line 544
    .restart local v0    # "aTo":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/linphone/DailPadActivityForAddCall;->performCallWithAddress(Ljava/lang/String;)V

    goto :goto_0

    .line 549
    .end local v0    # "aTo":Ljava/lang/String;
    :cond_2
    invoke-direct {p0}, Lorg/linphone/DailPadActivityForAddCall;->getlastCall()Ljava/lang/String;

    move-result-object v3

    .line 550
    .local v3, "lastCall":Ljava/lang/String;
    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 551
    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    iget-object v5, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->length()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setSelection(I)V

    .line 552
    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/linphone/DailPadActivityForAddCall;->afterTextChanged(Landroid/text/Editable;)V

    goto :goto_0

    .line 539
    .end local v3    # "lastCall":Ljava/lang/String;
    .restart local v0    # "aTo":Ljava/lang/String;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private performCallWithAddress(Ljava/lang/String;)V
    .locals 2
    .param p1, "aTo"    # Ljava/lang/String;

    .prologue
    .line 487
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 488
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->afterTextChanged(Landroid/text/Editable;)V

    .line 489
    iput-object p1, p0, Lorg/linphone/DailPadActivityForAddCall;->dialOutNumber:Ljava/lang/String;

    .line 491
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    invoke-virtual {v0, p1, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->addCall(Ljava/lang/String;Landroid/content/Context;)Z

    .line 492
    return-void
.end method

.method private setDialer(Landroid/net/Uri;)V
    .locals 1
    .param p1, "dialUri"    # Landroid/net/Uri;

    .prologue
    .line 275
    invoke-virtual {p1}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    .line 276
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->setFormattedDigits(Ljava/lang/String;)V

    .line 277
    return-void
.end method

.method private setupKeypad()V
    .locals 3

    .prologue
    .line 385
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00b3

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 386
    .local v0, "view":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 387
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 389
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00b4

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 390
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00b5

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 391
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00b6

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 392
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00b7

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 393
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00b8

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 394
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00b9

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 395
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00ba

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 396
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00bb

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 397
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00bc

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 399
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00bd

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 400
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 401
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 403
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v2, 0x7f0e00be

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 404
    return-void
.end method

.method private showDialog(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    const/4 v1, 0x1

    .line 725
    packed-switch p1, :pswitch_data_0

    .line 736
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unkown dialog id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 727
    :pswitch_0
    invoke-static {v1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->newInstance(I)Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;

    move-result-object v0

    .line 728
    .local v0, "kkdialog":Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;
    invoke-virtual {v0, p0, v1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 729
    const v1, 0x7f07006b

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivityForAddCall;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->setMessage(Ljava/lang/String;)V

    .line 730
    const v1, 0x7f07015b

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivityForAddCall;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->setPositiveButton(Ljava/lang/String;)V

    .line 731
    const/high16 v1, 0x1040000

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivityForAddCall;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->setNegativeButton(Ljava/lang/String;)V

    .line 732
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->setCancelable(Z)V

    .line 733
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->fragmentManager:Landroid/support/v4/app/FragmentManager;

    const-string/jumbo v2, "dialog"

    invoke-virtual {v0, v1, v2}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 740
    return-void

    .line 725
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private declared-synchronized vibrate()V
    .locals 3

    .prologue
    .line 631
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/linphone/DailPadActivityForAddCall;->mVibrateOn:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 638
    :goto_0
    monitor-exit p0

    return-void

    .line 634
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->mVibrator:Landroid/os/Vibrator;

    if-nez v0, :cond_1

    .line 635
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    const-string/jumbo v1, "vibrator"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->mVibrator:Landroid/os/Vibrator;

    .line 637
    :cond_1
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->mVibrator:Landroid/os/Vibrator;

    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->mVibratePattern:[J

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate([JI)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 631
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 3
    .param p1, "input"    # Landroid/text/Editable;

    .prologue
    .line 339
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-static {v0, v1, v2}, Lorg/linphone/DailPadActivityForAddCall;->handleChars(Landroid/content/Context;Ljava/lang/String;Landroid/widget/EditText;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 341
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->clear()V

    .line 353
    :cond_0
    return-void
.end method

.method public callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p4, "message"    # Ljava/lang/String;

    .prologue
    .line 720
    return-void
.end method

.method call_menu()V
    .locals 3

    .prologue
    .line 701
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 702
    .local v0, "target":Ljava/lang/String;
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->m_AlertDlg:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 703
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->m_AlertDlg:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 706
    :cond_0
    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->call(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 707
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 708
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivityForAddCall;->afterTextChanged(Landroid/text/Editable;)V

    .line 710
    :cond_1
    return-void
.end method

.method public doNegativeClick(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 752
    return-void
.end method

.method public doNeutralClick(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 758
    return-void
.end method

.method public doPositiveClick(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 746
    return-void
.end method

.method public handIntent()V
    .locals 4

    .prologue
    .line 284
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->isChild()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 285
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 289
    .local v0, "intent":Landroid/content/Intent;
    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->handleIntent(Landroid/content/Intent;)V

    .line 304
    :cond_0
    :goto_0
    return-void

    .line 291
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_1
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 293
    .restart local v0    # "intent":Landroid/content/Intent;
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 295
    .local v1, "uri":Landroid/net/Uri;
    if-eqz v1, :cond_0

    .line 296
    const-string/jumbo v2, "tel"

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 297
    invoke-direct {p0, v1}, Lorg/linphone/DailPadActivityForAddCall;->setDialer(Landroid/net/Uri;)V

    goto :goto_0

    .line 299
    :cond_2
    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->handleIntent(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method protected maybeAddNumberFormatting()V
    .locals 2

    .prologue
    .line 380
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    new-instance v1, Landroid/telephony/PhoneNumberFormattingTextWatcher;

    invoke-direct {v1}, Landroid/telephony/PhoneNumberFormattingTextWatcher;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 381
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/16 v5, 0xa

    const/16 v4, 0x9

    const/16 v3, 0x8

    const/4 v2, 0x7

    const/4 v1, 0x1

    .line 408
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 484
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 410
    :pswitch_1
    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 411
    invoke-direct {p0, v3}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 415
    :pswitch_2
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 416
    invoke-direct {p0, v4}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 420
    :pswitch_3
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 421
    invoke-direct {p0, v5}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 425
    :pswitch_4
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 426
    const/16 v0, 0xb

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 430
    :pswitch_5
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 431
    const/16 v0, 0xc

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 435
    :pswitch_6
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 436
    const/16 v0, 0xd

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 440
    :pswitch_7
    invoke-virtual {p0, v2}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 441
    const/16 v0, 0xe

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 445
    :pswitch_8
    invoke-virtual {p0, v3}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 446
    const/16 v0, 0xf

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 450
    :pswitch_9
    invoke-virtual {p0, v4}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 451
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 455
    :pswitch_a
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 456
    invoke-direct {p0, v2}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 460
    :pswitch_b
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 461
    const/16 v0, 0x12

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 465
    :pswitch_c
    invoke-virtual {p0, v5}, Lorg/linphone/DailPadActivityForAddCall;->playTone(I)V

    .line 466
    const/16 v0, 0x11

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 470
    :pswitch_d
    const/16 v0, 0x43

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 474
    :pswitch_e
    invoke-direct {p0}, Lorg/linphone/DailPadActivityForAddCall;->performCall()V

    goto :goto_0

    .line 478
    :pswitch_f
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 479
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setCursorVisible(Z)V

    goto/16 :goto_0

    .line 408
    nop

    :pswitch_data_0
    .packed-switch 0x7f0e00af
        :pswitch_f
        :pswitch_d
        :pswitch_0
        :pswitch_e
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_c
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 137
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 138
    invoke-virtual {p0}, Lorg/linphone/DailPadActivityForAddCall;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    .line 139
    invoke-virtual {p0}, Lorg/linphone/DailPadActivityForAddCall;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    .line 140
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    check-cast v0, Lcom/pccw/mobile/sip/AddCallActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/AddCallActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->fragmentManager:Landroid/support/v4/app/FragmentManager;

    .line 143
    sput-object p0, Lorg/linphone/DailPadActivityForAddCall;->theDailPad:Lorg/linphone/DailPadActivityForAddCall;

    .line 144
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    .line 148
    const-string/jumbo v3, "KKUI"

    const-string/jumbo v4, "DailPadActivityForAddCall-onCreateView"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    invoke-virtual {p0}, Lorg/linphone/DailPadActivityForAddCall;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    check-cast v3, Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v3}, Landroid/support/v7/app/ActionBarActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 151
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    const/16 v3, 0x8

    const/16 v4, 0xc

    invoke-virtual {v0, v3, v4}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(II)V

    .line 153
    const v3, 0x7f070060

    invoke-virtual {p0, v3}, Lorg/linphone/DailPadActivityForAddCall;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 155
    invoke-virtual {v0, v5}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 156
    invoke-virtual {v0, v5}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 158
    const v3, 0x7f040029

    const/4 v4, 0x0

    invoke-virtual {p1, v3, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    .line 160
    :try_start_0
    invoke-virtual {p0}, Lorg/linphone/DailPadActivityForAddCall;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 161
    .local v1, "r":Landroid/content/res/Resources;
    const v3, 0x7f020068

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->mDigitsBackground:Landroid/graphics/drawable/Drawable;

    .line 162
    const v3, 0x7f020066

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->mDigitsEmptyBackground:Landroid/graphics/drawable/Drawable;

    .line 163
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v4, 0x7f0e00af

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    .line 164
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setInputType(I)V

    .line 169
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v3, p0}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 170
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v3, p0}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 173
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    new-instance v4, Lorg/linphone/DailPadActivityForAddCall$2;

    invoke-direct {v4, p0}, Lorg/linphone/DailPadActivityForAddCall$2;-><init>(Lorg/linphone/DailPadActivityForAddCall;)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 186
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v4, 0x7f0e00b3

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 187
    .local v2, "view":Landroid/view/View;
    if-eqz v2, :cond_0

    .line 188
    invoke-direct {p0}, Lorg/linphone/DailPadActivityForAddCall;->setupKeypad()V

    .line 191
    :cond_0
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v4, 0x7f0e00b0

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->mDelete:Landroid/widget/ImageButton;

    .line 192
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->mDelete:Landroid/widget/ImageButton;

    invoke-virtual {v3, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->mDelete:Landroid/widget/ImageButton;

    invoke-virtual {v3, p0}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 194
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    const v4, 0x7f0e00b2

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->mDialButton:Landroid/widget/ImageButton;

    .line 195
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->mDialButton:Landroid/widget/ImageButton;

    invoke-virtual {v3, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 197
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->mPref:Landroid/content/SharedPreferences;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    .end local v1    # "r":Landroid/content/res/Resources;
    .end local v2    # "view":Landroid/view/View;
    :goto_0
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->v:Landroid/view/View;

    return-object v3

    .line 200
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 225
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 226
    const/4 v0, 0x0

    sput-object v0, Lorg/linphone/DailPadActivityForAddCall;->theDailPad:Lorg/linphone/DailPadActivityForAddCall;

    .line 227
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 664
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 673
    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 666
    :pswitch_0
    const/16 v0, 0x42

    if-ne p2, v0, :cond_0

    .line 668
    invoke-virtual {p0}, Lorg/linphone/DailPadActivityForAddCall;->call_menu()V

    .line 669
    const/4 v0, 0x1

    goto :goto_0

    .line 664
    :pswitch_data_0
    .packed-switch 0x7f0e012b
        :pswitch_0
    .end packed-switch
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 642
    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 643
    .local v0, "digits":Landroid/text/Editable;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    .line 644
    .local v1, "id":I
    sparse-switch v1, :sswitch_data_0

    move v2, v3

    .line 659
    :goto_0
    return v2

    .line 646
    :sswitch_0
    invoke-interface {v0}, Landroid/text/Editable;->clear()V

    .line 647
    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/linphone/DailPadActivityForAddCall;->afterTextChanged(Landroid/text/Editable;)V

    .line 651
    iget-object v4, p0, Lorg/linphone/DailPadActivityForAddCall;->mDelete:Landroid/widget/ImageButton;

    invoke-virtual {v4, v3}, Landroid/widget/ImageButton;->setPressed(Z)V

    goto :goto_0

    .line 655
    :sswitch_1
    const/16 v3, 0x51

    invoke-direct {p0, v3}, Lorg/linphone/DailPadActivityForAddCall;->keyPressed(I)V

    goto :goto_0

    .line 644
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0e00b0 -> :sswitch_0
        0x7f0e00bd -> :sswitch_1
    .end sparse-switch
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 678
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 684
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 681
    :pswitch_0
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 682
    const/4 v0, 0x1

    goto :goto_0

    .line 678
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 270
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onPause()V

    .line 271
    return-void
.end method

.method public onResume()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    .line 233
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 234
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string/jumbo v4, "dtmf_tone"

    invoke-static {v3, v4, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v2, :cond_2

    :goto_0
    iput-boolean v2, p0, Lorg/linphone/DailPadActivityForAddCall;->mDTMFToneEnabled:Z

    .line 240
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->mToneGeneratorLock:Ljava/lang/Object;

    monitor-enter v3

    .line 241
    :try_start_0
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->mToneGenerator:Landroid/media/ToneGenerator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 248
    :try_start_1
    new-instance v2, Landroid/media/ToneGenerator;

    const/4 v4, 0x3

    const/16 v5, 0x50

    invoke-direct {v2, v4, v5}, Landroid/media/ToneGenerator;-><init>(II)V

    iput-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->mToneGenerator:Landroid/media/ToneGenerator;

    .line 249
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    const/4 v4, 0x3

    invoke-virtual {v2, v4}, Landroid/app/Activity;->setVolumeControlStream(I)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 256
    :cond_0
    :goto_1
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 258
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    instance-of v2, v2, Lcom/pccw/mobile/sip/AddCallActivity;

    if-eqz v2, :cond_1

    .line 259
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->activity:Landroid/app/Activity;

    check-cast v2, Lcom/pccw/mobile/sip/AddCallActivity;

    invoke-virtual {v2}, Lcom/pccw/mobile/sip/AddCallActivity;->getAndClearDialUri()Landroid/net/Uri;

    move-result-object v0

    .line 260
    .local v0, "dialUri":Landroid/net/Uri;
    if-eqz v0, :cond_1

    const-string/jumbo v2, "tel"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 261
    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivityForAddCall;->setDialer(Landroid/net/Uri;)V

    .line 264
    .end local v0    # "dialUri":Landroid/net/Uri;
    :cond_1
    return-void

    .line 234
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 250
    :catch_0
    move-exception v1

    .line 253
    .local v1, "e":Ljava/lang/RuntimeException;
    const/4 v2, 0x0

    :try_start_3
    iput-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->mToneGenerator:Landroid/media/ToneGenerator;

    goto :goto_1

    .line 256
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2
.end method

.method playTone(I)V
    .locals 8
    .param p1, "tone"    # I

    .prologue
    .line 586
    iget-boolean v2, p0, Lorg/linphone/DailPadActivityForAddCall;->mDTMFToneEnabled:Z

    if-nez v2, :cond_1

    .line 618
    :cond_0
    :goto_0
    return-void

    .line 595
    :cond_1
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    const-string/jumbo v3, "audio"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 596
    .local v0, "audioManager":Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v1

    .line 597
    .local v1, "ringerMode":I
    if-eqz v1, :cond_0

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 602
    iget-object v3, p0, Lorg/linphone/DailPadActivityForAddCall;->mToneGeneratorLock:Ljava/lang/Object;

    monitor-enter v3

    .line 603
    :try_start_0
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->mToneGenerator:Landroid/media/ToneGenerator;

    if-nez v2, :cond_2

    .line 606
    monitor-exit v3

    goto :goto_0

    .line 617
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 610
    :cond_2
    :try_start_1
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->mToneGenerator:Landroid/media/ToneGenerator;

    invoke-virtual {v2, p1}, Landroid/media/ToneGenerator;->startTone(I)Z

    .line 613
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->handler:Landroid/os/Handler;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 614
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->handler:Landroid/os/Handler;

    const/4 v4, 0x0

    const-wide/16 v6, 0x96

    invoke-virtual {v2, v4, v6, v7}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 617
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method protected setFormattedDigits(Ljava/lang/String;)V
    .locals 4
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 325
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->extractNetworkPortion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 326
    .local v0, "dialString":Ljava/lang/String;
    invoke-static {v0}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 327
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 328
    iget-object v2, p0, Lorg/linphone/DailPadActivityForAddCall;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    .line 329
    .local v1, "digits":Landroid/text/Editable;
    const/4 v2, 0x0

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v3

    invoke-interface {v1, v2, v3, v0}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 334
    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivityForAddCall;->afterTextChanged(Landroid/text/Editable;)V

    .line 336
    .end local v1    # "digits":Landroid/text/Editable;
    :cond_0
    return-void
.end method
