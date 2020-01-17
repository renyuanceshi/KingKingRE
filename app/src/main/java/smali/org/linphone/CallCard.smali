.class public Lorg/linphone/CallCard;
.super Landroid/widget/FrameLayout;
.source "CallCard.java"

# interfaces
.implements Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;
.implements Lorg/linphone/ContactsAsyncHelper$OnImageLoadCompleteListener;


# static fields
.field static final CALLCARD_SIDE_MARGIN_LANDSCAPE:I = 0x32

.field private static final DBG:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "PCCW_MOBILE_SIP"

.field static final MAIN_CALLCARD_MIN_HEIGHT_LANDSCAPE:I = 0xc8

.field static final TITLE_TEXT_SIZE_LANDSCAPE:F = 22.0f


# instance fields
.field private callWaitingCallCard:Landroid/view/ViewGroup;

.field public mElapsedTime:Landroid/widget/Chronometer;

.field public mElapsedTimeCallWaitingMain:Landroid/widget/Chronometer;

.field private mLabel:Landroid/widget/TextView;

.field private mLabelCallWaitingMain:Landroid/widget/TextView;

.field private mLowerTitle:Landroid/widget/TextView;

.field private mMainCallCard:Landroid/view/ViewGroup;

.field public mName:Landroid/widget/TextView;

.field public mNameCallWaitingMain:Landroid/widget/TextView;

.field public mPhoneNumber:Landroid/widget/TextView;

.field public mPhoneNumberCallWaitingMain:Landroid/widget/TextView;

.field public mPhoto:Landroid/widget/ImageView;

.field public mPhotoCallWaitingMain:Landroid/widget/ImageView;

.field private mPhotoTracker:Lorg/linphone/ContactsAsyncHelper$ImageTracker;

.field private mQualityIndiImage:Landroid/widget/ImageView;

.field private mQualityIndiLabel:Landroid/widget/TextView;

.field private mQualityIndiLayout:Landroid/widget/RelativeLayout;

.field private mQualityIndiStatus:Landroid/widget/TextView;

.field private mSlidingCardManager:Lorg/linphone/SlidingCardManager;

.field private mTextColorConnected:I

.field private mTextColorDialing:I

.field private mTextColorEnded:I

.field private mTextColorOnHold:I

.field private mUpperTitle:Landroid/widget/TextView;

.field public mVideoIcon:Landroid/widget/ImageView;

.field private singleCallCard:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 121
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 132
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 133
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v1, 0x7f04002d

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 138
    new-instance v1, Lorg/linphone/ContactsAsyncHelper$ImageTracker;

    invoke-direct {v1}, Lorg/linphone/ContactsAsyncHelper$ImageTracker;-><init>()V

    iput-object v1, p0, Lorg/linphone/CallCard;->mPhotoTracker:Lorg/linphone/ContactsAsyncHelper$ImageTracker;

    .line 140
    return-void
.end method

.method private getTitleForCallCard(Lorg/linphone/core/LinphoneCall$State;)Ljava/lang/String;
    .locals 5
    .param p1, "state"    # Lorg/linphone/core/LinphoneCall$State;

    .prologue
    const v4, 0x7f070082

    const v3, 0x7f070080

    .line 398
    const/4 v1, 0x0

    .line 399
    .local v1, "retVal":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 404
    .local v0, "context":Landroid/content/Context;
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v2, :cond_0

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v2, :cond_0

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->OutgoingRinging:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v2, :cond_0

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v2, :cond_2

    .line 408
    :cond_0
    const v2, 0x7f070081

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 430
    :cond_1
    :goto_0
    return-object v1

    .line 409
    :cond_2
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v2, :cond_3

    .line 410
    const v2, 0x7f070083

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 411
    :cond_3
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Connected:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v2, :cond_4

    .line 412
    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 413
    :cond_4
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Error:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v2, :cond_5

    .line 414
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 415
    :cond_5
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->CallEnd:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v2, :cond_6

    .line 416
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 417
    :cond_6
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v2, :cond_7

    .line 418
    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 419
    :cond_7
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v2, :cond_8

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->PausedByRemote:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v2, :cond_8

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Pausing:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v2, :cond_9

    .line 423
    :cond_8
    const v2, 0x7f070084

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 424
    :cond_9
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Resuming:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v2, :cond_1

    .line 425
    const v2, 0x7f070085

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 679
    return-void
