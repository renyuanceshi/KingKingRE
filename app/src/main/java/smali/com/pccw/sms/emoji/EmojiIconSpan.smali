.class public Lcom/pccw/sms/emoji/EmojiIconSpan;
.super Landroid/text/style/DynamicDrawableSpan;
.source "EmojiIconSpan.java"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private final mResourceId:I

.field private final mSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resourceId"    # I
    .param p3, "size"    # I

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/text/style/DynamicDrawableSpan;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/pccw/sms/emoji/EmojiIconSpan;->mContext:Landroid/content/Context;

    .line 17
    iput p2, p0, Lcom/pccw/sms/emoji/EmojiIconSpan;->mResourceId:I

    .line 18
    iput p3, p0, Lcom/pccw/sms/emoji/EmojiIconSpan;->mSize:I

    .line 19
    return-void
.end method


# virtual methods
.method public getDrawable()Landroid/graphics/drawable/Drawable;
    .locals 4

    .prologue
    .line 23
    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiIconSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_0

    .line 25
    :try_start_0
    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiIconSpan;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Lcom/pccw/sms/emoji/EmojiIconSpan;->mResourceId:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/sms/emoji/EmojiIconSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 26
    iget v0, p0, Lcom/pccw/sms/emoji/EmojiIconSpan;->mSize:I

    .line 27
    .local v0, "size":I
    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiIconSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .end local v0    # "size":I
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiIconSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-object v1

    .line 28
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public getVerticalAlignment()I
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x1

    return v0
.end method
