.class public Lcom/pccw/mobile/sip/util/M5DUtils;
.super Ljava/lang/Object;
.source "M5DUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static byteArrayToHex([B)Ljava/lang/String;
    .locals 8
    .param p0, "byteArray"    # [B

    .prologue
    .line 22
    const/16 v5, 0x10

    new-array v1, v5, [C

    fill-array-data v1, :array_0

    .line 23
    .local v1, "hexDigits":[C
    array-length v5, p0

    mul-int/lit8 v5, v5, 0x2

    new-array v4, v5, [C

    .line 24
    .local v4, "resultCharArray":[C
    const/4 v2, 0x0

    .line 25
    .local v2, "index":I
    array-length v6, p0

    const/4 v5, 0x0

    move v3, v2

    .end local v2    # "index":I
    .local v3, "index":I
    :goto_0
    if-ge v5, v6, :cond_0

    aget-byte v0, p0, v5

    .line 26
    .local v0, "b":B
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "index":I
    .restart local v2    # "index":I
    ushr-int/lit8 v7, v0, 0x4

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v1, v7

    aput-char v7, v4, v3

    .line 27
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "index":I
    .restart local v3    # "index":I
    and-int/lit8 v7, v0, 0xf

    aget-char v7, v1, v7

    aput-char v7, v4, v2

    .line 25
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 29
    .end local v0    # "b":B
    :cond_0
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v4}, Ljava/lang/String;-><init>([C)V

    return-object v5

    .line 22
    nop

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public static ecodeByMD5(Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .param p0, "originstr"    # Ljava/lang/String;

    .prologue
    const/16 v13, 0x10

    .line 33
    const/4 v7, 0x0

    .line 34
    .local v7, "result":Ljava/lang/String;
    new-array v2, v13, [C

    fill-array-data v2, :array_0

    .line 36
    .local v2, "hexDigits":[C
    if-eqz p0, :cond_1

    .line 38
    :try_start_0
    const-string/jumbo v12, "MD5"

    invoke-static {v12}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v6

    .line 39
    .local v6, "md":Ljava/security/MessageDigest;
    const-string/jumbo v12, "utf-8"

    invoke-virtual {p0, v12}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v9

    .line 40
    .local v9, "source":[B
    invoke-virtual {v6, v9}, Ljava/security/MessageDigest;->update([B)V

    .line 41
    invoke-virtual {v6}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v11

    .line 42
    .local v11, "tmp":[B
    const/16 v12, 0x20

    new-array v10, v12, [C

    .line 43
    .local v10, "str":[C
    const/4 v3, 0x0

    .local v3, "i":I
    const/4 v4, 0x0

    .local v4, "j":I
    move v5, v4

    .end local v4    # "j":I
    .local v5, "j":I
    :goto_0
    if-ge v3, v13, :cond_0

    .line 44
    aget-byte v0, v11, v3

    .line 45
    .local v0, "b":B
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "j":I
    .restart local v4    # "j":I
    ushr-int/lit8 v12, v0, 0x4

    and-int/lit8 v12, v12, 0xf

    aget-char v12, v2, v12

    aput-char v12, v10, v5

    .line 46
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "j":I
    .restart local v5    # "j":I
    and-int/lit8 v12, v0, 0xf

    aget-char v12, v2, v12

    aput-char v12, v10, v4

    .line 43
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 48
    .end local v0    # "b":B
    :cond_0
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v10}, Ljava/lang/String;-><init>([C)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    .end local v7    # "result":Ljava/lang/String;
    .local v8, "result":Ljava/lang/String;
    move-object v7, v8

    .line 55
    .end local v3    # "i":I
    .end local v5    # "j":I
    .end local v6    # "md":Ljava/security/MessageDigest;
    .end local v8    # "result":Ljava/lang/String;
    .end local v9    # "source":[B
    .end local v10    # "str":[C
    .end local v11    # "tmp":[B
    .restart local v7    # "result":Ljava/lang/String;
    :cond_1
    :goto_1
    return-object v7

    .line 49
    :catch_0
    move-exception v1

    .line 50
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_1

    .line 51
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 52
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1

    .line 34
    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public static stringMD5(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 11
    :try_start_0
    const-string/jumbo v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 12
    .local v2, "messageDigest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 13
    .local v1, "inputByteArray":[B
    invoke-virtual {v2, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 14
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    .line 15
    .local v3, "resultByteArray":[B
    invoke-static {v3}, Lcom/pccw/mobile/sip/util/M5DUtils;->byteArrayToHex([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 17
    .end local v1    # "inputByteArray":[B
    .end local v2    # "messageDigest":Ljava/security/MessageDigest;
    .end local v3    # "resultByteArray":[B
    :goto_0
    return-object v4

    .line 16
    :catch_0
    move-exception v0

    .line 17
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    const/4 v4, 0x0

    goto :goto_0
.end method
