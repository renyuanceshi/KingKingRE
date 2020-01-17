.class public Lcom/pccw/sms/emoji/EmojiTextView;
.super Landroid/widget/TextView;
.source "EmojiTextView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;
    }
.end annotation


# instance fields
.field private mEmojiconSize:I

.field private originalText:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 26
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/pccw/sms/emoji/EmojiTextView;->init(Landroid/util/AttributeSet;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    invoke-direct {p0, p2}, Lcom/pccw/sms/emoji/EmojiTextView;->init(Landroid/util/AttributeSet;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    invoke-direct {p0, p2}, Lcom/pccw/sms/emoji/EmojiTextView;->init(Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method private init(Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 40
    if-nez p1, :cond_0

    .line 41
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiTextView;->getTextSize()F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/pccw/sms/emoji/EmojiTextView;->mEmojiconSize:I

    .line 49
    :goto_0
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/pccw/sms/emoji/EmojiTextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    return-void

    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/pccw/mobile/sip02/R$styleable;->Emojicon:[I

    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 45
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    .line 46
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiTextView;->getLineHeight()I

    move-result v2

    const/4 v3, 0x6

    invoke-static {v3}, Lcom/pccw/sms/bean/SMSConstants;->dpToPx(I)I

    move-result v3

    add-int/2addr v2, v3

    int-to-float v2, v2

    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/pccw/sms/emoji/EmojiTextView;->mEmojiconSize:I

    .line 47
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_0
.end method


# virtual methods
.method public getText()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiTextView;->originalText:Ljava/lang/CharSequence;

    if-nez v0, :cond_0

    .line 80
    invoke-super {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 82
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiTextView;->originalText:Ljava/lang/CharSequence;

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 65
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    .line 66
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiTextView;->getEllipsize()Landroid/text/TextUtils$TruncateAt;

    move-result-object v3

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    if-ne v3, v4, :cond_0

    .line 67
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiTextView;->getLayout()Landroid/text/Layout;

    move-result-object v1

    .line 68
    .local v1, "layout":Landroid/text/Layout;
    invoke-virtual {v1}, Landroid/text/Layout;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    .line 69
    .local v2, "text":Ljava/lang/CharSequence;
    invoke-virtual {v1}, Landroid/text/Layout;->getPaint()Landroid/text/TextPaint;

    move-result-object v3

    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiTextView;->getMeasuredWidth()I

    move-result v4

    int-to-float v4, v4

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v2, v3, v4, v5}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 70
    .local v0, "ellipsizedText":Ljava/lang/CharSequence;
    invoke-virtual {p0, v0}, Lcom/pccw/sms/emoji/EmojiTextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    iput-object v0, p0, Lcom/pccw/sms/emoji/EmojiTextView;->originalText:Ljava/lang/CharSequence;

    .line 72
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiTextView;->requestLayout()V

    .line 73
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiTextView;->invalidate()V

    .line 76
    .end local v0    # "ellipsizedText":Ljava/lang/CharSequence;
    .end local v1    # "layout":Landroid/text/Layout;
    .end local v2    # "text":Ljava/lang/CharSequence;
    :cond_0
    return-void
.end method

.method public setEmojiconSize(I)V
    .locals 0
    .param p1, "pixels"    # I

    .prologue
    .line 60
    iput p1, p0, Lcom/pccw/sms/emoji/EmojiTextView;->mEmojiconSize:I

    .line 61
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "type"    # Landroid/widget/TextView$BufferType;

    .prologue
    .line 54
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 55
    .local v0, "builder":Landroid/text/SpannableStringBuilder;
    invoke-virtual {p0}, Lcom/pccw/sms/emoji/EmojiTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/pccw/sms/emoji/EmojiTextView;->mEmojiconSize:I

    invoke-static {v1, v0, v2}, Lcom/pccw/sms/emoji/EmojiconHandler;->addEmojis(Landroid/content/Context;Landroid/text/Spannable;I)V

    .line 56
    invoke-super {p0, v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 57
    return-void
.end method
