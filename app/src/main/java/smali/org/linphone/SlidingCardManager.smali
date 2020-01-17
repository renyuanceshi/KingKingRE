.class public Lorg/linphone/SlidingCardManager;
.super Ljava/lang/Object;
.source "SlidingCardManager.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/SlidingCardManager$WindowAttachNotifierView;
    }
.end annotation


# static fields
.field private static final DBG:Z = false

.field static final SLIDE_DOWN_HINT_TOP_LANDSCAPE:I = 0xa0

.field static final SLIDE_UP_HINT_TOP_LANDSCAPE:I = 0x58


# instance fields
.field first:Z

.field height:I

.field private mCallCard:Lorg/linphone/CallCard;

.field private mCallEndedState:Z

.field private mCardAtTop:Z

.field private mCardPreferredX:I

.field private mCardPreferredY:I

.field private mInCallScreen:Lorg/linphone/InCallScreen;

.field private mMainFrame:Landroid/view/ViewGroup;

.field private mSlideDown:Landroid/view/ViewGroup;

.field private mSlideDownHint:Landroid/widget/TextView;

.field private mSlideInProgress:Z

.field private mSlideUp:Landroid/view/ViewGroup;

.field private mSlideUpHint:Landroid/widget/TextView;

.field private mTempLocation:[I

.field mTouchDownTime:J

.field private mTouchDownY:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/SlidingCardManager;->mSlideInProgress:Z

    .line 108
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/linphone/SlidingCardManager;->mTempLocation:[I

    .line 627
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/linphone/SlidingCardManager;->first:Z

    .line 117
    return-void
.end method

.method private abortSlide()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 607
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/SlidingCardManager;->mSlideInProgress:Z

    .line 615
    iget-object v0, p0, Lorg/linphone/SlidingCardManager;->mCallCard:Lorg/linphone/CallCard;

    iget v1, p0, Lorg/linphone/SlidingCardManager;->mCardPreferredX:I

    iget v2, p0, Lorg/linphone/SlidingCardManager;->mCardPreferredY:I

    invoke-virtual {v0, v1, v2, v3, v3}, Lorg/linphone/CallCard;->update(IIII)V

    .line 616
    return-void
.end method

.method private finishSuccessfulSlide()V
    .locals 2

    .prologue
    .line 536
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/linphone/SlidingCardManager;->mSlideInProgress:Z

    .line 549
    const/4 v0, 0x0

    .line 553
    .local v0, "phoneStateAboutToChange":Z
    iget-boolean v1, p0, Lorg/linphone/SlidingCardManager;->mCardAtTop:Z

    if-eqz v1, :cond_1

    .line 562
    const/4 v0, 0x1

    .line 588
    :goto_0
    if-nez v0, :cond_0

    .line 589
    invoke-virtual {p0}, Lorg/linphone/SlidingCardManager;->updateCardPreferredPosition()V

    .line 590
    invoke-virtual {p0}, Lorg/linphone/SlidingCardManager;->updateCardSlideHints()V

    .line 595
    iget-object v1, p0, Lorg/linphone/SlidingCardManager;->mMainFrame:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->requestLayout()V

    .line 597
    :cond_0
    return-void

    .line 573
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 625
    return-void
.end method

.method private setSlideHints(II)V
    .locals 4
    .param p1, "upHintResId"    # I
    .param p2, "downHintResId"    # I

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 337
    iget-object v3, p0, Lorg/linphone/SlidingCardManager;->mSlideUp:Landroid/view/ViewGroup;

    if-eqz p1, :cond_2

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 338
    if-eqz p1, :cond_0

    .line 339
    iget-object v0, p0, Lorg/linphone/SlidingCardManager;->mSlideUpHint:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 341
    :cond_0
    iget-object v0, p0, Lorg/linphone/SlidingCardManager;->mSlideDown:Landroid/view/ViewGroup;

    if-eqz p2, :cond_3

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 342
    if-eqz p2, :cond_1

    .line 343
    iget-object v0, p0, Lorg/linphone/SlidingCardManager;->mSlideDownHint:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 344
    :cond_1
    return-void

    :cond_2
    move v0, v2

    .line 337
    goto :goto_0

    :cond_3
    move v1, v2

    .line 341
    goto :goto_1
.end method


# virtual methods
.method clearInCallScreenReference()V
    .locals 1

    .prologue
    .line 157
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/SlidingCardManager;->mInCallScreen:Lorg/linphone/InCallScreen;

    .line 158
    return-void
.end method

.method handleCallCardTouchEvent(Landroid/view/MotionEvent;)V
    .locals 8
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 358
    iget-object v3, p0, Lorg/linphone/SlidingCardManager;->mInCallScreen:Lorg/linphone/InCallScreen;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/linphone/SlidingCardManager;->mInCallScreen:Lorg/linphone/InCallScreen;

    invoke-virtual {v3}, Lorg/linphone/InCallScreen;->isFinishing()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 416
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 365
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 370
    .local v0, "action":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    float-to-int v1, v3

    .line 371
    .local v1, "xAbsolute":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    float-to-int v2, v3

    .line 373
    .local v2, "yAbsolute":I
    invoke-virtual {p0}, Lorg/linphone/SlidingCardManager;->isSlideInProgress()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 374
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-wide v6, p0, Lorg/linphone/SlidingCardManager;->mTouchDownTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x3e8

    cmp-long v3, v4, v6

    if-lez v3, :cond_2

    .line 375
    invoke-direct {p0}, Lorg/linphone/SlidingCardManager;->abortSlide()V

    goto :goto_0

    .line 377
    :cond_2
    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 389
    :pswitch_1
    invoke-virtual {p0, v2}, Lorg/linphone/SlidingCardManager;->stopSliding(I)V

    goto :goto_0

    .line 383
    :pswitch_2
    invoke-virtual {p0, v2}, Lorg/linphone/SlidingCardManager;->updateWhileSliding(I)V

    goto :goto_0

    .line 399
    :pswitch_3
    invoke-direct {p0}, Lorg/linphone/SlidingCardManager;->abortSlide()V

    goto :goto_0

    .line 403
    :cond_3
    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 406
    :pswitch_4
    invoke-virtual {p0, v1, v2}, Lorg/linphone/SlidingCardManager;->startSliding(II)V

    goto :goto_0

    .line 377
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 403
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_4
    .end packed-switch
.end method

.method public isSlideInProgress()Z
    .locals 1

    .prologue
    .line 619
    iget-boolean v0, p0, Lorg/linphone/SlidingCardManager;->mSlideInProgress:Z

    return v0
.end method

.method public onGlobalLayout()V
    .locals 1

    .prologue
    .line 632
    iget-boolean v0, p0, Lorg/linphone/SlidingCardManager;->first:Z

    if-eqz v0, :cond_0

    .line 633
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/SlidingCardManager;->first:Z

    .line 634
    invoke-virtual {p0}, Lorg/linphone/SlidingCardManager;->showPopup()V

    .line 636
    :cond_0
    return-void
.end method

.method public showPopup()V
    .locals 0

    .prologue
    .line 170
    invoke-virtual {p0}, Lorg/linphone/SlidingCardManager;->updateCardPreferredPosition()V

    .line 172
    invoke-virtual {p0}, Lorg/linphone/SlidingCardManager;->updateCardSlideHints()V

    .line 174
    return-void
.end method

.method startSliding(II)V
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 429
    iget-boolean v0, p0, Lorg/linphone/SlidingCardManager;->mCallEndedState:Z

    if-eqz v0, :cond_0

    .line 438
    :goto_0
    return-void

    .line 435
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/linphone/SlidingCardManager;->mSlideInProgress:Z

    .line 436
    iput p2, p0, Lorg/linphone/SlidingCardManager;->mTouchDownY:I

    .line 437
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/linphone/SlidingCardManager;->mTouchDownTime:J

    goto :goto_0
.end method

.method stopSliding(I)V
    .locals 4
    .param p1, "y"    # I

    .prologue
    .line 485
    iget v2, p0, Lorg/linphone/SlidingCardManager;->mTouchDownY:I

    sub-int v1, p1, v2

    .line 496
    .local v1, "totalSlideAmount":I
    iget-object v2, p0, Lorg/linphone/SlidingCardManager;->mMainFrame:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getHeight()I

    move-result v2

    iget v3, p0, Lorg/linphone/SlidingCardManager;->height:I

    sub-int v0, v2, v3

    .line 503
    .local v0, "slideDistanceRequired":I
    add-int/lit8 v0, v0, -0x1e

    .line 509
    iget-boolean v2, p0, Lorg/linphone/SlidingCardManager;->mCardAtTop:Z

    if-nez v2, :cond_0

    .line 510
    neg-int v1, v1

    .line 512
    :cond_0
    if-lt v1, v0, :cond_1

    .line 516
    invoke-direct {p0}, Lorg/linphone/SlidingCardManager;->finishSuccessfulSlide()V

    .line 523
    :goto_0
    return-void

    .line 521
    :cond_1
    invoke-direct {p0}, Lorg/linphone/SlidingCardManager;->abortSlide()V

    goto :goto_0
.end method

.method public updateCardPreferredPosition()V
    .locals 9

    .prologue
    const/4 v5, 0x0

    const/4 v8, -0x1

    .line 200
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mMainFrame:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getWindowToken()Landroid/os/IBinder;

    move-result-object v6

    if-nez v6, :cond_0

    .line 275
    :goto_0
    return-void

    .line 206
    :cond_0
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mMainFrame:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getHeight()I

    move-result v6

    if-nez v6, :cond_1

    .line 213
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string/jumbo v6, "updateCardPreferredPosition: main frame not measured yet"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 223
    :cond_1
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mMainFrame:Landroid/view/ViewGroup;

    iget-object v7, p0, Lorg/linphone/SlidingCardManager;->mTempLocation:[I

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->getLocationInWindow([I)V

    .line 224
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mTempLocation:[I

    aget v1, v6, v5

    .line 225
    .local v1, "mainFrameX":I
    const/4 v2, 0x0

    .line 231
    .local v2, "mainFrameY":I
    const/4 v4, 0x0

    .line 235
    .local v4, "popupTopPosY":I
    iget v6, p0, Lorg/linphone/SlidingCardManager;->height:I

    if-nez v6, :cond_2

    .line 236
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mCallCard:Lorg/linphone/CallCard;

    invoke-virtual {v6}, Lorg/linphone/CallCard;->getHeight()I

    move-result v6

    iput v6, p0, Lorg/linphone/SlidingCardManager;->height:I

    .line 238
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mSlideUp:Landroid/view/ViewGroup;

    .line 239
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 241
    .local v0, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    iget v6, p0, Lorg/linphone/SlidingCardManager;->height:I

    iput v6, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 242
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mSlideUp:Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 243
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mSlideDown:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .end local v0    # "lp":Landroid/widget/RelativeLayout$LayoutParams;
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 245
    .restart local v0    # "lp":Landroid/widget/RelativeLayout$LayoutParams;
    iget v6, p0, Lorg/linphone/SlidingCardManager;->height:I

    iput v6, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 246
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mSlideDown:Landroid/view/ViewGroup;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 247
    iget v6, p0, Lorg/linphone/SlidingCardManager;->height:I

    add-int/lit8 v6, v6, 0xa

    iput v6, p0, Lorg/linphone/SlidingCardManager;->height:I

    .line 249
    .end local v0    # "lp":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_2
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mMainFrame:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getHeight()I

    move-result v6

    add-int/lit8 v6, v6, 0x0

    iget v7, p0, Lorg/linphone/SlidingCardManager;->height:I

    sub-int v3, v6, v7

    .line 266
    .local v3, "popupBottomPosY":I
    iput v1, p0, Lorg/linphone/SlidingCardManager;->mCardPreferredX:I

    .line 267
    iget-boolean v6, p0, Lorg/linphone/SlidingCardManager;->mCardAtTop:Z

    if-eqz v6, :cond_3

    move v3, v5

    .end local v3    # "popupBottomPosY":I
    :cond_3
    iput v3, p0, Lorg/linphone/SlidingCardManager;->mCardPreferredY:I

    .line 274
    iget-object v5, p0, Lorg/linphone/SlidingCardManager;->mCallCard:Lorg/linphone/CallCard;

    iget v6, p0, Lorg/linphone/SlidingCardManager;->mCardPreferredX:I

    iget v7, p0, Lorg/linphone/SlidingCardManager;->mCardPreferredY:I

    invoke-virtual {v5, v6, v7, v8, v8}, Lorg/linphone/CallCard;->update(IIII)V

    goto :goto_0
.end method

.method public updateCardSlideHints()V
    .locals 3

    .prologue
    .line 289
    iget-boolean v2, p0, Lorg/linphone/SlidingCardManager;->mSlideInProgress:Z

    if-eqz v2, :cond_0

    .line 313
    :goto_0
    return-void

    .line 305
    :cond_0
    const/4 v1, 0x0

    .line 306
    .local v1, "slideUpHint":I
    const/4 v0, 0x0

    .line 312
    .local v0, "slideDownHint":I
    invoke-direct {p0, v1, v0}, Lorg/linphone/SlidingCardManager;->setSlideHints(II)V

    goto :goto_0
.end method

.method updateWhileSliding(I)V
    .locals 9
    .param p1, "y"    # I

    .prologue
    const/4 v8, -0x1

    .line 446
    iget v6, p0, Lorg/linphone/SlidingCardManager;->mTouchDownY:I

    sub-int v5, p1, v6

    .line 454
    .local v5, "totalSlideAmount":I
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mMainFrame:Landroid/view/ViewGroup;

    iget-object v7, p0, Lorg/linphone/SlidingCardManager;->mTempLocation:[I

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->getLocationInWindow([I)V

    .line 455
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mTempLocation:[I

    const/4 v7, 0x0

    aget v0, v6, v7

    .line 456
    .local v0, "mainFrameX":I
    const/4 v1, 0x0

    .line 460
    .local v1, "mainFrameY":I
    const/4 v4, 0x0

    .line 464
    .local v4, "popupTopPosY":I
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mMainFrame:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getHeight()I

    move-result v6

    add-int/lit8 v6, v6, 0x0

    iget v7, p0, Lorg/linphone/SlidingCardManager;->height:I

    sub-int v3, v6, v7

    .line 467
    .local v3, "popupBottomPosY":I
    iget v6, p0, Lorg/linphone/SlidingCardManager;->mCardPreferredY:I

    add-int v2, v6, v5

    .line 471
    .local v2, "newCardTop":I
    if-gez v2, :cond_1

    .line 472
    const/4 v2, 0x0

    .line 477
    :cond_0
    :goto_0
    iget-object v6, p0, Lorg/linphone/SlidingCardManager;->mCallCard:Lorg/linphone/CallCard;

    iget v7, p0, Lorg/linphone/SlidingCardManager;->mCardPreferredX:I

    invoke-virtual {v6, v7, v2, v8, v8}, Lorg/linphone/CallCard;->update(IIII)V

    .line 478
    return-void

    .line 473
    :cond_1
    if-le v2, v3, :cond_0

    .line 474
    move v2, v3

    goto :goto_0
.end method
