.class public Lorg/linphone/CallCardHold;
.super Landroid/widget/FrameLayout;
.source "CallCardHold.java"

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

.field public mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

.field private mLabelCallWaitingOnHold:Landroid/widget/TextView;

.field public mNameCallWaitingOnHold:Landroid/widget/TextView;

.field public mPhoneNumberCallWaitingOnHold:Landroid/widget/TextView;

.field public mPhotoCallWaitingOnHold:Landroid/widget/ImageView;

.field private mPhotoTracker:Lorg/linphone/ContactsAsyncHelper$ImageTracker;

.field private mSlidingCardManager:Lorg/linphone/SlidingCardManager;

.field private mTextColorConnected:I

.field private mTextColorDialing:I

.field private mTextColorEnded:I

.field private mTextColorOnHold:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 98
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 109
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 110
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v1, 0x7f04002e

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 115
    new-instance v1, Lorg/linphone/ContactsAsyncHelper$ImageTracker;

    invoke-direct {v1}, Lorg/linphone/ContactsAsyncHelper$ImageTracker;-><init>()V

    iput-object v1, p0, Lorg/linphone/CallCardHold;->mPhotoTracker:Lorg/linphone/ContactsAsyncHelper$ImageTracker;

    .line 117
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 353
    return-void
.end method

.method private setSideMargins(Landroid/view/ViewGroup;I)V
    .locals 1
    .param p1, "vg"    # Landroid/view/ViewGroup;
    .param p2, "margin"    # I

    .prologue
    .line 341
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 343
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 344
    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 345
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 346
    return-void
.end method

.method private static final showCachedImage(Landroid/widget/ImageView;Lorg/linphone/CallerInfo;)Z
    .locals 1
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "ci"    # Lorg/linphone/CallerInfo;

    .prologue
    .line 292
    if-eqz p1, :cond_1

    iget-boolean v0, p1, Lorg/linphone/CallerInfo;->isCachedPhotoCurrent:Z

    if-eqz v0, :cond_1

    .line 293
    iget-object v0, p1, Lorg/linphone/CallerInfo;->cachedPhoto:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 294
    iget-object v0, p1, Lorg/linphone/CallerInfo;->cachedPhoto:Landroid/graphics/drawable/Drawable;

    invoke-static {p0, v0}, Lorg/linphone/CallCardHold;->showImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 298
    :goto_0
    const/4 v0, 0x1

    .line 300
    :goto_1
    return v0

    .line 296
    :cond_0
    const v0, 0x7f0200ce

    invoke-static {p0, v0}, Lorg/linphone/CallCardHold;->showImage(Landroid/widget/ImageView;I)V

    goto :goto_0

    .line 300
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private static final showImage(Landroid/widget/ImageView;I)V
    .locals 1
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "resource"    # I

    .prologue
    .line 308
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 309
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 310
    return-void
.end method

.method private static final showImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 317
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 318
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 319
    return-void
.end method

