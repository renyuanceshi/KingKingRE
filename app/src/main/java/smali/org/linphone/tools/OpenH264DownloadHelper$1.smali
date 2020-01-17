.class Lorg/linphone/tools/OpenH264DownloadHelper$1;
.super Ljava/lang/Object;
.source "OpenH264DownloadHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/tools/OpenH264DownloadHelper;->downloadCodec()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/tools/OpenH264DownloadHelper;


# direct methods
.method constructor <init>(Lorg/linphone/tools/OpenH264DownloadHelper;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/tools/OpenH264DownloadHelper;

    .prologue
    .line 183
    iput-object p1, p0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 188
    :try_start_0
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v15}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$000(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v15}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$100(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 189
    .local v9, "path":Ljava/lang/String;
    new-instance v12, Ljava/net/URL;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v14}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$200(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v14}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 190
    .local v12, "url":Ljava/net/URL;
    invoke-virtual {v12}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v13

    check-cast v13, Ljava/net/HttpURLConnection;

    .line 191
    .local v13, "urlConnection":Ljava/net/HttpURLConnection;
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->connect()V

    .line 192
    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string/jumbo v16, "OpenH264Downloader"

    aput-object v16, v14, v15

    const/4 v15, 0x1

    const-string/jumbo v16, " "

    aput-object v16, v14, v15

    invoke-static {v14}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 193
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 194
    .local v7, "inputStream":Ljava/io/InputStream;
    new-instance v5, Ljava/io/FileOutputStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v15}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$000(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v15}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$300(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v5, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 195
    .local v5, "fileOutputStream":Ljava/io/FileOutputStream;
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v11

    .line 196
    .local v11, "totalSize":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v14}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$400(Lorg/linphone/tools/OpenH264DownloadHelper;)Lorg/linphone/core/OpenH264DownloadHelperListener;

    move-result-object v14

    const/4 v15, 0x0

    invoke-interface {v14, v15, v11}, Lorg/linphone/core/OpenH264DownloadHelperListener;->OnProgress(II)V

    .line 198
    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string/jumbo v16, "OpenH264Downloader"

    aput-object v16, v14, v15

    const/4 v15, 0x1

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, " Download file:"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$300(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v14}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 200
    const/16 v14, 0x1000

    new-array v1, v14, [B

    .line 202
    .local v1, "buffer":[B
    const/4 v10, 0x0

    .line 203
    .local v10, "total":I
    :goto_0
    invoke-virtual {v7, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "bufferLength":I
    if-lez v2, :cond_0

    .line 204
    add-int/2addr v10, v2

    .line 205
    const/4 v14, 0x0

    invoke-virtual {v5, v1, v14, v2}, Ljava/io/FileOutputStream;->write([BII)V

    .line 206
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v14}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$400(Lorg/linphone/tools/OpenH264DownloadHelper;)Lorg/linphone/core/OpenH264DownloadHelperListener;

    move-result-object v14

    invoke-interface {v14, v10, v11}, Lorg/linphone/core/OpenH264DownloadHelperListener;->OnProgress(II)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 231
    .end local v1    # "buffer":[B
    .end local v2    # "bufferLength":I
    .end local v5    # "fileOutputStream":Ljava/io/FileOutputStream;
    .end local v7    # "inputStream":Ljava/io/InputStream;
    .end local v9    # "path":Ljava/lang/String;
    .end local v10    # "total":I
    .end local v11    # "totalSize":I
    .end local v12    # "url":Ljava/net/URL;
    .end local v13    # "urlConnection":Ljava/net/HttpURLConnection;
    :catch_0
    move-exception v4

    .line 232
    .local v4, "e":Ljava/io/FileNotFoundException;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v14}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$400(Lorg/linphone/tools/OpenH264DownloadHelper;)Lorg/linphone/core/OpenH264DownloadHelperListener;

    move-result-object v14

    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v14, v15}, Lorg/linphone/core/OpenH264DownloadHelperListener;->OnError(Ljava/lang/String;)V

    .line 236
    .end local v4    # "e":Ljava/io/FileNotFoundException;
    :goto_1
    return-void

    .line 209
    .restart local v1    # "buffer":[B
    .restart local v2    # "bufferLength":I
    .restart local v5    # "fileOutputStream":Ljava/io/FileOutputStream;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v9    # "path":Ljava/lang/String;
    .restart local v10    # "total":I
    .restart local v11    # "totalSize":I
    .restart local v12    # "url":Ljava/net/URL;
    .restart local v13    # "urlConnection":Ljava/net/HttpURLConnection;
    :cond_0
    :try_start_1
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 210
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 212
    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string/jumbo v16, "OpenH264Downloader"

    aput-object v16, v14, v15

    const/4 v15, 0x1

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, " Uncompress file:"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$300(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v14}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 214
    new-instance v6, Ljava/io/FileInputStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v15}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$000(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v15}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$300(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v6, v14}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 215
    .local v6, "in":Ljava/io/FileInputStream;
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 216
    .local v8, "out":Ljava/io/FileOutputStream;
    new-instance v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;

    invoke-direct {v3, v6}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;-><init>(Ljava/io/InputStream;)V

    .line 218
    .local v3, "bzIn":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;
    :goto_2
    invoke-virtual {v3, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_1

    .line 219
    const/4 v14, 0x0

    invoke-virtual {v8, v1, v14, v2}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 233
    .end local v1    # "buffer":[B
    .end local v2    # "bufferLength":I
    .end local v3    # "bzIn":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;
    .end local v5    # "fileOutputStream":Ljava/io/FileOutputStream;
    .end local v6    # "in":Ljava/io/FileInputStream;
    .end local v7    # "inputStream":Ljava/io/InputStream;
    .end local v8    # "out":Ljava/io/FileOutputStream;
    .end local v9    # "path":Ljava/lang/String;
    .end local v10    # "total":I
    .end local v11    # "totalSize":I
    .end local v12    # "url":Ljava/net/URL;
    .end local v13    # "urlConnection":Ljava/net/HttpURLConnection;
    :catch_1
    move-exception v4

    .line 234
    .local v4, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v14}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$400(Lorg/linphone/tools/OpenH264DownloadHelper;)Lorg/linphone/core/OpenH264DownloadHelperListener;

    move-result-object v14

    invoke-virtual {v4}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v14, v15}, Lorg/linphone/core/OpenH264DownloadHelperListener;->OnError(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 221
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v1    # "buffer":[B
    .restart local v2    # "bufferLength":I
    .restart local v3    # "bzIn":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;
    .restart local v5    # "fileOutputStream":Ljava/io/FileOutputStream;
    .restart local v6    # "in":Ljava/io/FileInputStream;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v8    # "out":Ljava/io/FileOutputStream;
    .restart local v9    # "path":Ljava/lang/String;
    .restart local v10    # "total":I
    .restart local v11    # "totalSize":I
    .restart local v12    # "url":Ljava/net/URL;
    .restart local v13    # "urlConnection":Ljava/net/HttpURLConnection;
    :cond_1
    :try_start_2
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V

    .line 222
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 223
    invoke-virtual {v3}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->close()V

    .line 225
    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string/jumbo v16, "OpenH264Downloader"

    aput-object v16, v14, v15

    const/4 v15, 0x1

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, " Remove file:"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$300(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v14}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 226
    new-instance v14, Ljava/io/File;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$000(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, "/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$300(Lorg/linphone/tools/OpenH264DownloadHelper;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/io/File;->delete()Z

    .line 228
    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string/jumbo v16, "OpenH264Downloader"

    aput-object v16, v14, v15

    const/4 v15, 0x1

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, " Loading plugin:"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v14}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 229
    invoke-static {v9}, Ljava/lang/System;->load(Ljava/lang/String;)V

    .line 230
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/linphone/tools/OpenH264DownloadHelper$1;->this$0:Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-static {v14}, Lorg/linphone/tools/OpenH264DownloadHelper;->access$400(Lorg/linphone/tools/OpenH264DownloadHelper;)Lorg/linphone/core/OpenH264DownloadHelperListener;

    move-result-object v14

    const/4 v15, 0x2

    const/16 v16, 0x1

    invoke-interface/range {v14 .. v16}, Lorg/linphone/core/OpenH264DownloadHelperListener;->OnProgress(II)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_1
.end method
