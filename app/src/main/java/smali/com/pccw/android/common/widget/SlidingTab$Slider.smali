.class Lcom/pccw/android/common/widget/SlidingTab$Slider;
.super Ljava/lang/Object;
.source "SlidingTab.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/android/common/widget/SlidingTab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Slider"
.end annotation


# static fields
.field public static final ALIGN_BOTTOM:I = 0x3

.field public static final ALIGN_LEFT:I = 0x0

.field public static final ALIGN_RIGHT:I = 0x1

.field public static final ALIGN_TOP:I = 0x2

.field public static final ALIGN_UNKNOWN:I = 0x4

.field private static final STATE_ACTIVE:I = 0x2

.field private static final STATE_NORMAL:I = 0x0

.field private static final STATE_PRESSED:I = 0x1


# instance fields
.field private alignment:I

.field private alignment_value:I

.field private final arrow:Landroid/widget/ImageView;

.field private currentState:I

.field private final tab:Landroid/widget/ImageView;

.field private final target:Landroid/widget/ImageView;

.field private final text:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;IIII)V
    .locals 5
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "tabId"    # I
    .param p3, "barId"    # I
    .param p4, "targetId"    # I
    .param p5, "aniId"    # I

    .prologue
    const/4 v4, 0x4

    const/4 v3, -0x2

    .line 192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    const/4 v0, 0x0

    iput v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->currentState:I

    .line 181
    iput v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    .line 194
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    .line 195
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 196
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 197
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 199
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    .line 200
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    invoke-virtual {v0, p5}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 201
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 202
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 205
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    .line 206
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v3, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 207
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 208
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f090132

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 213
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    .line 214
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    invoke-virtual {v0, p4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 215
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 216
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 217
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 219
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 220
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 221
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 222
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 223
    return-void
.end method

.method static synthetic access$100(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    return-object v0
.end method


# virtual methods
.method public getTabHeight()I
    .locals 1

    .prologue
    .line 447
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v0

    return v0
.end method

.method public getTabWidth()I
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v0

    return v0
.end method

.method hide()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 253
    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    if-eqz v5, :cond_0

    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    if-ne v5, v4, :cond_1

    :cond_0
    move v2, v4

    .line 254
    .local v2, "horiz":Z
    :goto_0
    if-eqz v2, :cond_3

    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    if-nez v5, :cond_2

    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/widget/ImageView;->getRight()I

    move-result v6

    sub-int v0, v5, v6

    .line 256
    .local v0, "dx":I
    :goto_1
    if-eqz v2, :cond_4

    .line 259
    .local v1, "dy":I
    :goto_2
    new-instance v3, Landroid/view/animation/TranslateAnimation;

    int-to-float v5, v0

    int-to-float v6, v1

    invoke-direct {v3, v7, v5, v7, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 260
    .local v3, "trans":Landroid/view/animation/Animation;
    const-wide/16 v6, 0xfa

    invoke-virtual {v3, v6, v7}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 261
    invoke-virtual {v3, v4}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 262
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 263
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 264
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 265
    return-void

    .end local v0    # "dx":I
    .end local v1    # "dy":I
    .end local v2    # "horiz":Z
    .end local v3    # "trans":Landroid/view/animation/Animation;
    :cond_1
    move v2, v1

    .line 253
    goto :goto_0

    .line 254
    .restart local v2    # "horiz":Z
    :cond_2
    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    .line 255
    invoke-virtual {v6}, Landroid/widget/ImageView;->getLeft()I

    move-result v6

    sub-int v0, v5, v6

    goto :goto_1

    :cond_3
    move v0, v1

    goto :goto_1

    .line 256
    .restart local v0    # "dx":I
    :cond_4
    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_5

    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/widget/ImageView;->getBottom()I

    move-result v6

    sub-int v1, v5, v6

    goto :goto_2

    :cond_5
    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    .line 257
    invoke-virtual {v6}, Landroid/widget/ImageView;->getTop()I

    move-result v6

    sub-int v1, v5, v6

    goto :goto_2
.end method

.method public hideTarget()V
    .locals 2

    .prologue
    .line 464
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 465
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 466
    return-void
.end method

.method layout(IIIII)V
    .locals 28
    .param p1, "l"    # I
    .param p2, "t"    # I
    .param p3, "r"    # I
    .param p4, "b"    # I
    .param p5, "alignment"    # I

    .prologue
    .line 360
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    .line 361
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v16

    .line 362
    .local v16, "tabBackground":Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 363
    .local v5, "arrowBackground":Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v9

    .line 364
    .local v9, "handleWidth":I
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    .line 365
    .local v6, "arrowWidth":I
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    .line 366
    .local v8, "handleHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v18

    .line 367
    .local v18, "targetDrawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {v18 .. v18}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v23

    .line 368
    .local v23, "targetWidth":I
    invoke-virtual/range {v18 .. v18}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v19

    .line 369
    .local v19, "targetHeight":I
    sub-int v13, p3, p1

    .line 370
    .local v13, "parentWidth":I
    sub-int v12, p4, p2

    .line 372
    .local v12, "parentHeight":I
    const v25, 0x3f2aaaab

    int-to-float v0, v13

    move/from16 v26, v0

    mul-float v25, v25, v26

    move/from16 v0, v25

    float-to-int v0, v0

    move/from16 v25, v0

    sub-int v25, v25, v23

    div-int/lit8 v26, v9, 0x2

    add-int v11, v25, v26

    .line 373
    .local v11, "leftTarget":I
    const v25, 0x3eaaaaaa

    int-to-float v0, v13

    move/from16 v26, v0

    mul-float v25, v25, v26

    move/from16 v0, v25

    float-to-int v0, v0

    move/from16 v25, v0

    div-int/lit8 v26, v9, 0x2

    sub-int v15, v25, v26

    .line 374
    .local v15, "rightTarget":I
    sub-int v25, v13, v9

    div-int/lit8 v10, v25, 0x2

    .line 375
    .local v10, "left":I
    add-int v14, v10, v9

    .line 376
    .local v14, "right":I
    if-eqz p5, :cond_0

    const/16 v25, 0x1

    move/from16 v0, p5

    move/from16 v1, v25

    if-ne v0, v1, :cond_2

    .line 378
    :cond_0
    sub-int v25, v12, v19

    div-int/lit8 v22, v25, 0x2

    .line 379
    .local v22, "targetTop":I
    add-int v17, v22, v19

    .line 380
    .local v17, "targetBottom":I
    sub-int v25, v12, v8

    div-int/lit8 v24, v25, 0x2

    .line 381
    .local v24, "top":I
    add-int v25, v12, v8

    div-int/lit8 v7, v25, 0x2

    .line 382
    .local v7, "bottom":I
    if-nez p5, :cond_1

    .line 383
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    move-object/from16 v0, v25

    move/from16 v1, v26

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2, v9, v7}, Landroid/widget/ImageView;->layout(IIII)V

    .line 384
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    add-int v26, v6, v9

    move-object/from16 v0, v25

    move/from16 v1, v24

    move/from16 v2, v26

    invoke-virtual {v0, v9, v1, v2, v7}, Landroid/widget/ImageView;->layout(IIII)V

    .line 387
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    add-int v26, v11, v23

    move-object/from16 v0, v25

    move/from16 v1, v22

    move/from16 v2, v26

    move/from16 v3, v17

    invoke-virtual {v0, v11, v1, v2, v3}, Landroid/widget/ImageView;->layout(IIII)V

    .line 388
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    .line 415
    .end local v17    # "targetBottom":I
    .end local v22    # "targetTop":I
    :goto_0
    return-void

    .line 390
    .restart local v17    # "targetBottom":I
    .restart local v22    # "targetTop":I
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    sub-int v26, v13, v9

    move-object/from16 v0, v25

    move/from16 v1, v26

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2, v13, v7}, Landroid/widget/ImageView;->layout(IIII)V

    .line 391
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    sub-int v26, v13, v9

    sub-int v26, v26, v6

    sub-int v27, v13, v9

    move-object/from16 v0, v25

    move/from16 v1, v26

    move/from16 v2, v24

    move/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3, v7}, Landroid/widget/ImageView;->layout(IIII)V

    .line 394
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    add-int v26, v15, v23

    move-object/from16 v0, v25

    move/from16 v1, v22

    move/from16 v2, v26

    move/from16 v3, v17

    invoke-virtual {v0, v15, v1, v2, v3}, Landroid/widget/ImageView;->layout(IIII)V

    .line 395
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    goto :goto_0

    .line 399
    .end local v7    # "bottom":I
    .end local v17    # "targetBottom":I
    .end local v22    # "targetTop":I
    .end local v24    # "top":I
    :cond_2
    sub-int v25, v13, v23

    div-int/lit8 v20, v25, 0x2

    .line 400
    .local v20, "targetLeft":I
    add-int v25, v13, v23

    div-int/lit8 v21, v25, 0x2

    .line 401
    .local v21, "targetRight":I
    const v25, 0x3f2aaaab

    int-to-float v0, v12

    move/from16 v26, v0

    mul-float v25, v25, v26

    move/from16 v0, v25

    float-to-int v0, v0

    move/from16 v25, v0

    div-int/lit8 v26, v8, 0x2

    add-int v25, v25, v26

    sub-int v24, v25, v19

    .line 402
    .restart local v24    # "top":I
    const v25, 0x3eaaaaaa

    int-to-float v0, v12

    move/from16 v26, v0

    mul-float v25, v25, v26

    move/from16 v0, v25

    float-to-int v0, v0

    move/from16 v25, v0

    div-int/lit8 v26, v8, 0x2

    sub-int v7, v25, v26

    .line 403
    .restart local v7    # "bottom":I
    const/16 v25, 0x2

    move/from16 v0, p5

    move/from16 v1, v25

    if-ne v0, v1, :cond_3

    .line 404
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v0, v10, v1, v14, v8}, Landroid/widget/ImageView;->layout(IIII)V

    .line 405
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    move-object/from16 v25, v0

    rsub-int/lit8 v26, v12, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v10, v1, v14, v2}, Landroid/widget/TextView;->layout(IIII)V

    .line 406
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    add-int v26, v24, v19

    move-object/from16 v0, v25

    move/from16 v1, v20

    move/from16 v2, v24

    move/from16 v3, v21

    move/from16 v4, v26

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/ImageView;->layout(IIII)V

    .line 407
    move/from16 v0, p2

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    goto/16 :goto_0

    .line 409
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    sub-int v26, v12, v8

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v0, v10, v1, v14, v12}, Landroid/widget/ImageView;->layout(IIII)V

    .line 410
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    move-object/from16 v25, v0

    add-int v26, v12, v12

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v0, v10, v12, v14, v1}, Landroid/widget/TextView;->layout(IIII)V

    .line 411
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    add-int v26, v7, v19

    move-object/from16 v0, v25

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v26

    invoke-virtual {v0, v1, v7, v2, v3}, Landroid/widget/ImageView;->layout(IIII)V

    .line 412
    move/from16 v0, p4

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    goto/16 :goto_0
.end method

