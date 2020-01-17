.class public Lorg/linphone/ButtonGridLayoutOld;
.super Landroid/view/ViewGroup;
.source "ButtonGridLayoutOld.java"


# static fields
.field private static isMeasured:Z


# instance fields
.field private final COLUMNS:I

.field private final ROWS:I

.field private context:Landroid/content/Context;

.field private mButtonHeight:I

.field private mButtonWidth:I

.field private mHeight:I

.field private mHeightInc:I

.field private mPaddingBottom:I

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaddingTop:I

.field private mWidthInc:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x0

    sput-boolean v0, Lorg/linphone/ButtonGridLayoutOld;->isMeasured:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x6

    .line 68
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 44
    const/4 v0, 0x3

    iput v0, p0, Lorg/linphone/ButtonGridLayoutOld;->COLUMNS:I

    .line 45
    const/4 v0, 0x4

    iput v0, p0, Lorg/linphone/ButtonGridLayoutOld;->ROWS:I

    .line 53
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 54
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 55
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    .line 56
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 69
    iput-object p1, p0, Lorg/linphone/ButtonGridLayoutOld;->context:Landroid/content/Context;

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x6

    .line 73
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    const/4 v0, 0x3

    iput v0, p0, Lorg/linphone/ButtonGridLayoutOld;->COLUMNS:I

    .line 45
    const/4 v0, 0x4

    iput v0, p0, Lorg/linphone/ButtonGridLayoutOld;->ROWS:I

    .line 53
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 54
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 55
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    .line 56
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 74
    iput-object p1, p0, Lorg/linphone/ButtonGridLayoutOld;->context:Landroid/content/Context;

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v1, 0x6

    .line 78
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 44
    const/4 v0, 0x3

    iput v0, p0, Lorg/linphone/ButtonGridLayoutOld;->COLUMNS:I

    .line 45
    const/4 v0, 0x4

    iput v0, p0, Lorg/linphone/ButtonGridLayoutOld;->ROWS:I

    .line 53
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 54
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 55
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    .line 56
    iput v1, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 79
    iput-object p1, p0, Lorg/linphone/ButtonGridLayoutOld;->context:Landroid/content/Context;

    .line 80
    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .locals 8
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 92
    const/4 v2, 0x0

    .line 94
    .local v2, "i":I
    sub-int v6, p5, p3

    iget v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mHeight:I

    sub-int/2addr v6, v7

    iget v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    add-int v5, v6, v7

    .line 95
    .local v5, "y":I
    const/4 v3, 0x0

    .local v3, "row":I
    :goto_0
    const/4 v6, 0x4

    if-ge v3, v6, :cond_1

    .line 96
    iget v4, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 97
    .local v4, "x":I
    const/4 v1, 0x0

    .local v1, "col":I
    :goto_1
    const/4 v6, 0x3

    if-ge v1, v6, :cond_0

    .line 98
    invoke-virtual {p0, v2}, Lorg/linphone/ButtonGridLayoutOld;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 100
    .local v0, "child":Landroid/view/View;
    iget v6, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonWidth:I

    add-int/2addr v6, v4

    iget v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    add-int/2addr v7, v5

    invoke-virtual {v0, v4, v5, v6, v7}, Landroid/view/View;->layout(IIII)V

    .line 102
    iget v6, p0, Lorg/linphone/ButtonGridLayoutOld;->mWidthInc:I

    add-int/2addr v4, v6

    .line 103
    add-int/lit8 v2, v2, 0x1

    .line 97
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 105
    .end local v0    # "child":Landroid/view/View;
    :cond_0
    iget v6, p0, Lorg/linphone/ButtonGridLayoutOld;->mHeightInc:I

    add-int/2addr v5, v6

    .line 95
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 107
    .end local v1    # "col":I
    .end local v4    # "x":I
    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 111
    iget-object v7, p0, Lorg/linphone/ButtonGridLayoutOld;->context:Landroid/content/Context;

    const-string/jumbo v8, "window"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/WindowManager;

    .line 112
    .local v5, "mWMgr":Landroid/view/WindowManager;
    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/Display;->getWidth()I

    move-result v2

    .line 113
    .local v2, "displayWidth":I
    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/Display;->getHeight()I

    move-result v1

    .line 119
    .local v1, "displayHeight":I
    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Lorg/linphone/ButtonGridLayoutOld;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 120
    .local v0, "child":Landroid/view/View;
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Landroid/view/View;->measure(II)V

    .line 123
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_0
    invoke-virtual {p0}, Lorg/linphone/ButtonGridLayoutOld;->getChildCount()I

    move-result v7

    if-ge v4, v7, :cond_0

    .line 124
    invoke-virtual {p0, v4}, Lorg/linphone/ButtonGridLayoutOld;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/view/View;->measure(II)V

    .line 123
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 128
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonWidth:I

    .line 129
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    .line 132
    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxyTab()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 133
    const/16 v7, 0x78

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    .line 134
    const/16 v7, 0xb4

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonWidth:I

    .line 135
    const/16 v7, 0xa

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 136
    const/16 v7, 0xa

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 137
    const/16 v7, 0xa

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 138
    const/16 v7, 0xa

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    .line 204
    :goto_1
    iget v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonWidth:I

    iget v8, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    add-int/2addr v7, v8

    iget v8, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    add-int/2addr v7, v8

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mWidthInc:I

    .line 205
    iget v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    iget v8, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    add-int/2addr v7, v8

    iget v8, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    add-int/2addr v7, v8

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mHeightInc:I

    .line 206
    iget v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mHeightInc:I

    mul-int/lit8 v7, v7, 0x4

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mHeight:I

    .line 208
    iget v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mWidthInc:I

    mul-int/lit8 v7, v7, 0x3

    invoke-static {v7, p1}, Lorg/linphone/ButtonGridLayoutOld;->resolveSize(II)I

    move-result v6

    .line 209
    .local v6, "width":I
    iget v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mHeight:I

    invoke-static {v7, p2}, Lorg/linphone/ButtonGridLayoutOld;->resolveSize(II)I

    move-result v3

    .line 215
    .local v3, "height":I
    invoke-virtual {p0, v6, v3}, Lorg/linphone/ButtonGridLayoutOld;->setMeasuredDimension(II)V

    .line 216
    return-void

    .line 139
    .end local v3    # "height":I
    .end local v6    # "width":I
    :cond_1
    const/16 v7, 0x5dc

    if-lt v1, v7, :cond_2

    .line 140
    const/16 v7, 0xaf

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    .line 141
    const/16 v7, 0x12c

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonWidth:I

    .line 142
    const/16 v7, 0xe

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 143
    const/16 v7, 0xe

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 144
    const/16 v7, 0x10

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 145
    const/16 v7, 0x10

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    goto :goto_1

    .line 146
    :cond_2
    const/16 v7, 0x4b0

    if-lt v1, v7, :cond_3

    .line 147
    const/16 v7, 0x7d

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    .line 148
    const/16 v7, 0xc8

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonWidth:I

    .line 149
    const/16 v7, 0x12

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 150
    const/16 v7, 0x12

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 151
    const/16 v7, 0x14

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 152
    const/16 v7, 0x14

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    goto :goto_1

    .line 160
    :cond_3
    const/16 v7, 0x438

    if-lt v1, v7, :cond_4

    .line 161
    const/16 v7, 0x64

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    .line 162
    const/16 v7, 0xaa

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonWidth:I

    .line 163
    const/16 v7, 0xa

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 164
    const/16 v7, 0xa

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 165
    const/16 v7, 0xf

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 166
    const/16 v7, 0xf

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    goto/16 :goto_1

    .line 167
    :cond_4
    const/16 v7, 0x3c0

    if-lt v1, v7, :cond_5

    .line 168
    const/16 v7, 0x55

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    .line 169
    const/16 v7, 0xa0

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonWidth:I

    .line 170
    const/16 v7, 0x8

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 171
    const/16 v7, 0x8

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 172
    const/16 v7, 0x8

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 173
    const/16 v7, 0x8

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    goto/16 :goto_1

    .line 174
    :cond_5
    const/16 v7, 0x320

    if-lt v1, v7, :cond_6

    .line 175
    const/16 v7, 0x46

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    .line 176
    const/4 v7, 0x6

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 177
    const/4 v7, 0x6

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 178
    const/4 v7, 0x6

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 179
    const/4 v7, 0x6

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    goto/16 :goto_1

    .line 180
    :cond_6
    const/16 v7, 0x280

    if-lt v1, v7, :cond_7

    .line 181
    const/16 v7, 0x37

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    .line 182
    const/4 v7, 0x4

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 183
    const/4 v7, 0x4

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 184
    const/4 v7, 0x4

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 185
    const/4 v7, 0x4

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    goto/16 :goto_1

    .line 186
    :cond_7
    const/16 v7, 0x1e0

    if-lt v1, v7, :cond_8

    .line 187
    const/16 v7, 0x2c

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    .line 188
    const/4 v7, 0x2

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 189
    const/4 v7, 0x2

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 190
    const/4 v7, 0x2

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 191
    const/4 v7, 0x2

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    goto/16 :goto_1

    .line 193
    :cond_8
    const/16 v7, 0x1b

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mButtonHeight:I

    .line 194
    const/4 v7, 0x2

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingTop:I

    .line 195
    const/4 v7, 0x2

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingBottom:I

    .line 196
    const/4 v7, 0x2

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingLeft:I

    .line 197
    const/4 v7, 0x2

    iput v7, p0, Lorg/linphone/ButtonGridLayoutOld;->mPaddingRight:I

    goto/16 :goto_1
.end method

.method public setChildrenBackgroundResource(I)V
    .locals 3
    .param p1, "resid"    # I

    .prologue
    .line 83
    const/16 v0, 0xc

    .line 85
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v2, 0xc

    if-ge v1, v2, :cond_0

    .line 86
    invoke-virtual {p0, v1}, Lorg/linphone/ButtonGridLayoutOld;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 85
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 88
    :cond_0
    return-void
.end method
