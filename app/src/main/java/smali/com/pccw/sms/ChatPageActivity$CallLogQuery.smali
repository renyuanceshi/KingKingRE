.class public interface abstract Lcom/pccw/sms/ChatPageActivity$CallLogQuery;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/ChatPageActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CallLogQuery"
.end annotation


# static fields
.field public static final CALL_LOG_PROJECTION:[Ljava/lang/String;

.field public static final DATE:I = 0x1

.field public static final DURATION:I = 0x2

.field public static final NUMBER:I = 0x4

.field public static final QUERY_ID:I = 0x0

.field public static final TYPE:I = 0x3

.field public static final URI:Landroid/net/Uri;

.field public static final _ID:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 1280
    sget-object v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    sput-object v0, Lcom/pccw/sms/ChatPageActivity$CallLogQuery;->URI:Landroid/net/Uri;

    .line 1284
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "date"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "duration"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "type"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "number"

    aput-object v2, v0, v1

    sput-object v0, Lcom/pccw/sms/ChatPageActivity$CallLogQuery;->CALL_LOG_PROJECTION:[Ljava/lang/String;

    return-void
.end method
