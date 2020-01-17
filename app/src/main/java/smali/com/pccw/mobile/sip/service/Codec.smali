.class public Lcom/pccw/mobile/sip/service/Codec;
.super Ljava/lang/Object;
.source "Codec.java"


# instance fields
.field public codecName:Ljava/lang/String;

.field public key:I

.field public rate:I


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p1, "codec"    # Ljava/lang/String;
    .param p2, "rate"    # I
    .param p3, "key"    # I

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/pccw/mobile/sip/service/Codec;->codecName:Ljava/lang/String;

    .line 12
    iput p2, p0, Lcom/pccw/mobile/sip/service/Codec;->rate:I

    .line 13
    iput p3, p0, Lcom/pccw/mobile/sip/service/Codec;->key:I

    .line 14
    return-void
.end method
