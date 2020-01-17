.class public Lcom/pccw/mobile/sip/FacebookShareXmlResponse;
.super Ljava/lang/Object;
.source "FacebookShareXmlResponse.java"


# instance fields
.field public caption:Ljava/lang/String;

.field public dayDiff:Ljava/lang/String;

.field public description:Ljava/lang/String;

.field public imageurl:Ljava/lang/String;

.field public message:Ljava/lang/String;

.field public title:Ljava/lang/String;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->title:Ljava/lang/String;

    .line 6
    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->caption:Ljava/lang/String;

    .line 7
    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->description:Ljava/lang/String;

    .line 8
    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->message:Ljava/lang/String;

    .line 9
    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->url:Ljava/lang/String;

    .line 10
    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->imageurl:Ljava/lang/String;

    .line 11
    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->dayDiff:Ljava/lang/String;

    return-void
.end method
