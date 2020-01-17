.class public interface abstract Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;
.super Ljava/lang/Object;
.source "ContactFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/ContactFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "AllPhoneNumberQuery"
.end annotation


# static fields
.field public static final ID:I = 0x0

.field public static final LOOKUP_KEY:I = 0x2

.field public static final NUMBER:I = 0x1

.field public static final PROJECTION:[Ljava/lang/String;

.field public static final QUERY_ID:I = 0x2

.field public static final SELECTION:Ljava/lang/String; = "contact_id = "

.field public static final SORT_ORDER:Ljava/lang/String; = "data1"

.field public static final URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 645
    sget-object v0, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    sput-object v0, Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;->URI:Landroid/net/Uri;

    .line 648
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "data1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "lookup"

    aput-object v2, v0, v1

    sput-object v0, Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;->PROJECTION:[Ljava/lang/String;

    return-void
.end method
