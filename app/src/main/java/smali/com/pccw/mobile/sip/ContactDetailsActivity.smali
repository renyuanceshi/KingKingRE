.class public Lcom/pccw/mobile/sip/ContactDetailsActivity;
.super Lcom/pccw/mobile/sip/BaseActionBarActivity;
.source "ContactDetailsActivity.java"

# interfaces
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;
.implements Lcom/pccw/dialog/listener/IKKDialogOnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactPhoneNumberQuery;,
        Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/pccw/mobile/sip/BaseActionBarActivity;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Lcom/pccw/dialog/listener/IKKDialogOnClickListener;"
    }
.end annotation


# static fields
.field private static final SHOW_IDD_CHARGE_MESSAGE:Ljava/lang/String; = "SHOW_IDD_CHARGE_MESSAGE"


# instance fields
.field actionBar:Landroid/support/v7/app/ActionBar;

.field checkSMSTypeServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;

.field private contactCompanyView:Landroid/widget/TextView;

.field private contactDetails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private contactDetailsAdapter:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

.field private contactId:Ljava/lang/String;

.field private contactName:Ljava/lang/String;

.field private contactPhoto:Landroid/widget/ImageView;

.field private contactPositionView:Landroid/widget/TextView;

.field conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

.field private lookUpKey:Ljava/lang/String;

.field mPhoneList:Landroid/widget/ListView;

.field private msisdnlistString:Ljava/lang/String;

.field private notShowSMSConsumeWarmingAgainCkeckBox:Landroid/widget/CheckBox;

.field private owner:Ljava/lang/String;

.field private phoneViewList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private smsTypesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;"
        }
    .end annotation
.end field

.field private targerNumber:Ljava/lang/String;

