.class public Lcom/pccw/sms/emoji/EmojiPagerAdapter;
.super Landroid/support/v4/app/FragmentStatePagerAdapter;
.source "EmojiPagerAdapter.java"


# instance fields
.field private fragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/pccw/sms/emoji/EmojiconGridFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V
    .locals 0
    .param p1, "fm"    # Landroid/support/v4/app/FragmentManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentManager;",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/sms/emoji/EmojiconGridFragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 15
    .local p2, "fragments":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/sms/emoji/EmojiconGridFragment;>;"
    invoke-direct {p0, p1}, Landroid/support/v4/app/FragmentStatePagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 16
    iput-object p2, p0, Lcom/pccw/sms/emoji/EmojiPagerAdapter;->fragments:Ljava/util/List;

    .line 17
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiPagerAdapter;->fragments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 21
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiPagerAdapter;->fragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    return-object v0
.end method
