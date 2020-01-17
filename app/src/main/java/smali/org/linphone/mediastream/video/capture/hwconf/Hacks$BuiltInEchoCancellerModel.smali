.class Lorg/linphone/mediastream/video/capture/hwconf/Hacks$BuiltInEchoCancellerModel;
.super Ljava/lang/Object;
.source "Hacks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/mediastream/video/capture/hwconf/Hacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BuiltInEchoCancellerModel"
.end annotation


# instance fields
.field public manufacturer:Ljava/lang/String;

.field public model:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "manufacturer"    # Ljava/lang/String;
    .param p2, "model"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lorg/linphone/mediastream/video/capture/hwconf/Hacks$BuiltInEchoCancellerModel;->manufacturer:Ljava/lang/String;

    .line 35
    iput-object p2, p0, Lorg/linphone/mediastream/video/capture/hwconf/Hacks$BuiltInEchoCancellerModel;->model:Ljava/lang/String;

    .line 36
    return-void
.end method