.field private title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;-><init>()V

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->smsTypesList:Ljava/util/List;

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->phoneViewList:Ljava/util/List;

    .line 94
    new-instance v0, Lcom/pccw/mobile/sip/ContactDetailsActivity$1;

    invoke-direct {v0, p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity$1;-><init>(Lcom/pccw/mobile/sip/ContactDetailsActivity;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->checkSMSTypeServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactDetailsActivity;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->smsTypesList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactDetailsActivity;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->phoneViewList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactDetailsActivity;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetails:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$300(Lcom/pccw/mobile/sip/ContactDetailsActivity;Lcom/pccw/dialog/EnumKKDialogType;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactDetailsActivity;
    .param p1, "x1"    # Lcom/pccw/dialog/EnumKKDialogType;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V

    return-void
.end method

.method static synthetic access$400(Lcom/pccw/mobile/sip/ContactDetailsActivity;Lcom/pccw/dialog/EnumKKDialogType;Landroid/os/Bundle;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactDetailsActivity;
    .param p1, "x1"    # Lcom/pccw/dialog/EnumKKDialogType;
    .param p2, "x2"    # Landroid/os/Bundle;

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->promptDialogWithArguments(Lcom/pccw/dialog/EnumKKDialogType;Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$500(Lcom/pccw/mobile/sip/ContactDetailsActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactDetailsActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->startNewChatActivity(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/pccw/mobile/sip/ContactDetailsActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactDetailsActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->pasteNumberToDialer(Ljava/lang/String;)V

    return-void
.end method

.method private call(Ljava/lang/String;)V
    .locals 2
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 705
    if-nez p1, :cond_0

    .line 706
    iget-object p1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->targerNumber:Ljava/lang/String;

    .line 707
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->call(Ljava/lang/String;Landroid/content/Context;Z)Z

    .line 708
    return-void
.end method

.method private editContact()V
    .locals 5

    .prologue
    .line 717
    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    .line 718
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iget-object v4, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->lookUpKey:Ljava/lang/String;

    .line 717
    invoke-static {v2, v3, v4}, Landroid/provider/ContactsContract$Contacts;->getLookupUri(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 719
    .local v1, "mSelectedContactUri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.EDIT"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 720
    .local v0, "editIntent":Landroid/content/Intent;
    const-string/jumbo v2, "vnd.android.cursor.item/contact"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 724
    const-string/jumbo v2, "finishActivityOnSaveCompleted"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 725
    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->startActivity(Landroid/content/Intent;)V

    .line 727
    return-void
.end method

.method private getAllInfo()V
    .locals 61
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 204
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string/jumbo v7, "display_name COLLATE LOCALIZED ASC"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v20

    .line 212
    .local v20, "cur":Landroid/database/Cursor;
    const/16 v42, 0x0

    .line 215
    .local v42, "phones":Landroid/database/Cursor;
    const/16 v25, 0x0

    .line 218
    .local v25, "emails":Landroid/database/Cursor;
    const/4 v8, 0x0

    .line 221
    .local v8, "address":Landroid/database/Cursor;
    const/16 v38, 0x0

    .line 224
    .local v38, "organizations":Landroid/database/Cursor;
    const/16 v36, 0x0

    .line 227
    .local v36, "notes":Landroid/database/Cursor;
    const/16 v34, 0x0

    .line 230
    .local v34, "nicknames":Landroid/database/Cursor;
    const/16 v47, 0x0

    .line 233
    .local v47, "relation":Landroid/database/Cursor;
    const/16 v57, 0x0

    .line 235
    .local v57, "webSite":Landroid/database/Cursor;
    :try_start_0
    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_24

    .line 237
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "contact_id = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v42

    .line 242
    new-instance v43, Ljava/util/ArrayList;

    invoke-direct/range {v43 .. v43}, Ljava/util/ArrayList;-><init>()V

    .line 243
    .local v43, "phonesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface/range {v42 .. v42}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 245
    :cond_0
    const-string/jumbo v6, "data1"

    .line 247
    move-object/from16 v0, v42

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 246
    move-object/from16 v0, v42

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    .line 248
    .local v40, "phoneNumber":Ljava/lang/String;
    const-string/jumbo v6, "data2"

    .line 250
    move-object/from16 v0, v42

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 249
    move-object/from16 v0, v42

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v41

    .line 251
    .local v41, "phoneType":Ljava/lang/String;
    invoke-static/range {v41 .. v41}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v55

    .line 253
    .local v55, "type":I
    invoke-static/range {v55 .. v55}, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->getTypeLabelResource(I)I

    move-result v56

    .line 254
    .local v56, "typeLabelResource":I
    move-object/from16 v0, p0

    move/from16 v1, v56

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getString(I)Ljava/lang/String;

    move-result-object v39

    .line 256
    .local v39, "phoneLabel":Ljava/lang/String;
    new-instance v31, Ljava/util/HashMap;

    invoke-direct/range {v31 .. v31}, Ljava/util/HashMap;-><init>()V

    .line 258
    .local v31, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v6, "KKSMS"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v60, "query phone number:"

    move-object/from16 v0, v60

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v40

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v60, " trimmed="

    move-object/from16 v0, v60

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static/range {v40 .. v40}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSpace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v60

    move-object/from16 v0, v60

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    invoke-static/range {v40 .. v40}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSpace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v43

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 260
    const-string/jumbo v6, "KKSMS"

    const-string/jumbo v7, "do not add phoneNumber"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    :goto_0
    invoke-interface/range {v42 .. v42}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_0

    .line 282
    .end local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v39    # "phoneLabel":Ljava/lang/String;
    .end local v40    # "phoneNumber":Ljava/lang/String;
    .end local v41    # "phoneType":Ljava/lang/String;
    .end local v55    # "type":I
    .end local v56    # "typeLabelResource":I
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$CommonDataKinds$Email;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "contact_id = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v25

    .line 287
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    .line 288
    .local v26, "emailsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 290
    :cond_2
    const-string/jumbo v6, "data2"

    .line 292
    move-object/from16 v0, v25

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 291
    move-object/from16 v0, v25

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    .line 293
    .local v23, "emailType":Ljava/lang/String;
    const-string/jumbo v6, "data1"

    .line 295
    move-object/from16 v0, v25

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 294
    move-object/from16 v0, v25

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 298
    .local v24, "emailValue":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0700bc

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v22

    .line 300
    .local v22, "emailTitle":Ljava/lang/String;
    invoke-static/range {v23 .. v23}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 301
    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v55

    .line 302
    .restart local v55    # "type":I
    invoke-static/range {v55 .. v55}, Landroid/provider/ContactsContract$CommonDataKinds$Email;->getTypeLabelResource(I)I

    move-result v27

    .line 303
    .local v27, "emailtypeLabelResource":I
    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getString(I)Ljava/lang/String;

    move-result-object v21

    .line 304
    .local v21, "emailLabel":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 307
    .end local v21    # "emailLabel":Ljava/lang/String;
    .end local v27    # "emailtypeLabelResource":I
    .end local v55    # "type":I
    :cond_3
    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_13

    .line 318
    :goto_1
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_2

    .line 337
    .end local v22    # "emailTitle":Ljava/lang/String;
    .end local v23    # "emailType":Ljava/lang/String;
    .end local v24    # "emailValue":Ljava/lang/String;
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$CommonDataKinds$StructuredPostal;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "contact_id = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 338
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 342
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_15

    .line 344
    :cond_5
    const-string/jumbo v6, "data4"

    .line 346
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 345
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v53

    .line 347
    .local v53, "street":Ljava/lang/String;
    const-string/jumbo v6, "data7"

    .line 349
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 348
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 350
    .local v18, "city":Ljava/lang/String;
    const-string/jumbo v6, "data8"

    .line 352
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 351
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v46

    .line 353
    .local v46, "region":Ljava/lang/String;
    const-string/jumbo v6, "data9"

    .line 355
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 354
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v44

    .line 356
    .local v44, "postCode":Ljava/lang/String;
    const-string/jumbo v6, "data1"

    .line 358
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 357
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v28

    .line 359
    .local v28, "formatAddress":Ljava/lang/String;
    const-string/jumbo v11, ""

    .line 361
    .local v11, "addressString":Ljava/lang/String;
    const/4 v6, 0x4

    new-array v9, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v44, v9, v6

    const/4 v6, 0x1

    aput-object v53, v9, v6

    const/4 v6, 0x2

    aput-object v18, v9, v6

    const/4 v6, 0x3

    aput-object v46, v9, v6

    .line 364
    .local v9, "addressArray":[Ljava/lang/String;
    const/16 v30, 0x0

    .line 365
    .local v30, "j":I
    const/16 v29, 0x0

    .local v29, "i":I
    :goto_2
    array-length v6, v9

    move/from16 v0, v29

    if-ge v0, v6, :cond_14

    .line 366
    aget-object v6, v9, v29

    if-eqz v6, :cond_7

    const-string/jumbo v6, ""

    aget-object v7, v9, v29

    .line 367
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 368
    if-lez v30, :cond_6

    array-length v6, v9

    move/from16 v0, v29

    if-ge v0, v6, :cond_6

    .line 369
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 371
    :cond_6
    add-int/lit8 v30, v30, 0x1

    .line 372
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v9, v29

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 365
    :cond_7
    add-int/lit8 v29, v29, 0x1

    goto :goto_2

    .line 263
    .end local v9    # "addressArray":[Ljava/lang/String;
    .end local v11    # "addressString":Ljava/lang/String;
    .end local v18    # "city":Ljava/lang/String;
    .end local v26    # "emailsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v28    # "formatAddress":Ljava/lang/String;
    .end local v29    # "i":I
    .end local v30    # "j":I
    .end local v44    # "postCode":Ljava/lang/String;
    .end local v46    # "region":Ljava/lang/String;
    .end local v53    # "street":Ljava/lang/String;
    .restart local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v39    # "phoneLabel":Ljava/lang/String;
    .restart local v40    # "phoneNumber":Ljava/lang/String;
    .restart local v41    # "phoneType":Ljava/lang/String;
    .restart local v55    # "type":I
    .restart local v56    # "typeLabelResource":I
    :cond_8
    const-string/jumbo v6, "KKSMS"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v60, "add phone number:"

    move-object/from16 v0, v60

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static/range {v40 .. v40}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSpace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v60

    move-object/from16 v0, v60

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    invoke-static/range {v40 .. v40}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSpace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v43

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 265
    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->pretreatment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    .line 266
    .local v45, "preparedNumber":Ljava/lang/String;
    const-string/jumbo v6, "NotMatch"

    move-object/from16 v0, v45

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_12

    .line 267
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->msisdnlistString:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v45

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->msisdnlistString:Ljava/lang/String;

    .line 268
    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    move-object/from16 v1, v39

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    const-string/jumbo v6, "contant"

    move-object/from16 v0, v31

    move-object/from16 v1, v40

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    const-string/jumbo v6, "type"

    const-string/jumbo v7, "phone"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    :goto_3
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetails:Ljava/util/List;

    move-object/from16 v0, v31

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    .line 558
    .end local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v39    # "phoneLabel":Ljava/lang/String;
    .end local v40    # "phoneNumber":Ljava/lang/String;
    .end local v41    # "phoneType":Ljava/lang/String;
    .end local v43    # "phonesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v45    # "preparedNumber":Ljava/lang/String;
    .end local v55    # "type":I
    .end local v56    # "typeLabelResource":I
    :catchall_0
    move-exception v6

    if-eqz v42, :cond_9

    .line 559
    invoke-interface/range {v42 .. v42}, Landroid/database/Cursor;->close()V

    .line 563
    :cond_9
    if-eqz v25, :cond_a

    .line 564
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->close()V

    .line 568
    :cond_a
    if-eqz v8, :cond_b

    .line 569
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 573
    :cond_b
    if-eqz v38, :cond_c

    .line 574
    invoke-interface/range {v38 .. v38}, Landroid/database/Cursor;->close()V

    .line 578
    :cond_c
    if-eqz v36, :cond_d

    .line 579
    invoke-interface/range {v36 .. v36}, Landroid/database/Cursor;->close()V

    .line 583
    :cond_d
    if-eqz v34, :cond_e

    .line 584
    invoke-interface/range {v34 .. v34}, Landroid/database/Cursor;->close()V

    .line 588
    :cond_e
    if-eqz v47, :cond_f

    .line 589
    invoke-interface/range {v47 .. v47}, Landroid/database/Cursor;->close()V

    .line 593
    :cond_f
    if-eqz v57, :cond_10

    .line 594
    invoke-interface/range {v57 .. v57}, Landroid/database/Cursor;->close()V

    .line 597
    :cond_10
    if-eqz v20, :cond_11

    .line 598
    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->close()V

    :cond_11
    throw v6

    .line 272
    .restart local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v39    # "phoneLabel":Ljava/lang/String;
    .restart local v40    # "phoneNumber":Ljava/lang/String;
    .restart local v41    # "phoneType":Ljava/lang/String;
    .restart local v43    # "phonesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v45    # "preparedNumber":Ljava/lang/String;
    .restart local v55    # "type":I
    .restart local v56    # "typeLabelResource":I
    :cond_12
    :try_start_1
    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    move-object/from16 v1, v39

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    const-string/jumbo v6, "contant"

    move-object/from16 v0, v31

    move-object/from16 v1, v40

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    const-string/jumbo v6, "type"

    const-string/jumbo v7, "phone"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 310
    .end local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v39    # "phoneLabel":Ljava/lang/String;
    .end local v40    # "phoneNumber":Ljava/lang/String;
    .end local v41    # "phoneType":Ljava/lang/String;
    .end local v45    # "preparedNumber":Ljava/lang/String;
    .end local v55    # "type":I
    .end local v56    # "typeLabelResource":I
    .restart local v22    # "emailTitle":Ljava/lang/String;
    .restart local v23    # "emailType":Ljava/lang/String;
    .restart local v24    # "emailValue":Ljava/lang/String;
    .restart local v26    # "emailsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_13
    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 311
    new-instance v31, Ljava/util/HashMap;

    invoke-direct/range {v31 .. v31}, Ljava/util/HashMap;-><init>()V

    .line 312
    .restart local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    move-object/from16 v1, v22

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    const-string/jumbo v6, "contant"

    move-object/from16 v0, v31

    move-object/from16 v1, v24

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    const-string/jumbo v6, "type"

    const-string/jumbo v7, "email"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetails:Ljava/util/List;

    move-object/from16 v0, v31

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 375
    .end local v22    # "emailTitle":Ljava/lang/String;
    .end local v23    # "emailType":Ljava/lang/String;
    .end local v24    # "emailValue":Ljava/lang/String;
    .end local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v9    # "addressArray":[Ljava/lang/String;
    .restart local v11    # "addressString":Ljava/lang/String;
    .restart local v18    # "city":Ljava/lang/String;
    .restart local v28    # "formatAddress":Ljava/lang/String;
    .restart local v29    # "i":I
    .restart local v30    # "j":I
    .restart local v44    # "postCode":Ljava/lang/String;
    .restart local v46    # "region":Ljava/lang/String;
    .restart local v53    # "street":Ljava/lang/String;
    :cond_14
    const-string/jumbo v6, "data2"

    .line 377
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 376
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 378
    .local v13, "addressType":Ljava/lang/String;
    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v55

    .line 380
    .restart local v55    # "type":I
    invoke-static/range {v55 .. v55}, Landroid/provider/ContactsContract$CommonDataKinds$StructuredPostal;->getTypeLabelResource(I)I

    move-result v14

    .line 381
    .local v14, "addressTypeResource":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 383
    .local v10, "addressLabel":Ljava/lang/String;
    new-instance v31, Ljava/util/HashMap;

    invoke-direct/range {v31 .. v31}, Ljava/util/HashMap;-><init>()V

    .line 384
    .restart local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v60, 0x7f0700b9

    move/from16 v0, v60

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 385
    .local v12, "addressTitle":Ljava/lang/String;
    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    const-string/jumbo v6, "contant"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    const-string/jumbo v6, "type"

    const-string/jumbo v7, "address"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetails:Ljava/util/List;

    move-object/from16 v0, v31

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 390
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_5

    .line 395
    .end local v9    # "addressArray":[Ljava/lang/String;
    .end local v10    # "addressLabel":Ljava/lang/String;
    .end local v11    # "addressString":Ljava/lang/String;
    .end local v12    # "addressTitle":Ljava/lang/String;
    .end local v13    # "addressType":Ljava/lang/String;
    .end local v14    # "addressTypeResource":I
    .end local v18    # "city":Ljava/lang/String;
    .end local v28    # "formatAddress":Ljava/lang/String;
    .end local v29    # "i":I
    .end local v30    # "j":I
    .end local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v44    # "postCode":Ljava/lang/String;
    .end local v46    # "region":Ljava/lang/String;
    .end local v53    # "street":Ljava/lang/String;
    .end local v55    # "type":I
    :cond_15
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x3

    new-array v4, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string/jumbo v7, "_id"

    aput-object v7, v4, v6

    const/4 v6, 0x1

    const-string/jumbo v7, "data1"

    aput-object v7, v4, v6

    const/4 v6, 0x2

    const-string/jumbo v7, "data4"

    aput-object v7, v4, v6

    const-string/jumbo v5, "contact_id=? AND mimetype=\'vnd.android.cursor.item/organization\'"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    move-object/from16 v60, v0

    aput-object v60, v6, v7

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v38

    .line 402
    invoke-interface/range {v38 .. v38}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_18

    .line 404
    :cond_16
    const-string/jumbo v6, "data1"

    .line 405
    move-object/from16 v0, v38

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 404
    move-object/from16 v0, v38

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 406
    .local v19, "company":Ljava/lang/String;
    const-string/jumbo v6, "data4"

    .line 407
    move-object/from16 v0, v38

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 406
    move-object/from16 v0, v38

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v54

    .line 408
    .local v54, "title":Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Lcom/pccw/mobile/util/StringUtil;->isNotEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_17

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, " "

    const-string/jumbo v60, ""

    move-object/from16 v0, v60

    invoke-virtual {v6, v7, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_17

    .line 409
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactPositionView:Landroid/widget/TextView;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 410
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactPositionView:Landroid/widget/TextView;

    move-object/from16 v0, v54

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 411
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactCompanyView:Landroid/widget/TextView;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 412
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactCompanyView:Landroid/widget/TextView;

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 415
    :cond_17
    invoke-interface/range {v38 .. v38}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_16

    .line 418
    .end local v19    # "company":Ljava/lang/String;
    .end local v54    # "title":Ljava/lang/String;
    :cond_18
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x3

    new-array v4, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string/jumbo v7, "_id"

    aput-object v7, v4, v6

    const/4 v6, 0x1

    const-string/jumbo v7, "data1"

    aput-object v7, v4, v6

    const/4 v6, 0x2

    const-string/jumbo v7, "mimetype"

    aput-object v7, v4, v6

    const-string/jumbo v5, "contact_id=? AND mimetype=\'vnd.android.cursor.item/note\'"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    move-object/from16 v60, v0

    aput-object v60, v6, v7

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v36

    .line 424
    invoke-interface/range {v36 .. v36}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1b

    .line 426
    :cond_19
    const-string/jumbo v6, "data1"

    .line 427
    move-object/from16 v0, v36

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 426
    move-object/from16 v0, v36

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v35

    .line 428
    .local v35, "noteinfo":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0700be

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v37

    .line 429
    .local v37, "notesTitle":Ljava/lang/String;
    new-instance v31, Ljava/util/HashMap;

    invoke-direct/range {v31 .. v31}, Ljava/util/HashMap;-><init>()V

    .line 430
    .restart local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static/range {v35 .. v35}, Lcom/pccw/mobile/util/StringUtil;->isNotEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1a

    invoke-virtual/range {v35 .. v35}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, " "

    const-string/jumbo v60, ""

    move-object/from16 v0, v60

    invoke-virtual {v6, v7, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_1a

    .line 431
    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    move-object/from16 v1, v37

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    const-string/jumbo v6, "contant"

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    const-string/jumbo v6, "type"

    const-string/jumbo v7, "note"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 434
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetails:Ljava/util/List;

    move-object/from16 v0, v31

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 438
    :cond_1a
    invoke-interface/range {v36 .. v36}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_19

    .line 441
    .end local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v35    # "noteinfo":Ljava/lang/String;
    .end local v37    # "notesTitle":Ljava/lang/String;
    :cond_1b
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x2

    new-array v4, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string/jumbo v7, "_id"

    aput-object v7, v4, v6

    const/4 v6, 0x1

    const-string/jumbo v7, "data1"

    aput-object v7, v4, v6

    const-string/jumbo v5, "contact_id=? AND mimetype=\'vnd.android.cursor.item/nickname\'"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    move-object/from16 v60, v0

    aput-object v60, v6, v7

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v34

    .line 447
    invoke-interface/range {v34 .. v34}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1e

    .line 449
    :cond_1c
    const-string/jumbo v6, "data1"

    .line 450
    move-object/from16 v0, v34

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 449
    move-object/from16 v0, v34

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v33

    .line 451
    .local v33, "nickname_":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0700bf

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v32

    .line 452
    .local v32, "nicknameTitle":Ljava/lang/String;
    new-instance v31, Ljava/util/HashMap;

    invoke-direct/range {v31 .. v31}, Ljava/util/HashMap;-><init>()V

    .line 453
    .restart local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static/range {v33 .. v33}, Lcom/pccw/mobile/util/StringUtil;->isNotEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1d

    invoke-virtual/range {v33 .. v33}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, " "

    const-string/jumbo v60, ""

    move-object/from16 v0, v60

    invoke-virtual {v6, v7, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_1d

    .line 454
    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 455
    const-string/jumbo v6, "contant"

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    const-string/jumbo v6, "type"

    const-string/jumbo v7, "nickname"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetails:Ljava/util/List;

    move-object/from16 v0, v31

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 461
    :cond_1d
    invoke-interface/range {v34 .. v34}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_1c

    .line 465
    .end local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v32    # "nicknameTitle":Ljava/lang/String;
    .end local v33    # "nickname_":Ljava/lang/String;
    :cond_1e
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x4

    new-array v4, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string/jumbo v7, "_id"

    aput-object v7, v4, v6

    const/4 v6, 0x1

    const-string/jumbo v7, "data1"

    aput-object v7, v4, v6

    const/4 v6, 0x2

    const-string/jumbo v7, "data1"

    aput-object v7, v4, v6

    const/4 v6, 0x3

    const-string/jumbo v7, "data2"

    aput-object v7, v4, v6

    const-string/jumbo v5, "contact_id=? AND mimetype=\'vnd.android.cursor.item/relation\'"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    move-object/from16 v60, v0

    aput-object v60, v6, v7

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v47

    .line 471
    invoke-interface/range {v47 .. v47}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_21

    .line 473
    :cond_1f
    const-string/jumbo v6, "data2"

    .line 475
    move-object/from16 v0, v47

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 474
    move-object/from16 v0, v47

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v49

    .line 476
    .local v49, "relationType":Ljava/lang/String;
    const-string/jumbo v6, "data1"

    .line 478
    move-object/from16 v0, v47

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 477
    move-object/from16 v0, v47

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v50

    .line 480
    .local v50, "relationValue":Ljava/lang/String;
    invoke-static/range {v49 .. v49}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v55

    .line 482
    .restart local v55    # "type":I
    invoke-static/range {v55 .. v55}, Landroid/provider/ContactsContract$CommonDataKinds$Relation;->getTypeLabelResource(I)I

    move-result v52

    .line 483
    .local v52, "relationtypeLabelResource":I
    move-object/from16 v0, p0

    move/from16 v1, v52

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getString(I)Ljava/lang/String;

    move-result-object v48

    .line 485
    .local v48, "relationLabel":Ljava/lang/String;
    new-instance v31, Ljava/util/HashMap;

    invoke-direct/range {v31 .. v31}, Ljava/util/HashMap;-><init>()V

    .line 486
    .restart local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v60, 0x7f0700c0

    move/from16 v0, v60

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v48

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v51

    .line 487
    .local v51, "relationshipTitle":Ljava/lang/String;
    invoke-static/range {v50 .. v50}, Lcom/pccw/mobile/util/StringUtil;->isNotEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_20

    invoke-virtual/range {v50 .. v50}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, " "

    const-string/jumbo v60, ""

    move-object/from16 v0, v60

    invoke-virtual {v6, v7, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_20

    .line 488
    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    move-object/from16 v1, v51

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    const-string/jumbo v6, "contant"

    move-object/from16 v0, v31

    move-object/from16 v1, v50

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 490
    const-string/jumbo v6, "type"

    const-string/jumbo v7, "relation"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetails:Ljava/util/List;

    move-object/from16 v0, v31

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 495
    :cond_20
    invoke-interface/range {v47 .. v47}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_1f

    .line 499
    .end local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v48    # "relationLabel":Ljava/lang/String;
    .end local v49    # "relationType":Ljava/lang/String;
    .end local v50    # "relationValue":Ljava/lang/String;
    .end local v51    # "relationshipTitle":Ljava/lang/String;
    .end local v52    # "relationtypeLabelResource":I
    .end local v55    # "type":I
    :cond_21
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x2

    new-array v4, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string/jumbo v7, "_id"

    aput-object v7, v4, v6

    const/4 v6, 0x1

    const-string/jumbo v7, "data1"

    aput-object v7, v4, v6

    const-string/jumbo v5, "contact_id=? AND mimetype=\'vnd.android.cursor.item/website\'"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    move-object/from16 v60, v0

    aput-object v60, v6, v7

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v57

    .line 505
    invoke-interface/range {v57 .. v57}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_24

    .line 507
    :cond_22
    const-string/jumbo v6, "data1"

    .line 508
    move-object/from16 v0, v57

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 507
    move-object/from16 v0, v57

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v58

    .line 509
    .local v58, "webSite_":Ljava/lang/String;
    new-instance v31, Ljava/util/HashMap;

    invoke-direct/range {v31 .. v31}, Ljava/util/HashMap;-><init>()V

    .line 510
    .restart local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0700c2

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v59

    .line 511
    .local v59, "websiteTitle":Ljava/lang/String;
    invoke-static/range {v58 .. v58}, Lcom/pccw/mobile/util/StringUtil;->isNotEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_23

    invoke-virtual/range {v58 .. v58}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, " "

    const-string/jumbo v60, ""

    move-object/from16 v0, v60

    invoke-virtual {v6, v7, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_23

    .line 512
    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    move-object/from16 v1, v59

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    const-string/jumbo v6, "contant"

    move-object/from16 v0, v31

    move-object/from16 v1, v58

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    const-string/jumbo v6, "type"

    const-string/jumbo v7, "website"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetails:Ljava/util/List;

    move-object/from16 v0, v31

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 518
    :cond_23
    invoke-interface/range {v57 .. v57}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_22

    .line 524
    .end local v26    # "emailsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v43    # "phonesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v58    # "webSite_":Ljava/lang/String;
    .end local v59    # "websiteTitle":Ljava/lang/String;
    :cond_24
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 525
    .local v2, "cr":Landroid/content/ContentResolver;
    sget-object v3, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    .line 526
    .local v3, "uri":Landroid/net/Uri;
    const/4 v6, 0x1

    new-array v4, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string/jumbo v7, "data1"

    aput-object v7, v4, v6

    .line 527
    .local v4, "projection":[Ljava/lang/String;
    const-string/jumbo v5, "contact_id=? AND mimetype=\'vnd.android.cursor.item/contact_event\' and data2=\'3\'"
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 529
    .local v5, "selection":Ljava/lang/String;
    const/16 v17, 0x0

    .line 531
    .local v17, "brithdayCursor":Landroid/database/Cursor;
    const/4 v6, 0x1

    :try_start_2
    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    move-object/from16 v60, v0

    aput-object v60, v6, v7

    const/4 v7, 0x0

    .line 532
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v17

    .line 533
    if-eqz v17, :cond_27

    .line 534
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_27

    .line 536
    :cond_25
    new-instance v31, Ljava/util/HashMap;

    invoke-direct/range {v31 .. v31}, Ljava/util/HashMap;-><init>()V

    .line 537
    .restart local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0700ba

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 538
    .local v16, "birthdayTitle":Ljava/lang/String;
    const/4 v6, 0x0

    move-object/from16 v0, v17

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 539
    .local v15, "birthdayStr":Ljava/lang/String;
    invoke-static {v15}, Lcom/pccw/mobile/util/StringUtil;->isNotEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_26

    .line 540
    const-string/jumbo v6, "title"

    move-object/from16 v0, v31

    move-object/from16 v1, v16

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 541
    const-string/jumbo v6, "contant"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 542
    const-string/jumbo v6, "type"

    const-string/jumbo v7, "birthday"

    move-object/from16 v0, v31

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 543
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetails:Ljava/util/List;

    move-object/from16 v0, v31

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 545
    :cond_26
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result v6

    if-nez v6, :cond_25

    .line 550
    .end local v15    # "birthdayStr":Ljava/lang/String;
    .end local v16    # "birthdayTitle":Ljava/lang/String;
    .end local v31    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_27
    if-eqz v17, :cond_28

    .line 551
    :try_start_3
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 558
    :cond_28
    if-eqz v42, :cond_29

    .line 559
    invoke-interface/range {v42 .. v42}, Landroid/database/Cursor;->close()V

    .line 563
    :cond_29
    if-eqz v25, :cond_2a

    .line 564
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->close()V

    .line 568
    :cond_2a
    if-eqz v8, :cond_2b

    .line 569
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 573
    :cond_2b
    if-eqz v38, :cond_2c

    .line 574
    invoke-interface/range {v38 .. v38}, Landroid/database/Cursor;->close()V

    .line 578
    :cond_2c
    if-eqz v36, :cond_2d

    .line 579
    invoke-interface/range {v36 .. v36}, Landroid/database/Cursor;->close()V

    .line 583
    :cond_2d
    if-eqz v34, :cond_2e

    .line 584
    invoke-interface/range {v34 .. v34}, Landroid/database/Cursor;->close()V

    .line 588
    :cond_2e
    if-eqz v47, :cond_2f

    .line 589
    invoke-interface/range {v47 .. v47}, Landroid/database/Cursor;->close()V

    .line 593
    :cond_2f
    if-eqz v57, :cond_30

    .line 594
    invoke-interface/range {v57 .. v57}, Landroid/database/Cursor;->close()V

    .line 597
    :cond_30
    if-eqz v20, :cond_31

    .line 598
    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->close()V

    .line 603
    :cond_31
    return-void

    .line 550
    :catchall_1
    move-exception v6

    if-eqz v17, :cond_32

    .line 551
    :try_start_4
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    :cond_32
    throw v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method private pasteNumberToDialer(Ljava/lang/String;)V
    .locals 1
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 711
    if-nez p1, :cond_0

    .line 712
    iget-object p1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->targerNumber:Ljava/lang/String;

    .line 713
    :cond_0
    invoke-static {p1, p0}, Lcom/pccw/mobile/sip/util/IntentUtils;->genDialScreenIntent(Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->startActivity(Landroid/content/Intent;)V

    .line 714
    return-void
.end method

.method private pretreatment(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "oldNumber"    # Ljava/lang/String;

    .prologue
    .line 606
    invoke-static {p1}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 608
    invoke-static {p1}, Lcom/pccw/sms/util/SMSNumberUtil;->isValidRecipient(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 609
    invoke-static {p1}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 613
    :goto_0
    return-object v1

    .line 611
    :cond_0
    new-instance v0, Lcom/pccw/mobile/sip/SMSType;

    const-string/jumbo v1, "na"

    invoke-direct {v0, p1, v1}, Lcom/pccw/mobile/sip/SMSType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 612
    .local v0, "smsType":Lcom/pccw/mobile/sip/SMSType;
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->smsTypesList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 613
    const-string/jumbo v1, "NotMatch"

    goto :goto_0
.end method

.method private promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V
    .locals 3
    .param p1, "dialogType"    # Lcom/pccw/dialog/EnumKKDialogType;

    .prologue
    .line 940
    new-instance v0, Lcom/pccw/dialog/KKDialogBuilder;

    invoke-direct {v0}, Lcom/pccw/dialog/KKDialogBuilder;-><init>()V

    .line 941
    .local v0, "dialogBuilder":Lcom/pccw/dialog/KKDialogBuilder;
    new-instance v2, Lcom/pccw/dialog/KKDialogProvider;

    invoke-direct {v2, v0, p0}, Lcom/pccw/dialog/KKDialogProvider;-><init>(Lcom/pccw/dialog/KKDialogBuilder;Landroid/app/Activity;)V

    .line 942
    .local v2, "provider":Lcom/pccw/dialog/KKDialogProvider;
    invoke-virtual {v2, p1, p0}, Lcom/pccw/dialog/KKDialogProvider;->requestDialog(Lcom/pccw/dialog/EnumKKDialogType;Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)Lcom/pccw/dialog/KKDialog;

    move-result-object v1

    .line 943
    .local v1, "kkDialog":Lcom/pccw/dialog/KKDialog;
    invoke-virtual {v1}, Lcom/pccw/dialog/KKDialog;->show()V

    .line 944
    return-void
.end method

.method private promptDialogWithArguments(Lcom/pccw/dialog/EnumKKDialogType;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "dialogType"    # Lcom/pccw/dialog/EnumKKDialogType;
    .param p2, "args"    # Landroid/os/Bundle;

    .prologue
    .line 947
    new-instance v0, Lcom/pccw/dialog/KKDialogBuilder;

    invoke-direct {v0}, Lcom/pccw/dialog/KKDialogBuilder;-><init>()V

    .line 948
    .local v0, "dialogBuilder":Lcom/pccw/dialog/KKDialogBuilder;
    new-instance v2, Lcom/pccw/dialog/KKDialogProvider;

    invoke-direct {v2, v0, p0}, Lcom/pccw/dialog/KKDialogProvider;-><init>(Lcom/pccw/dialog/KKDialogBuilder;Landroid/app/Activity;)V

    .line 949
    .local v2, "provider":Lcom/pccw/dialog/KKDialogProvider;
    invoke-virtual {v2, p1, p0}, Lcom/pccw/dialog/KKDialogProvider;->requestDialog(Lcom/pccw/dialog/EnumKKDialogType;Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)Lcom/pccw/dialog/KKDialog;

    move-result-object v1

    .line 950
    .local v1, "kkDialog":Lcom/pccw/dialog/KKDialog;
    invoke-virtual {v1, p2}, Lcom/pccw/dialog/KKDialog;->setArguments(Landroid/os/Bundle;)V

    .line 951
    invoke-virtual {v1}, Lcom/pccw/dialog/KKDialog;->show()V

    .line 952
    return-void
.end method

.method private retrieveContactPhoto(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 8
    .param p1, "contactId"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 732
    const/4 v2, 0x0

    .line 736
    .local v2, "photo":Landroid/graphics/Bitmap;
    :try_start_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v3, v4, :cond_1

    .line 738
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 741
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 739
    invoke-static {v4, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x1

    .line 738
    invoke-static {v3, v4, v5}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Ljava/io/InputStream;

    move-result-object v1

    .line 750
    .local v1, "inputStream":Ljava/io/InputStream;
    :goto_0
    if-eqz v1, :cond_0

    .line 751
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 752
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 759
    .end local v1    # "inputStream":Ljava/io/InputStream;
    :cond_0
    :goto_1
    return-object v2

    .line 744
    :cond_1
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 747
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 745
    invoke-static {v4, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v4

    .line 744
    invoke-static {v3, v4}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .restart local v1    # "inputStream":Ljava/io/InputStream;
    goto :goto_0

    .line 755
    .end local v1    # "inputStream":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 756
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method private startNewChatActivity(Ljava/lang/String;)V
    .locals 5
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 930
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 931
    .local v1, "intent":Landroid/content/Intent;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 932
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v2, "numbers"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 935
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 936
    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->startActivity(Landroid/content/Intent;)V

    .line 937
    return-void
.end method


# virtual methods
.method public onClickKKDialogNegativeButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 0
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 978
    return-void
.end method

.method public onClickKKDialogNeutralButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 0
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 984
    return-void
.end method

.method public onClickKKDialogPositiveButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 4
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 957
    sget-object v2, Lcom/pccw/mobile/sip/ContactDetailsActivity$2;->$SwitchMap$com$pccw$dialog$EnumKKDialogType:[I

    invoke-virtual {p1}, Lcom/pccw/dialog/KKDialog;->getDialogType()Lcom/pccw/dialog/EnumKKDialogType;

    move-result-object v3

    invoke-virtual {v3}, Lcom/pccw/dialog/EnumKKDialogType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 972
    :goto_0
    return-void

    .line 959
    :pswitch_0
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.settings.WIFI_SETTINGS"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 962
    :pswitch_1
    invoke-virtual {p1}, Lcom/pccw/dialog/KKDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 963
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v2, "number"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 964
    .local v1, "number":Ljava/lang/String;
    invoke-static {v1}, Lcom/pccw/sms/util/SMSNumberUtil;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->startNewChatActivity(Ljava/lang/String;)V

    goto :goto_0

    .line 967
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "number":Ljava/lang/String;
    :pswitch_2
    const-string/jumbo v2, ""

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/pccw/mobile/sip/util/IntentUtils;->genDialScreenIntent(Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 957
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    const/16 v2, 0x10

    .line 145
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 146
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    .line 147
    .local v9, "mIntent":Landroid/content/Intent;
    const-string/jumbo v0, "contactId"

    invoke-virtual {v9, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    .line 148
    const-string/jumbo v0, "contactName"

    invoke-virtual {v9, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactName:Ljava/lang/String;

    .line 150
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 151
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 152
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v0, v2, v2}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(II)V

    .line 154
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    .line 155
    .local v7, "inflater":Landroid/view/LayoutInflater;
    const v0, 0x7f04001c

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v7, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    .line 158
    .local v8, "layout":Landroid/view/View;
    const v0, 0x7f0e0043

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->title:Landroid/widget/TextView;

    .line 159
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->title:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v0, v8}, Landroid/support/v7/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 164
    const v0, 0x7f04003d

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->setContentView(I)V

    .line 166
    const v0, 0x7f0e0118

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactPositionView:Landroid/widget/TextView;

    .line 167
    const v0, 0x7f0e0119

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactCompanyView:Landroid/widget/TextView;

    .line 169
    new-instance v0, Lcom/pccw/sms/service/ConversationParticipantItemService;

    invoke-direct {v0, p0}, Lcom/pccw/sms/service/ConversationParticipantItemService;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

    .line 172
    const v0, 0x7f0e0117

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactPhoto:Landroid/widget/ImageView;

    .line 173
    const v0, 0x7f0e011a

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->mPhoneList:Landroid/widget/ListView;

    .line 174
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetails:Ljava/util/List;

    .line 175
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->msisdnlistString:Ljava/lang/String;

    .line 177
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getAllInfo()V

    .line 196
    new-instance v0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iget-object v3, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetails:Ljava/util/List;

    const v4, 0x7f04003e

    move-object v1, p0

    move-object v2, p0

    move-object v6, v5

    invoke-direct/range {v0 .. v6}, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;-><init>(Lcom/pccw/mobile/sip/ContactDetailsActivity;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetailsAdapter:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    .line 198
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->mPhoneList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactDetailsAdapter:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 200
    return-void
.end method

.method public onCreateDescription()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 636
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

    .line 672
    packed-switch p1, :pswitch_data_0

    move-object v0, v5

    .line 681
    :goto_0
    return-object v0

    .line 674
    :pswitch_0
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    sget-object v2, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactPhoneNumberQuery;->PROJECTION:[Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "contact_id =  \'"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

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

    .line 678
    .local v0, "mLoader":Landroid/support/v4/content/CursorLoader;
    goto :goto_0

    .line 672
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 647
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    .line 648
    .local v1, "inflater":Landroid/view/MenuInflater;
    const v2, 0x7f100003

    invoke-virtual {v1, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 649
    const v2, 0x7f0e0209

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 650
    .local v0, "editItem":Landroid/view/MenuItem;
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 651
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v2

    return v2
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 642
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onDestroy()V

    .line 643
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
    .line 686
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    invoke-virtual {p1}, Landroid/support/v4/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 701
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 691
    :pswitch_1
    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 692
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 693
    const/4 v0, 0x4

    .line 694
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->lookUpKey:Ljava/lang/String;

    .line 695
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->title:Landroid/widget/TextView;

    const/4 v1, 0x5

    .line 696
    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 695
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 686
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 71
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

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
    .line 927
    .local p1, "arg0":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 656
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 664
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 658
    :sswitch_0
    invoke-static {p0}, Landroid/support/v4/app/NavUtils;->navigateUpFromSameTask(Landroid/app/Activity;)V

    goto :goto_0

    .line 661
    :sswitch_1
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->editContact()V

    goto :goto_0

    .line 656
    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f0e0209 -> :sswitch_1
    .end sparse-switch
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 630
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onPause()V

    .line 631
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 619
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 621
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactId:Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/pccw/mobile/util/UserPhotoUtil;->getLargeContactPhoto(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 622
    .local v0, "contactBm":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 623
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity;->contactPhoto:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 625
    :cond_0
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onResume()V

    .line 626
    return-void
.end method