.end method

.method private setMainCallCardBackgroundResource(I)V
    .locals 1
    .param p1, "resid"    # I

    .prologue
    .line 634
    iget-object v0, p0, Lorg/linphone/CallCard;->mMainCallCard:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 635
    return-void
.end method

.method private setSideMargins(Landroid/view/ViewGroup;I)V
    .locals 1
    .param p1, "vg"    # Landroid/view/ViewGroup;
    .param p2, "margin"    # I

    .prologue
    .line 667
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 669
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 670
    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 671
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 672
    return-void
.end method

.method private static final showCachedImage(Landroid/widget/ImageView;Lorg/linphone/CallerInfo;)Z
    .locals 1
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "ci"    # Lorg/linphone/CallerInfo;

    .prologue
    .line 586
    if-eqz p1, :cond_1

    iget-boolean v0, p1, Lorg/linphone/CallerInfo;->isCachedPhotoCurrent:Z

    if-eqz v0, :cond_1

    .line 587
    iget-object v0, p1, Lorg/linphone/CallerInfo;->cachedPhoto:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 588
    iget-object v0, p1, Lorg/linphone/CallerInfo;->cachedPhoto:Landroid/graphics/drawable/Drawable;

    invoke-static {p0, v0}, Lorg/linphone/CallCard;->showImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 592
    :goto_0
    const/4 v0, 0x1

    .line 594
    :goto_1
    return v0

    .line 590
    :cond_0
    const v0, 0x7f0200ce

    invoke-static {p0, v0}, Lorg/linphone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    goto :goto_0

    .line 594
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private showCallConnected()V
    .locals 0

    .prologue
    .line 449
    return-void
.end method

.method private showCallConnecting()V
    .locals 0

    .prologue
    .line 437
    return-void
.end method

.method private showCallEnded()V
    .locals 0

    .prologue
    .line 455
    return-void
.end method

.method private showCallIncoming()V
    .locals 0

    .prologue
    .line 443
    return-void
.end method

.method private showCallOnhold()V
    .locals 0

    .prologue
    .line 461
    return-void
.end method

.method private static final showImage(Landroid/widget/ImageView;I)V
    .locals 1
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "resource"    # I

    .prologue
    .line 602
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 603
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 604
    return-void
.end method

.method private static final showImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 611
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 612
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 613
    return-void
.end method

.method private updateCallWaitingMainCardTitleWidgets(Lorg/linphone/core/LinphoneCall$State;I)V
    .locals 6
    .param p1, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p2, "callDuration"    # I

    .prologue
    const/16 v1, 0x8

    .line 365
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_1

    .line 366
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTimeCallWaitingMain:Landroid/widget/Chronometer;

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setVisibility(I)V

    .line 389
    :cond_0
    :goto_0
    return-void

    .line 367
    :cond_1
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_2

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->Connected:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_2

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->Resuming:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_2

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_2

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->PausedByRemote:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_2

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->Pausing:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_3

    .line 375
    :cond_2
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTimeCallWaitingMain:Landroid/widget/Chronometer;

    iget v1, p0, Lorg/linphone/CallCard;->mTextColorOnHold:I

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setTextColor(I)V

    .line 376
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTimeCallWaitingMain:Landroid/widget/Chronometer;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    mul-int/lit16 v1, p2, 0x3e8

    int-to-long v4, v1

    sub-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Landroid/widget/Chronometer;->setBase(J)V

    .line 377
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTimeCallWaitingMain:Landroid/widget/Chronometer;

    invoke-virtual {v0}, Landroid/widget/Chronometer;->start()V

    .line 378
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTimeCallWaitingMain:Landroid/widget/Chronometer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setVisibility(I)V

    goto :goto_0

    .line 379
    :cond_3
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_4

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_4

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingProgress:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_4

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingRinging:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_5

    .line 384
    :cond_4
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTimeCallWaitingMain:Landroid/widget/Chronometer;

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setVisibility(I)V

    goto :goto_0

    .line 385
    :cond_5
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->CallEnd:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_6

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->Error:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_0

    .line 386
    :cond_6
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTimeCallWaitingMain:Landroid/widget/Chronometer;

    iget v1, p0, Lorg/linphone/CallCard;->mTextColorEnded:I

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setTextColor(I)V

    .line 387
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTimeCallWaitingMain:Landroid/widget/Chronometer;

    invoke-virtual {v0}, Landroid/widget/Chronometer;->stop()V

    goto :goto_0
