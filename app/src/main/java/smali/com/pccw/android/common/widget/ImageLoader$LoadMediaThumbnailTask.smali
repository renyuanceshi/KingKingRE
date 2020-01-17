.class Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;
.super Landroid/os/AsyncTask;
.source "ImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/android/common/widget/ImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LoadMediaThumbnailTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

.field final synthetic this$0:Lcom/pccw/android/common/widget/ImageLoader;


# direct methods
.method public constructor <init>(Lcom/pccw/android/common/widget/ImageLoader;Ljava/lang/String;Landroid/widget/ImageView;I)V
    .locals 1
    .param p1, "this$0"    # Lcom/pccw/android/common/widget/ImageLoader;
    .param p2, "imageUrl"    # Ljava/lang/String;
    .param p3, "iv"    # Landroid/widget/ImageView;
    .param p4, "holder"    # I

    .prologue
    .line 264
    iput-object p1, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 265
    new-instance v0, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;-><init>(Lcom/pccw/android/common/widget/ImageLoader;Ljava/lang/String;Landroid/widget/ImageView;I)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    .line 266
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 4
    .param p1, "urls"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 270
    iget-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    iget-object v3, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    invoke-static {v2, v3}, Lcom/pccw/android/common/widget/ImageLoader;->access$000(Lcom/pccw/android/common/widget/ImageLoader;Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v0, v1

    .line 287
    :goto_0
    return-object v0

    .line 273
    :cond_0
    const/4 v0, 0x0

    .line 274
    .local v0, "bmp":Landroid/graphics/Bitmap;
    iget-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget v2, v2, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->placeHolder:I

    packed-switch v2, :pswitch_data_0

    .line 283
    :goto_1
    if-eqz v0, :cond_1

    .line 284
    iget-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    iget-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget-object v2, v2, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->url:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lcom/pccw/android/common/widget/ImageLoader;->addBitmapToMemoryCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 276
    :pswitch_0
    iget-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget-object v2, v2, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->url:Ljava/lang/String;

    invoke-static {v2}, Lcom/pccw/mobile/util/BitmapUtil;->getVideoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 277
    goto :goto_1

    .line 279
    :pswitch_1
    iget-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget-object v2, v2, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->url:Ljava/lang/String;

    invoke-static {v2}, Lcom/pccw/mobile/util/BitmapUtil;->getImageThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1

    :cond_1
    move-object v0, v1

    .line 287
    goto :goto_0

    .line 274
    nop

    :pswitch_data_0
    .packed-switch 0x7f02044b
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 261
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->doInBackground([Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "bmp"    # Landroid/graphics/Bitmap;

    .prologue
    .line 293
    iget-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    iget-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    invoke-static {v0, v1}, Lcom/pccw/android/common/widget/ImageLoader;->access$000(Lcom/pccw/android/common/widget/ImageLoader;Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 301
    :goto_0
    return-void

    .line 296
    :cond_0
    if-eqz p1, :cond_1

    .line 297
    iget-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget-object v0, v0, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 299
    :cond_1
    iget-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget-object v0, v0, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->imageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 261
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
