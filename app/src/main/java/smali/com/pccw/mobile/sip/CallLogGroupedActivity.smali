.class public Lcom/pccw/mobile/sip/CallLogGroupedActivity;
.super Lcom/pccw/mobile/sip/BaseActionBarActivity;
.source "CallLogGroupedActivity.java"

# interfaces
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/CallLogGroupedActivity$QueryByNumber;,
        Lcom/pccw/mobile/sip/CallLogGroupedActivity$QueryByName;,
        Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;,
        Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/pccw/mobile/sip/BaseActionBarActivity;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# static fields
.field private static final FORMATTING_TYPE_INVALID:I = -0x1

.field private static final SHOW_IDD_CHARGE_MESSAGE:Ljava/lang/String; = "SHOW_IDD_CHARGE_MESSAGE"

.field private static sFormattingType:I


# instance fields
.field actionBar:Landroid/support/v7/app/ActionBar;

.field private contactName:Ljava/lang/String;

.field private contactNameView:Landroid/widget/TextView;

.field private contactNumber:Ljava/lang/String;

.field private contactPhoto:Landroid/graphics/Bitmap;

.field private contactPhotoView:Landroid/widget/ImageView;

.field conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

.field private hasContact:Z

.field mCalllogList:Landroid/widget/ListView;

.field private mCalllogListCursorAdapter:Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;

.field mLoaderManager:Landroid/support/v4/app/LoaderManager;