.method private updateCallWaitingHoldCardTitleWidgets(Lorg/linphone/core/LinphoneCall$State;I)V
    .locals 7
    .param p1, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p2, "callDuration"    # I

    .prologue
    const/16 v1, 0x8

    const/4 v6, 0x0

    .line 180
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_0

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->PausedByRemote:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_0

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->Pausing:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_2

    .line 183
    :cond_0
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    iget v1, p0, Lorg/linphone/CallCardHold;->mTextColorOnHold:I

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setTextColor(I)V

    .line 184
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    mul-int/lit16 v1, p2, 0x3e8

    int-to-long v4, v1

    sub-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Landroid/widget/Chronometer;->setBase(J)V

    .line 185
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    invoke-virtual {v0}, Landroid/widget/Chronometer;->start()V

    .line 186
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    invoke-virtual {v0, v6}, Landroid/widget/Chronometer;->setVisibility(I)V

    .line 204
    :cond_1
    :goto_0
    return-void

    .line 187
    :cond_2
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_3

    .line 188
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setVisibility(I)V

    goto :goto_0

    .line 189
    :cond_3
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_4

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->Connected:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_5

    .line 190
    :cond_4
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    iget v1, p0, Lorg/linphone/CallCardHold;->mTextColorConnected:I

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setTextColor(I)V

    .line 191
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    mul-int/lit16 v1, p2, 0x3e8

    int-to-long v4, v1

    sub-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Landroid/widget/Chronometer;->setBase(J)V

    .line 192
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    invoke-virtual {v0}, Landroid/widget/Chronometer;->start()V

    .line 193
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    invoke-virtual {v0, v6}, Landroid/widget/Chronometer;->setVisibility(I)V

    goto :goto_0

    .line 194
    :cond_5
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_6

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_6

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingProgress:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_6

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingRinging:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_7

    .line 199
    :cond_6
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setVisibility(I)V

    goto :goto_0

    .line 200
    :cond_7
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->CallEnd:Lorg/linphone/core/LinphoneCall$State;

    if-eq p1, v0, :cond_8

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->Error:Lorg/linphone/core/LinphoneCall$State;

    if-ne p1, v0, :cond_1

    .line 201
    :cond_8
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    iget v1, p0, Lorg/linphone/CallCardHold;->mTextColorEnded:I

    invoke-virtual {v0, v1}, Landroid/widget/Chronometer;->setTextColor(I)V

    .line 202
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    invoke-virtual {v0}, Landroid/widget/Chronometer;->stop()V

    goto :goto_0
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 325
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mSlidingCardManager:Lorg/linphone/SlidingCardManager;

    if-eqz v0, :cond_0

    .line 326
    iget-object v0, p0, Lorg/linphone/CallCardHold;->mSlidingCardManager:Lorg/linphone/SlidingCardManager;

    invoke-virtual {v0, p1}, Lorg/linphone/SlidingCardManager;->handleCallCardTouchEvent(Landroid/view/MotionEvent;)V

    .line 327
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public displayCallWaitingHoldCallStatus(Lorg/linphone/core/LinphoneCall$State;I)V
    .locals 0
    .param p1, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p2, "callDuration"    # I

    .prologue
    .line 150
    invoke-direct {p0, p1, p2}, Lorg/linphone/CallCardHold;->updateCallWaitingHoldCardTitleWidgets(Lorg/linphone/core/LinphoneCall$State;I)V

    .line 151
    return-void
.end method

.method public displayCallWaitingLayout()V
    .locals 2

    .prologue
    .line 158
    iget-object v0, p0, Lorg/linphone/CallCardHold;->callWaitingCallCard:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 159
    return-void
.end method

.method public displayMainCallLayout()V
    .locals 2

    .prologue
    .line 154
    iget-object v0, p0, Lorg/linphone/CallCardHold;->callWaitingCallCard:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 155
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 128
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 133
    const v0, 0x7f0e00db

    invoke-virtual {p0, v0}, Lorg/linphone/CallCardHold;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lorg/linphone/CallCardHold;->callWaitingCallCard:Landroid/view/ViewGroup;

    .line 136
    invoke-virtual {p0}, Lorg/linphone/CallCardHold;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0065

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lorg/linphone/CallCardHold;->mTextColorDialing:I

    .line 137
    invoke-virtual {p0}, Lorg/linphone/CallCardHold;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0064

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lorg/linphone/CallCardHold;->mTextColorConnected:I

    .line 138
    invoke-virtual {p0}, Lorg/linphone/CallCardHold;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0066

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lorg/linphone/CallCardHold;->mTextColorEnded:I

    .line 139
    invoke-virtual {p0}, Lorg/linphone/CallCardHold;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0067

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lorg/linphone/CallCardHold;->mTextColorOnHold:I

    .line 142
    const v0, 0x7f0e00dd

    invoke-virtual {p0, v0}, Lorg/linphone/CallCardHold;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lorg/linphone/CallCardHold;->mPhotoCallWaitingOnHold:Landroid/widget/ImageView;

    .line 143
    const v0, 0x7f0e00e1

    invoke-virtual {p0, v0}, Lorg/linphone/CallCardHold;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCardHold;->mNameCallWaitingOnHold:Landroid/widget/TextView;

    .line 144
    const v0, 0x7f0e00e3

    invoke-virtual {p0, v0}, Lorg/linphone/CallCardHold;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCardHold;->mPhoneNumberCallWaitingOnHold:Landroid/widget/TextView;

    .line 145
    const v0, 0x7f0e00e2

    invoke-virtual {p0, v0}, Lorg/linphone/CallCardHold;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/linphone/CallCardHold;->mLabelCallWaitingOnHold:Landroid/widget/TextView;

    .line 146
    const v0, 0x7f0e00df

    invoke-virtual {p0, v0}, Lorg/linphone/CallCardHold;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Chronometer;

    iput-object v0, p0, Lorg/linphone/CallCardHold;->mElapsedTimeCallWaitingOnHold:Landroid/widget/Chronometer;

    .line 147
    return-void
