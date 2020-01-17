.class public Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;
.super Ljava/lang/Object;
.source "NTLMEngineImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/auth/NTLMEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "CipherGen"
.end annotation


# instance fields
.field protected final challenge:[B

.field protected clientChallenge:[B

.field protected clientChallenge2:[B

.field protected final domain:Ljava/lang/String;

.field protected lanManagerSessionKey:[B

.field protected lm2SessionResponse:[B

.field protected lmHash:[B

.field protected lmResponse:[B

.field protected lmUserSessionKey:[B

.field protected lmv2Hash:[B

.field protected lmv2Response:[B

.field protected ntlm2SessionResponse:[B

.field protected ntlm2SessionResponseUserSessionKey:[B

.field protected ntlmHash:[B

.field protected ntlmResponse:[B

.field protected ntlmUserSessionKey:[B

.field protected ntlmv2Blob:[B

.field protected ntlmv2Hash:[B

.field protected ntlmv2Response:[B

.field protected ntlmv2UserSessionKey:[B

.field protected final password:Ljava/lang/String;

.field protected secondaryKey:[B

.field protected final target:Ljava/lang/String;

.field protected final targetInformation:[B

.field protected timestamp:[B

.field protected final user:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[B)V
    .locals 11
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "user"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "challenge"    # [B
    .param p5, "target"    # Ljava/lang/String;
    .param p6, "targetInformation"    # [B

    .prologue
    .line 311
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    invoke-direct/range {v0 .. v10}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[B[B[B[B[B)V

    .line 312
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[B[B[B[B[B)V
    .locals 1
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "user"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "challenge"    # [B
    .param p5, "target"    # Ljava/lang/String;
    .param p6, "targetInformation"    # [B
    .param p7, "clientChallenge"    # [B
    .param p8, "clientChallenge2"    # [B
    .param p9, "secondaryKey"    # [B
    .param p10, "timestamp"    # [B

    .prologue
    const/4 v0, 0x0

    .line 296
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 276
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmHash:[B

    .line 277
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmResponse:[B

    .line 278
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmHash:[B

    .line 279
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmResponse:[B

    .line 280
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Hash:[B

    .line 281
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmv2Hash:[B

    .line 282
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmv2Response:[B

    .line 283
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Blob:[B

    .line 284
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Response:[B

    .line 285
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlm2SessionResponse:[B

    .line 286
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lm2SessionResponse:[B

    .line 287
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmUserSessionKey:[B

    .line 288
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmUserSessionKey:[B

    .line 289
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2UserSessionKey:[B

    .line 290
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlm2SessionResponseUserSessionKey:[B

    .line 291
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lanManagerSessionKey:[B

    .line 297
    iput-object p1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->domain:Ljava/lang/String;

    .line 298
    iput-object p5, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->target:Ljava/lang/String;

    .line 299
    iput-object p2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->user:Ljava/lang/String;

    .line 300
    iput-object p3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->password:Ljava/lang/String;

    .line 301
    iput-object p4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->challenge:[B

    .line 302
    iput-object p6, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->targetInformation:[B

    .line 303
    iput-object p7, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->clientChallenge:[B

    .line 304
    iput-object p8, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->clientChallenge2:[B

    .line 305
    iput-object p9, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->secondaryKey:[B

    .line 306
    iput-object p10, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->timestamp:[B

    .line 307
    return-void
.end method


# virtual methods
.method public getClientChallenge()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 317
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->clientChallenge:[B

    if-nez v0, :cond_0

    .line 318
    invoke-static {}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$000()[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->clientChallenge:[B

    .line 320
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->clientChallenge:[B

    return-object v0
.end method

.method public getClientChallenge2()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 326
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->clientChallenge2:[B

    if-nez v0, :cond_0

    .line 327
    invoke-static {}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$000()[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->clientChallenge2:[B

    .line 329
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->clientChallenge2:[B

    return-object v0
.end method

.method public getLM2SessionResponse()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 450
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lm2SessionResponse:[B

    if-nez v1, :cond_0

    .line 451
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getClientChallenge()[B

    move-result-object v0

    .line 452
    .local v0, "clientChallenge":[B
    const/16 v1, 0x18

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lm2SessionResponse:[B

    .line 453
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lm2SessionResponse:[B

    array-length v2, v0

    invoke-static {v0, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 454
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lm2SessionResponse:[B

    array-length v2, v0

    iget-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lm2SessionResponse:[B

    array-length v3, v3

    invoke-static {v1, v2, v3, v4}, Ljava/util/Arrays;->fill([BIIB)V

    .line 456
    .end local v0    # "clientChallenge":[B
    :cond_0
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lm2SessionResponse:[B

    return-object v1
.end method

.method public getLMHash()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 344
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmHash:[B

    if-nez v0, :cond_0

    .line 345
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->password:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$200(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmHash:[B

    .line 347
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmHash:[B

    return-object v0
.end method

.method public getLMResponse()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 353
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmResponse:[B

    if-nez v0, :cond_0

    .line 354
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMHash()[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->challenge:[B

    invoke-static {v0, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$300([B[B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmResponse:[B

    .line 356
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmResponse:[B

    return-object v0
.end method

.method public getLMUserSessionKey()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x10

    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 462
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmUserSessionKey:[B

    if-nez v1, :cond_0

    .line 463
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMHash()[B

    move-result-object v0

    .line 464
    .local v0, "lmHash":[B
    new-array v1, v4, [B

    iput-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmUserSessionKey:[B

    .line 465
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmUserSessionKey:[B

    invoke-static {v0, v2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 466
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmUserSessionKey:[B

    invoke-static {v1, v3, v4, v2}, Ljava/util/Arrays;->fill([BIIB)V

    .line 468
    .end local v0    # "lmHash":[B
    :cond_0
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmUserSessionKey:[B

    return-object v1
.end method

.method public getLMv2Hash()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 380
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmv2Hash:[B

    if-nez v0, :cond_0

    .line 381
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->domain:Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->user:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMHash()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$500(Ljava/lang/String;Ljava/lang/String;[B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmv2Hash:[B

    .line 383
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmv2Hash:[B

    return-object v0
.end method

.method public getLMv2Response()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 432
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmv2Response:[B

    if-nez v0, :cond_0

    .line 433
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMv2Hash()[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->challenge:[B

    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getClientChallenge()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$800([B[B[B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmv2Response:[B

    .line 435
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lmv2Response:[B

    return-object v0
.end method

.method public getLanManagerSessionKey()[B
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 512
    iget-object v10, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lanManagerSessionKey:[B

    if-nez v10, :cond_0

    .line 513
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMHash()[B

    move-result-object v5

    .line 514
    .local v5, "lmHash":[B
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMResponse()[B

    move-result-object v6

    .line 516
    .local v6, "lmResponse":[B
    const/16 v10, 0xe

    :try_start_0
    new-array v4, v10, [B

    .line 517
    .local v4, "keyBytes":[B
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v12, 0x8

    invoke-static {v5, v10, v4, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 518
    const/16 v10, 0x8

    array-length v11, v4

    const/16 v12, -0x43

    invoke-static {v4, v10, v11, v12}, Ljava/util/Arrays;->fill([BIIB)V

    .line 519
    const/4 v10, 0x0

    invoke-static {v4, v10}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$900([BI)Ljava/security/Key;

    move-result-object v7

    .line 520
    .local v7, "lowKey":Ljava/security/Key;
    const/4 v10, 0x7

    invoke-static {v4, v10}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$900([BI)Ljava/security/Key;

    move-result-object v2

    .line 521
    .local v2, "highKey":Ljava/security/Key;
    const/16 v10, 0x8

    new-array v9, v10, [B

    .line 522
    .local v9, "truncatedResponse":[B
    const/4 v10, 0x0

    const/4 v11, 0x0

    array-length v12, v9

    invoke-static {v6, v10, v9, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 523
    const-string/jumbo v10, "DES/ECB/NoPadding"

    invoke-static {v10}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 524
    .local v0, "des":Ljavax/crypto/Cipher;
    const/4 v10, 0x1

    invoke-virtual {v0, v10, v7}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 525
    invoke-virtual {v0, v9}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v8

    .line 526
    .local v8, "lowPart":[B
    const-string/jumbo v10, "DES/ECB/NoPadding"

    invoke-static {v10}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 527
    const/4 v10, 0x1

    invoke-virtual {v0, v10, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 528
    invoke-virtual {v0, v9}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v3

    .line 529
    .local v3, "highPart":[B
    const/16 v10, 0x10

    new-array v10, v10, [B

    iput-object v10, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lanManagerSessionKey:[B

    .line 530
    const/4 v10, 0x0

    iget-object v11, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lanManagerSessionKey:[B

    const/4 v12, 0x0

    array-length v13, v8

    invoke-static {v8, v10, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 531
    const/4 v10, 0x0

    iget-object v11, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lanManagerSessionKey:[B

    array-length v12, v8

    array-length v13, v3

    invoke-static {v3, v10, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 536
    .end local v0    # "des":Ljavax/crypto/Cipher;
    .end local v2    # "highKey":Ljava/security/Key;
    .end local v3    # "highPart":[B
    .end local v4    # "keyBytes":[B
    .end local v5    # "lmHash":[B
    .end local v6    # "lmResponse":[B
    .end local v7    # "lowKey":Ljava/security/Key;
    .end local v8    # "lowPart":[B
    .end local v9    # "truncatedResponse":[B
    :cond_0
    iget-object v10, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->lanManagerSessionKey:[B

    return-object v10

    .line 532
    .restart local v5    # "lmHash":[B
    .restart local v6    # "lmResponse":[B
    :catch_0
    move-exception v1

    .line 533
    .local v1, "e":Ljava/lang/Exception;
    new-instance v10, Lorg/apache/http/impl/auth/NTLMEngineException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v1}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10
.end method

.method public getNTLM2SessionResponse()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 441
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlm2SessionResponse:[B

    if-nez v0, :cond_0

    .line 442
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMHash()[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->challenge:[B

    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getClientChallenge()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->ntlm2SessionResponse([B[B[B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlm2SessionResponse:[B

    .line 444
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlm2SessionResponse:[B

    return-object v0
.end method

.method public getNTLM2SessionResponseUserSessionKey()[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 498
    iget-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlm2SessionResponseUserSessionKey:[B

    if-nez v3, :cond_0

    .line 499
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMUserSessionKey()[B

    move-result-object v1

    .line 500
    .local v1, "ntlmUserSessionKey":[B
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLM2SessionResponse()[B

    move-result-object v0

    .line 501
    .local v0, "ntlm2SessionResponseNonce":[B
    iget-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->challenge:[B

    array-length v3, v3

    array-length v4, v0

    add-int/2addr v3, v4

    new-array v2, v3, [B

    .line 502
    .local v2, "sessionNonce":[B
    iget-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->challenge:[B

    iget-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->challenge:[B

    array-length v4, v4

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 503
    iget-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->challenge:[B

    array-length v3, v3

    array-length v4, v0

    invoke-static {v0, v5, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 504
    invoke-static {v2, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->hmacMD5([B[B)[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlm2SessionResponseUserSessionKey:[B

    .line 506
    .end local v0    # "ntlm2SessionResponseNonce":[B
    .end local v1    # "ntlmUserSessionKey":[B
    .end local v2    # "sessionNonce":[B
    :cond_0
    iget-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlm2SessionResponseUserSessionKey:[B

    return-object v3
.end method

.method public getNTLMHash()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 362
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmHash:[B

    if-nez v0, :cond_0

    .line 363
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->password:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$400(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmHash:[B

    .line 365
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmHash:[B

    return-object v0
.end method

.method public getNTLMResponse()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 371
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmResponse:[B

    if-nez v0, :cond_0

    .line 372
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMHash()[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->challenge:[B

    invoke-static {v0, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$300([B[B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmResponse:[B

    .line 374
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmResponse:[B

    return-object v0
.end method

.method public getNTLMUserSessionKey()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 474
    iget-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmUserSessionKey:[B

    if-nez v2, :cond_0

    .line 475
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMHash()[B

    move-result-object v1

    .line 476
    .local v1, "ntlmHash":[B
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$MD4;

    invoke-direct {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$MD4;-><init>()V

    .line 477
    .local v0, "md4":Lorg/apache/http/impl/auth/NTLMEngineImpl$MD4;
    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$MD4;->update([B)V

    .line 478
    invoke-virtual {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$MD4;->getOutput()[B

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmUserSessionKey:[B

    .line 480
    .end local v0    # "md4":Lorg/apache/http/impl/auth/NTLMEngineImpl$MD4;
    .end local v1    # "ntlmHash":[B
    :cond_0
    iget-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmUserSessionKey:[B

    return-object v2
.end method

.method public getNTLMv2Blob()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 414
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Blob:[B

    if-nez v0, :cond_0

    .line 415
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getClientChallenge2()[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->targetInformation:[B

    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getTimestamp()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$700([B[B[B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Blob:[B

    .line 417
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Blob:[B

    return-object v0
.end method

.method public getNTLMv2Hash()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 389
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Hash:[B

    if-nez v0, :cond_0

    .line 390
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->domain:Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->user:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMHash()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$600(Ljava/lang/String;Ljava/lang/String;[B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Hash:[B

    .line 392
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Hash:[B

    return-object v0
.end method

.method public getNTLMv2Response()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 423
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Response:[B

    if-nez v0, :cond_0

    .line 424
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMv2Hash()[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->challenge:[B

    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMv2Blob()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$800([B[B[B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Response:[B

    .line 426
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2Response:[B

    return-object v0
.end method

.method public getNTLMv2UserSessionKey()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x10

    const/4 v3, 0x0

    .line 486
    iget-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2UserSessionKey:[B

    if-nez v2, :cond_0

    .line 487
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMv2Hash()[B

    move-result-object v0

    .line 488
    .local v0, "ntlmv2hash":[B
    new-array v1, v4, [B

    .line 489
    .local v1, "truncatedResponse":[B
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMv2Response()[B

    move-result-object v2

    invoke-static {v2, v3, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 490
    invoke-static {v1, v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->hmacMD5([B[B)[B

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2UserSessionKey:[B

    .line 492
    .end local v0    # "ntlmv2hash":[B
    .end local v1    # "truncatedResponse":[B
    :cond_0
    iget-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->ntlmv2UserSessionKey:[B

    return-object v2
.end method

.method public getSecondaryKey()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 335
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->secondaryKey:[B

    if-nez v0, :cond_0

    .line 336
    invoke-static {}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$100()[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->secondaryKey:[B

    .line 338
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->secondaryKey:[B

    return-object v0
.end method

.method public getTimestamp()[B
    .locals 7

    .prologue
    const/16 v6, 0x8

    .line 397
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->timestamp:[B

    if-nez v1, :cond_0

    .line 398
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 399
    .local v2, "time":J
    const-wide v4, 0xa9730b66800L

    add-long/2addr v2, v4

    .line 400
    const-wide/16 v4, 0x2710

    mul-long/2addr v2, v4

    .line 402
    new-array v1, v6, [B

    iput-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->timestamp:[B

    .line 403
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v6, :cond_0

    .line 404
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->timestamp:[B

    long-to-int v4, v2

    int-to-byte v4, v4

    aput-byte v4, v1, v0

    .line 405
    ushr-long/2addr v2, v6

    .line 403
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 408
    .end local v0    # "i":I
    .end local v2    # "time":J
    :cond_0
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->timestamp:[B

    return-object v1
.end method