.end method

.method private updateMainCardTitleWidgets(Lorg/linphone/core/LinphoneCall$State;I)V
    .locals 6
    .param p1, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p2, "callDuration"    # I

    .prologue
    const/16 v1, 0x8

    .line 333
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_1

    .line 334
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTime:Landroid/widget/Chronometer;

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setVisibility(I)V

    .line 351
    :cond_0
    :goto_0
    return-void

    .line 335
    :cond_1
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_2

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->Connected:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_3

    .line 337
    :cond_2
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTime:Landroid/widget/Chronometer;

    iget v1, p0, Lorg/linphone/CallCard;->mTextColorConnected:I

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setTextColor(I)V

    .line 338
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTime:Landroid/widget/Chronometer;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    mul-int/lit16 v1, p2, 0x3e8

    int-to-long v4, v1

    sub-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Landroid/widget/Chronometer;->setBase(J)V

    .line 339
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTime:Landroid/widget/Chronometer;

    invoke-virtual {v0}, Landroid/widget/Chronometer;->start()V

    .line 340
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTime:Landroid/widget/Chronometer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setVisibility(I)V

    goto :goto_0

    .line 341
    :cond_3
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_4

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_4

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingProgress:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_4

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingRinging:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_5

    .line 346
    :cond_4
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTime:Landroid/widget/Chronometer;

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setVisibility(I)V

    goto :goto_0

    .line 347
    :cond_5
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->CallEnd:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_6

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->Error:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_0

    .line 348
    :cond_6
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTime:Landroid/widget/Chronometer;

    iget v1, p0, Lorg/linphone/CallCard;->mTextColorEnded:I

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setTextColor(I)V

    .line 349
    iget-object v0, p0, Lorg/linphone/CallCard;->mElapsedTime:Landroid/widget/Chronometer;

    invoke-virtual {v0}, Landroid/widget/Chronometer;->stop()V

    goto :goto_0
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 619
    iget-object v0, p0, Lorg/linphone/CallCard;->mSlidingCardManager:Lorg/linphone/SlidingCardManager;

    if-eqz v0, :cond_0

    .line 620
    iget-object v0, p0, Lorg/linphone/CallCard;->mSlidingCardManager:Lorg/linphone/SlidingCardManager;

    invoke-virtual {v0, p1}, Lorg/linphone/SlidingCardManager;->handleCallCardTouchEvent(Landroid/view/MotionEvent;)V

    .line 621
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public displayCallWaitingLayout()V
    .locals 2

    .prologue
    .line 307
    iget-object v0, p0, Lorg/linphone/CallCard;->singleCallCard:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 308
    iget-object v0, p0, Lorg/linphone/CallCard;->callWaitingCallCard:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 309
    return-void
.end method

.method public displayMainCallLayout()V
    .locals 2

    .prologue
    .line 302
    iget-object v0, p0, Lorg/linphone/CallCard;->singleCallCard:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 303
    iget-object v0, p0, Lorg/linphone/CallCard;->callWaitingCallCard:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 304
    return-void
.end method

