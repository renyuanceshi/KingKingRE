.class public Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;
.super Landroid/widget/BaseAdapter;
.source "GroupInfoParticipantAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/widget/BaseAdapter;"
    }
.end annotation


# instance fields
.field private LOG_TAG:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mMemoryCache:Landroid/support/v4/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mSparseBooleanArray:Landroid/util/SparseBooleanArray;

.field private owner:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>;"
    .local p2, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 33
    const-string/jumbo v2, "GroupInfoParticipantAdapter"

    iput-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->LOG_TAG:Ljava/lang/String;

    .line 43
    iput-object p1, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mContext:Landroid/content/Context;

    .line 44
    iget-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 45
    new-instance v2, Landroid/util/SparseBooleanArray;

    invoke-direct {v2}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mSparseBooleanArray:Landroid/util/SparseBooleanArray;

    .line 46
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mList:Ljava/util/ArrayList;

    .line 47
    iput-object p2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mList:Ljava/util/ArrayList;

    .line 48
    iget-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->owner:Ljava/lang/String;

    .line 50
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v2

    const-wide/16 v4, 0x400

    div-long/2addr v2, v4

    long-to-int v1, v2

    .line 51
    .local v1, "maxMemory":I
    div-int/lit8 v0, v1, 0x8

    .line 53
    .local v0, "cacheSize":I
    new-instance v2, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$1;

    invoke-direct {v2, p0, v0}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$1;-><init>(Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;I)V

    iput-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mMemoryCache:Landroid/support/v4/util/LruCache;

    .line 59
    return-void
.end method

.method static synthetic access$000(Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public addBitmapToMemoryCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 62
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>;"
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 63
    invoke-virtual {p0, p1}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    :cond_0
    return-void
.end method

.method public getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 69
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>;"
    iget-object v0, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getCheckedItems()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 87
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .local v1, "mTempArry":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 89
    iget-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mSparseBooleanArray:Landroid/util/SparseBooleanArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 90
    iget-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 93
    :cond_1
    return-object v1
.end method

.method public getCheckedUserId()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .local v1, "mTempArry":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 99
    iget-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mSparseBooleanArray:Landroid/util/SparseBooleanArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 100
    iget-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/pccw/sms/bean/ConversationParticipantItem;

    invoke-virtual {v2}, Lcom/pccw/sms/bean/ConversationParticipantItem;->getUserId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 103
    :cond_1
    return-object v1
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 109
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>;"
    iget-object v0, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 114
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>;"
    iget-object v1, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/database/entity/GroupMember;

    .line 115
    .local v0, "gm":Lcom/pccw/database/entity/GroupMember;
    iget-object v1, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->owner:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->owner:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/pccw/database/entity/GroupMember;->getMemberUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 118
    .end local v0    # "gm":Lcom/pccw/database/entity/GroupMember;
    :goto_0
    return-object v0

    .restart local v0    # "gm":Lcom/pccw/database/entity/GroupMember;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 124
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>;"
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>;"
    const v11, 0x7f0200ce

    .line 131
    if-nez p2, :cond_0

    .line 132
    iget-object v8, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v9, 0x7f04004b

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 135
    :cond_0
    const v8, 0x7f0e014d

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 136
    .local v7, "tvTitle":Landroid/widget/TextView;
    const v8, 0x7f0e014c

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 137
    .local v5, "profilePic":Landroid/widget/ImageView;
    const v8, 0x7f0e014e

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 139
    .local v6, "tvAdmin":Landroid/widget/TextView;
    const/4 v8, 0x4

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 141
    iget-object v8, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v8, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/pccw/database/entity/GroupMember;

    .line 142
    .local v1, "gm":Lcom/pccw/database/entity/GroupMember;
    invoke-virtual {v1}, Lcom/pccw/database/entity/GroupMember;->getMemberUserName()Ljava/lang/String;

    move-result-object v3

    .line 143
    .local v3, "memberID":Ljava/lang/String;
    iget-object v8, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->owner:Ljava/lang/String;

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->owner:Ljava/lang/String;

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f07009b

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 145
    .local v4, "nickname":Ljava/lang/String;
    :goto_0
    if-eqz v4, :cond_2

    const-string/jumbo v8, ""

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 146
    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    :goto_1
    iget-object v8, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v8, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/pccw/database/entity/GroupMember;

    invoke-virtual {v8}, Lcom/pccw/database/entity/GroupMember;->getProfileImagePath()Ljava/lang/String;

    move-result-object v2

    .line 152
    .local v2, "imgPath":Ljava/lang/String;
    if-eqz v2, :cond_3

    const-string/jumbo v8, ""

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 153
    invoke-virtual {p0, v2, v5, v11}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->loadBitmap(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 159
    :goto_2
    return-object p2

    .line 143
    .end local v2    # "imgPath":Ljava/lang/String;
    .end local v4    # "nickname":Ljava/lang/String;
    :cond_1
    invoke-virtual {v1}, Lcom/pccw/database/entity/GroupMember;->getNickName()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 148
    .restart local v4    # "nickname":Ljava/lang/String;
    :cond_2
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 155
    .restart local v2    # "imgPath":Ljava/lang/String;
    :cond_3
    iget-object v8, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-static {v8, v11}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 156
    .local v0, "bm":Landroid/graphics/Bitmap;
    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_2
.end method

.method public loadBitmap(Ljava/lang/String;Landroid/widget/ImageView;I)V
    .locals 5
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "imageView"    # Landroid/widget/ImageView;
    .param p3, "placeholder"    # I

    .prologue
    .line 73
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>;"
    move-object v1, p1

    .line 75
    .local v1, "imageKey":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 77
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 78
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 84
    :goto_0
    return-void

    .line 80
    :cond_0
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 81
    new-instance v2, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;

    invoke-direct {v2, p0, p1, p2}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;-><init>(Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 82
    .local v2, "task":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>.SetImageTask;"
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v2, v3}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method
