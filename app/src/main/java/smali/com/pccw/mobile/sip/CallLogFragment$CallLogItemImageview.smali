.class final Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;
.super Ljava/lang/Object;
.source "CallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CallLogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CallLogItemImageview"
.end annotation


# instance fields
.field public imagePath:Ljava/lang/String;

.field public imageView:Landroid/widget/ImageView;

.field public number:Ljava/lang/String;

.field public position:I


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "number"    # Ljava/lang/String;
    .param p4, "position"    # I

    .prologue
    .line 267
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 268
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;->imageView:Landroid/widget/ImageView;

    .line 269
    iput-object p2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;->imagePath:Ljava/lang/String;

    .line 270
    iput-object p3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;->number:Ljava/lang/String;

    .line 271
    iput p4, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;->position:I

    .line 272
    return-void
.end method