.method public displayMainCallStatus(Lorg/linphone/core/LinphoneCall$State;IZ)V
    .locals 5
    .param p1, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p2, "callDuration"    # I
    .param p3, "singleCall"    # Z

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    const/4 v2, 0x4

    .line 257
    invoke-direct {p0, p1}, Lorg/linphone/CallCard;->getTitleForCallCard(Lorg/linphone/core/LinphoneCall$State;)Ljava/lang/String;

    move-result-object v0

    .line 259
    .local v0, "cardTitle":Ljava/lang/String;
    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v1, :cond_0

    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->OutgoingRinging:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v1, :cond_0

    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v1, :cond_1

    .line 261
    :cond_0
    iget-object v1, p0, Lorg/linphone/CallCard;->mQualityIndiLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 262
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 263
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 264
    iget-object v1, p0, Lorg/linphone/CallCard;->mLowerTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 265
    iget-object v1, p0, Lorg/linphone/CallCard;->mLowerTitle:Landroid/widget/TextView;

    iget v2, p0, Lorg/linphone/CallCard;->mTextColorDialing:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 294
    :goto_0
    if-eqz p3, :cond_8

    .line 295
    invoke-direct {p0, p1, p2}, Lorg/linphone/CallCard;->updateMainCardTitleWidgets(Lorg/linphone/core/LinphoneCall$State;I)V

    .line 299
    :goto_1
    return-void

    .line 266
    :cond_1
    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->OutgoingProgress:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v1, :cond_2

    .line 267
    iget-object v1, p0, Lorg/linphone/CallCard;->mQualityIndiLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 268
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 269
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 270
    iget-object v1, p0, Lorg/linphone/CallCard;->mLowerTitle:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 271
    :cond_2
    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v1, :cond_3

    .line 272
    iget-object v1, p0, Lorg/linphone/CallCard;->mQualityIndiLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 273
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 274
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 275
    :cond_3
    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v1, :cond_4

    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->Connected:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v1, :cond_5

    .line 276
    :cond_4
    iget-object v1, p0, Lorg/linphone/CallCard;->mQualityIndiLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 277
    iget-object v1, p0, Lorg/linphone/CallCard;->mLowerTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 278
    iget-object v1, p0, Lorg/linphone/CallCard;->mLowerTitle:Landroid/widget/TextView;

    iget v2, p0, Lorg/linphone/CallCard;->mTextColorConnected:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 279
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 280
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 281
    :cond_5
    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->CallEnd:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v1, :cond_6

    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->Error:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v1, :cond_7

    .line 282
    :cond_6
    iget-object v1, p0, Lorg/linphone/CallCard;->mQualityIndiLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 283
    iget-object v1, p0, Lorg/linphone/CallCard;->mLowerTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 284
    iget-object v1, p0, Lorg/linphone/CallCard;->mLowerTitle:Landroid/widget/TextView;

    iget v2, p0, Lorg/linphone/CallCard;->mTextColorEnded:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 285
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 286
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 288
    :cond_7
    iget-object v1, p0, Lorg/linphone/CallCard;->mQualityIndiLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 290
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 291
    iget-object v1, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    iget-object v1, p0, Lorg/linphone/CallCard;->mLowerTitle:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 297
    :cond_8
    invoke-direct {p0, p1, p2}, Lorg/linphone/CallCard;->updateCallWaitingMainCardTitleWidgets(Lorg/linphone/core/LinphoneCall$State;I)V

    goto/16 :goto_1
.end method

