.class public Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;
.super Landroid/os/AsyncTask;
.source "GroupInfoParticipantAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SetImageTask"
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
.field imageView:Landroid/widget/ImageView;

.field mImageUrl:Ljava/lang/String;

.field final synthetic this$0:Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;


# direct methods
.method public constructor <init>(Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;
    .param p2, "imageUrl"    # Ljava/lang/String;
    .param p3, "iv"    # Landroid/widget/ImageView;

    .prologue
    .line 166
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>.SetImageTask;"
    iput-object p1, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->this$0:Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 167
    iput-object p2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->mImageUrl:Ljava/lang/String;

    .line 168
    iput-object p3, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->imageView:Landroid/widget/ImageView;

    .line 169
    return-void
.end method

.method private loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "photoData"    # Ljava/lang/String;

    .prologue
    .line 185
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>.SetImageTask;"
    const/4 v2, 0x0

    .line 188
    .local v2, "is":Ljava/io/InputStream;
    const/16 v4, 0xb

    :try_start_0
    invoke-static {v4}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 189
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 196
    .local v3, "thumbUri":Landroid/net/Uri;
    :goto_0
    iget-object v4, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->this$0:Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;

    invoke-static {v4}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->access$000(Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 198
    if-eqz v2, :cond_2

    .line 199
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 204
    if-eqz v2, :cond_0

    .line 206
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 212
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :cond_0
    :goto_1
    return-object v4

    .line 191
    :cond_1
    :try_start_2
    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v4, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 193
    .local v0, "contactUri":Landroid/net/Uri;
    const-string/jumbo v4, "photo"

    invoke-static {v0, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .restart local v3    # "thumbUri":Landroid/net/Uri;
    goto :goto_0

    .line 207
    .end local v0    # "contactUri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 208
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 204
    .end local v1    # "e":Ljava/io/IOException;
    :cond_2
    if-eqz v2, :cond_3

    .line 206
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 212
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :cond_3
    :goto_2
    const/4 v4, 0x0

    goto :goto_1

    .line 207
    .restart local v3    # "thumbUri":Landroid/net/Uri;
    :catch_1
    move-exception v1

    .line 208
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 201
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :catch_2
    move-exception v1

    .line 202
    .local v1, "e":Ljava/io/FileNotFoundException;
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 204
    if-eqz v2, :cond_3

    .line 206
    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_2

    .line 207
    :catch_3
    move-exception v1

    .line 208
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 204
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    if-eqz v2, :cond_4

    .line 206
    :try_start_6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 209
    :cond_4
    :goto_3
    throw v4

    .line 207
    :catch_4
    move-exception v1

    .line 208
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 4
    .param p1, "url"    # [Ljava/lang/String;

    .prologue
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>.SetImageTask;"
    const/16 v3, 0x46

    .line 173
    const/4 v0, 0x0

    .line 175
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->mImageUrl:Ljava/lang/String;

    const-string/jumbo v2, "content://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 176
    iget-object v1, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->mImageUrl:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 181
    :goto_0
    if-nez v0, :cond_1

    const/4 v1, 0x0

    :goto_1
    return-object v1

    .line 178
    :cond_0
    iget-object v1, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->this$0:Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;

    invoke-static {v1}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->access$000(Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->mImageUrl:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/pccw/mobile/util/BitmapUtil;->getProfileImageThumbnail(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0

    .line 181
    :cond_1
    invoke-static {v0, v3, v3}, Lcom/pccw/mobile/util/UserPhotoUtil;->getCircularBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 162
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>.SetImageTask;"
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->doInBackground([Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 219
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>.SetImageTask;"
    invoke-virtual {p0}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 220
    const/4 p1, 0x0

    .line 223
    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->imageView:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    .line 224
    iget-object v0, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 225
    iget-object v0, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->this$0:Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;

    iget-object v1, p0, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->mImageUrl:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;->addBitmapToMemoryCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 227
    :cond_1
    return-void
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 162
    .local p0, "this":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<TT;>.SetImageTask;"
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter$SetImageTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
