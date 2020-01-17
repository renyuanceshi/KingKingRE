.class public Lcom/pccw/sms/emoji/EmojiKeyboardFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "EmojiKeyboardFragment.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;,
        Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;,
        Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;
    }
.end annotation


# instance fields
.field private keyboardHeight:I

.field private mEmojiTabLastSelectedIndex:I

.field private mEmojiTabs:[Landroid/view/View;

.field private mOnEmojiconBackspaceClickedListener:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;

.field private mOnKeyboardDialogDismissListener:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;

.field private popUpheight:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 36
    const/4 v0, -0x1

    iput v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabLastSelectedIndex:I

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/sms/emoji/EmojiKeyboardFragment;)Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/emoji/EmojiKeyboardFragment;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mOnEmojiconBackspaceClickedListener:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;

    return-object v0
.end method

.method public static backspace(Landroid/widget/EditText;)V
    .locals 13
    .param p0, "editText"    # Landroid/widget/EditText;

    .prologue
    const-wide/16 v2, 0x0

    const/4 v6, 0x0

    .line 214
    new-instance v1, Landroid/view/KeyEvent;

    const/16 v7, 0x43

    const/4 v12, 0x6

    move-wide v4, v2

    move v8, v6

    move v9, v6

    move v10, v6

    move v11, v6

    invoke-direct/range {v1 .. v12}, Landroid/view/KeyEvent;-><init>(JJIIIIIII)V

    .line 215
    .local v1, "event":Landroid/view/KeyEvent;
    invoke-virtual {p0, v1}, Landroid/widget/EditText;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 216
    return-void
.end method

.method private changeKeyboardHeight(I)V
    .locals 1
    .param p1, "height"    # I

    .prologue
    .line 155
    const/16 v0, 0x64

    if-le p1, v0, :cond_0

    .line 156
    iput p1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->keyboardHeight:I

    .line 160
    :goto_0
    return-void

    .line 158
    :cond_0
    iget v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->popUpheight:F

    float-to-int v0, v0

    iput v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->keyboardHeight:I

    goto :goto_0
.end method

.method public static input(Landroid/widget/EditText;Lcom/pccw/sms/bean/Emojicon;)V
    .locals 8
    .param p0, "editText"    # Landroid/widget/EditText;
    .param p1, "emojicon"    # Lcom/pccw/sms/bean/Emojicon;

    .prologue
    .line 200
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 211
    :cond_0
    :goto_0
    return-void

    .line 204
    :cond_1
    invoke-virtual {p0}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v7

    .line 205
    .local v7, "start":I
    invoke-virtual {p0}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v6

    .line 206
    .local v6, "end":I
    if-gez v7, :cond_2

    .line 207
    invoke-virtual {p1}, Lcom/pccw/sms/bean/Emojicon;->getEmoji()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->append(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 209
    :cond_2
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v7, v6}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {p1}, Lcom/pccw/sms/bean/Emojicon;->getEmoji()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p1}, Lcom/pccw/sms/bean/Emojicon;->getEmoji()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-interface/range {v0 .. v5}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;II)Landroid/text/Editable;

    goto :goto_0
.end method

