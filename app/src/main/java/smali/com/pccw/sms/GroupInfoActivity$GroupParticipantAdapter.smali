.class public Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;
.super Landroid/widget/BaseAdapter;
.source "GroupInfoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/GroupInfoActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GroupParticipantAdapter"
.end annotation


# instance fields
.field private layoutID:I

.field private list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;

.field public mThumbnailUri:Ljava/lang/String;

.field final synthetic this$0:Lcom/pccw/sms/GroupInfoActivity;


# direct methods
.method public constructor <init>(Lcom/pccw/sms/GroupInfoActivity;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V
    .locals 1
    .param p1, "this$0"    # Lcom/pccw/sms/GroupInfoActivity;
    .param p2, "context"    # Landroid/content/Context;
    .param p4, "layoutID"    # I
    .param p5, "flag"    # [Ljava/lang/String;
    .param p6, "ItemIDs"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;I[",
            "Ljava/lang/String;",
            "[I)V"
        }
    .end annotation

    .prologue
    .line 311
    .local p3, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 312
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 313
    iput-object p3, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->list:Ljava/util/List;

    .line 314
    iput p4, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->layoutID:I

    .line 315
    iput-object p2, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->mContext:Landroid/content/Context;

    .line 316
    return-void
.end method

.method private getContactImageByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "strPhoneNumber"    # Ljava/lang/String;

    .prologue
    .line 429
    new-instance v0, Lcom/pccw/mobile/sms/helper/ContactsHelper;

    iget-object v1, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-virtual {v1}, Lcom/pccw/sms/GroupInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p2, v1}, Lcom/pccw/mobile/sms/helper/ContactsHelper;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 430
    .local v0, "helper":Lcom/pccw/mobile/sms/helper/ContactsHelper;
    invoke-virtual {v0}, Lcom/pccw/mobile/sms/helper/ContactsHelper;->getPhoto()Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public getContactNameByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "number"    # Ljava/lang/String;

    .prologue
    .line 424
    new-instance v0, Lcom/pccw/mobile/sms/helper/ContactsHelper;

    iget-object v1, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-virtual {v1}, Lcom/pccw/sms/GroupInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p2, v1}, Lcom/pccw/mobile/sms/helper/ContactsHelper;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 425
    .local v0, "helper":Lcom/pccw/mobile/sms/helper/ContactsHelper;
    invoke-virtual {v0}, Lcom/pccw/mobile/sms/helper/ContactsHelper;->getName()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 320
    iget-object v0, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "arg0"    # I

    .prologue
    .line 325
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "arg0"    # I

    .prologue
    .line 330
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v11, 0x0

    .line 335
    iget-object v8, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v9, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->layoutID:I

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 336
    iget-object v8, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->list:Ljava/util/List;

    invoke-interface {v8, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 338
    .local v3, "number":Ljava/lang/String;
    const v8, 0x7f0e014c

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 339
    .local v4, "participantIcon":Landroid/widget/ImageView;
    const v8, 0x7f0e014f

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 340
    .local v5, "participantName":Landroid/widget/TextView;
    const v8, 0x7f0e0150

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 341
    .local v6, "participantNumber":Landroid/widget/TextView;
    const v8, 0x7f0e0152

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 342
    .local v0, "callBtn":Landroid/widget/ImageView;
    const v8, 0x7f0e0151

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 344
    .local v7, "smsTypeBtn":Landroid/widget/ImageView;
    invoke-virtual {v7, v3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 345
    iget-object v8, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-static {v8}, Lcom/pccw/sms/GroupInfoActivity;->access$100(Lcom/pccw/sms/GroupInfoActivity;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-gt v8, p1, :cond_0

    .line 346
    iget-object v8, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-static {v8}, Lcom/pccw/sms/GroupInfoActivity;->access$100(Lcom/pccw/sms/GroupInfoActivity;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 349
    :cond_0
    iget-object v8, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v8, v3}, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->getContactNameByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 350
    .local v2, "name":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 351
    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 352
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 354
    :cond_1
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 355
    iget-object v8, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p0, v8, v3}, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->getContactImageByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 356
    .local v1, "contactBitmap":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_2

    .line 357
    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 362
    :goto_0
    invoke-static {v3}, Lcom/pccw/sms/util/SMSNumberUtil;->isValidRecipient(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 363
    invoke-virtual {v7, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 364
    iget-object v8, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-virtual {v8}, Lcom/pccw/sms/GroupInfoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f020081

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 390
    :goto_1
    new-instance v8, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;

    invoke-direct {v8, p0, v3}, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$1;-><init>(Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 412
    const v8, 0x7f0204f5

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 413
    new-instance v8, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$2;

    invoke-direct {v8, p0, v3}, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$2;-><init>(Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 420
    return-object p2

    .line 359
    :cond_2
    const v8, 0x7f0200ce

    invoke-virtual {v4, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 366
    :cond_3
    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1
.end method
