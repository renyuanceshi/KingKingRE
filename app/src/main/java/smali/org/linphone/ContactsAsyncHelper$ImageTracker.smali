.class public Lorg/linphone/ContactsAsyncHelper$ImageTracker;
.super Ljava/lang/Object;
.source "ContactsAsyncHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/ContactsAsyncHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImageTracker"
.end annotation


# static fields
.field public static final DISPLAY_DEFAULT:I = -0x2

.field public static final DISPLAY_IMAGE:I = -0x1

.field public static final DISPLAY_UNDEFINED:I


# instance fields
.field private displayMode:I

.field private mCurrentCallerInfo:Lorg/linphone/CallerInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/ContactsAsyncHelper$ImageTracker;->mCurrentCallerInfo:Lorg/linphone/CallerInfo;

    .line 113
    const/4 v0, 0x0

    iput v0, p0, Lorg/linphone/ContactsAsyncHelper$ImageTracker;->displayMode:I

    .line 114
    return-void
.end method


# virtual methods
.method public getPhotoState()I
    .locals 1

    .prologue
    .line 175
    iget v0, p0, Lorg/linphone/ContactsAsyncHelper$ImageTracker;->displayMode:I

    return v0
.end method

.method public getPhotoUri()Landroid/net/Uri;
    .locals 4

    .prologue
    .line 158
    iget-object v0, p0, Lorg/linphone/ContactsAsyncHelper$ImageTracker;->mCurrentCallerInfo:Lorg/linphone/CallerInfo;

    if-eqz v0, :cond_0

    .line 159
    sget-object v0, Landroid/provider/Contacts$People;->CONTENT_URI:Landroid/net/Uri;

    iget-object v1, p0, Lorg/linphone/ContactsAsyncHelper$ImageTracker;->mCurrentCallerInfo:Lorg/linphone/CallerInfo;

    iget-wide v2, v1, Lorg/linphone/CallerInfo;->person_id:J

    invoke-static {v0, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 161
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDifferentImageRequest(Lorg/linphone/CallerInfo;)Z
    .locals 1
    .param p1, "ci"    # Lorg/linphone/CallerInfo;

    .prologue
    .line 124
    iget-object v0, p0, Lorg/linphone/ContactsAsyncHelper$ImageTracker;->mCurrentCallerInfo:Lorg/linphone/CallerInfo;

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setPhotoRequest(Lorg/linphone/CallerInfo;)V
    .locals 0
    .param p1, "ci"    # Lorg/linphone/CallerInfo;

    .prologue
    .line 150
    iput-object p1, p0, Lorg/linphone/ContactsAsyncHelper$ImageTracker;->mCurrentCallerInfo:Lorg/linphone/CallerInfo;

    .line 151
    return-void
.end method

.method public setPhotoState(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 168
    iput p1, p0, Lorg/linphone/ContactsAsyncHelper$ImageTracker;->displayMode:I

    .line 169
    return-void
.end method