.method public measure()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 425
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->measure(II)V

    .line 426
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->measure(II)V

    .line 427
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->measure(II)V

    .line 428
    return-void
.end method

.method reset(Z)V
    .locals 9
    .param p1, "animate"    # Z

    .prologue
    const/4 v2, 0x1

    const/4 v8, 0x0

    const/4 v4, 0x0

    .line 316
    invoke-virtual {p0, v4}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setState(I)V

    .line 317
    iget-object v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 318
    iget-object v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f090132

    invoke-virtual {v5, v6, v7}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 319
    iget-object v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 320
    iget-object v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 321
    iget-object v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 322
    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    if-eqz v5, :cond_0

    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    if-ne v5, v2, :cond_1

    .line 323
    .local v2, "horiz":Z
    :cond_0
    :goto_0
    if-eqz v2, :cond_3

    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    if-nez v5, :cond_2

    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/widget/ImageView;->getLeft()I

    move-result v6

    sub-int v0, v5, v6

    .line 324
    .local v0, "dx":I
    :goto_1
    if-eqz v2, :cond_4

    move v1, v4

    .line 325
    .local v1, "dy":I
    :goto_2
    if-eqz p1, :cond_6

    .line 326
    new-instance v3, Landroid/view/animation/TranslateAnimation;

    int-to-float v5, v0

    int-to-float v6, v1

    invoke-direct {v3, v8, v5, v8, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 327
    .local v3, "trans":Landroid/view/animation/TranslateAnimation;
    const-wide/16 v6, 0xfa

    invoke-virtual {v3, v6, v7}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 328
    invoke-virtual {v3, v4}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    .line 329
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 330
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 343
    .end local v3    # "trans":Landroid/view/animation/TranslateAnimation;
    :goto_3
    return-void

    .end local v0    # "dx":I
    .end local v1    # "dy":I
    .end local v2    # "horiz":Z
    :cond_1
    move v2, v4

    .line 322
    goto :goto_0

    .line 323
    .restart local v2    # "horiz":Z
    :cond_2
    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/widget/ImageView;->getRight()I

    move-result v6

    sub-int v0, v5, v6

    goto :goto_1

    :cond_3
    move v0, v4

    goto :goto_1

    .line 324
    .restart local v0    # "dx":I
    :cond_4
    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_5

    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/widget/ImageView;->getTop()I

    move-result v6

    sub-int v1, v5, v6

    goto :goto_2

    :cond_5
    iget v5, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment_value:I

    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/widget/ImageView;->getBottom()I

    move-result v6

    sub-int v1, v5, v6

    goto :goto_2

    .line 332
    .restart local v1    # "dy":I
    :cond_6
    if-eqz v2, :cond_7

    .line 333
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->offsetLeftAndRight(I)V

    .line 334
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->offsetLeftAndRight(I)V

    .line 339
    :goto_4
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->clearAnimation()V

    .line 340
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->clearAnimation()V

    .line 341
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->clearAnimation()V

    goto :goto_3

    .line 336
    :cond_7
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->offsetTopAndBottom(I)V

    .line 337
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->offsetTopAndBottom(I)V

    goto :goto_4
.end method

.method setAnimationResource(I)V
    .locals 1
    .param p1, "aniId"    # I

    .prologue
    .line 234
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 236
    const v0, 0x7f020061

    if-ne p1, v0, :cond_1

    .line 237
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    sput-object v0, Lcom/pccw/android/common/widget/SlidingTab;->btnAcceptCallAnimation:Landroid/graphics/drawable/AnimationDrawable;

    .line 242
    :cond_0
    :goto_0
    return-void

    .line 238
    :cond_1
    const v0, 0x7f02007c

    if-ne p1, v0, :cond_2

    .line 239
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    sput-object v0, Lcom/pccw/android/common/widget/SlidingTab;->btnRejectCallAnimation:Landroid/graphics/drawable/AnimationDrawable;

    goto :goto_0

    .line 240
    :cond_2
    const v0, 0x7f020062

    if-ne p1, v0, :cond_0

    .line 241
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    sput-object v0, Lcom/pccw/android/common/widget/SlidingTab;->btnAcceptVideoAnimation:Landroid/graphics/drawable/AnimationDrawable;

    goto :goto_0
.end method

.method setBarBackgroundResource(I)V
    .locals 1
    .param p1, "barId"    # I

    .prologue
    .line 245
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 246
    return-void
.end method

.method setHintText(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 249
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 250
    return-void
.end method

.method setIcon(I)V
    .locals 1
    .param p1, "iconId"    # I

    .prologue
    .line 226
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 227
    return-void
.end method

.method setState(I)V
    .locals 5
    .param p1, "state"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 286
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    if-ne p1, v2, :cond_2

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setPressed(Z)V

    .line 287
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    if-ne p1, v2, :cond_3

    move v1, v2

    :goto_1
    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setPressed(Z)V

    .line 288
    const/4 v1, 0x2

    if-ne p1, v1, :cond_4

    .line 292
    new-array v0, v2, [I

    const v1, 0x10100a2

    aput v1, v0, v3

    .line 295
    .local v0, "activeState":[I
    iget-object v1, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 296
    iget-object v1, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 298
    :cond_0
    iget-object v1, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 299
    iget-object v1, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 301
    :cond_1
    iget-object v1, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090131

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 305
    .end local v0    # "activeState":[I
    :goto_2
    iput p1, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->currentState:I

    .line 306
    return-void

    :cond_2
    move v1, v3

    .line 286
    goto :goto_0

    :cond_3
    move v1, v3

    .line 287
    goto :goto_1

    .line 303
    :cond_4
    iget-object v1, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090132

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    goto :goto_2
.end method

.method setTabBackgroundResource(I)V
    .locals 1
    .param p1, "tabId"    # I

    .prologue
    .line 230
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 231
    return-void
.end method

.method setTarget(I)V
    .locals 1
    .param p1, "targetId"    # I

    .prologue
    .line 346
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 347
    return-void
.end method

.method show(Z)V
    .locals 7
    .param p1, "animate"    # Z

    .prologue
    const/4 v2, 0x1

    const/4 v6, 0x0

    const/4 v1, 0x0

    .line 268
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 269
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 270
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 272
    if-eqz p1, :cond_1

    .line 273
    iget v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    if-eqz v4, :cond_0

    iget v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    if-ne v4, v2, :cond_2

    .line 274
    .local v2, "horiz":Z
    :cond_0
    :goto_0
    if-eqz v2, :cond_4

    iget v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    if-nez v4, :cond_3

    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    .line 275
    .local v0, "dx":I
    :goto_1
    if-eqz v2, :cond_5

    .line 277
    .local v1, "dy":I
    :goto_2
    new-instance v3, Landroid/view/animation/TranslateAnimation;

    neg-int v4, v0

    int-to-float v4, v4

    neg-int v5, v1

    int-to-float v5, v5

    invoke-direct {v3, v4, v6, v5, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 278
    .local v3, "trans":Landroid/view/animation/Animation;
    const-wide/16 v4, 0xfa

    invoke-virtual {v3, v4, v5}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 279
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 280
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->arrow:Landroid/widget/ImageView;

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 281
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 283
    .end local v0    # "dx":I
    .end local v1    # "dy":I
    .end local v2    # "horiz":Z
    .end local v3    # "trans":Landroid/view/animation/Animation;
    :cond_1
    return-void

    :cond_2
    move v2, v1

    .line 273
    goto :goto_0

    .line 274
    .restart local v2    # "horiz":Z
    :cond_3
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getWidth()I

    move-result v4

    neg-int v0, v4

    goto :goto_1

    :cond_4
    move v0, v1

    goto :goto_1

    .line 275
    .restart local v0    # "dx":I
    :cond_5
    iget v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->alignment:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_6

    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getHeight()I

    move-result v1

    goto :goto_2

    :cond_6
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getHeight()I

    move-result v4

    neg-int v1, v4

    goto :goto_2
.end method

.method showTarget()V
    .locals 4

    .prologue
    .line 309
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 310
    .local v0, "alphaAnim":Landroid/view/animation/AlphaAnimation;
    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 311
    iget-object v1, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 312
    iget-object v1, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->target:Landroid/widget/ImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 313
    return-void
.end method

.method public startAnimation(Landroid/view/animation/Animation;Landroid/view/animation/Animation;)V
    .locals 1
    .param p1, "anim1"    # Landroid/view/animation/Animation;
    .param p2, "anim2"    # Landroid/view/animation/Animation;

    .prologue
    .line 459
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->tab:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 460
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->text:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 461
    return-void
.end method

.method public updateDrawableStates()V
    .locals 1

    .prologue
    .line 418
    iget v0, p0, Lcom/pccw/android/common/widget/SlidingTab$Slider;->currentState:I

    invoke-virtual {p0, v0}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setState(I)V

    .line 419
    return-void
.end method
