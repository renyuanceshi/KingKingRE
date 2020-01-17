.class public Lcom/pccw/sms/emoji/EmojiEditText;
.super Landroid/widget/EditText;
.source "EmojiEditText.java"


# instance fields
.field private mEmojiconSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 18
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiEditText;->getLineHeight()I

    move-result v0

    iput v0, p0, Lcom/pccw/sms/emoji/EmojiEditText;->mEmojiconSize:I

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    invoke-direct {p0, p2}, Lcom/pccw/sms/emoji/EmojiEditText;->init(Landroid/util/AttributeSet;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    invoke-direct {p0, p2}, Lcom/pccw/sms/emoji/EmojiEditText;->init(Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method

.method private init(Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 33
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiEditText;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/pccw/mobile/sip02/R$styleable;->Emojicon:[I

    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 34
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiEditText;->getLineHeight()I

    move-result v2

    const/4 v3, 0x3

    invoke-static {v3}, Lcom/pccw/sms/bean/SMSConstants;->dpToPx(I)I

    move-result v3

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/pccw/sms/emoji/EmojiEditText;->mEmojiconSize:I

    .line 35
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 36
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/pccw/sms/emoji/EmojiEditText;->setText(Ljava/lang/CharSequence;)V

    .line 37
    return-void
.end method


# virtual methods
.method protected onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "lengthBefore"    # I
    .param p4, "lengthAfter"    # I

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiEditText;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    iget v2, p0, Lcom/pccw/sms/emoji/EmojiEditText;->mEmojiconSize:I

    invoke-static {v0, v1, v2}, Lcom/pccw/sms/emoji/EmojiconHandler;->addEmojis(Landroid/content/Context;Landroid/text/Spannable;I)V

    .line 42
    return-void
.end method

.method public setEmojiconSize(I)V
    .locals 0
    .param p1, "pixels"    # I

    .prologue
    .line 45
    iput p1, p0, Lcom/pccw/sms/emoji/EmojiEditText;->mEmojiconSize:I

    .line 46
    return-void
.end method
