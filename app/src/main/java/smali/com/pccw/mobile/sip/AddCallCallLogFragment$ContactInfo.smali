.class final Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;
.super Ljava/lang/Object;
.source "AddCallCallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/AddCallCallLogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ContactInfo"
.end annotation


# static fields
.field public static EMPTY:Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;


# instance fields
.field public formattedNumber:Ljava/lang/String;

.field public label:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public number:Ljava/lang/String;

.field public personId:J

.field public thumbnailUri:Ljava/lang/String;

.field public type:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 163
    new-instance v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->EMPTY:Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
