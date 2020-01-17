.class public interface abstract Lcom/pccw/sms/service/AllHistoryIMServer$MixCallLogQuery;
.super Ljava/lang/Object;
.source "AllHistoryIMServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/service/AllHistoryIMServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MixCallLogQuery"
.end annotation


# static fields
.field public static final CACHED_NAME:I = 0x5

.field public static final CACHED_NUMBER_LABEL:I = 0x7

.field public static final CACHED_NUMBER_TYPE:I = 0x6

.field public static final DATE:I = 0x3

.field public static final DURATION:I = 0x4

.field public static final NUMBER:I = 0x1

.field public static final PROJECTION:[Ljava/lang/String;

.field public static final QUERY_ID:I = 0x0

.field public static final TYPE:I = 0x2

.field public static final URI:Landroid/net/Uri;

.field public static final _ID:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 78
    sget-object v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    sput-object v0, Lcom/pccw/sms/service/AllHistoryIMServer$MixCallLogQuery;->URI:Landroid/net/Uri;

    .line 81
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "number"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "type"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "date"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "duration"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "name"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "numbertype"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "numberlabel"

    aput-object v2, v0, v1

    sput-object v0, Lcom/pccw/sms/service/AllHistoryIMServer$MixCallLogQuery;->PROJECTION:[Ljava/lang/String;

    return-void
.end method
