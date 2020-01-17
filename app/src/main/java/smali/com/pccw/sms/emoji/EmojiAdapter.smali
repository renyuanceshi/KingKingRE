.class Lcom/pccw/sms/emoji/EmojiAdapter;
.super Landroid/widget/ArrayAdapter;
.source "EmojiAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/emoji/EmojiAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/pccw/sms/bean/Emojicon;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;[Lcom/pccw/sms/bean/Emojicon;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "data"    # [Lcom/pccw/sms/bean/Emojicon;

    .prologue
    .line 15
    const v0, 0x7f040045

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 16
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 20
    move-object v2, p2

    .line 21
    .local v2, "v":Landroid/view/View;
    if-nez v2, :cond_0

    .line 22
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiAdapter;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f040045

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 23
    new-instance v1, Lcom/pccw/sms/emoji/EmojiAdapter$ViewHolder;

    invoke-direct {v1, p0}, Lcom/pccw/sms/emoji/EmojiAdapter$ViewHolder;-><init>(Lcom/pccw/sms/emoji/EmojiAdapter;)V

    .line 24
    .local v1, "holder":Lcom/pccw/sms/emoji/EmojiAdapter$ViewHolder;
    const v3, 0x7f0e012d

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v1, Lcom/pccw/sms/emoji/EmojiAdapter$ViewHolder;->icon:Landroid/widget/TextView;

    .line 25
    invoke-virtual {v2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 27
    .end local v1    # "holder":Lcom/pccw/sms/emoji/EmojiAdapter$ViewHolder;
    :cond_0
    invoke-virtual {p0, p1}, Lcom/pccw/sms/emoji/EmojiAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/bean/Emojicon;

    .line 28
    .local v0, "emoji":Lcom/pccw/sms/bean/Emojicon;
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/pccw/sms/emoji/EmojiAdapter$ViewHolder;

    .line 29
    .restart local v1    # "holder":Lcom/pccw/sms/emoji/EmojiAdapter$ViewHolder;
    iget-object v3, v1, Lcom/pccw/sms/emoji/EmojiAdapter$ViewHolder;->icon:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/pccw/sms/bean/Emojicon;->getEmoji()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    return-object v2
.end method
