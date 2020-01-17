.class public interface abstract Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;
.super Ljava/lang/Object;
.source "AddCallContactFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/AddCallContactFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ContactAllQuery"
.end annotation


# static fields
.field public static final DISPLAY_NAME:I = 0x1

.field public static final LOOKUP_KEY:I = 0x3

.field public static final PHOTO_THUMBNAIL_URI:I = 0x2

.field public static final PROJECTION:[Ljava/lang/String;

.field public static final PROJECTION_HONEYCOMB:[Ljava/lang/String;

.field public static final PROJECTION_OLD:[Ljava/lang/String;

.field public static final QUERY_ID:I = 0x0

.field public static final SELECTION:Ljava/lang/String; = "has_phone_number = 1"

.field public static final SELECTION_SEARCH:Ljava/lang/String; = "display_name LIKE ? AND has_phone_number = 1"

.field public static final SORT_ORDER:Ljava/lang/String; = "display_name"

.field public static final URI:Landroid/net/Uri;

.field public static final _ID:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 526
    sget-object v0, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    sput-object v0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;->URI:Landroid/net/Uri;

    .line 529
    new-array v0, v6, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v2

    const-string/jumbo v1, "display_name"

    aput-object v1, v0, v3

    const-string/jumbo v1, "photo_thumb_uri"

    aput-object v1, v0, v4

    const-string/jumbo v1, "lookup"

    aput-object v1, v0, v5

    sput-object v0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;->PROJECTION_HONEYCOMB:[Ljava/lang/String;

    .line 533
    new-array v0, v6, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v2

    const-string/jumbo v1, "display_name"

    aput-object v1, v0, v3

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v4

    const-string/jumbo v1, "lookup"

    aput-object v1, v0, v5

    sput-object v0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;->PROJECTION_OLD:[Ljava/lang/String;

    .line 538
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    sget-object v0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;->PROJECTION_HONEYCOMB:[Ljava/lang/String;

    :goto_0
    sput-object v0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;->PROJECTION:[Ljava/lang/String;

    return-void

    :cond_0
    sget-object v0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;->PROJECTION_OLD:[Ljava/lang/String;

    goto :goto_0
.end method
