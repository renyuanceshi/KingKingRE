.class public Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;
.super Lcom/pccw/mobile/sip/BaseActionBarActivity;
.source "AddCallContactDetailsActivity.java"

# interfaces
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$ContactPhoneNumberQuery;,
        Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;
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
.field private static final SHOW_IDD_CHARGE_MESSAGE:Ljava/lang/String; = "SHOW_IDD_CHARGE_MESSAGE"

.field private static activity:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;


# instance fields
.field actionBar:Landroid/support/v7/app/ActionBar;

.field private contactId:Ljava/lang/String;

.field private contactName:Ljava/lang/String;

.field private contactPhoto:Landroid/widget/ImageView;

.field conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

.field private lookUpKey:Ljava/lang/String;

.field mPhoneList:Landroid/widget/ListView;

.field private mPhoneListCursorAdapter:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;

.field private name:Landroid/widget/TextView;

.field private targerNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;-><init>()V

    return-void
.end method

.method private addCall(Ljava/lang/String;)V
    .locals 1
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 205
    if-nez p1, :cond_0

    .line 206
    iget-object p1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->targerNumber:Ljava/lang/String;

    .line 207
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0, p1, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->addCall(Ljava/lang/String;Landroid/content/Context;)Z

    .line 208
    return-void
.end method

.method private editContact()V
    .locals 5

    .prologue
    .line 212
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->contactId:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iget-object v4, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->lookUpKey:Ljava/lang/String;

    invoke-static {v2, v3, v4}, Landroid/provider/ContactsContract$Contacts;->getLookupUri(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 213
    .local v1, "mSelectedContactUri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.EDIT"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 214
    .local v0, "editIntent":Landroid/content/Intent;
    const-string/jumbo v2, "vnd.android.cursor.item/contact"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 217
    const-string/jumbo v2, "finishActivityOnSaveCompleted"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 218
    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->startActivity(Landroid/content/Intent;)V

    .line 219
    return-void
.end method

.method public static getActivity()Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;
    .locals 1

    .prologue
    .line 148
    sget-object v0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->activity:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;

    if-nez v0, :cond_0

    .line 149
    const/4 v0, 0x0

    .line 151
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->activity:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;

    goto :goto_0
.end method

.method private retrieveContactPhoto(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 8
    .param p1, "contactId"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 224
    const/4 v2, 0x0

    .line 228
    .local v2, "photo":Landroid/graphics/Bitmap;
    const/16 v3, 0xe

    :try_start_0
    invoke-static {v3}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 230
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 232
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 231
    invoke-static {v4, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x1

    .line 229
    invoke-static {v3, v4, v5}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Ljava/io/InputStream;

    move-result-object v1

    .line 240
    .local v1, "inputStream":Ljava/io/InputStream;
    :goto_0
    if-eqz v1, :cond_0

    .line 241
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 242
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 249
    .end local v1    # "inputStream":Ljava/io/InputStream;
    :cond_0
    :goto_1
    return-object v2

    .line 235
    :cond_1
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 237
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 236
    invoke-static {v4, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v4

    .line 234
    invoke-static {v3, v4}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .restart local v1    # "inputStream":Ljava/io/InputStream;
    goto :goto_0

    .line 245
    .end local v1    # "inputStream":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 246
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
    .locals 3
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p4, "message"    # Ljava/lang/String;

    .prologue
    .line 161
    :try_start_0
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v1

    invoke-virtual {v1}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v1

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 162
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    :cond_0
    :goto_0
    return-void

    .line 165
    :catch_0
    move-exception v0

    .line 166
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->finish()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 70
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 72
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 73
    .local v0, "mIntent":Landroid/content/Intent;
    const-string/jumbo v1, "contactId"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->contactId:Ljava/lang/String;

    .line 74
    const-string/jumbo v1, "contactName"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->contactName:Ljava/lang/String;

    .line 76
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 77
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v1, v3}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 79
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    const v2, 0x7f07005f

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 81
    const v1, 0x7f040025

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->setContentView(I)V

    .line 83
    new-instance v1, Lcom/pccw/sms/service/ConversationParticipantItemService;

    invoke-direct {v1, p0}, Lcom/pccw/sms/service/ConversationParticipantItemService;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

    .line 85
    const v1, 0x7f0e009e

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->contactPhoto:Landroid/widget/ImageView;

    .line 86
    const v1, 0x7f0e009f

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->name:Landroid/widget/TextView;

    .line 87
    const v1, 0x7f0e00a0

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->mPhoneList:Landroid/widget/ListView;

    .line 89
    new-instance v1, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p0, v2, v3}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;-><init>(Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;Landroid/content/Context;Landroid/database/Cursor;Z)V

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->mPhoneListCursorAdapter:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;

    .line 90
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->mPhoneList:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->mPhoneListCursorAdapter:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 92
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->name:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->contactName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    sput-object p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->activity:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;

    .line 96
    return-void
.end method

.method public onCreateDescription()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 126
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
    const/4 v5, 0x0

    .line 176
    packed-switch p1, :pswitch_data_0

    move-object v0, v5

    .line 183
    :goto_0
    return-object v0

    .line 178
    :pswitch_0
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    sget-object v2, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$ContactPhoneNumberQuery;->PROJECTION:[Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "contact_id =  \'"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->contactId:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v4, "\'"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v1, p0

    move-object v6, v5

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .local v0, "mLoader":Landroid/support/v4/content/CursorLoader;
    goto :goto_0

    .line 176
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 132
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onDestroy()V

    .line 133
    const/4 v0, 0x0

    sput-object v0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->activity:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;

    .line 134
    return-void
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 2
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
    .line 188
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    invoke-virtual {p1}, Landroid/support/v4/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 196
    :goto_0
    return-void

    .line 190
    :pswitch_0
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 191
    const/4 v0, 0x4

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->lookUpKey:Ljava/lang/String;

    .line 192
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->name:Landroid/widget/TextView;

    const/4 v1, 0x5

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->mPhoneListCursorAdapter:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;

    invoke-virtual {v0, p2}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    goto :goto_0

    .line 188
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 48
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

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
    .line 201
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 138
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 144
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 141
    :pswitch_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->finish()V

    .line 142
    const/4 v0, 0x1

    goto :goto_0

    .line 138
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 120
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onPause()V

    .line 121
    return-void
.end method

.method protected onResume()V
    .locals 6

    .prologue
    const/16 v5, 0x258

    .line 100
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v2

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 101
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->contactId:Ljava/lang/String;

    invoke-static {p0, v2}, Lcom/pccw/mobile/util/UserPhotoUtil;->getLargeContactPhoto(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 102
    .local v0, "contactBm":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 103
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->contactPhoto:Landroid/widget/ImageView;

    invoke-static {v0, v5, v5}, Lcom/pccw/mobile/util/UserPhotoUtil;->getRectangularBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 104
    :cond_0
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onResume()V

    .line 107
    :try_start_0
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v2

    invoke-virtual {v2}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_1

    .line 108
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    :cond_1
    :goto_0
    return-void

    .line 111
    :catch_0
    move-exception v1

    .line 112
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->finish()V

    goto :goto_0
.end method
