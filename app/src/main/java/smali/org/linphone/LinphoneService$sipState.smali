.class public Lorg/linphone/LinphoneService$sipState;
.super Ljava/lang/Object;
.source "LinphoneService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/LinphoneService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "sipState"
.end annotation


# instance fields
.field public domain:Ljava/lang/String;

.field public identity:Ljava/lang/String;

.field public proxy:Ljava/lang/String;

.field public regState:Ljava/lang/String;

.field public route:Ljava/lang/String;

.field final synthetic this$0:Lorg/linphone/LinphoneService;


# direct methods
.method public constructor <init>(Lorg/linphone/LinphoneService;)V
    .locals 1
    .param p1, "this$0"    # Lorg/linphone/LinphoneService;

    .prologue
    const/4 v0, 0x0

    .line 490
    iput-object p1, p0, Lorg/linphone/LinphoneService$sipState;->this$0:Lorg/linphone/LinphoneService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 491
    iput-object v0, p0, Lorg/linphone/LinphoneService$sipState;->domain:Ljava/lang/String;

    .line 492
    iput-object v0, p0, Lorg/linphone/LinphoneService$sipState;->identity:Ljava/lang/String;

    .line 493
    iput-object v0, p0, Lorg/linphone/LinphoneService$sipState;->proxy:Ljava/lang/String;

    .line 494
    iput-object v0, p0, Lorg/linphone/LinphoneService$sipState;->route:Ljava/lang/String;

    .line 495
    iput-object v0, p0, Lorg/linphone/LinphoneService$sipState;->regState:Ljava/lang/String;

    return-void
.end method
