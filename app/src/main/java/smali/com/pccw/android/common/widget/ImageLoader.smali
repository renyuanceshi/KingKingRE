.class public Lcom/pccw/android/common/widget/ImageLoader;
.super Ljava/lang/Object;
.source "ImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;,
        Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;,
        Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;
    }
.end annotation


# static fields
.field private static final TYPE_CALLLOG:I = 0x0

.field private static final TYPE_MEDIA:I = 0x1

.field private static max:I


# instance fields
.field private defaultImageList:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field group_default:Landroid/graphics/Bitmap;

.field private imageViewHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/widget/ImageView;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field image_default:Landroid/graphics/Bitmap;

.field individual_default:Landroid/graphics/Bitmap;

.field private mContext:Landroid/content/Context;

.field private mMemoryCache:Landroid/support/v4/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field onPause:Z

.field video_default:Landroid/graphics/Bitmap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x0

    sput v0, Lcom/pccw/android/common/widget/ImageLoader;->max:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader;->defaultImageList:Ljava/util/HashMap;

    .line 33
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader;->imageViewHashMap:Ljava/util/HashMap;

    .line 35
    iput-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->group_default:Landroid/graphics/Bitmap;

    .line 36
    iput-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->individual_default:Landroid/graphics/Bitmap;

    .line 37
    iput-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->video_default:Landroid/graphics/Bitmap;

    .line 38
    iput-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->image_default:Landroid/graphics/Bitmap;

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/ImageLoader;->onPause:Z

    .line 56
    iput-object p1, p0, Lcom/pccw/android/common/widget/ImageLoader;->mContext:Landroid/content/Context;

    .line 57
    invoke-direct {p0, p1}, Lcom/pccw/android/common/widget/ImageLoader;->init(Landroid/content/Context;)V

    .line 58
    return-void
.end method

