.class public Lcom/pccw/sms/GroupInfoActivity;
.super Lcom/pccw/mobile/sip/BaseActionBarActivity;
.source "GroupInfoActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/pccw/dialog/listener/IKKDialogOnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;
    }
.end annotation


# static fields
.field static final EDIT_GROUP_INFO_FAIL:I = 0xbc4

.field static final EDIT_GROUP_INFO_SUCCESS:I = 0xbc3

.field static final MAX_GROUP_PARTICIPANT_NUMBER:I = 0x32

.field private static password:Ljava/lang/String;

.field private static userName:Ljava/lang/String;


# instance fields
.field final EDIT_GROUP_INFO:I

.field private LOG_TAG:Ljava/lang/String;

.field actionBar:Landroid/support/v7/app/ActionBar;

.field checkSMSTypeServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;

.field private editParticipant:Landroid/widget/Button;

.field groupInfoLayout:Lcom/pccw/sms/bean/GroupInfoLayout;

.field private groupParticipantAdapter:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

.field private mListView:Landroid/widget/ListView;

.field private menu:Landroid/view/Menu;

.field muteMenuItem:Landroid/view/MenuItem;

.field private noWiFiDialog:Landroid/app/AlertDialog;

.field private participantTypes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;"
        }
    .end annotation
.end field

.field private participants:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private participantsView:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private recipient:Ljava/lang/String;

