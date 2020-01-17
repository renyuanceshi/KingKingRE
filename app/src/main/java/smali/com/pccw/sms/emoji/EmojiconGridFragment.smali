.class public Lcom/pccw/sms/emoji/EmojiconGridFragment;
.super Landroid/support/v4/app/Fragment;
.source "EmojiconGridFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;
    }
.end annotation


# instance fields
.field private mData:[Lcom/pccw/sms/bean/Emojicon;

.field private mOnEmojiconClickedListener:Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method public static newInstance([Lcom/pccw/sms/bean/Emojicon;)Lcom/pccw/sms/emoji/EmojiconGridFragment;
    .locals 3
    .param p0, "emojicons"    # [Lcom/pccw/sms/bean/Emojicon;

    .prologue
    .line 22
    new-instance v1, Lcom/pccw/sms/emoji/EmojiconGridFragment;

    invoke-direct {v1}, Lcom/pccw/sms/emoji/EmojiconGridFragment;-><init>()V

    .line 23
    .local v1, "emojiGridFragment":Lcom/pccw/sms/emoji/EmojiconGridFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 24
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "emojicons"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 25
    invoke-virtual {v1, v0}, Lcom/pccw/sms/emoji/EmojiconGridFragment;->setArguments(Landroid/os/Bundle;)V

    .line 26
    return-object v1
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 51
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 52
    instance-of v0, p1, Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;

    if-eqz v0, :cond_0

    .line 53
    check-cast p1, Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;

    .end local p1    # "activity":Landroid/app/Activity;
    iput-object p1, p0, Lcom/pccw/sms/emoji/EmojiconGridFragment;->mOnEmojiconClickedListener:Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;

    .line 57
    return-void

    .line 55
    .restart local p1    # "activity":Landroid/app/Activity;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " must implement interface "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 31
    const v0, 0x7f040044

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/sms/emoji/EmojiconGridFragment;->mOnEmojiconClickedListener:Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;

    .line 62
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDetach()V

    .line 63
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
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
    .line 67
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiconGridFragment;->mOnEmojiconClickedListener:Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;

    if-eqz v0, :cond_0

    .line 68
    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiconGridFragment;->mOnEmojiconClickedListener:Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;

    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/bean/Emojicon;

    invoke-interface {v1, v0}, Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;->onEmojiconClicked(Lcom/pccw/sms/bean/Emojicon;)V

    .line 70
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 45
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 46
    const-string/jumbo v0, "emojicons"

    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiconGridFragment;->mData:[Lcom/pccw/sms/bean/Emojicon;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 47
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 36
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 37
    const v1, 0x7f0e012c

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/GridView;

    .line 38
    .local v0, "gridView":Landroid/widget/GridView;
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiconGridFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/pccw/sms/emoji/type/People;->DATA:[Lcom/pccw/sms/bean/Emojicon;

    :goto_0
    iput-object v1, p0, Lcom/pccw/sms/emoji/EmojiconGridFragment;->mData:[Lcom/pccw/sms/bean/Emojicon;

    .line 39
    new-instance v1, Lcom/pccw/sms/emoji/EmojiAdapter;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/sms/emoji/EmojiconGridFragment;->mData:[Lcom/pccw/sms/bean/Emojicon;

    invoke-direct {v1, v2, v3}, Lcom/pccw/sms/emoji/EmojiAdapter;-><init>(Landroid/content/Context;[Lcom/pccw/sms/bean/Emojicon;)V

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 40
    invoke-virtual {v0, p0}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 41
    return-void

    .line 38
    :cond_0
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiconGridFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "emojicons"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, [Lcom/pccw/sms/bean/Emojicon;

    check-cast v1, [Lcom/pccw/sms/bean/Emojicon;

    goto :goto_0
.end method
