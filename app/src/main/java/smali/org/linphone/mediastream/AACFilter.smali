.class public Lorg/linphone/mediastream/AACFilter;
.super Ljava/lang/Object;
.source "AACFilter.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation


# static fields
.field private static singleton:Lorg/linphone/mediastream/AACFilter;


# instance fields
.field bitrate:I

.field channelCount:I

.field decoder:Landroid/media/MediaCodec;

.field decoderBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field decoderInputBuffers:[Ljava/nio/ByteBuffer;

.field decoderOutputBuffers:[Ljava/nio/ByteBuffer;

.field encoder:Landroid/media/MediaCodec;

.field encoderBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field encoderInputBuffers:[Ljava/nio/ByteBuffer;

.field encoderOutputBuffers:[Ljava/nio/ByteBuffer;

.field initialized:Z

.field sampleRate:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/mediastream/AACFilter;->initialized:Z

    .line 55
    return-void
.end method

.method private static dequeueData(Landroid/media/MediaCodec;[Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;[B)I
    .locals 9
    .param p0, "codec"    # Landroid/media/MediaCodec;
    .param p1, "ouputBuffers"    # [Ljava/nio/ByteBuffer;
    .param p2, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;
    .param p3, "b"    # [B

    .prologue
    const/4 v2, -0x3

    const/4 v8, 0x1

    const/4 v3, 0x0

    .line 231
    const/4 v1, 0x0

    .line 232
    .local v1, "pcmbufPollCount":I
    :goto_0
    if-ge v1, v8, :cond_6

    .line 233
    const-wide/16 v4, 0x64

    invoke-virtual {p0, p2, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    .line 235
    .local v0, "decBufIdx":I
    if-ltz v0, :cond_3

    .line 236
    array-length v2, p3

    iget v4, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    if-ge v2, v4, :cond_0

    .line 237
    new-array v2, v8, [Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "array is too small "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, p3

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " < "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v2}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    .line 238
    :cond_0
    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v4, 0x2

    if-ne v2, v4, :cond_1

    .line 239
    new-array v2, v8, [Ljava/lang/Object;

    const-string/jumbo v4, "JUST READ MediaCodec.BUFFER_FLAG_CODEC_CONFIG buffer"

    aput-object v4, v2, v3

    invoke-static {v2}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 242
    :cond_1
    aget-object v2, p1, v0

    iget v4, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-virtual {v2, p3, v3, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 243
    aget-object v2, p1, v0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 245
    invoke-virtual {p0, v0, v3}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 246
    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 259
    .end local v0    # "decBufIdx":I
    :cond_2
    :goto_1
    return v2

    .line 247
    .restart local v0    # "decBufIdx":I
    :cond_3
    if-eq v0, v2, :cond_2

    .line 249
    const/4 v4, -0x2

    if-ne v0, v4, :cond_5

    .line 250
    new-array v4, v8, [Ljava/lang/Object;

    const-string/jumbo v5, "MediaCodec.INFO_OUTPUT_FORMAT_CHANGED"

    aput-object v5, v4, v3

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 251
    new-array v4, v8, [Ljava/lang/Object;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "CHANNEL_COUNT: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v6

    const-string/jumbo v7, "channel-count"

    invoke-virtual {v6, v7}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 252
    new-array v4, v8, [Ljava/lang/Object;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "SAMPLE_RATE: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v6

    const-string/jumbo v7, "sample-rate"

    invoke-virtual {v6, v7}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 257
    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 258
    goto/16 :goto_0

    .line 254
    :cond_5
    const/4 v4, -0x1

    if-ne v0, v4, :cond_4

    goto :goto_2

    .end local v0    # "decBufIdx":I
    :cond_6
    move v2, v3

    .line 259
    goto :goto_1
.end method

.method public static instance()Lorg/linphone/mediastream/AACFilter;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lorg/linphone/mediastream/AACFilter;->singleton:Lorg/linphone/mediastream/AACFilter;

    if-nez v0, :cond_0

    new-instance v0, Lorg/linphone/mediastream/AACFilter;

    invoke-direct {v0}, Lorg/linphone/mediastream/AACFilter;-><init>()V

    sput-object v0, Lorg/linphone/mediastream/AACFilter;->singleton:Lorg/linphone/mediastream/AACFilter;

    .line 50
    :cond_0
    sget-object v0, Lorg/linphone/mediastream/AACFilter;->singleton:Lorg/linphone/mediastream/AACFilter;

    return-object v0
.end method

.method private static queueData(Landroid/media/MediaCodec;[Ljava/nio/ByteBuffer;[BI)Z
    .locals 7
    .param p0, "codec"    # Landroid/media/MediaCodec;
    .param p1, "inputBuffers"    # [Ljava/nio/ByteBuffer;
    .param p2, "data"    # [B
    .param p3, "size"    # I

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    .line 220
    invoke-virtual {p0, v4, v5}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v1

    .line 221
    .local v1, "bufdex":I
    if-ltz v1, :cond_0

    .line 222
    aget-object v0, p1, v1

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 223
    aget-object v0, p1, v1

    invoke-virtual {v0, p2, v2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    move-object v0, p0

    move v3, p3

    move v6, v2

    .line 224
    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 225
    const/4 v2, 0x1

    .line 227
    :cond_0
    return v2
.end method


# virtual methods
.method public postprocess()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 201
    iget-boolean v0, p0, Lorg/linphone/mediastream/AACFilter;->initialized:Z

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 203
    new-array v0, v3, [Ljava/lang/Object;

    const-string/jumbo v1, "Stopping encoder"

    aput-object v1, v0, v2

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 204
    iget-object v0, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 205
    new-array v0, v3, [Ljava/lang/Object;

    const-string/jumbo v1, "Stopping decoder"

    aput-object v1, v0, v2

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 206
    iget-object v0, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 207
    iget-object v0, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 208
    new-array v0, v3, [Ljava/lang/Object;

    const-string/jumbo v1, "Release encoder"

    aput-object v1, v0, v2

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 209
    iget-object v0, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 210
    new-array v0, v3, [Ljava/lang/Object;

    const-string/jumbo v1, "Release decoder"

    aput-object v1, v0, v2

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 211
    iget-object v0, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 212
    iput-object v4, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    .line 213
    iput-object v4, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    .line 214
    iput-boolean v2, p0, Lorg/linphone/mediastream/AACFilter;->initialized:Z

    .line 216
    :cond_0
    return v3
.end method

.method public preprocess(IIIZ)Z
    .locals 10
    .param p1, "sampleRate"    # I
    .param p2, "channelCount"    # I
    .param p3, "bitrate"    # I
    .param p4, "sbr_enabled"    # Z

    .prologue
    .line 58
    iget-boolean v6, p0, Lorg/linphone/mediastream/AACFilter;->initialized:Z

    if-eqz v6, :cond_0

    .line 59
    const/4 v6, 0x1

    .line 139
    :goto_0
    return v6

    .line 61
    :cond_0
    iput p1, p0, Lorg/linphone/mediastream/AACFilter;->sampleRate:I

    .line 62
    iput p2, p0, Lorg/linphone/mediastream/AACFilter;->channelCount:I

    .line 63
    iput p3, p0, Lorg/linphone/mediastream/AACFilter;->bitrate:I

    .line 65
    const/4 v0, 0x0

    .line 67
    .local v0, "asc":[B
    :try_start_0
    const-string/jumbo v6, "audio/mp4a-latm"

    invoke-static {v6, p1, p2}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v5

    .line 68
    .local v5, "mediaFormat":Landroid/media/MediaFormat;
    const-string/jumbo v6, "aac-profile"

    const/16 v7, 0x27

    invoke-virtual {v5, v6, v7}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 69
    const-string/jumbo v6, "bitrate"

    invoke-virtual {v5, v6, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 78
    const-string/jumbo v6, "OMX.google.aac.encoder"

    invoke-static {v6}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v6

    iput-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    .line 79
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-virtual {v6, v5, v7, v8, v9}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 81
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    invoke-virtual {v6}, Landroid/media/MediaCodec;->start()V

    .line 83
    new-instance v6, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v6}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoderBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 85
    const/4 v2, 0x0

    .line 86
    .local v2, "ascPollCount":I
    :goto_1
    if-nez v0, :cond_2

    const/16 v6, 0x3e8

    if-ge v2, v6, :cond_2

    .line 88
    const/4 v3, -0x1

    .line 89
    .local v3, "encInBufIdx":I
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    iget-object v7, p0, Lorg/linphone/mediastream/AACFilter;->encoderBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const-wide/16 v8, 0x0

    invoke-virtual {v6, v7, v8, v9}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v3

    .line 90
    if-ltz v3, :cond_1

    .line 91
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoderBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v6, v6, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v7, 0x2

    if-ne v6, v7, :cond_1

    .line 92
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoderBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v6, v6, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array v0, v6, [B

    .line 93
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    invoke-virtual {v6}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v6

    aget-object v6, v6, v3

    const/4 v7, 0x0

    iget-object v8, p0, Lorg/linphone/mediastream/AACFilter;->encoderBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v8, v8, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-virtual {v6, v0, v7, v8}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 94
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    invoke-virtual {v6}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v6

    aget-object v6, v6, v3

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 95
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    const/4 v7, 0x0

    invoke-virtual {v6, v3, v7}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 98
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 99
    goto :goto_1

    .line 100
    .end local v3    # "encInBufIdx":I
    :cond_2
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    invoke-virtual {v6}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v6

    iput-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoderOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 101
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    invoke-virtual {v6}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v6

    iput-object v6, p0, Lorg/linphone/mediastream/AACFilter;->encoderInputBuffers:[Ljava/nio/ByteBuffer;

    .line 102
    if-nez v0, :cond_3

    .line 103
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string/jumbo v8, "Sigh, failed to read asc from encoder"

    aput-object v8, v6, v7

    invoke-static {v6}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :cond_3
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string/jumbo v8, "AAC encoder initialized"

    aput-object v8, v6, v7

    invoke-static {v6}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 112
    const/4 v5, 0x0

    .line 113
    if-eqz v0, :cond_4

    .line 114
    :try_start_1
    const-string/jumbo v6, "audio/mp4a-latm"

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static {v6, v7, v8}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v5

    .line 115
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 117
    .local v1, "ascBuf":Ljava/nio/ByteBuffer;
    const-string/jumbo v6, "csd-0"

    invoke-virtual {v5, v6, v1}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 123
    .end local v1    # "ascBuf":Ljava/nio/ByteBuffer;
    :goto_2
    const-string/jumbo v6, "OMX.google.aac.decoder"

    invoke-static {v6}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v6

    iput-object v6, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    .line 124
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v6, v5, v7, v8, v9}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 125
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    invoke-virtual {v6}, Landroid/media/MediaCodec;->start()V

    .line 127
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    invoke-virtual {v6}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v6

    iput-object v6, p0, Lorg/linphone/mediastream/AACFilter;->decoderOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 128
    iget-object v6, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    invoke-virtual {v6}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v6

    iput-object v6, p0, Lorg/linphone/mediastream/AACFilter;->decoderInputBuffers:[Ljava/nio/ByteBuffer;

    .line 130
    new-instance v6, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v6}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v6, p0, Lorg/linphone/mediastream/AACFilter;->decoderBufferInfo:Landroid/media/MediaCodec$BufferInfo;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 136
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string/jumbo v8, "AAC decoder initialized"

    aput-object v8, v6, v7

    invoke-static {v6}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 137
    const/4 v6, 0x1

    iput-boolean v6, p0, Lorg/linphone/mediastream/AACFilter;->initialized:Z

    .line 139
    const/4 v6, 0x1

    goto/16 :goto_0

    .line 105
    .end local v2    # "ascPollCount":I
    .end local v5    # "mediaFormat":Landroid/media/MediaFormat;
    :catch_0
    move-exception v4

    .line 106
    .local v4, "exc":Ljava/lang/Exception;
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v4, v6, v7

    const/4 v7, 0x1

    const-string/jumbo v8, "Unable to create AAC Encoder"

    aput-object v8, v6, v7

    invoke-static {v6}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    .line 107
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 119
    .end local v4    # "exc":Ljava/lang/Exception;
    .restart local v2    # "ascPollCount":I
    .restart local v5    # "mediaFormat":Landroid/media/MediaFormat;
    :cond_4
    :try_start_2
    const-string/jumbo v6, "audio/mp4a-latm"

    invoke-static {v6, p1, p2}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v5

    .line 120
    const-string/jumbo v6, "bitrate"

    invoke-virtual {v5, v6, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 131
    :catch_1
    move-exception v4

    .line 132
    .restart local v4    # "exc":Ljava/lang/Exception;
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v4, v6, v7

    const/4 v7, 0x1

    const-string/jumbo v8, "Unable to create AAC Decoder"

    aput-object v8, v6, v7

    invoke-static {v6}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    .line 133
    const/4 v6, 0x0

    goto/16 :goto_0
.end method

.method public pullFromDecoder([B)I
    .locals 5
    .param p1, "b"    # [B

    .prologue
    .line 159
    :try_start_0
    iget-object v2, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    iget-object v3, p0, Lorg/linphone/mediastream/AACFilter;->decoderOutputBuffers:[Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lorg/linphone/mediastream/AACFilter;->decoderBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-static {v2, v3, v4, p1}, Lorg/linphone/mediastream/AACFilter;->dequeueData(Landroid/media/MediaCodec;[Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;[B)I

    move-result v1

    .line 160
    .local v1, "result":I
    const/4 v2, -0x3

    if-ne v1, v2, :cond_0

    .line 161
    iget-object v2, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/linphone/mediastream/AACFilter;->decoderOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 162
    invoke-virtual {p0, p1}, Lorg/linphone/mediastream/AACFilter;->pullFromDecoder([B)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 167
    .end local v1    # "result":I
    :cond_0
    :goto_0
    return v1

    .line 166
    :catch_0
    move-exception v0

    .line 167
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public pullFromEncoder([B)I
    .locals 5
    .param p1, "b"    # [B

    .prologue
    .line 188
    :try_start_0
    iget-object v2, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    iget-object v3, p0, Lorg/linphone/mediastream/AACFilter;->encoderOutputBuffers:[Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lorg/linphone/mediastream/AACFilter;->encoderBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-static {v2, v3, v4, p1}, Lorg/linphone/mediastream/AACFilter;->dequeueData(Landroid/media/MediaCodec;[Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;[B)I

    move-result v1

    .line 189
    .local v1, "result":I
    const/4 v2, -0x3

    if-ne v1, v2, :cond_0

    .line 190
    iget-object v2, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/linphone/mediastream/AACFilter;->encoderOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 191
    invoke-virtual {p0, p1}, Lorg/linphone/mediastream/AACFilter;->pullFromDecoder([B)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 196
    .end local v1    # "result":I
    :cond_0
    :goto_0
    return v1

    .line 195
    :catch_0
    move-exception v0

    .line 196
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public pushToDecoder([BI)Z
    .locals 5
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    const/4 v1, 0x0

    .line 144
    if-eqz p1, :cond_0

    :try_start_0
    iget-object v2, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    if-eqz v2, :cond_0

    .line 146
    iget-object v2, p0, Lorg/linphone/mediastream/AACFilter;->decoder:Landroid/media/MediaCodec;

    iget-object v3, p0, Lorg/linphone/mediastream/AACFilter;->decoderInputBuffers:[Ljava/nio/ByteBuffer;

    invoke-static {v2, v3, p1, p2}, Lorg/linphone/mediastream/AACFilter;->queueData(Landroid/media/MediaCodec;[Ljava/nio/ByteBuffer;[BI)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 152
    :cond_0
    :goto_0
    return v1

    .line 150
    :catch_0
    move-exception v0

    .line 151
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v1

    const/4 v3, 0x1

    const-string/jumbo v4, "Push to decoder failed"

    aput-object v4, v2, v3

    invoke-static {v2}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public pushToEncoder([BI)Z
    .locals 5
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    const/4 v1, 0x0

    .line 173
    if-eqz p1, :cond_0

    :try_start_0
    iget-object v2, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    if-eqz v2, :cond_0

    .line 175
    iget-object v2, p0, Lorg/linphone/mediastream/AACFilter;->encoder:Landroid/media/MediaCodec;

    iget-object v3, p0, Lorg/linphone/mediastream/AACFilter;->encoderInputBuffers:[Ljava/nio/ByteBuffer;

    invoke-static {v2, v3, p1, p2}, Lorg/linphone/mediastream/AACFilter;->queueData(Landroid/media/MediaCodec;[Ljava/nio/ByteBuffer;[BI)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 181
    :cond_0
    :goto_0
    return v1

    .line 179
    :catch_0
    move-exception v0

    .line 180
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v1

    const/4 v3, 0x1

    const-string/jumbo v4, "Push to encoder failed"

    aput-object v4, v2, v3

    invoke-static {v2}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    goto :goto_0
.end method
