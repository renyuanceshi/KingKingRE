.class public interface abstract Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$ContactPhoneNumberQuery;
.super Ljava/lang/Object;
.source "AddCallContactDetailsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ContactPhoneNumberQuery"
.end annotation


# static fields
.field public static final DISPLAY_NAME:I = 0x5

.field public static final ID:I = 0x0

.field public static final LABEL:I = 0x3

.field public static final LOOKUP_KEY:I = 0x4

.field public static final NUMBER:I = 0x1

.field public static final PROJECTION:[Ljava/lang/String;

.field public static final QUERY_ID:I = 0x2

.field public static final SELECTION:Ljava/lang/String; = "contact_id = "

.field public static final TYPE:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 328
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "data1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "data2"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "data3"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "lookup"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "display_name"

    aput-object v2, v0, v1

    sput-object v0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$ContactPhoneNumberQuery;->PROJECTION:[Ljava/lang/String;

    return-void
.end method
