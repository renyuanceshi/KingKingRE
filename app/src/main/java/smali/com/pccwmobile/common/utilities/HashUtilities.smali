.class public Lcom/pccwmobile/common/utilities/HashUtilities;
.super Ljava/lang/Object;
.source "HashUtilities.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static md5Hash(Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 73
    const-string/jumbo v0, "MD5"

    .line 74
    .local v0, "MD5":Ljava/lang/String;
    const-string/jumbo v1, "0"

    .line 75
    .local v1, "ZERO":Ljava/lang/String;
    const/4 v8, 0x0

    .line 76
    .local v8, "md5":Ljava/security/MessageDigest;
    const/4 v3, 0x0

    .line 77
    .local v3, "charArray":[C
    const/4 v2, 0x0

    .line 78
    .local v2, "byteArray":[B
    const/4 v9, 0x0

    .line 79
    .local v9, "md5Bytes":[B
    const/4 v5, 0x0

    .line 80
    .local v5, "hexValue":Ljava/lang/StringBuffer;
    const/4 v10, 0x0

    .line 84
    .local v10, "result":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v12, "MD5"

    invoke-static {v12}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v8

    .line 85
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    .line 86
    array-length v12, v3

    new-array v2, v12, [B

    .line 88
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    array-length v12, v3

    if-ge v7, v12, :cond_0

    .line 89
    aget-char v12, v3, v7

    int-to-byte v12, v12

    aput-byte v12, v2, v7

    .line 88
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 90
    :cond_0
    invoke-virtual {v8, v2}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v9

    .line 91
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    .end local v5    # "hexValue":Ljava/lang/StringBuffer;
    .local v6, "hexValue":Ljava/lang/StringBuffer;
    const/4 v7, 0x0

    :goto_1
    :try_start_1
    array-length v12, v9

    if-ge v7, v12, :cond_2

    .line 94
    aget-byte v12, v9, v7

    and-int/lit16 v11, v12, 0xff

    .line 95
    .local v11, "val":I
    const/16 v12, 0x10

    if-ge v11, v12, :cond_1

    .line 96
    const-string/jumbo v12, "0"

    invoke-virtual {v6, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 97
    :cond_1
    invoke-static {v11}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 99
    .end local v11    # "val":I
    :cond_2
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v10

    .line 109
    const/4 v8, 0x0

    .line 110
    const/4 v3, 0x0

    .line 111
    const/4 v2, 0x0

    .line 112
    const/4 v9, 0x0

    .line 113
    const/4 v5, 0x0

    .line 115
    .end local v6    # "hexValue":Ljava/lang/StringBuffer;
    .end local v7    # "i":I
    .restart local v5    # "hexValue":Ljava/lang/StringBuffer;
    :goto_2
    return-object v10

    .line 101
    :catch_0
    move-exception v4

    .line 104
    .local v4, "e":Ljava/lang/Exception;
    :goto_3
    :try_start_2
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 105
    const/4 v10, 0x0

    .line 109
    const/4 v8, 0x0

    .line 110
    const/4 v3, 0x0

    .line 111
    const/4 v2, 0x0

    .line 112
    const/4 v9, 0x0

    .line 113
    const/4 v5, 0x0

    .line 114
    goto :goto_2

    .line 109
    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v12

    :goto_4
    const/4 v8, 0x0

    .line 110
    const/4 v3, 0x0

    .line 111
    const/4 v2, 0x0

    .line 112
    const/4 v9, 0x0

    .line 113
    const/4 v5, 0x0

    throw v12

    .line 109
    .end local v5    # "hexValue":Ljava/lang/StringBuffer;
    .restart local v6    # "hexValue":Ljava/lang/StringBuffer;
    .restart local v7    # "i":I
    :catchall_1
    move-exception v12

    move-object v5, v6

    .end local v6    # "hexValue":Ljava/lang/StringBuffer;
    .restart local v5    # "hexValue":Ljava/lang/StringBuffer;
    goto :goto_4

    .line 101
    .end local v5    # "hexValue":Ljava/lang/StringBuffer;
    .restart local v6    # "hexValue":Ljava/lang/StringBuffer;
    :catch_1
    move-exception v4

    move-object v5, v6

    .end local v6    # "hexValue":Ljava/lang/StringBuffer;
    .restart local v5    # "hexValue":Ljava/lang/StringBuffer;
    goto :goto_3
.end method

.method public static sha1(Ljava/lang/String;)[B
    .locals 7
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 26
    const-string/jumbo v4, "testing"

    const-string/jumbo v5, "FSFSDFSDFSF"

    invoke-static {v4, v5}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    if-eqz p0, :cond_0

    .line 32
    :try_start_0
    const-string/jumbo v4, "SHA-1"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 40
    .local v1, "md":Ljava/security/MessageDigest;
    const/16 v4, 0x28

    new-array v2, v4, [B

    .line 43
    .local v2, "sha1hash":[B
    :try_start_1
    const-string/jumbo v4, "iso-8859-1"

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v1, v4, v5, v6}, Ljava/security/MessageDigest;->update([BII)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 51
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    .line 52
    const/4 v1, 0x0

    .line 57
    .end local v1    # "md":Ljava/security/MessageDigest;
    .end local v2    # "sha1hash":[B
    :goto_0
    return-object v2

    .line 34
    :catch_0
    move-exception v0

    .line 37
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    move-object v2, v3

    .line 38
    goto :goto_0

    .line 45
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v1    # "md":Ljava/security/MessageDigest;
    .restart local v2    # "sha1hash":[B
    :catch_1
    move-exception v0

    .line 48
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    move-object v2, v3

    .line 49
    goto :goto_0

    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v1    # "md":Ljava/security/MessageDigest;
    .end local v2    # "sha1hash":[B
    :cond_0
    move-object v2, v3

    .line 57
    goto :goto_0
.end method

.method public static sha1String(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-static {p0}, Lcom/pccwmobile/common/utilities/HashUtilities;->sha1(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/pccwmobile/common/utilities/HexUtilities;->byteArrayToHexString([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