.field private targetNumber:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 75
    const/4 v0, -0x1

    sput v0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->sFormattingType:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->hasContact:Z

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogGroupedActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->call(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogGroupedActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogGroupedActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->pasteNumberToDialer(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;I)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogGroupedActivity;
    .param p1, "x1"    # Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;
    .param p2, "x2"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->setCallTypeLabel(Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;I)V

    return-void
.end method

.method private call(Ljava/lang/String;)V
    .locals 2
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 195
    if-nez p1, :cond_0

    .line 196
    iget-object p1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->targetNumber:Ljava/lang/String;

    .line 197
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->call(Ljava/lang/String;Landroid/content/Context;Z)Z

    .line 198
    return-void
.end method

.method private formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 272
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 273
    const-string/jumbo v2, ""

    .line 288
    :goto_0
    return-object v2

    .line 277
    :cond_0
    sget v2, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->sFormattingType:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    .line 278
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-static {v2}, Landroid/telephony/PhoneNumberUtils;->getFormatTypeForLocale(Ljava/util/Locale;)I

    move-result v2

    sput v2, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->sFormattingType:I

    .line 282
    :cond_1
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->convertKeypadLettersToDigits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 281
    invoke-static {v2}, Landroid/telephony/PhoneNumberUtils;->extractNetworkPortion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 284
    .local v1, "unformattedNumber":Ljava/lang/String;
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 285
    .local v0, "sEditable":Landroid/text/SpannableStringBuilder;
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 287
    sget v2, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->sFormattingType:I

    invoke-static {v0, v2}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Landroid/text/Editable;I)V

    .line 288
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private makeVoiceCall(Ljava/lang/String;)V
    .locals 7
    .param p1, "phoneNum"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 208
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    iget v4, v4, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v4, :cond_2

    .line 210
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    .line 211
    .local v3, "mformattedNumber":Ljava/lang/String;
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    invoke-virtual {v4, v3, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->startCallChecking(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 214
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->hasIDDPrefix(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 215
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string/jumbo v5, "SHOW_IDD_CHARGE_MESSAGE"

    const/4 v6, 0x1

    .line 216
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 218
    :try_start_0
    iput-object v3, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->targetNumber:Ljava/lang/String;

    .line 220
    new-instance v1, Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v1, v4}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 221
    .local v1, "doNotShowAgainBox":Landroid/widget/CheckBox;
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 222
    const v4, 0x7f070106

    invoke-virtual {v1, v4}, Landroid/widget/CheckBox;->setText(I)V

    .line 224
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .line 225
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 226
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v4, 0x7f020436

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f07006a

    .line 227
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f070169

    .line 228
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 229
    invoke-virtual {v4, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const/high16 v5, 0x1040000

    new-instance v6, Lcom/pccw/mobile/sip/CallLogGroupedActivity$2;

    invoke-direct {v6, p0}, Lcom/pccw/mobile/sip/CallLogGroupedActivity$2;-><init>(Lcom/pccw/mobile/sip/CallLogGroupedActivity;)V

    .line 230
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x104000a

    new-instance v6, Lcom/pccw/mobile/sip/CallLogGroupedActivity$1;

    invoke-direct {v6, p0, v1}, Lcom/pccw/mobile/sip/CallLogGroupedActivity$1;-><init>(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Landroid/widget/CheckBox;)V

    .line 237
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 252
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v1    # "doNotShowAgainBox":Landroid/widget/CheckBox;
    .end local v3    # "mformattedNumber":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 258
    .restart local v3    # "mformattedNumber":Ljava/lang/String;
    :cond_1
    invoke-direct {p0, v3}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->call(Ljava/lang/String;)V

    goto :goto_0

    .line 263
    .end local v3    # "mformattedNumber":Ljava/lang/String;
    :cond_2
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.CALL"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 265
    .local v2, "intent":Landroid/content/Intent;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "tel:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 266
    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 253
    .end local v2    # "intent":Landroid/content/Intent;
    .restart local v3    # "mformattedNumber":Ljava/lang/String;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private pasteNumberToDialer(Ljava/lang/String;)V
    .locals 1
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 201
    if-nez p1, :cond_0

    .line 202
    iget-object p1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->targetNumber:Ljava/lang/String;

    .line 203
    :cond_0
    invoke-static {p1, p0}, Lcom/pccw/mobile/sip/util/IntentUtils;->genDialScreenIntent(Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->startActivity(Landroid/content/Intent;)V

    .line 204
    return-void
.end method

.method private setCallTypeLabel(Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;I)V
    .locals 2
    .param p1, "views"    # Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;
    .param p2, "callTypeIndex"    # I

    .prologue
    .line 357
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->callTypeImageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 358
    packed-switch p2, :pswitch_data_0

    .line 372
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->callTypeTextView:Landroid/widget/TextView;

    const v1, 0x7f07007d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 373
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->callTypeImageView:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 376
    :goto_0
    return-void

    .line 360
    :pswitch_0
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->callTypeTextView:Landroid/widget/TextView;

    const v1, 0x7f07007a

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 361
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->callTypeImageView:Landroid/widget/ImageView;

    const v1, 0x7f02043f

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 364
    :pswitch_1
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->callTypeTextView:Landroid/widget/TextView;

    const v1, 0x7f07007b

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 365
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->callTypeImageView:Landroid/widget/ImageView;

    const v1, 0x7f020448

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 368
    :pswitch_2
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->callTypeTextView:Landroid/widget/TextView;

    const v1, 0x7f070079

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 369
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->callTypeImageView:Landroid/widget/ImageView;

    const v1, 0x7f020434

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 358
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 81
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 83
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 84
    .local v0, "mIntent":Landroid/content/Intent;
    const-string/jumbo v1, "contactNumber"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactNumber:Ljava/lang/String;

    .line 85
    const-string/jumbo v1, "contactName"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactName:Ljava/lang/String;

    .line 86
    const-string/jumbo v1, "contactPhoto"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    iput-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactPhoto:Landroid/graphics/Bitmap;

    .line 88
    const-string/jumbo v1, "KKIM"

    const-string/jumbo v4, "contactNumber=%s contactName=%s, contactPhotoByte=%s"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactNumber:Ljava/lang/String;

    aput-object v6, v5, v3

    iget-object v6, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactName:Ljava/lang/String;

    aput-object v6, v5, v2

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactPhoto:Landroid/graphics/Bitmap;

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactName:Ljava/lang/String;

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->hasContact:Z

    .line 95
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 96
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 97
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    const v3, 0x7f07007c

    invoke-virtual {v1, v3}, Landroid/support/v7/app/ActionBar;->setTitle(I)V

    .line 99
    const v1, 0x7f040033

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->setContentView(I)V

    .line 101
    new-instance v1, Lcom/pccw/sms/service/ConversationParticipantItemService;

    invoke-direct {v1, p0}, Lcom/pccw/sms/service/ConversationParticipantItemService;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

    .line 103
    const v1, 0x7f0e00f3

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactNameView:Landroid/widget/TextView;

    .line 104
    const v1, 0x7f0e00f2

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactPhotoView:Landroid/widget/ImageView;

    .line 105
    const v1, 0x7f0e00f4

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->mCalllogList:Landroid/widget/ListView;

    .line 108
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactName:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 109
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactNameView:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    :goto_1
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactPhoto:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    .line 115
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactPhotoView:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactPhoto:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 118
    :cond_0
    new-instance v1, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;

    const/4 v3, 0x0

    invoke-direct {v1, p0, p0, v3, v2}, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;-><init>(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Landroid/content/Context;Landroid/database/Cursor;Z)V

    iput-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->mCalllogListCursorAdapter:Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;

    .line 119
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->mCalllogList:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->mCalllogListCursorAdapter:Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 121
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->mLoaderManager:Landroid/support/v4/app/LoaderManager;

    .line 123
    const/4 v1, -0x1

    sput v1, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->sFormattingType:I

    .line 124
    return-void

    :cond_1
    move v1, v3

    .line 93
    goto :goto_0

    .line 111
    :cond_2
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactNameView:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactNumber:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method public onCreateDescription()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 147
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreateDescription()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 7
    .param p1, "loaderId"    # I
    .param p2, "bundle"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v6, 0x0

    .line 161
    packed-switch p1, :pswitch_data_0

    .line 176
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 163
    :pswitch_0
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    sget-object v2, Lcom/pccw/mobile/sip/CallLogGroupedActivity$QueryByName;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/CallLogGroupedActivity$QueryByName;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v4, "name = ?"

    new-array v5, v1, [Ljava/lang/String;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactName:Ljava/lang/String;

    aput-object v1, v5, v6

    const-string/jumbo v6, "date DESC"

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .local v0, "mLoader":Landroid/support/v4/content/CursorLoader;
    goto :goto_0

    .line 170
    .end local v0    # "mLoader":Landroid/support/v4/content/CursorLoader;
    :pswitch_1
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    sget-object v2, Lcom/pccw/mobile/sip/CallLogGroupedActivity$QueryByNumber;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/CallLogGroupedActivity$QueryByNumber;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v4, "number = ?"

    new-array v5, v1, [Ljava/lang/String;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->contactNumber:Ljava/lang/String;

    aput-object v1, v5, v6

    const-string/jumbo v6, "date DESC"

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    .restart local v0    # "mLoader":Landroid/support/v4/content/CursorLoader;
    goto :goto_0

    .line 161
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 153
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onDestroy()V

    .line 154
    return-void
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 1
    .param p2, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 181
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    invoke-virtual {p1}, Landroid/support/v4/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 187
    :goto_0
    return-void

    .line 184
    :pswitch_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->mCalllogListCursorAdapter:Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;

    invoke-virtual {v0, p2}, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    goto :goto_0

    .line 181
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 44
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/support/v4/content/Loader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 192
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 141
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onPause()V

    .line 142
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 130
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->hasContact:Z

    if-eqz v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->mLoaderManager:Landroid/support/v4/app/LoaderManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 135
    :goto_0
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onResume()V

    .line 136
    return-void

    .line 133
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->mLoaderManager:Landroid/support/v4/app/LoaderManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_0
.end method
