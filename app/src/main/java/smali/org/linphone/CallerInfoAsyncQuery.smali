.class public Lorg/linphone/CallerInfoAsyncQuery;
.super Ljava/lang/Object;
.source "CallerInfoAsyncQuery.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;,
        Lorg/linphone/CallerInfoAsyncQuery$QueryPoolException;,
        Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;,
        Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;
    }
.end annotation


# static fields
.field private static final DBG:Z = false

.field private static final EVENT_ADD_LISTENER:I = 0x2

.field private static final EVENT_EMERGENCY_NUMBER:I = 0x4

.field private static final EVENT_END_OF_QUEUE:I = 0x3

.field private static final EVENT_NEW_QUERY:I = 0x1

.field private static final EVENT_VOICEMAIL_NUMBER:I = 0x5

.field private static final LOG_TAG:Ljava/lang/String; = "PCCW_MOBILE_SIP"


# instance fields
.field private mHandler:Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 260
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 261
    return-void
.end method

.method static synthetic access$000(Lorg/linphone/CallerInfoAsyncQuery;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/CallerInfoAsyncQuery;

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/linphone/CallerInfoAsyncQuery;->release()V

    return-void
.end method

.method private allocate(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "contactRef"    # Landroid/net/Uri;

    .prologue
    .line 339
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 340
    :cond_0
    new-instance v0, Lorg/linphone/CallerInfoAsyncQuery$QueryPoolException;

    const-string/jumbo v1, "Bad context or query uri."

    invoke-direct {v0, v1}, Lorg/linphone/CallerInfoAsyncQuery$QueryPoolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 342
    :cond_1
    new-instance v0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;-><init>(Lorg/linphone/CallerInfoAsyncQuery;Landroid/content/Context;Lorg/linphone/CallerInfoAsyncQuery$1;)V

    iput-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery;->mHandler:Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;

    .line 343
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery;->mHandler:Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;

    invoke-static {v0, p1}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->access$302(Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;Landroid/content/Context;)Landroid/content/Context;

    .line 344
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery;->mHandler:Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;

    invoke-static {v0, p2}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->access$402(Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;Landroid/net/Uri;)Landroid/net/Uri;

    .line 345
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 0
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 363
    return-void
.end method

.method private release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 351
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery;->mHandler:Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;

    invoke-static {v0, v1}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->access$302(Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;Landroid/content/Context;)Landroid/content/Context;

    .line 352
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery;->mHandler:Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;

    invoke-static {v0, v1}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->access$402(Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;Landroid/net/Uri;)Landroid/net/Uri;

    .line 353
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery;->mHandler:Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;

    invoke-static {v0, v1}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->access$502(Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;Lorg/linphone/CallerInfo;)Lorg/linphone/CallerInfo;

    .line 354
    iput-object v1, p0, Lorg/linphone/CallerInfoAsyncQuery;->mHandler:Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;

    .line 355
    return-void
.end method

.method public static startQuery(ILandroid/content/Context;Landroid/net/Uri;Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lorg/linphone/CallerInfoAsyncQuery;
    .locals 9
    .param p0, "token"    # I
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "contactRef"    # Landroid/net/Uri;
    .param p3, "listener"    # Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;
    .param p4, "cookie"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 269
    new-instance v8, Lorg/linphone/CallerInfoAsyncQuery;

    invoke-direct {v8}, Lorg/linphone/CallerInfoAsyncQuery;-><init>()V

    .line 270
    .local v8, "c":Lorg/linphone/CallerInfoAsyncQuery;
    invoke-direct {v8, p1, p2}, Lorg/linphone/CallerInfoAsyncQuery;->allocate(Landroid/content/Context;Landroid/net/Uri;)V

    .line 276
    new-instance v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;

    invoke-direct {v2, v4}, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;-><init>(Lorg/linphone/CallerInfoAsyncQuery$1;)V

    .line 277
    .local v2, "cw":Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;
    iput-object p3, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->listener:Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;

    .line 278
    iput-object p4, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->cookie:Ljava/lang/Object;

    .line 279
    const/4 v0, 0x1

    iput v0, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->event:I

    .line 281
    iget-object v0, v8, Lorg/linphone/CallerInfoAsyncQuery;->mHandler:Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;

    move v1, p0

    move-object v3, p2

    move-object v5, v4

    move-object v6, v4

    move-object v7, v4

    invoke-virtual/range {v0 .. v7}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    return-object v8
.end method

.method public static startQuery(ILandroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lorg/linphone/CallerInfoAsyncQuery;
    .locals 10
    .param p0, "token"    # I
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "number"    # Ljava/lang/String;
    .param p3, "number2"    # Ljava/lang/String;
    .param p4, "listener"    # Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;
    .param p5, "cookie"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 292
    move-object v9, p2

    .line 293
    .local v9, "number_search":Ljava/lang/String;
    const-string/jumbo v0, "&"

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    const/4 v0, 0x0

    const-string/jumbo v1, "&"

    invoke-virtual {p2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 295
    :cond_0
    sget-object v0, Landroid/provider/Contacts$Phones;->CONTENT_FILTER_URL:Landroid/net/Uri;

    invoke-static {v0, v9}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 297
    .local v3, "contactRef":Landroid/net/Uri;
    new-instance v8, Lorg/linphone/CallerInfoAsyncQuery;

    invoke-direct {v8}, Lorg/linphone/CallerInfoAsyncQuery;-><init>()V

    .line 298
    .local v8, "c":Lorg/linphone/CallerInfoAsyncQuery;
    invoke-direct {v8, p1, v3}, Lorg/linphone/CallerInfoAsyncQuery;->allocate(Landroid/content/Context;Landroid/net/Uri;)V

    .line 304
    new-instance v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;

    invoke-direct {v2, v4}, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;-><init>(Lorg/linphone/CallerInfoAsyncQuery$1;)V

    .line 305
    .local v2, "cw":Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;
    iput-object p4, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->listener:Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;

    .line 306
    iput-object p5, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->cookie:Ljava/lang/Object;

    .line 307
    iput-object p2, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->number:Ljava/lang/String;

    .line 308
    iput-object p3, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->number2:Ljava/lang/String;

    .line 310
    const/4 v0, 0x1

    iput v0, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->event:I

    .line 311
    iget-object v0, v8, Lorg/linphone/CallerInfoAsyncQuery;->mHandler:Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;

    move v1, p0

    move-object v5, v4

    move-object v6, v4

    move-object v7, v4

    invoke-virtual/range {v0 .. v7}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    return-object v8
.end method


# virtual methods
.method public addQueryListener(ILorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)V
    .locals 8
    .param p1, "token"    # I
    .param p2, "listener"    # Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;
    .param p3, "cookie"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 326
    new-instance v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;

    invoke-direct {v2, v3}, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;-><init>(Lorg/linphone/CallerInfoAsyncQuery$1;)V

    .line 327
    .local v2, "cw":Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;
    iput-object p2, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->listener:Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;

    .line 328
    iput-object p3, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->cookie:Ljava/lang/Object;

    .line 329
    const/4 v0, 0x2

    iput v0, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->event:I

    .line 331
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery;->mHandler:Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;

    move v1, p1

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-virtual/range {v0 .. v7}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    return-void
.end method