.method static synthetic access$000(Lcom/pccw/android/common/widget/ImageLoader;Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/ImageLoader;
    .param p1, "x1"    # Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/pccw/android/common/widget/ImageLoader;->imageViewReused(Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/pccw/android/common/widget/ImageLoader;Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/ImageLoader;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # I

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/pccw/android/common/widget/ImageLoader;->getProfileBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/android/common/widget/ImageLoader;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/ImageLoader;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader;->defaultImageList:Ljava/util/HashMap;

    return-object v0
.end method

.method private getProfileBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "placeHolder"    # I

    .prologue
    .line 161
    const/4 v0, 0x0

    .line 163
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const v1, 0x7f0200cd

    if-eq p2, v1, :cond_0

    const v1, 0x7f0200ce

    if-ne p2, v1, :cond_2

    .line 164
    :cond_0
    iget-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/pccw/mobile/util/UserPhotoUtil;->getIMContactPhotoWithPhotoUri(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 170
    :cond_1
    :goto_0
    return-object v0

    .line 166
    :cond_2
    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    .line 167
    invoke-direct {p0, p1}, Lcom/pccw/android/common/widget/ImageLoader;->loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0
.end method

.method private imageViewReused(Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;)Z
    .locals 3
    .param p1, "photoToLoad"    # Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;

    .prologue
    .line 206
    iget-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->imageViewHashMap:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 208
    .local v0, "tag":Ljava/lang/String;
    if-eqz v0, :cond_0

    iget-object v1, p1, Lcom/pccw/android/common/widget/ImageLoader$PhotoToLoad;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 209
    :cond_0
    const/4 v1, 0x1

    .line 211
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private init(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v2

    const-wide/16 v4, 0x400

    div-long/2addr v2, v4

    long-to-int v1, v2

    .line 66
    .local v1, "maxMemory":I
    div-int/lit8 v0, v1, 0x8

    .line 67
    .local v0, "cacheSize":I
    sput v0, Lcom/pccw/android/common/widget/ImageLoader;->max:I

    .line 68
    new-instance v2, Lcom/pccw/android/common/widget/ImageLoader$1;

    invoke-direct {v2, p0, v0}, Lcom/pccw/android/common/widget/ImageLoader$1;-><init>(Lcom/pccw/android/common/widget/ImageLoader;I)V

    iput-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader;->mMemoryCache:Landroid/support/v4/util/LruCache;

    .line 75
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0200cd

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader;->group_default:Landroid/graphics/Bitmap;

    .line 76
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0200ce

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader;->individual_default:Landroid/graphics/Bitmap;

    .line 77
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f02044c

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader;->video_default:Landroid/graphics/Bitmap;

    .line 78
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f02044b

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader;->image_default:Landroid/graphics/Bitmap;

    .line 79
    return-void
.end method

.method private loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 7
    .param p1, "photoData"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 174
    const/4 v2, 0x0

    .line 177
    .local v2, "is":Ljava/io/InputStream;
    const/16 v6, 0xb

    :try_start_0
    invoke-static {v6}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 178
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 184
    .local v4, "thumbUri":Landroid/net/Uri;
    :goto_0
    iget-object v6, p0, Lcom/pccw/android/common/widget/ImageLoader;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 185
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 186
    .local v3, "options":Landroid/graphics/BitmapFactory$Options;
    sget-object v6, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v6, v3, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 188
    if-eqz v2, :cond_2

    .line 189
    const/4 v6, 0x0

    invoke-static {v2, v6, v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v5

    .line 194
    if-eqz v2, :cond_0

    .line 196
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 202
    .end local v3    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v4    # "thumbUri":Landroid/net/Uri;
    :cond_0
    :goto_1
    return-object v5

    .line 180
    :cond_1
    :try_start_2
    sget-object v6, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v6, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 181
    .local v0, "contactUri":Landroid/net/Uri;
    const-string/jumbo v6, "photo"

    invoke-static {v0, v6}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v4

    .restart local v4    # "thumbUri":Landroid/net/Uri;
    goto :goto_0

    .line 197
    .end local v0    # "contactUri":Landroid/net/Uri;
    .restart local v3    # "options":Landroid/graphics/BitmapFactory$Options;
    :catch_0
    move-exception v1

    .line 198
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 194
    .end local v1    # "e":Ljava/io/IOException;
    :cond_2
    if-eqz v2, :cond_0

    .line 196
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 197
    :catch_1
    move-exception v1

    .line 198
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 191
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v4    # "thumbUri":Landroid/net/Uri;
    :catch_2
    move-exception v1

    .line 192
    .local v1, "e":Ljava/io/FileNotFoundException;
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 194
    if-eqz v2, :cond_0

    .line 196
    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_1

    .line 197
    :catch_3
    move-exception v1

    .line 198
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 194
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    if-eqz v2, :cond_3

    .line 196
    :try_start_6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 199
    :cond_3
    :goto_2
    throw v5

    .line 197
    :catch_4
    move-exception v1

    .line 198
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method private queuePhoto(Ljava/lang/String;Landroid/widget/ImageView;II)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "imageView"    # Landroid/widget/ImageView;
    .param p3, "placeHolder"    # I
    .param p4, "type"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 151
    if-nez p4, :cond_0

    .line 152
    new-instance v0, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;-><init>(Lcom/pccw/android/common/widget/ImageLoader;Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 153
    .local v0, "task":Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;
    new-array v1, v1, [Ljava/lang/String;

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 158
    .end local v0    # "task":Lcom/pccw/android/common/widget/ImageLoader$LoadCallLogProfilePicTask;
    :goto_0
    return-void

    .line 155
    :cond_0
    new-instance v0, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;-><init>(Lcom/pccw/android/common/widget/ImageLoader;Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 156
    .local v0, "task":Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;
    new-array v1, v1, [Ljava/lang/String;

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/ImageLoader$LoadMediaThumbnailTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method


# virtual methods
.method public addBitmapToMemoryCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 82
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 83
    invoke-virtual {p0, p1}, Lcom/pccw/android/common/widget/ImageLoader;->getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    :cond_0
    return-void
.end method

.method public clearCache()V
    .locals 2

    .prologue
    .line 215
    iget-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0}, Landroid/support/v4/util/LruCache;->evictAll()V

    .line 217
    iget-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->imageViewHashMap:Ljava/util/HashMap;

    monitor-enter v1

    .line 218
    :try_start_0
    iget-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader;->imageViewHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 219
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    iget-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->defaultImageList:Ljava/util/HashMap;

    monitor-enter v1

    .line 221
    :try_start_1
    iget-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader;->defaultImageList:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 222
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 223
    return-void

    .line 219
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 222
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method public getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 90
    const-string/jumbo v0, "Loader"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ImageLoader , from internal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/android/common/widget/ImageLoader;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v2}, Landroid/support/v4/util/LruCache;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " /"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/pccw/android/common/widget/ImageLoader;->max:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    iget-object v0, p0, Lcom/pccw/android/common/widget/ImageLoader;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public loadBitmap(Ljava/lang/String;Landroid/widget/ImageView;I)V
    .locals 5
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "imageView"    # Landroid/widget/ImageView;
    .param p3, "placeHolder"    # I

    .prologue
    const v1, 0x7f0200ce

    const/4 v4, 0x0

    const v2, 0x7f0200cd

    .line 95
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 96
    iget-object v3, p0, Lcom/pccw/android/common/widget/ImageLoader;->imageViewHashMap:Ljava/util/HashMap;

    invoke-virtual {v3, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    const/4 v0, 0x0

    .line 99
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0, p1}, Lcom/pccw/android/common/widget/ImageLoader;->getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 101
    if-nez v0, :cond_0

    .line 102
    iget-object v3, p0, Lcom/pccw/android/common/widget/ImageLoader;->defaultImageList:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    check-cast v0, Landroid/graphics/Bitmap;

    .line 105
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_0
    if-eqz v0, :cond_2

    .line 106
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 133
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_1
    :goto_0
    return-void

    .line 107
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_2
    iget-boolean v3, p0, Lcom/pccw/android/common/widget/ImageLoader;->onPause:Z

    if-nez v3, :cond_1

    .line 108
    if-ne p3, v2, :cond_3

    move v1, v2

    :cond_3
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 110
    sparse-switch p3, :sswitch_data_0

    .line 123
    :goto_1
    if-eqz v0, :cond_4

    .line 124
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 125
    invoke-virtual {p0, p1, v0}, Lcom/pccw/android/common/widget/ImageLoader;->addBitmapToMemoryCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 112
    :sswitch_0
    invoke-direct {p0, p1}, Lcom/pccw/android/common/widget/ImageLoader;->loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 113
    goto :goto_1

    .line 116
    :sswitch_1
    invoke-direct {p0, p1, p2, p3, v4}, Lcom/pccw/android/common/widget/ImageLoader;->queuePhoto(Ljava/lang/String;Landroid/widget/ImageView;II)V

    goto :goto_1

    .line 119
    :sswitch_2
    invoke-direct {p0, p1, p2, p3, v4}, Lcom/pccw/android/common/widget/ImageLoader;->queuePhoto(Ljava/lang/String;Landroid/widget/ImageView;II)V

    goto :goto_1

    .line 127
    :cond_4
    iget-object v3, p0, Lcom/pccw/android/common/widget/ImageLoader;->defaultImageList:Ljava/util/HashMap;

    if-ne p3, v2, :cond_5

    iget-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->group_default:Landroid/graphics/Bitmap;

    :goto_2
    invoke-virtual {v3, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_5
    iget-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->individual_default:Landroid/graphics/Bitmap;

    goto :goto_2

    .line 131
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_6
    if-ne p3, v2, :cond_7

    :goto_3
    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :cond_7
    move v2, v1

    goto :goto_3

    .line 110
    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_0
        0x7f0200cd -> :sswitch_2
        0x7f0200ce -> :sswitch_1
    .end sparse-switch
.end method

.method public loadMediaImageBitmap(Ljava/lang/String;Landroid/widget/ImageView;I)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "imageView"    # Landroid/widget/ImageView;
    .param p3, "placeHolder"    # I

    .prologue
    .line 136
    if-eqz p1, :cond_0

    const-string/jumbo v1, ""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 137
    iget-object v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->imageViewHashMap:Ljava/util/HashMap;

    invoke-virtual {v1, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    const/4 v0, 0x0

    .line 140
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0, p1}, Lcom/pccw/android/common/widget/ImageLoader;->getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 142
    if-eqz v0, :cond_1

    .line 143
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 148
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_0
    :goto_0
    return-void

    .line 144
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_1
    iget-boolean v1, p0, Lcom/pccw/android/common/widget/ImageLoader;->onPause:Z

    if-nez v1, :cond_0

    .line 145
    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, p3, v1}, Lcom/pccw/android/common/widget/ImageLoader;->queuePhoto(Ljava/lang/String;Landroid/widget/ImageView;II)V

    goto :goto_0
.end method

.method public setPause(Z)V
    .locals 0
    .param p1, "pause"    # Z

    .prologue
    .line 61
    iput-boolean p1, p0, Lcom/pccw/android/common/widget/ImageLoader;->onPause:Z

    .line 62
    return-void
.end method
