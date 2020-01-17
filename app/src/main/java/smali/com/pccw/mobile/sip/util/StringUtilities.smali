.class public Lcom/pccw/mobile/sip/util/StringUtilities;
.super Ljava/lang/Object;
.source "StringUtilities.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static md5Hash(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "inStr"    # Ljava/lang/String;

    .prologue
    .line 8
    const/4 v5, 0x0

    .line 10
    .local v5, "md5":Ljava/security/MessageDigest;
    :try_start_0
    const-string/jumbo v8, "MD5"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 15
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 16
    .local v1, "charArray":[C
    array-length v8, v1

    new-array v0, v8, [B

    .line 18
    .local v0, "byteArray":[B
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v8, v1

    if-ge v4, v8, :cond_0

    .line 19
    aget-char v8, v1, v4

    int-to-byte v8, v8

    aput-byte v8, v0, v4

    .line 18
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 11
    .end local v0    # "byteArray":[B
    .end local v1    # "charArray":[C
    .end local v4    # "i":I
    :catch_0
    move-exception v2

    .line 12
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 13
    const-string/jumbo v8, ""

    .line 32
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_1
    return-object v8

    .line 21
    .restart local v0    # "byteArray":[B
    .restart local v1    # "charArray":[C
    .restart local v4    # "i":I
    :cond_0
    invoke-virtual {v5, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v6

    .line 23
    .local v6, "md5Bytes":[B
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 25
    .local v3, "hexValue":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    :goto_2
    array-length v8, v6

    if-ge v4, v8, :cond_2

    .line 26
    aget-byte v8, v6, v4

    and-int/lit16 v7, v8, 0xff

    .line 27
    .local v7, "val":I
    const/16 v8, 0x10

    if-ge v7, v8, :cond_1

    .line 28
    const-string/jumbo v8, "0"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 29
    :cond_1
    invoke-static {v7}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 25
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 32
    .end local v7    # "val":I
    :cond_2
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_1
.end method
