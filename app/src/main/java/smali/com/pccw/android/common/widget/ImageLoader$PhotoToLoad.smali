.class public Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;
.super Ljava/lang/Object;
.source "ImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/android/common/widget/ImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PhotoToLoad"
.end annotation


# instance fields
.field public imageView:Landroid/widget/ImageView;

.field public placeHolder:I

.field final synthetic this$0:Lcom/pccw/android/common/widget/ImageLoader;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/pccw/android/common/widget/ImageLoader;Ljava/lang/String;Landroid/widget/ImageView;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/android/common/widget/ImageLoader;
    .param p2, "u"    # Ljava/lang/String;
    .param p3, "i"    # Landroid/widget/ImageView;
    .param p4, "p"    # I

    .prologue
    .line 48
    iput-object p1, p0, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p2, p0, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->url:Ljava/lang/String;

    .line 50
    iput-object p3, p0, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->imageView:Landroid/widget/ImageView;

    .line 51
    iput p4, p0, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->placeHolder:I

    .line 52
    return-void
.end method