.field private targerNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;-><init>()V

    .line 58
    const-string/jumbo v0, "GroupInfoActivity"

    iput-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->LOG_TAG:Ljava/lang/String;

    .line 78
    const/16 v0, 0xbc2

    iput v0, p0, Lcom/pccw/sms/GroupInfoActivity;->EDIT_GROUP_INFO:I

    .line 84
    new-instance v0, Lcom/pccw/sms/GroupInfoActivity$1;

    invoke-direct {v0, p0}, Lcom/pccw/sms/GroupInfoActivity$1;-><init>(Lcom/pccw/sms/GroupInfoActivity;)V

    iput-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->checkSMSTypeServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/sms/GroupInfoActivity;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/GroupInfoActivity;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->participantTypes:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100(Lcom/pccw/sms/GroupInfoActivity;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/GroupInfoActivity;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->participantsView:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/sms/GroupInfoActivity;Lcom/pccw/dialog/EnumKKDialogType;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/GroupInfoActivity;
    .param p1, "x1"    # Lcom/pccw/dialog/EnumKKDialogType;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/pccw/sms/GroupInfoActivity;->promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V

    return-void
.end method

.method static synthetic access$300(Lcom/pccw/sms/GroupInfoActivity;Lcom/pccw/dialog/EnumKKDialogType;Landroid/os/Bundle;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/GroupInfoActivity;
    .param p1, "x1"    # Lcom/pccw/dialog/EnumKKDialogType;
    .param p2, "x2"    # Landroid/os/Bundle;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Lcom/pccw/sms/GroupInfoActivity;->promptDialogWithArguments(Lcom/pccw/dialog/EnumKKDialogType;Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$400(Lcom/pccw/sms/GroupInfoActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/GroupInfoActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/pccw/sms/GroupInfoActivity;->pasteNumberToDialer(Ljava/lang/String;)V

    return-void
.end method

.method private call(Ljava/lang/String;)V
    .locals 2
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 435
    if-nez p1, :cond_0

    .line 436
    iget-object p1, p0, Lcom/pccw/sms/GroupInfoActivity;->targerNumber:Ljava/lang/String;

    .line 437
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->call(Ljava/lang/String;Landroid/content/Context;Z)Z

    .line 438
    return-void
.end method

.method private createFailToast(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 270
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 271
    return-void
.end method

.method private getViews()V
    .locals 9

    .prologue
    const/4 v5, 0x0

    .line 161
    const v0, 0x7f0e0085

    invoke-virtual {p0, v0}, Lcom/pccw/sms/GroupInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->mListView:Landroid/widget/ListView;

    .line 162
    const v0, 0x7f0e0088

    invoke-virtual {p0, v0}, Lcom/pccw/sms/GroupInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->editParticipant:Landroid/widget/Button;

    .line 163
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->participants:Ljava/util/List;

    .line 164
    iget-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->recipient:Ljava/lang/String;

    const-string/jumbo v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 165
    .local v8, "recipants":[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    array-length v0, v8

    if-ge v7, v0, :cond_0

    .line 166
    iget-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->participants:Ljava/util/List;

    aget-object v1, v8, v7

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 169
    :cond_0
    new-instance v0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    iget-object v3, p0, Lcom/pccw/sms/GroupInfoActivity;->participants:Ljava/util/List;

    const v4, 0x7f04004c

    move-object v1, p0

    move-object v2, p0

    move-object v6, v5

    invoke-direct/range {v0 .. v6}, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;-><init>(Lcom/pccw/sms/GroupInfoActivity;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->groupParticipantAdapter:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    .line 170
    iget-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/pccw/sms/GroupInfoActivity;->groupParticipantAdapter:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 171
    iget-object v0, p0, Lcom/pccw/sms/GroupInfoActivity;->editParticipant:Landroid/widget/Button;

    new-instance v1, Lcom/pccw/sms/GroupInfoActivity$2;

    invoke-direct {v1, p0, v8}, Lcom/pccw/sms/GroupInfoActivity$2;-><init>(Lcom/pccw/sms/GroupInfoActivity;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    return-void
.end method

.method public static isNumberWithinContact(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 10
    .param p0, "number"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x1

    const/4 v3, 0x0

    const/4 v9, 0x0

    .line 281
    sget-object v0, Landroid/provider/ContactsContract$PhoneLookup;->CONTENT_FILTER_URI:Landroid/net/Uri;

    .line 283
    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 281
    invoke-static {v0, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 284
    .local v1, "lookupUri":Landroid/net/Uri;
    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/String;

    const-string/jumbo v0, "_id"

    aput-object v0, v2, v9

    const-string/jumbo v0, "number"

    aput-object v0, v2, v8

    const/4 v0, 0x2

    const-string/jumbo v4, "display_name"

    aput-object v4, v2, v0

    .line 285
    .local v2, "mPhoneNumberProjection":[Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 287
    .local v6, "cur":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 288
    const-string/jumbo v0, "KKIM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " -- Number "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " is within Contact List"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 295
    if-eqz v6, :cond_0

    .line 296
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_0
    move v0, v8

    .line 300
    :goto_0
    return v0

    .line 295
    :cond_1
    if-eqz v6, :cond_2

    .line 296
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 299
    :cond_2
    const-string/jumbo v0, "KKIM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " -- Number "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " is NOT within Contact List"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v9

    .line 300
    goto :goto_0

    .line 291
    :catch_0
    move-exception v7

    .line 292
    .local v7, "e":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v0, "KKIM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " -- Number "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " is NOT within Contact List -- ERROR"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 295
    if-eqz v6, :cond_3

    .line 296
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    move v0, v9

    .line 293
    goto :goto_0

    .line 295
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_4

    .line 296
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v0
.end method

.method private pasteNumberToDialer(Ljava/lang/String;)V
    .locals 1
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 441
    if-nez p1, :cond_0

    .line 442
    iget-object p1, p0, Lcom/pccw/sms/GroupInfoActivity;->targerNumber:Ljava/lang/String;

    .line 443
    :cond_0
    invoke-static {p1, p0}, Lcom/pccw/mobile/sip/util/IntentUtils;->genDialScreenIntent(Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/pccw/sms/GroupInfoActivity;->startActivity(Landroid/content/Intent;)V

    .line 444
    return-void
.end method

.method private promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V
    .locals 3
    .param p1, "dialogType"    # Lcom/pccw/dialog/EnumKKDialogType;

    .prologue
    .line 447
    new-instance v0, Lcom/pccw/dialog/KKDialogBuilder;

    invoke-direct {v0}, Lcom/pccw/dialog/KKDialogBuilder;-><init>()V

    .line 448
    .local v0, "dialogBuilder":Lcom/pccw/dialog/KKDialogBuilder;
    new-instance v2, Lcom/pccw/dialog/KKDialogProvider;

    invoke-direct {v2, v0, p0}, Lcom/pccw/dialog/KKDialogProvider;-><init>(Lcom/pccw/dialog/KKDialogBuilder;Landroid/app/Activity;)V

    .line 449
    .local v2, "provider":Lcom/pccw/dialog/KKDialogProvider;
    invoke-virtual {v2, p1, p0}, Lcom/pccw/dialog/KKDialogProvider;->requestDialog(Lcom/pccw/dialog/EnumKKDialogType;Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)Lcom/pccw/dialog/KKDialog;

    move-result-object v1

    .line 450
    .local v1, "kkDialog":Lcom/pccw/dialog/KKDialog;
    invoke-virtual {v1}, Lcom/pccw/dialog/KKDialog;->show()V

    .line 451
    return-void
.end method

.method private promptDialogWithArguments(Lcom/pccw/dialog/EnumKKDialogType;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "dialogType"    # Lcom/pccw/dialog/EnumKKDialogType;
    .param p2, "args"    # Landroid/os/Bundle;

    .prologue
    .line 454
    new-instance v0, Lcom/pccw/dialog/KKDialogBuilder;

    invoke-direct {v0}, Lcom/pccw/dialog/KKDialogBuilder;-><init>()V

    .line 455
    .local v0, "dialogBuilder":Lcom/pccw/dialog/KKDialogBuilder;
    new-instance v2, Lcom/pccw/dialog/KKDialogProvider;

    invoke-direct {v2, v0, p0}, Lcom/pccw/dialog/KKDialogProvider;-><init>(Lcom/pccw/dialog/KKDialogBuilder;Landroid/app/Activity;)V

    .line 456
    .local v2, "provider":Lcom/pccw/dialog/KKDialogProvider;
    invoke-virtual {v2, p1, p0}, Lcom/pccw/dialog/KKDialogProvider;->requestDialog(Lcom/pccw/dialog/EnumKKDialogType;Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)Lcom/pccw/dialog/KKDialog;

    move-result-object v1

    .line 457
    .local v1, "kkDialog":Lcom/pccw/dialog/KKDialog;
    invoke-virtual {v1, p2}, Lcom/pccw/dialog/KKDialog;->setArguments(Landroid/os/Bundle;)V

    .line 458
    invoke-virtual {v1}, Lcom/pccw/dialog/KKDialog;->show()V

    .line 459
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 228
    iget-object v3, p0, Lcom/pccw/sms/GroupInfoActivity;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v4, "-onActivityResult"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    invoke-super {p0, p1, p2, p3}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 231
    const/16 v3, 0xbc2

    if-ne p1, v3, :cond_1

    const/16 v3, 0xbc3

    if-ne p2, v3, :cond_1

    .line 233
    const-string/jumbo v3, "newGroupName"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/mobile/util/StringUtil;->unicodeUnescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 234
    .local v2, "newGroupName":Ljava/lang/String;
    const-string/jumbo v3, "picturePath"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 236
    .local v1, "iconPath":Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 240
    :cond_0
    if-eqz v1, :cond_1

    const-string/jumbo v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 241
    invoke-static {v1}, Lcom/pccw/mobile/util/BitmapUtil;->getExternalImageThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 244
    .local v0, "bmp":Landroid/graphics/Bitmap;
    const-string/jumbo v3, "getGroupIcon"

    const-string/jumbo v4, "try updating group icon from API"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    .end local v0    # "bmp":Landroid/graphics/Bitmap;
    .end local v1    # "iconPath":Ljava/lang/String;
    .end local v2    # "newGroupName":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public onClickKKDialogNegativeButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 0
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 486
    return-void
.end method

.method public onClickKKDialogNeutralButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 0
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 492
    return-void
.end method

.method public onClickKKDialogPositiveButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 4
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 463
    sget-object v2, Lcom/pccw/sms/GroupInfoActivity$5;->$SwitchMap$com$pccw$dialog$EnumKKDialogType:[I

    invoke-virtual {p1}, Lcom/pccw/dialog/KKDialog;->getDialogType()Lcom/pccw/dialog/EnumKKDialogType;

    move-result-object v3

    invoke-virtual {v3}, Lcom/pccw/dialog/EnumKKDialogType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 480
    :goto_0
    return-void

    .line 465
    :pswitch_0
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.settings.WIFI_SETTINGS"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/pccw/sms/GroupInfoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 469
    :pswitch_1
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 470
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p1}, Lcom/pccw/dialog/KKDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 471
    .local v0, "bundle":Landroid/os/Bundle;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 472
    invoke-virtual {p0, v1}, Lcom/pccw/sms/GroupInfoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 475
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "intent":Landroid/content/Intent;
    :pswitch_2
    const-string/jumbo v2, ""

    invoke-virtual {p0}, Lcom/pccw/sms/GroupInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/pccw/mobile/sip/util/IntentUtils;->genDialScreenIntent(Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/pccw/sms/GroupInfoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 463
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v7, 0x10

    .line 125
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 127
    invoke-virtual {p0}, Lcom/pccw/sms/GroupInfoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 128
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v4, "recipient"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/pccw/sms/GroupInfoActivity;->recipient:Ljava/lang/String;

    .line 142
    iget-object v4, p0, Lcom/pccw/sms/GroupInfoActivity;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "GroupInfoActivity: onCreate(), recipient="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/pccw/sms/GroupInfoActivity;->recipient:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    invoke-virtual {p0}, Lcom/pccw/sms/GroupInfoActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v4

    iput-object v4, p0, Lcom/pccw/sms/GroupInfoActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 145
    iget-object v4, p0, Lcom/pccw/sms/GroupInfoActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 146
    iget-object v4, p0, Lcom/pccw/sms/GroupInfoActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v4, v7, v7}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(II)V

    .line 147
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 148
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v4, 0x7f04001c

    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v6, 0x0

    invoke-virtual {v0, v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 149
    .local v2, "layout":Landroid/view/View;
    const v4, 0x7f0e0043

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 150
    .local v3, "title":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/pccw/sms/GroupInfoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07008e

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    iget-object v4, p0, Lcom/pccw/sms/GroupInfoActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v4, v2}, Landroid/support/v7/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 152
    const v4, 0x7f040021

    invoke-virtual {p0, v4}, Lcom/pccw/sms/GroupInfoActivity;->setContentView(I)V

    .line 154
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/pccw/sms/GroupInfoActivity;->participantsView:Ljava/util/List;

    .line 155
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/pccw/sms/GroupInfoActivity;->participantTypes:Ljava/util/List;

    .line 156
    invoke-direct {p0}, Lcom/pccw/sms/GroupInfoActivity;->getViews()V

    .line 158
    return-void
.end method

.method protected onCreateNoNetworkDialog(Landroid/content/Context;)Landroid/app/Dialog;
    .locals 4
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 250
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 251
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f07006b

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 252
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v2, 0x1040000

    .line 253
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/sms/GroupInfoActivity$4;

    invoke-direct {v3, p0}, Lcom/pccw/sms/GroupInfoActivity$4;-><init>(Lcom/pccw/sms/GroupInfoActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f07015b

    .line 259
    invoke-virtual {p0, v2}, Lcom/pccw/sms/GroupInfoActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/sms/GroupInfoActivity$3;

    invoke-direct {v3, p0}, Lcom/pccw/sms/GroupInfoActivity$3;-><init>(Lcom/pccw/sms/GroupInfoActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 266
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 198
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 199
    iput-object p1, p0, Lcom/pccw/sms/GroupInfoActivity;->menu:Landroid/view/Menu;

    .line 200
    const/4 v0, 0x1

    return v0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 218
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v2, p0, Lcom/pccw/sms/GroupInfoActivity;->groupInfoLayout:Lcom/pccw/sms/bean/GroupInfoLayout;

    invoke-virtual {v2}, Lcom/pccw/sms/bean/GroupInfoLayout;->getListAdapter()Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;

    move-result-object v0

    .line 219
    .local v0, "adapter":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<Lcom/pccw/database/entity/GroupMember;>;"
    const/4 v1, 0x0

    .line 221
    .local v1, "gm":Lcom/pccw/database/entity/GroupMember;
    if-eqz v0, :cond_0

    .line 222
    invoke-virtual {v0, p3}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "gm":Lcom/pccw/database/entity/GroupMember;
    check-cast v1, Lcom/pccw/database/entity/GroupMember;

    .line 224
    .restart local v1    # "gm":Lcom/pccw/database/entity/GroupMember;
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 206
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 213
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 208
    :pswitch_0
    invoke-virtual {p0}, Lcom/pccw/sms/GroupInfoActivity;->finish()V

    .line 209
    const/4 v0, 0x1

    goto :goto_0

    .line 206
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 193
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onResume()V

    .line 194
    return-void
.end method
