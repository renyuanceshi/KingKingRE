.class Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;
.super Landroid/content/AsyncQueryHandler;
.source "CallerInfoAsyncQuery.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/CallerInfoAsyncQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CallerInfoAsyncQueryHandler"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler$CallerInfoWorkerHandler;
    }
.end annotation


# instance fields
.field private mCallerInfo:Lorg/linphone/CallerInfo;

.field private mQueryContext:Landroid/content/Context;

.field private mQueryUri:Landroid/net/Uri;

.field final synthetic this$0:Lorg/linphone/CallerInfoAsyncQuery;


# direct methods
.method private constructor <init>(Lorg/linphone/CallerInfoAsyncQuery;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 180
    iput-object p1, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->this$0:Lorg/linphone/CallerInfoAsyncQuery;

    .line 181
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    .line 182
    return-void
.end method

.method synthetic constructor <init>(Lorg/linphone/CallerInfoAsyncQuery;Landroid/content/Context;Lorg/linphone/CallerInfoAsyncQuery$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/linphone/CallerInfoAsyncQuery;
    .param p2, "x1"    # Landroid/content/Context;
    .param p3, "x2"    # Lorg/linphone/CallerInfoAsyncQuery$1;

    .prologue
    .line 90
    invoke-direct {p0, p1, p2}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;-><init>(Lorg/linphone/CallerInfoAsyncQuery;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$302(Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;Landroid/content/Context;)Landroid/content/Context;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 90
    iput-object p1, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mQueryContext:Landroid/content/Context;

    return-object p1
.end method

.method static synthetic access$402(Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;
    .param p1, "x1"    # Landroid/net/Uri;

    .prologue
    .line 90
    iput-object p1, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mQueryUri:Landroid/net/Uri;

    return-object p1
.end method

.method static synthetic access$502(Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;Lorg/linphone/CallerInfo;)Lorg/linphone/CallerInfo;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;
    .param p1, "x1"    # Lorg/linphone/CallerInfo;

    .prologue
    .line 90
    iput-object p1, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mCallerInfo:Lorg/linphone/CallerInfo;

    return-object p1
.end method


# virtual methods
.method protected createHandler(Landroid/os/Looper;)Landroid/os/Handler;
    .locals 1
    .param p1, "looper"    # Landroid/os/Looper;

    .prologue
    .line 186
    new-instance v0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler$CallerInfoWorkerHandler;

    invoke-direct {v0, p0, p1}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler$CallerInfoWorkerHandler;-><init>(Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;Landroid/os/Looper;)V

    return-object v0
.end method

.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 9
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x0

    .line 204
    move-object v8, p2

    check-cast v8, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;

    .line 205
    .local v8, "cw":Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;
    if-nez v8, :cond_1

    .line 254
    :cond_0
    :goto_0
    return-void

    .line 216
    :cond_1
    iget v0, v8, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->event:I

    if-ne v0, v4, :cond_2

    .line 217
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->this$0:Lorg/linphone/CallerInfoAsyncQuery;

    invoke-static {v0}, Lorg/linphone/CallerInfoAsyncQuery;->access$000(Lorg/linphone/CallerInfoAsyncQuery;)V

    goto :goto_0

    .line 222
    :cond_2
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mCallerInfo:Lorg/linphone/CallerInfo;

    if-nez v0, :cond_7

    .line 223
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mQueryContext:Landroid/content/Context;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mQueryUri:Landroid/net/Uri;

    if-nez v0, :cond_4

    .line 224
    :cond_3
    new-instance v0, Lorg/linphone/CallerInfoAsyncQuery$QueryPoolException;

    const-string/jumbo v1, "Bad context or query uri, or CallerInfoAsyncQuery already released."

    invoke-direct {v0, v1}, Lorg/linphone/CallerInfoAsyncQuery$QueryPoolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 229
    :cond_4
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mQueryContext:Landroid/content/Context;

    iget-object v1, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mQueryUri:Landroid/net/Uri;

    invoke-static {v0, v1, p3}, Lorg/linphone/CallerInfo;->getCallerInfo(Landroid/content/Context;Landroid/net/Uri;Landroid/database/Cursor;)Lorg/linphone/CallerInfo;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mCallerInfo:Lorg/linphone/CallerInfo;

    .line 231
    iget-object v0, v8, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->number:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 232
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mCallerInfo:Lorg/linphone/CallerInfo;

    iget-object v0, v0, Lorg/linphone/CallerInfo;->name:Ljava/lang/String;

    if-nez v0, :cond_5

    iget-object v0, v8, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->number:Ljava/lang/String;

    iget-object v1, v8, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->number2:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 233
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mCallerInfo:Lorg/linphone/CallerInfo;

    iget-object v1, v8, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->number2:Ljava/lang/String;

    iput-object v1, v0, Lorg/linphone/CallerInfo;->name:Ljava/lang/String;

    .line 234
    :cond_5
    iget-object v0, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mCallerInfo:Lorg/linphone/CallerInfo;

    iget-object v1, v8, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->number:Ljava/lang/String;

    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/linphone/CallerInfo;->phoneNumber:Ljava/lang/String;

    .line 242
    :cond_6
    new-instance v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;

    invoke-direct {v2, v3}, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;-><init>(Lorg/linphone/CallerInfoAsyncQuery$1;)V

    .line 243
    .local v2, "endMarker":Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;
    iput v4, v2, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->event:I

    move-object v0, p0

    move v1, p1

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    .line 244
    invoke-virtual/range {v0 .. v7}, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .end local v2    # "endMarker":Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;
    :cond_7
    iget-object v0, v8, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->listener:Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, v8, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->listener:Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;

    iget-object v1, v8, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;->cookie:Ljava/lang/Object;

    iget-object v3, p0, Lorg/linphone/CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler;->mCallerInfo:Lorg/linphone/CallerInfo;

    invoke-interface {v0, p1, v1, v3}, Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;->onQueryComplete(ILjava/lang/Object;Lorg/linphone/CallerInfo;)V

    goto :goto_0
.end method