.method public static newInstance(I)Lcom/pccw/sms/emoji/EmojiKeyboardFragment;
    .locals 3
    .param p0, "keyboardHeight"    # I

    .prologue
    .line 42
    new-instance v1, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;

    invoke-direct {v1}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;-><init>()V

    .line 43
    .local v1, "f":Lcom/pccw/sms/emoji/EmojiKeyboardFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 44
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "keyboardHeight"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 45
    invoke-virtual {v1, v0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->setArguments(Landroid/os/Bundle;)V

    .line 47
    return-object v1
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 134
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 135
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v0, v0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;

    if-eqz v0, :cond_0

    .line 136
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;

    iput-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mOnEmojiconBackspaceClickedListener:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;

    .line 140
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v0, v0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;

    if-eqz v0, :cond_1

    .line 141
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;

    iput-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mOnKeyboardDialogDismissListener:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;

    .line 145
    return-void

    .line 138
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " must implement interface "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 143
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " must implement interface "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 102
    const/4 v0, 0x2

    const v1, 0x7f09002b

    invoke-virtual {p0, v0, v1}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->setStyle(II)V

    .line 103
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "keyboardHeight"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->keyboardHeight:I

    .line 104
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 105
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 11
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 52
    const v6, 0x7f040046

    invoke-virtual {p1, v6, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 54
    .local v4, "view":Landroid/view/View;
    const v6, 0x7f0e012e

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager;

    .line 56
    .local v2, "pager":Landroid/support/v4/view/ViewPager;
    invoke-virtual {v2, p0}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 57
    new-instance v0, Lcom/pccw/sms/emoji/EmojiPagerAdapter;

    .line 58
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v6

    const/4 v7, 0x5

    new-array v7, v7, [Lcom/pccw/sms/emoji/EmojiconGridFragment;

    const/4 v8, 0x0

    sget-object v9, Lcom/pccw/sms/emoji/type/People;->DATA:[Lcom/pccw/sms/bean/Emojicon;

    .line 59
    invoke-static {v9}, Lcom/pccw/sms/emoji/EmojiconGridFragment;->newInstance([Lcom/pccw/sms/bean/Emojicon;)Lcom/pccw/sms/emoji/EmojiconGridFragment;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    sget-object v9, Lcom/pccw/sms/emoji/type/Nature;->DATA:[Lcom/pccw/sms/bean/Emojicon;

    .line 60
    invoke-static {v9}, Lcom/pccw/sms/emoji/EmojiconGridFragment;->newInstance([Lcom/pccw/sms/bean/Emojicon;)Lcom/pccw/sms/emoji/EmojiconGridFragment;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    sget-object v9, Lcom/pccw/sms/emoji/type/Objects;->DATA:[Lcom/pccw/sms/bean/Emojicon;

    .line 61
    invoke-static {v9}, Lcom/pccw/sms/emoji/EmojiconGridFragment;->newInstance([Lcom/pccw/sms/bean/Emojicon;)Lcom/pccw/sms/emoji/EmojiconGridFragment;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x3

    sget-object v9, Lcom/pccw/sms/emoji/type/Places;->DATA:[Lcom/pccw/sms/bean/Emojicon;

    .line 62
    invoke-static {v9}, Lcom/pccw/sms/emoji/EmojiconGridFragment;->newInstance([Lcom/pccw/sms/bean/Emojicon;)Lcom/pccw/sms/emoji/EmojiconGridFragment;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x4

    sget-object v9, Lcom/pccw/sms/emoji/type/Symbols;->DATA:[Lcom/pccw/sms/bean/Emojicon;

    .line 63
    invoke-static {v9}, Lcom/pccw/sms/emoji/EmojiconGridFragment;->newInstance([Lcom/pccw/sms/bean/Emojicon;)Lcom/pccw/sms/emoji/EmojiconGridFragment;

    move-result-object v9

    aput-object v9, v7, v8

    .line 58
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v0, v6, v7}, Lcom/pccw/sms/emoji/EmojiPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    .line 64
    .local v0, "emojisAdapter":Lcom/pccw/sms/emoji/EmojiPagerAdapter;
    invoke-virtual {v2, v0}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 66
    const/4 v6, 0x5

    new-array v6, v6, [Landroid/view/View;

    iput-object v6, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabs:[Landroid/view/View;

    .line 67
    iget-object v6, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabs:[Landroid/view/View;

    const/4 v7, 0x0

    const v8, 0x7f0e0130

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    aput-object v8, v6, v7

    .line 68
    iget-object v6, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabs:[Landroid/view/View;

    const/4 v7, 0x1

    const v8, 0x7f0e0131

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    aput-object v8, v6, v7

    .line 69
    iget-object v6, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabs:[Landroid/view/View;

    const/4 v7, 0x2

    const v8, 0x7f0e0132

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    aput-object v8, v6, v7

    .line 70
    iget-object v6, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabs:[Landroid/view/View;

    const/4 v7, 0x3

    const v8, 0x7f0e0133

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    aput-object v8, v6, v7

    .line 71
    iget-object v6, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabs:[Landroid/view/View;

    const/4 v7, 0x4

    const v8, 0x7f0e0134

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    aput-object v8, v6, v7

    .line 72
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v6, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabs:[Landroid/view/View;

    array-length v6, v6

    if-ge v1, v6, :cond_0

    .line 73
    move v3, v1

    .line 74
    .local v3, "position":I
    iget-object v6, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabs:[Landroid/view/View;

    aget-object v6, v6, v1

    new-instance v7, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$1;

    invoke-direct {v7, p0, v3, v2}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$1;-><init>(Lcom/pccw/sms/emoji/EmojiKeyboardFragment;ILandroid/support/v4/view/ViewPager;)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 82
    .end local v3    # "position":I
    :cond_0
    const v6, 0x7f0e0135

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    new-instance v7, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    const/16 v8, 0x3e8

    const/16 v9, 0x32

    new-instance v10, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$2;

    invoke-direct {v10, p0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$2;-><init>(Lcom/pccw/sms/emoji/EmojiKeyboardFragment;)V

    invoke-direct {v7, v8, v9, v10}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;-><init>(IILandroid/view/View$OnClickListener;)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 92
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->onPageSelected(I)V

    .line 94
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    .line 95
    .local v5, "window":Landroid/view/Window;
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/view/Window;->requestFeature(I)Z

    .line 97
    return-object v4
.end method

.method public onDetach()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 149
    iput-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mOnEmojiconBackspaceClickedListener:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;

    .line 150
    iput-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mOnKeyboardDialogDismissListener:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;

    .line 151
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDetach()V

    .line 152
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 220
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mOnKeyboardDialogDismissListener:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;

    if-eqz v0, :cond_0

    .line 221
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mOnKeyboardDialogDismissListener:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;

    invoke-interface {v0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;->OnKeyboardDialogDismiss()V

    .line 222
    :cond_0
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 223
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "i"    # I

    .prologue
    .line 189
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "i"    # I
    .param p2, "v"    # F
    .param p3, "i2"    # I

    .prologue
    .line 164
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2
    .param p1, "i"    # I

    .prologue
    .line 168
    iget v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabLastSelectedIndex:I

    if-ne v0, p1, :cond_0

    .line 185
    :goto_0
    return-void

    .line 171
    :cond_0
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 177
    :pswitch_0
    iget v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabLastSelectedIndex:I

    if-ltz v0, :cond_1

    iget v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabLastSelectedIndex:I

    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabs:[Landroid/view/View;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 179
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabs:[Landroid/view/View;

    iget v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabLastSelectedIndex:I

    aget-object v0, v0, v1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 181
    :cond_1
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabs:[Landroid/view/View;

    aget-object v0, v0, p1

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 182
    iput p1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->mEmojiTabLastSelectedIndex:I

    goto :goto_0

    .line 171
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onStart()V
    .locals 7

    .prologue
    const/high16 v6, 0x40000

    const/high16 v5, 0x20000

    const/16 v4, 0x20

    .line 109
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onStart()V

    .line 111
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080024

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    iput v2, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->popUpheight:F

    .line 112
    iget v2, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->keyboardHeight:I

    invoke-direct {p0, v2}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->changeKeyboardHeight(I)V

    .line 114
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 115
    .local v0, "window":Landroid/view/Window;
    invoke-virtual {v0, v4, v4}, Landroid/view/Window;->setFlags(II)V

    .line 116
    invoke-virtual {v0, v6, v6}, Landroid/view/Window;->setFlags(II)V

    .line 117
    invoke-virtual {v0, v5, v5}, Landroid/view/Window;->setFlags(II)V

    .line 118
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 120
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 121
    .local v1, "windowParams":Landroid/view/WindowManager$LayoutParams;
    const/4 v2, -0x1

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 122
    iget v2, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->keyboardHeight:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 123
    const/16 v2, 0x53

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 124
    const/4 v2, 0x0

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 125
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit8 v2, v2, 0x2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 127
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 129
    const v2, 0x106000d

    invoke-virtual {v0, v2}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 130
    return-void
.end method
