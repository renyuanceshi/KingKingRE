.class final Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;
.super Ljava/lang/Object;
.source "CallerInfoAsyncQuery.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/CallerInfoAsyncQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CookieWrapper"
.end annotation


# instance fields
.field public cookie:Ljava/lang/Object;

.field public event:I

.field public listener:Lorg/linphone/CallerInfoAsyncQuery$OnQueryCompleteListener;

.field public number:Ljava/lang/String;

.field public number2:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/linphone/CallerInfoAsyncQuery$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/linphone/CallerInfoAsyncQuery$1;

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/linphone/CallerInfoAsyncQuery$CookieWrapper;-><init>()V

    return-void
.end method
