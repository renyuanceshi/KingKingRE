.class Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;
.super Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;
.source "NTLMEngineImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/auth/NTLMEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Type3Message"
.end annotation


# instance fields
.field protected domainBytes:[B

.field protected hostBytes:[B

.field protected lmResp:[B

.field protected ntResp:[B

.field protected sessionKey:[B

.field protected type2Flags:I

.field protected userBytes:[B


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;[B)V
    .locals 11
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .param p5, "nonce"    # [B
    .param p6, "type2Flags"    # I
    .param p7, "target"    # Ljava/lang/String;
    .param p8, "targetInformation"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 1193
    invoke-direct {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;-><init>()V

    .line 1195
    move/from16 v0, p6

    iput v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    .line 1198
    invoke-static {p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1400(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1200
    .local v9, "unqualifiedHost":Ljava/lang/String;
    invoke-static {p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1500(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1203
    .local v2, "unqualifiedDomain":Ljava/lang/String;
    new-instance v1, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    invoke-direct/range {v1 .. v7}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[B)V

    .line 1211
    .local v1, "gen":Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;
    const/high16 v3, 0x800000

    and-int v3, v3, p6

    if-eqz v3, :cond_1

    if-eqz p8, :cond_1

    if-eqz p7, :cond_1

    .line 1214
    :try_start_0
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMv2Response()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    .line 1215
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMv2Response()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    .line 1216
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_0

    .line 1217
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLanManagerSessionKey()[B
    :try_end_0
    .catch Lorg/apache/http/impl/auth/NTLMEngineException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 1254
    .local v10, "userSessionKey":[B
    :goto_0
    and-int/lit8 v3, p6, 0x10

    if-eqz v3, :cond_7

    .line 1255
    const/high16 v3, 0x40000000    # 2.0f

    and-int v3, v3, p6

    if-eqz v3, :cond_6

    .line 1256
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getSecondaryKey()[B

    move-result-object v3

    invoke-static {v3, v10}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->RC4([B[B)[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    .line 1265
    :goto_1
    if-eqz v9, :cond_8

    :try_start_1
    const-string/jumbo v3, "UnicodeLittleUnmarked"

    invoke-virtual {v9, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    :goto_2
    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->hostBytes:[B

    .line 1267
    if-eqz v2, :cond_9

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "UnicodeLittleUnmarked"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    :goto_3
    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->domainBytes:[B

    .line 1269
    const-string/jumbo v3, "UnicodeLittleUnmarked"

    invoke-virtual {p3, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->userBytes:[B
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1273
    return-void

    .line 1219
    .end local v10    # "userSessionKey":[B
    :cond_0
    :try_start_2
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMv2UserSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1223
    .end local v10    # "userSessionKey":[B
    :cond_1
    const/high16 v3, 0x80000

    and-int v3, v3, p6

    if-eqz v3, :cond_3

    .line 1225
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLM2SessionResponse()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    .line 1226
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLM2SessionResponse()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    .line 1227
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_2

    .line 1228
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLanManagerSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1230
    .end local v10    # "userSessionKey":[B
    :cond_2
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLM2SessionResponseUserSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1233
    .end local v10    # "userSessionKey":[B
    :cond_3
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMResponse()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    .line 1234
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMResponse()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    .line 1235
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_4

    .line 1236
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLanManagerSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1238
    .end local v10    # "userSessionKey":[B
    :cond_4
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMUserSessionKey()[B
    :try_end_2
    .catch Lorg/apache/http/impl/auth/NTLMEngineException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1242
    .end local v10    # "userSessionKey":[B
    :catch_0
    move-exception v8

    .line 1245
    .local v8, "e":Lorg/apache/http/impl/auth/NTLMEngineException;
    const/4 v3, 0x0

    new-array v3, v3, [B

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    .line 1246
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMResponse()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    .line 1247
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_5

    .line 1248
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLanManagerSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto/16 :goto_0

    .line 1250
    .end local v10    # "userSessionKey":[B
    :cond_5
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMUserSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto/16 :goto_0

    .line 1258
    .end local v8    # "e":Lorg/apache/http/impl/auth/NTLMEngineException;
    :cond_6
    iput-object v10, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    goto/16 :goto_1

    .line 1261
    :cond_7
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    goto/16 :goto_1

    .line 1265
    :cond_8
    const/4 v3, 0x0

    goto/16 :goto_2

    .line 1267
    :cond_9
    const/4 v3, 0x0

    goto :goto_3

    .line 1270
    :catch_1
    move-exception v8

    .line 1271
    .local v8, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lorg/apache/http/impl/auth/NTLMEngineException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unicode not supported: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v8}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v8}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method


# virtual methods
.method getResponse()Ljava/lang/String;
    .locals 17

    .prologue
    .line 1278
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    array-length v8, v14

    .line 1279
    .local v8, "ntRespLen":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    array-length v6, v14

    .line 1281
    .local v6, "lmRespLen":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->domainBytes:[B

    if-eqz v14, :cond_1

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->domainBytes:[B

    array-length v1, v14

    .line 1282
    .local v1, "domainLen":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->hostBytes:[B

    if-eqz v14, :cond_2

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->hostBytes:[B

    array-length v4, v14

    .line 1283
    .local v4, "hostLen":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->userBytes:[B

    array-length v12, v14

    .line 1285
    .local v12, "userLen":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    if-eqz v14, :cond_3

    .line 1286
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    array-length v10, v14

    .line 1292
    .local v10, "sessionKeyLen":I
    :goto_2
    const/16 v7, 0x48

    .line 1293
    .local v7, "lmRespOffset":I
    add-int/lit8 v9, v6, 0x48

    .line 1294
    .local v9, "ntRespOffset":I
    add-int v2, v9, v8

    .line 1295
    .local v2, "domainOffset":I
    add-int v13, v2, v1

    .line 1296
    .local v13, "userOffset":I
    add-int v5, v13, v12

    .line 1297
    .local v5, "hostOffset":I
    add-int v11, v5, v4

    .line 1298
    .local v11, "sessionKeyOffset":I
    add-int v3, v11, v10

    .line 1301
    .local v3, "finalLength":I
    const/4 v14, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->prepareResponse(II)V

    .line 1304
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1305
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1308
    const/16 v14, 0x48

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1311
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1312
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1315
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1318
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1319
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1322
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1325
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1326
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1329
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1332
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1333
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1336
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1339
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1340
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1343
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1346
    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit16 v14, v14, 0x80

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit16 v15, v15, 0x200

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const/high16 v16, 0x80000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    const/high16 v15, 0x2000000

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const v16, 0x8000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x20

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x10

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const/high16 v16, 0x20000000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const/high16 v16, -0x80000000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const/high16 v16, 0x40000000    # 2.0f

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const/high16 v16, 0x800000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x1

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x4

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1374
    const/16 v14, 0x105

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1376
    const/16 v14, 0xa28

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1378
    const/16 v14, 0xf00

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1381
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1382
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1383
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->domainBytes:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1384
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->userBytes:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1385
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->hostBytes:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1386
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    if-eqz v14, :cond_0

    .line 1387
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1390
    :cond_0
    invoke-super/range {p0 .. p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->getResponse()Ljava/lang/String;

    move-result-object v14

    return-object v14

    .line 1281
    .end local v1    # "domainLen":I
    .end local v2    # "domainOffset":I
    .end local v3    # "finalLength":I
    .end local v4    # "hostLen":I
    .end local v5    # "hostOffset":I
    .end local v7    # "lmRespOffset":I
    .end local v9    # "ntRespOffset":I
    .end local v10    # "sessionKeyLen":I
    .end local v11    # "sessionKeyOffset":I
    .end local v12    # "userLen":I
    .end local v13    # "userOffset":I
    :cond_1
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 1282
    .restart local v1    # "domainLen":I
    :cond_2
    const/4 v4, 0x0

    goto/16 :goto_1

    .line 1288
    .restart local v4    # "hostLen":I
    .restart local v12    # "userLen":I
    :cond_3
    const/4 v10, 0x0

    .restart local v10    # "sessionKeyLen":I
    goto/16 :goto_2
.end method