.end method

.method public onImageLoadComplete(ILjava/lang/Object;Landroid/widget/ImageView;Z)V
    .locals 0
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "iView"    # Landroid/widget/ImageView;
    .param p4, "imagePresent"    # Z

    .prologue
    .line 170
    return-void
.end method

.method public onQueryComplete(ILjava/lang/Object;Lorg/linphone/CallerInfo;)V
    .locals 0
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "ci"    # Lorg/linphone/CallerInfo;

    .prologue
    .line 359
    return-void
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 124
    return-void
.end method

.method public setSlidingCardManager(Lorg/linphone/SlidingCardManager;)V
    .locals 0
    .param p1, "slidingCardManager"    # Lorg/linphone/SlidingCardManager;

    .prologue
    .line 331
    iput-object p1, p0, Lorg/linphone/CallCardHold;->mSlidingCardManager:Lorg/linphone/SlidingCardManager;

    .line 332
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

    .line 94
    invoke-virtual {p0, v0, p2, v0, v0}, Lorg/linphone/CallCardHold;->setPadding(IIII)V

    .line 95
    return-void
.end method

.method public updateCallWaitingOnHoldCallCardInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 5
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "lable"    # Ljava/lang/String;
    .param p4, "photo"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const v4, 0x7f07022b

    const/4 v3, 0x0

    .line 207
    invoke-static {p2}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 208
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mNameCallWaitingOnHold:Landroid/widget/TextView;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    :goto_0
    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 215
    const-string/jumbo v1, "-3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 216
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mPhoneNumberCallWaitingOnHold:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 225
    :goto_1
    invoke-static {p3}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 226
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mLabelCallWaitingOnHold:Landroid/widget/TextView;

    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mLabelCallWaitingOnHold:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 232
    :goto_2
    if-eqz p4, :cond_6

    .line 233
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mPhotoCallWaitingOnHold:Landroid/widget/ImageView;

    invoke-virtual {v1, p4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 234
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mPhotoCallWaitingOnHold:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 242
    :goto_3
    return-void

    .line 209
    :cond_0
    const-string/jumbo v1, "-3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 210
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mNameCallWaitingOnHold:Landroid/widget/TextView;

    const v2, 0x7f0700ab

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 212
    :cond_1
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mNameCallWaitingOnHold:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 218
    :cond_2
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRestoreMapPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "n":Ljava/lang/String;
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mPhoneNumberCallWaitingOnHold:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    .end local v0    # "n":Ljava/lang/String;
    :goto_4
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .restart local v0    # "n":Ljava/lang/String;
    :cond_3
    move-object v0, p1

    goto :goto_4

    .line 222
    .end local v0    # "n":Ljava/lang/String;
    :cond_4
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mPhoneNumberCallWaitingOnHold:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 229
    :cond_5
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mLabelCallWaitingOnHold:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mLabelCallWaitingOnHold:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    .line 235
    :cond_6
    const-string/jumbo v1, "-3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 236
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mPhotoCallWaitingOnHold:Landroid/widget/ImageView;

    const v2, 0x7f0200cb

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 237
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mPhotoCallWaitingOnHold:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_3

    .line 239
    :cond_7
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mPhotoCallWaitingOnHold:Landroid/widget/ImageView;

    const v2, 0x7f0200ce

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 240
    iget-object v1, p0, Lorg/linphone/CallCardHold;->mPhotoCallWaitingOnHold:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_3
.end method
