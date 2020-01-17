.class Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;
.super Landroid/os/AsyncTask;
.source "ImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/android/common/widget/ImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LoadCallLogProfilePicTask"
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
    .line 228
    iput-object p1, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 229
    new-instance v0, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;-><init>(Lcom/pccw/android/common/widget/ImageLoader;Ljava/lang/String;Landroid/widget/ImageView;I)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    .line 230
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 6
    .param p1, "urls"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 235
    iget-object v3, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    iget-object v4, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    invoke-static {v3, v4}, Lcom/pccw/android/common/widget/ImageLoader;->access$000(Lcom/pccw/android/common/widget/ImageLoader;Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v0, v2

    .line 247
    :goto_0
    return-object v0

    .line 238
    :cond_0
    iget-object v3, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    iget-object v4, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget-object v4, v4, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->url:Ljava/lang/String;

    iget-object v5, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget v5, v5, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->placeHolder:I

    invoke-static {v3, v4, v5}, Lcom/pccw/android/common/widget/ImageLoader;->access$100(Lcom/pccw/android/common/widget/ImageLoader;Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 239
    .local v0, "bmp":Landroid/graphics/Bitmap;
    if-nez v0, :cond_2

    .line 240
    iget-object v3, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget v3, v3, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->placeHolder:I

    const v4, 0x7f0200cd

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    iget-object v1, v3, Lcom/pccw/android/common/widget/ImageLoader;->group_default:Landroid/graphics/Bitmap;

    .line 241
    .local v1, "placeHolder":Landroid/graphics/Bitmap;
    :goto_1
    iget-object v3, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    invoke-static {v3}, Lcom/pccw/android/common/widget/ImageLoader;->access$200(Lcom/pccw/android/common/widget/ImageLoader;)Ljava/util/HashMap;

    move-result-object v3

    iget-object v4, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget-object v4, v4, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->url:Ljava/lang/String;

    invoke-virtual {v3, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v2

    .line 242
    goto :goto_0

    .line 240
    .end local v1    # "placeHolder":Landroid/graphics/Bitmap;
    :cond_1
    iget-object v3, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    iget-object v1, v3, Lcom/pccw/android/common/widget/ImageLoader;->individual_default:Landroid/graphics/Bitmap;

    goto :goto_1

    .line 244
    :cond_2
    iget-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    iget-object v3, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget-object v3, v3, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->url:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Lcom/pccw/android/common/widget/ImageLoader;->addBitmapToMemoryCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 225
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->doInBackground([Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "bmp"    # Landroid/graphics/Bitmap;

    .prologue
    .line 252
    iget-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->this$0:Lcom/pccw/android/common/widget/ImageLoader;

    iget-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    invoke-static {v0, v1}, Lcom/pccw/android/common/widget/ImageLoader;->access$000(Lcom/pccw/android/common/widget/ImageLoader;Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 258
    :cond_0
    :goto_0
    return-void

    .line 255
    :cond_1
    if-eqz p1, :cond_0

    .line 256
    iget-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->mPhoto:Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    iget-object v0, v0, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 225
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
