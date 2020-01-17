.class public Lde/timroes/base64/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field private static final code:[C

.field private static final map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Character;",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 12
    const-string/jumbo v1, "=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lde/timroes/base64/Base64;->code:[C

    .line 15
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lde/timroes/base64/Base64;->map:Ljava/util/HashMap;

    .line 18
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lde/timroes/base64/Base64;->code:[C

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 19
    sget-object v1, Lde/timroes/base64/Base64;->map:Ljava/util/HashMap;

    sget-object v2, Lde/timroes/base64/Base64;->code:[C

    aget-char v2, v2, v0

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    int-to-byte v3, v0

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 14
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    const/4 v13, 0x0

    .line 31
    const-string/jumbo v10, "\\r|\\n"

    const-string/jumbo v11, ""

    invoke-virtual {p0, v10, v11}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    rem-int/lit8 v10, v10, 0x4

    if-eqz v10, :cond_0

    .line 33
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v11, "The length of the input string must be a multiple of four."

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 36
    :cond_0
    const-string/jumbo v10, "^[A-Za-z0-9+/]*[=]{0,3}$"

    invoke-virtual {p0, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_1

    .line 37
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v11, "The argument contains illegal characters."

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 40
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    mul-int/lit8 v10, v10, 0x3

    div-int/lit8 v10, v10, 0x4

    new-array v6, v10, [B

    .line 42
    .local v6, "out":[B
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    .line 44
    .local v5, "input":[C
    const/4 v7, 0x0

    .line 46
    .local v7, "outi":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v10, v5

    if-ge v4, v10, :cond_2

    .line 47
    sget-object v10, Lde/timroes/base64/Base64;->map:Ljava/util/HashMap;

    aget-char v11, v5, v4

    invoke-static {v11}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Byte;

    invoke-virtual {v10}, Ljava/lang/Byte;->byteValue()B

    move-result v10

    add-int/lit8 v0, v10, -0x1

    .line 48
    .local v0, "b1":I
    sget-object v10, Lde/timroes/base64/Base64;->map:Ljava/util/HashMap;

    add-int/lit8 v11, v4, 0x1

    aget-char v11, v5, v11

    invoke-static {v11}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Byte;

    invoke-virtual {v10}, Ljava/lang/Byte;->byteValue()B

    move-result v10

    add-int/lit8 v1, v10, -0x1

    .line 49
    .local v1, "b2":I
    sget-object v10, Lde/timroes/base64/Base64;->map:Ljava/util/HashMap;

    add-int/lit8 v11, v4, 0x2

    aget-char v11, v5, v11

    invoke-static {v11}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Byte;

    invoke-virtual {v10}, Ljava/lang/Byte;->byteValue()B

    move-result v10

    add-int/lit8 v2, v10, -0x1

    .line 50
    .local v2, "b3":I
    sget-object v10, Lde/timroes/base64/Base64;->map:Ljava/util/HashMap;

    add-int/lit8 v11, v4, 0x3

    aget-char v11, v5, v11

    invoke-static {v11}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Byte;

    invoke-virtual {v10}, Ljava/lang/Byte;->byteValue()B

    move-result v10

    add-int/lit8 v3, v10, -0x1

    .line 51
    .local v3, "b4":I
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "outi":I
    .local v8, "outi":I
    shl-int/lit8 v10, v0, 0x2

    ushr-int/lit8 v11, v1, 0x4

    or-int/2addr v10, v11

    int-to-byte v10, v10

    aput-byte v10, v6, v7

    .line 52
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "outi":I
    .restart local v7    # "outi":I
    and-int/lit8 v10, v1, 0xf

    shl-int/lit8 v10, v10, 0x4

    ushr-int/lit8 v11, v2, 0x2

    or-int/2addr v10, v11

    int-to-byte v10, v10

    aput-byte v10, v6, v8

    .line 53
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "outi":I
    .restart local v8    # "outi":I
    and-int/lit8 v10, v2, 0x3

    shl-int/lit8 v10, v10, 0x6

    and-int/lit8 v11, v3, 0x3f

    or-int/2addr v10, v11

    int-to-byte v10, v10

    aput-byte v10, v6, v7

    .line 46
    add-int/lit8 v4, v4, 0x4

    move v7, v8

    .end local v8    # "outi":I
    .restart local v7    # "outi":I
    goto :goto_0

    .line 56
    .end local v0    # "b1":I
    .end local v1    # "b2":I
    .end local v2    # "b3":I
    .end local v3    # "b4":I
    :cond_2
    const-string/jumbo v10, "="

    invoke-virtual {p0, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 57
    array-length v10, v6

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v11

    const-string/jumbo v12, "="

    invoke-virtual {p0, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v12

    sub-int/2addr v11, v12

    sub-int/2addr v10, v11

    new-array v9, v10, [B

    .line 58
    .local v9, "trimmed":[B
    array-length v10, v9

    invoke-static {v6, v13, v9, v13, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 62
    .end local v9    # "trimmed":[B
    :goto_1
    return-object v9

    :cond_3
    move-object v9, v6

    goto :goto_1
.end method

.method public static decodeAsString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 73
    new-instance v0, Ljava/lang/String;

    invoke-static {p0}, Lde/timroes/base64/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public static encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 83
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lde/timroes/base64/Base64;->encode([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encode([B)Ljava/lang/String;
    .locals 5
    .param p0, "in"    # [B

    .prologue
    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v3, p0

    add-int/lit8 v3, v3, 0x2

    div-int/lit8 v3, v3, 0x3

    mul-int/lit8 v3, v3, 0x4

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 108
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-static {p0}, Lde/timroes/base64/Base64;->encodeAsBytes([B)[B

    move-result-object v1

    .line 109
    .local v1, "encoded":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 110
    sget-object v3, Lde/timroes/base64/Base64;->code:[C

    aget-byte v4, v1, v2

    add-int/lit8 v4, v4, 0x1

    aget-char v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 111
    rem-int/lit8 v3, v2, 0x48

    const/16 v4, 0x47

    if-ne v3, v4, :cond_0

    .line 112
    const-string/jumbo v3, "\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 114
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static encode([Ljava/lang/Byte;)Ljava/lang/String;
    .locals 3
    .param p0, "in"    # [Ljava/lang/Byte;

    .prologue
    .line 93
    array-length v2, p0

    new-array v1, v2, [B

    .line 94
    .local v1, "tmp":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 95
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    move-result v2

    aput-byte v2, v1, v0

    .line 94
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 97
    :cond_0
    invoke-static {v1}, Lde/timroes/base64/Base64;->encode([B)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static encodeAsBytes(Ljava/lang/String;)[B
    .locals 1
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 125
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lde/timroes/base64/Base64;->encodeAsBytes([B)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeAsBytes([B)[B
    .locals 7
    .param p0, "inArray"    # [B

    .prologue
    const/4 v6, 0x0

    .line 138
    array-length v5, p0

    add-int/lit8 v5, v5, 0x2

    div-int/lit8 v5, v5, 0x3

    mul-int/lit8 v5, v5, 0x4

    new-array v2, v5, [B

    .line 140
    .local v2, "out":[B
    array-length v5, p0

    add-int/lit8 v5, v5, 0x2

    div-int/lit8 v5, v5, 0x3

    mul-int/lit8 v5, v5, 0x3

    new-array v1, v5, [B

    .line 142
    .local v1, "in":[B
    array-length v5, p0

    invoke-static {p0, v6, v1, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 144
    const/4 v3, 0x0

    .line 145
    .local v3, "outi":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, v1

    if-ge v0, v5, :cond_0

    .line 147
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "outi":I
    .local v4, "outi":I
    aget-byte v5, v1, v0

    and-int/lit16 v5, v5, 0xff

    ushr-int/lit8 v5, v5, 0x2

    int-to-byte v5, v5

    aput-byte v5, v2, v3

    .line 148
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "outi":I
    .restart local v3    # "outi":I
    aget-byte v5, v1, v0

    and-int/lit8 v5, v5, 0x3

    shl-int/lit8 v5, v5, 0x4

    add-int/lit8 v6, v0, 0x1

    aget-byte v6, v1, v6

    and-int/lit16 v6, v6, 0xff

    ushr-int/lit8 v6, v6, 0x4

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 149
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "outi":I
    .restart local v4    # "outi":I
    add-int/lit8 v5, v0, 0x1

    aget-byte v5, v1, v5

    and-int/lit8 v5, v5, 0xf

    shl-int/lit8 v5, v5, 0x2

    add-int/lit8 v6, v0, 0x2

    aget-byte v6, v1, v6

    and-int/lit16 v6, v6, 0xff

    ushr-int/lit8 v6, v6, 0x6

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v2, v3

    .line 150
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "outi":I
    .restart local v3    # "outi":I
    add-int/lit8 v5, v0, 0x2

    aget-byte v5, v1, v5

    and-int/lit8 v5, v5, 0x3f

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 145
    add-int/lit8 v0, v0, 0x3

    goto :goto_0

    .line 154
    :cond_0
    array-length v5, v1

    array-length v6, p0

    sub-int v0, v5, v6

    :goto_1
    if-lez v0, :cond_1

    .line 155
    array-length v5, v2

    sub-int/2addr v5, v0

    const/4 v6, -0x1

    aput-byte v6, v2, v5

    .line 154
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 158
    :cond_1
    return-object v2
.end method