.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 200
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 205
    const v0, 0x7f0e00cc

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lorg/linphone/CallCard;->mMainCallCard:Landroid/view/ViewGroup;

    .line 206
    const v0, 0x7f0e00d4

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lorg/linphone/CallCard;->singleCallCard:Landroid/view/ViewGroup;

    .line 207
    const v0, 0x7f0e00e4

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lorg/linphone/CallCard;->callWaitingCallCard:Landroid/view/ViewGroup;

    .line 210
    const v0, 0x7f0e00d2

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    .line 211
    const v0, 0x7f0e00d9

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mLowerTitle:Landroid/widget/TextView;

    .line 212
    const v0, 0x7f0e00da

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Chronometer;

    iput-object v0, p0, Lorg/linphone/CallCard;->mElapsedTime:Landroid/widget/Chronometer;

    .line 215
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0065

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lorg/linphone/CallCard;->mTextColorDialing:I

    .line 216
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0064

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lorg/linphone/CallCard;->mTextColorConnected:I

    .line 217
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0066

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lorg/linphone/CallCard;->mTextColorEnded:I

    .line 218
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0067

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lorg/linphone/CallCard;->mTextColorOnHold:I

    .line 221
    const v0, 0x7f0e00d5

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mPhoto:Landroid/widget/ImageView;

    .line 222
    const v0, 0x7f0e00d6

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mName:Landroid/widget/TextView;

    .line 223
    const v0, 0x7f0e00d8

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    .line 224
    const v0, 0x7f0e00d7

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mLabel:Landroid/widget/TextView;

    .line 225
    const v0, 0x7f0e00d3

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mVideoIcon:Landroid/widget/ImageView;

    .line 226
    iget-object v0, p0, Lorg/linphone/CallCard;->mVideoIcon:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 228
    const v0, 0x7f0e00cd

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lorg/linphone/CallCard;->mQualityIndiLayout:Landroid/widget/RelativeLayout;

    .line 230
    const v0, 0x7f0e00ce

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mQualityIndiImage:Landroid/widget/ImageView;

    .line 231
    const v0, 0x7f0e00cf

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mQualityIndiLabel:Landroid/widget/TextView;

    .line 232
    const v0, 0x7f0e00d0

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mQualityIndiStatus:Landroid/widget/TextView;

    .line 235
    const v0, 0x7f0e00e6

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mPhotoCallWaitingMain:Landroid/widget/ImageView;

    .line 236
    const v0, 0x7f0e00e7

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mNameCallWaitingMain:Landroid/widget/TextView;

    .line 237
    const v0, 0x7f0e00e9

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mPhoneNumberCallWaitingMain:Landroid/widget/TextView;

    .line 238
    const v0, 0x7f0e00e8

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCard;->mLabelCallWaitingMain:Landroid/widget/TextView;

    .line 239
    const v0, 0x7f0e00ea

    invoke-virtual {p0, v0}, Lorg/linphone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Chronometer;

    iput-object v0, p0, Lorg/linphone/CallCard;->mElapsedTimeCallWaitingMain:Landroid/widget/Chronometer;

    .line 240
    return-void
.end method

.method public onImageLoadComplete(ILjava/lang/Object;Landroid/widget/ImageView;Z)V
    .locals 0
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "iView"    # Landroid/widget/ImageView;
    .param p4, "imagePresent"    # Z

    .prologue
    .line 320
    return-void
.end method

.method public onQueryComplete(ILjava/lang/Object;Lorg/linphone/CallerInfo;)V
    .locals 0
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "ci"    # Lorg/linphone/CallerInfo;

    .prologue
    .line 685
    return-void
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 147
    invoke-direct {p0}, Lorg/linphone/CallCard;->showCallConnected()V

    .line 148
    iget-object v0, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    return-void
.end method

.method public setSlidingCardManager(Lorg/linphone/SlidingCardManager;)V
    .locals 0
    .param p1, "slidingCardManager"    # Lorg/linphone/SlidingCardManager;

    .prologue
    .line 625
    iput-object p1, p0, Lorg/linphone/CallCard;->mSlidingCardManager:Lorg/linphone/SlidingCardManager;

    .line 626
    return-void
.end method

.method public update(IIII)V
    .locals 1
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I

    .prologue
    const/4 v0, 0x0

    .line 117
    invoke-virtual {p0, v0, p2, v0, v0}, Lorg/linphone/CallCard;->setPadding(IIII)V

    .line 118
    return-void
.end method

