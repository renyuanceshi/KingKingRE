.class public Lcom/pccw/mobile/util/BitmapUtil;
.super Ljava/lang/Object;
.source "BitmapUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I
    .locals 4
    .param p0, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p1, "reqWidth"    # I
    .param p2, "reqHeight"    # I

    .prologue
    .line 92
    iget v0, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 93
    .local v0, "height":I
    iget v2, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 94
    .local v2, "width":I
    const/4 v1, 0x1

    .line 96
    .local v1, "inSampleSize":I
    :goto_0
    div-int v3, v2, v1

    div-int/lit8 v3, v3, 0x2

    if-ge v3, p1, :cond_0

    div-int v3, v0, v1

    div-int/lit8 v3, v3, 0x2

    if-lt v3, p1, :cond_1

    .line 98
    :cond_0
    mul-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 114
    :cond_1
    return v1
.end method

.method public static convertBitmap2Byte(Landroid/graphics/Bitmap;)[B
    .locals 5
    .param p0, "bmp"    # Landroid/graphics/Bitmap;

    .prologue
    .line 269
    :try_start_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 270
    .local v2, "stream":Ljava/io/ByteArrayOutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {p0, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 271
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 273
    .local v0, "byteArray":[B
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 274
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 282
    .end local v0    # "byteArray":[B
    .end local v2    # "stream":Ljava/io/ByteArrayOutputStream;
    :goto_0
    return-object v0

    .line 279
    :catch_0
    move-exception v1

    .line 280
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 282
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static generateVideoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 6
    .param p0, "videoPath"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    .line 125
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 126
    const/4 v3, 0x1

    invoke-static {p0, v3}, Landroid/media/ThumbnailUtils;->createVideoThumbnail(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 127
    .local v1, "thumb":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_0

    .line 128
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Lcom/pccw/sms/bean/SMSConstants;->getThumbnailDependantDimension(II)Ljava/util/HashMap;

    move-result-object v0

    .line 129
    .local v0, "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string/jumbo v3, "width"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string/jumbo v3, "height"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v1, v4, v3, v5}, Landroid/media/ThumbnailUtils;->extractThumbnail(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 141
    .end local v0    # "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :goto_0
    return-object v3

    .line 132
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->STORAGE_ROOT_BASE:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-static {v3, v4}, Landroid/media/ThumbnailUtils;->createVideoThumbnail(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 134
    .local v2, "thumb1":Landroid/graphics/Bitmap;
    if-eqz v2, :cond_1

    .line 135
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Lcom/pccw/sms/bean/SMSConstants;->getThumbnailDependantDimension(II)Ljava/util/HashMap;

    move-result-object v0

    .line 136
    .restart local v0    # "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string/jumbo v3, "width"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string/jumbo v3, "height"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v2, v4, v3, v5}, Landroid/media/ThumbnailUtils;->extractThumbnail(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    move-result-object v3

    goto :goto_0

    .line 139
    .end local v0    # "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_1
    const/4 v2, 0x0

    .line 140
    const/4 v1, 0x0

    .line 141
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private static getBitmapOrientation(Ljava/lang/String;)I
    .locals 5
    .param p0, "imagePath"    # Ljava/lang/String;

    .prologue
    .line 190
    const/4 v2, 0x0

    .line 192
    .local v2, "orientation":I
    :try_start_0
    new-instance v1, Landroid/media/ExifInterface;

    invoke-direct {v1, p0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 193
    .local v1, "exif":Landroid/media/ExifInterface;
    const-string/jumbo v3, "Orientation"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 197
    .end local v1    # "exif":Landroid/media/ExifInterface;
    :goto_0
    return v2

    .line 194
    :catch_0
    move-exception v0

    .line 195
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static getExternalImageThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0xc8

    .line 233
    invoke-static {p0, v2}, Lcom/pccw/mobile/util/BitmapUtil;->getSampledBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 234
    .local v0, "source":Landroid/graphics/Bitmap;
    invoke-static {v0, v2, v2}, Landroid/media/ThumbnailUtils;->extractThumbnail(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 235
    .local v1, "thumb":Landroid/graphics/Bitmap;
    return-object v1
.end method

.method public static getImageThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 6
    .param p0, "imagePath"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    .line 170
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 171
    sget v3, Lcom/pccw/sms/bean/SMSConstants;->MEDIA_IMAGE_THUMBNAIL_DIMENSIONS:I

    invoke-static {p0, v3}, Lcom/pccw/mobile/util/BitmapUtil;->getSampledBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 172
    .local v1, "source":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_0

    .line 173
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Lcom/pccw/sms/bean/SMSConstants;->getThumbnailDependantDimension(II)Ljava/util/HashMap;

    move-result-object v0

    .line 174
    .local v0, "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string/jumbo v3, "width"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string/jumbo v3, "height"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v1, v4, v3, v5}, Landroid/media/ThumbnailUtils;->extractThumbnail(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 185
    .end local v0    # "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :goto_0
    return-object v3

    .line 177
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->STORAGE_ROOT_BASE:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/pccw/sms/bean/SMSConstants;->MEDIA_IMAGE_THUMBNAIL_DIMENSIONS:I

    invoke-static {v3, v4}, Lcom/pccw/mobile/util/BitmapUtil;->getSampledBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 178
    .local v2, "source1":Landroid/graphics/Bitmap;
    if-eqz v2, :cond_1

    .line 179
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Lcom/pccw/sms/bean/SMSConstants;->getThumbnailDependantDimension(II)Ljava/util/HashMap;

    move-result-object v0

    .line 180
    .restart local v0    # "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string/jumbo v3, "width"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string/jumbo v3, "height"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v2, v4, v3, v5}, Landroid/media/ThumbnailUtils;->extractThumbnail(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    move-result-object v3

    goto :goto_0

    .line 183
    .end local v0    # "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_1
    const/4 v1, 0x0

    .line 184
    const/4 v2, 0x0

    .line 185
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static getProfileImageThumbnail(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x60

    .line 223
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/pccw/sms/bean/SMSConstants;->INTERNAL_PROFILE_IMAGE_FILE_DIR(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v4}, Lcom/pccw/mobile/util/BitmapUtil;->getSampledBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 224
    .local v0, "source":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 225
    invoke-static {v0, v4, v4}, Landroid/media/ThumbnailUtils;->extractThumbnail(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 228
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getResizedProfileImageFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 243
    invoke-static {p1}, Lcom/pccw/mobile/util/BitmapUtil;->getExternalImageThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 244
    .local v6, "resizedBitmap":Landroid/graphics/Bitmap;
    if-eqz v6, :cond_0

    .line 245
    const/4 v1, 0x0

    .line 246
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    const/4 v4, 0x0

    .line 247
    .local v4, "fos":Ljava/io/FileOutputStream;
    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v7

    const-string/jumbo v8, "temp.png"

    invoke-direct {v3, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 250
    .local v3, "f":Ljava/io/File;
    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 251
    invoke-static {v6}, Lcom/pccw/mobile/util/BitmapUtil;->convertBitmap2Byte(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    .line 252
    .local v0, "bitmapdata":[B
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .local v5, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-virtual {v5, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 254
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V

    .line 255
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v4, v5

    .line 263
    .end local v0    # "bitmapdata":[B
    .end local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "f":Ljava/io/File;
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    :goto_0
    return-object v3

    .line 257
    .restart local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "f":Ljava/io/File;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v2

    .line 258
    .local v2, "e":Ljava/io/IOException;
    :goto_1
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 263
    .end local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "f":Ljava/io/File;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 257
    .restart local v0    # "bitmapdata":[B
    .restart local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "f":Ljava/io/File;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v2

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method public static getRotatedBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 8
    .param p0, "source"    # Landroid/graphics/Bitmap;
    .param p1, "orientation"    # I

    .prologue
    const/4 v1, 0x0

    .line 201
    if-nez p0, :cond_0

    const/4 p0, 0x0

    .line 219
    .end local p0    # "source":Landroid/graphics/Bitmap;
    :goto_0
    return-object p0

    .line 202
    .restart local p0    # "source":Landroid/graphics/Bitmap;
    :cond_0
    const/4 v7, 0x0

    .line 203
    .local v7, "degree":I
    packed-switch p1, :pswitch_data_0

    .line 215
    :goto_1
    :pswitch_0
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 216
    .local v5, "matrix":Landroid/graphics/Matrix;
    int-to-float v0, v7

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 217
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p0

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 219
    goto :goto_0

    .line 205
    .end local v5    # "matrix":Landroid/graphics/Matrix;
    :pswitch_1
    const/16 v7, 0xb4

    .line 206
    goto :goto_1

    .line 208
    :pswitch_2
    const/16 v7, 0x5a

    .line 209
    goto :goto_1

    .line 211
    :pswitch_3
    const/16 v7, 0x10e

    goto :goto_1

    .line 203
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public static getSampledBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 11
    .param p0, "photoPath"    # Ljava/lang/String;
    .param p1, "requiredSize"    # I

    .prologue
    const/4 v8, 0x0

    .line 37
    :try_start_0
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 38
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 39
    .local v2, "f_path":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 40
    invoke-static {p0}, Lcom/pccw/mobile/util/BitmapUtil;->getBitmapOrientation(Ljava/lang/String;)I

    move-result v5

    .line 42
    .local v5, "orientation":I
    invoke-static {p0}, Lcom/pccw/mobile/util/BitmapUtil;->queryBitmap(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v4

    .line 46
    .local v4, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v9, 0x0

    iput-boolean v9, v4, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 47
    sget-object v9, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v9, v4, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 48
    move v7, p1

    .line 49
    .local v7, "screenWidth":I
    iget v9, v4, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    mul-int/2addr v9, v7

    iget v10, v4, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int v6, v9, v10

    .line 50
    .local v6, "scaledH":I
    invoke-static {v4, v7, v6}, Lcom/pccw/mobile/util/BitmapUtil;->calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I

    move-result v9

    iput v9, v4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 52
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 53
    .local v3, "inputStream":Ljava/io/InputStream;
    const/4 v9, 0x0

    invoke-static {v3, v9, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 54
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 55
    :cond_0
    const/4 v3, 0x0

    .line 57
    invoke-static {v0, v5}, Lcom/pccw/mobile/util/BitmapUtil;->getRotatedBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 65
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "f_path":Ljava/io/File;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v5    # "orientation":I
    .end local v6    # "scaledH":I
    .end local v7    # "screenWidth":I
    :goto_0
    return-object v0

    .restart local v2    # "f_path":Ljava/io/File;
    :cond_1
    move-object v0, v8

    .line 60
    goto :goto_0

    .line 63
    .end local v2    # "f_path":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 64
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    move-object v0, v8

    .line 65
    goto :goto_0
.end method

.method public static getVideoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 6
    .param p0, "videoPath"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    .line 145
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 147
    sget v3, Lcom/pccw/sms/bean/SMSConstants;->MEDIA_IMAGE_THUMBNAIL_DIMENSIONS:I

    invoke-static {p0, v3}, Lcom/pccw/mobile/util/BitmapUtil;->getSampledBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 148
    .local v1, "source":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_0

    .line 149
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Lcom/pccw/sms/bean/SMSConstants;->getThumbnailDependantDimension(II)Ljava/util/HashMap;

    move-result-object v0

    .line 150
    .local v0, "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string/jumbo v3, "width"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string/jumbo v3, "height"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v1, v4, v3, v5}, Landroid/media/ThumbnailUtils;->extractThumbnail(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 162
    .end local v0    # "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :goto_0
    return-object v3

    .line 154
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->STORAGE_ROOT_BASE:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/pccw/sms/bean/SMSConstants;->MEDIA_IMAGE_THUMBNAIL_DIMENSIONS:I

    invoke-static {v3, v4}, Lcom/pccw/mobile/util/BitmapUtil;->getSampledBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 155
    .local v2, "source1":Landroid/graphics/Bitmap;
    if-eqz v2, :cond_1

    .line 156
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Lcom/pccw/sms/bean/SMSConstants;->getThumbnailDependantDimension(II)Ljava/util/HashMap;

    move-result-object v0

    .line 157
    .restart local v0    # "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string/jumbo v3, "width"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string/jumbo v3, "height"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v2, v4, v3, v5}, Landroid/media/ThumbnailUtils;->extractThumbnail(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    move-result-object v3

    goto :goto_0

    .line 160
    .end local v0    # "dimens":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_1
    const/4 v2, 0x0

    .line 161
    const/4 v1, 0x0

    .line 162
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static isImageSizeEnough(Ljava/lang/String;)Z
    .locals 5
    .param p0, "photoPath"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x60

    .line 287
    const/4 v1, 0x1

    .line 288
    .local v1, "isValid":Z
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 289
    .local v0, "f_path":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 290
    invoke-static {p0}, Lcom/pccw/mobile/util/BitmapUtil;->queryBitmap(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v2

    .line 291
    .local v2, "options":Landroid/graphics/BitmapFactory$Options;
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lt v3, v4, :cond_0

    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-ge v3, v4, :cond_1

    .line 292
    :cond_0
    const/4 v1, 0x0

    .line 294
    .end local v2    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_1
    return v1
.end method

.method public static queryBitmap(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;
    .locals 4
    .param p0, "photoPath"    # Ljava/lang/String;

    .prologue
    .line 73
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 74
    .local v2, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v3, 0x1

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 78
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 79
    .local v1, "inputStream":Ljava/io/InputStream;
    const/4 v3, 0x0

    invoke-static {v1, v3, v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 80
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 81
    :cond_0
    const/4 v1, 0x0

    .line 88
    .end local v1    # "inputStream":Ljava/io/InputStream;
    :goto_0
    return-object v2

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 85
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 86
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
