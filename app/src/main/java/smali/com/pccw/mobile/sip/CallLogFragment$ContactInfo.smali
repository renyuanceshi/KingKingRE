.class final Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;
.super Ljava/lang/Object;
.source "CallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CallLogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ContactInfo"
.end annotation


# static fields
.field public static EMPTY:Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;


# instance fields
.field public formattedNumber:Ljava/lang/String;

.field public isChecking:Z

.field public label:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public number:Ljava/lang/String;

.field public numberType:I

.field public personId:J

.field public thumbnailUri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 248
    new-instance v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->EMPTY:Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment$1;

    .prologue
    .line 238
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;-><init>()V

    return-void
.end method