.method public updateCallCardInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 5
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "lable"    # Ljava/lang/String;
    .param p4, "photo"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const v4, 0x7f07022b

    const/4 v3, 0x0

    .line 465
    invoke-static {p2}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 466
    iget-object v1, p0, Lorg/linphone/CallCard;->mName:Landroid/widget/TextView;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 472
    :goto_0
    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 473
    const-string/jumbo v1, "-3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 474
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 483
    :goto_1
    invoke-static {p3}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 484
    iget-object v1, p0, Lorg/linphone/CallCard;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 485
    iget-object v1, p0, Lorg/linphone/CallCard;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 489
    :goto_2
    if-eqz p4, :cond_6

    .line 490
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoto:Landroid/widget/ImageView;

    invoke-virtual {v1, p4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 491
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoto:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 499
    :goto_3
    return-void

    .line 467
    :cond_0
    const-string/jumbo v1, "-3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 468
    iget-object v1, p0, Lorg/linphone/CallCard;->mName:Landroid/widget/TextView;

    const v2, 0x7f0700ab

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 470
    :cond_1
    iget-object v1, p0, Lorg/linphone/CallCard;->mName:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 476
    :cond_2
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRestoreMapPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 477
    .local v0, "n":Ljava/lang/String;
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    .end local v0    # "n":Ljava/lang/String;
    :goto_4
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .restart local v0    # "n":Ljava/lang/String;
    :cond_3
    move-object v0, p1

    goto :goto_4

    .line 480
    .end local v0    # "n":Ljava/lang/String;
    :cond_4
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 487
    :cond_5
    iget-object v1, p0, Lorg/linphone/CallCard;->mLabel:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 492
    :cond_6
    const-string/jumbo v1, "-3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 493
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoto:Landroid/widget/ImageView;

    const v2, 0x7f0200cb

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 494
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoto:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_3

    .line 496
    :cond_7
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoto:Landroid/widget/ImageView;

    const v2, 0x7f0200ce

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 497
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoto:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_3
.end method

.method public updateCallWaitingMainCallCardInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 5
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "lable"    # Ljava/lang/String;
    .param p4, "photo"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const v4, 0x7f07022b

    const/4 v3, 0x0

    .line 502
    invoke-static {p2}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 503
    iget-object v1, p0, Lorg/linphone/CallCard;->mNameCallWaitingMain:Landroid/widget/TextView;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 509
    :goto_0
    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 510
    const-string/jumbo v1, "-3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 511
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoneNumberCallWaitingMain:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 520
    :goto_1
    invoke-static {p3}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 521
    iget-object v1, p0, Lorg/linphone/CallCard;->mLabelCallWaitingMain:Landroid/widget/TextView;

    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 522
    iget-object v1, p0, Lorg/linphone/CallCard;->mLabelCallWaitingMain:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 526
    :goto_2
    if-eqz p4, :cond_6

    .line 527
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhotoCallWaitingMain:Landroid/widget/ImageView;

    invoke-virtual {v1, p4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 528
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhotoCallWaitingMain:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 536
    :goto_3
    return-void

    .line 504
    :cond_0
    const-string/jumbo v1, "-3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 505
    iget-object v1, p0, Lorg/linphone/CallCard;->mNameCallWaitingMain:Landroid/widget/TextView;

    const v2, 0x7f0700ab

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 507
    :cond_1
    iget-object v1, p0, Lorg/linphone/CallCard;->mNameCallWaitingMain:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 513
    :cond_2
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRestoreMapPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 514
    .local v0, "n":Ljava/lang/String;
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoneNumberCallWaitingMain:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    .end local v0    # "n":Ljava/lang/String;
    :goto_4
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .restart local v0    # "n":Ljava/lang/String;
    :cond_3
    move-object v0, p1

    goto :goto_4

    .line 517
    .end local v0    # "n":Ljava/lang/String;
    :cond_4
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhoneNumberCallWaitingMain:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 524
    :cond_5
    iget-object v1, p0, Lorg/linphone/CallCard;->mLabelCallWaitingMain:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 529
    :cond_6
    const-string/jumbo v1, "-3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 530
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhotoCallWaitingMain:Landroid/widget/ImageView;

    const v2, 0x7f0200cb

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 531
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhotoCallWaitingMain:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_3

    .line 533
    :cond_7
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhotoCallWaitingMain:Landroid/widget/ImageView;

    const v2, 0x7f0200ce

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 534
    iget-object v1, p0, Lorg/linphone/CallCard;->mPhotoCallWaitingMain:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_3
.end method

.method public updateForLandscapeMode()V
    .locals 2

    .prologue
    .line 649
    iget-object v0, p0, Lorg/linphone/CallCard;->mMainCallCard:Landroid/view/ViewGroup;

    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setMinimumHeight(I)V

    .line 654
    iget-object v0, p0, Lorg/linphone/CallCard;->mMainCallCard:Landroid/view/ViewGroup;

    const/16 v1, 0x32

    invoke-direct {p0, v0, v1}, Lorg/linphone/CallCard;->setSideMargins(Landroid/view/ViewGroup;I)V

    .line 657
    iget-object v0, p0, Lorg/linphone/CallCard;->mUpperTitle:Landroid/widget/TextView;

    const/high16 v1, 0x41b00000    # 22.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 658
    return-void
.end method

.method public updateQualityIndiImage(F)V
    .locals 9
    .param p1, "score"    # F

    .prologue
    const/4 v6, 0x4

    const/4 v8, 0x0

    .line 156
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0701ea

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 157
    .local v2, "topQualityLabel":Ljava/lang/String;
    const-string/jumbo v3, ""

    .line 158
    .local v3, "topQualityStatusLabel":Ljava/lang/String;
    const-string/jumbo v1, ""

    .line 160
    .local v1, "qualityStatusDescription":Ljava/lang/String;
    const/4 v0, 0x0

    .line 162
    .local v0, "image":Landroid/graphics/drawable/Drawable;
    const/4 v4, 0x0

    cmpl-float v4, p1, v4

    if-ltz v4, :cond_3

    .line 163
    float-to-double v4, p1

    const-wide/high16 v6, 0x4012000000000000L    # 4.5

    cmpl-double v4, v4, v6

    if-ltz v4, :cond_1

    .line 164
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f02042d

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 165
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0701f0

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 166
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0701ee

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 180
    :goto_0
    iget-object v4, p0, Lorg/linphone/CallCard;->mQualityIndiLabel:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 181
    iget-object v4, p0, Lorg/linphone/CallCard;->mQualityIndiImage:Landroid/widget/ImageView;

    invoke-virtual {v4, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 182
    iget-object v4, p0, Lorg/linphone/CallCard;->mQualityIndiStatus:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 190
    :goto_1
    iget-object v4, p0, Lorg/linphone/CallCard;->mQualityIndiLabel:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    iget-object v4, p0, Lorg/linphone/CallCard;->mQualityIndiStatus:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    if-eqz v0, :cond_0

    .line 194
    iget-object v4, p0, Lorg/linphone/CallCard;->mQualityIndiImage:Landroid/widget/ImageView;

    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 196
    :cond_0
    return-void

    .line 168
    :cond_1
    float-to-double v4, p1

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    cmpl-double v4, v4, v6

    if-ltz v4, :cond_2

    .line 169
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f02042c

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 170
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0701ef

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 171
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0701ed

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 174
    :cond_2
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f02042e

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 175
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0701eb

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 176
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0701ec

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 184
    :cond_3
    iget-object v4, p0, Lorg/linphone/CallCard;->mQualityIndiLabel:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 185
    iget-object v4, p0, Lorg/linphone/CallCard;->mQualityIndiImage:Landroid/widget/ImageView;

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 186
    iget-object v4, p0, Lorg/linphone/CallCard;->mQualityIndiStatus:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 187
    invoke-virtual {p0}, Lorg/linphone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0701f1

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_1
.end method
