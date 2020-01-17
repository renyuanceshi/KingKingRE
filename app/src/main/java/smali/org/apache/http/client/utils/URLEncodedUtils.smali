.class public Lorg/apache/http/client/utils/URLEncodedUtils;
.super Ljava/lang/Object;
.source "URLEncodedUtils.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final CONTENT_TYPE:Ljava/lang/String; = "application/x-www-form-urlencoded"

.field private static final NAME_VALUE_SEPARATOR:Ljava/lang/String; = "="

.field private static final PATHSAFE:Ljava/util/BitSet;

.field private static final PUNCT:Ljava/util/BitSet;

.field private static final QP_SEPS:[C

.field private static final QP_SEP_A:C = '&'

.field private static final QP_SEP_PATTERN:Ljava/lang/String;

.field private static final QP_SEP_S:C = ';'

.field private static final RADIX:I = 0x10

.field private static final RESERVED:Ljava/util/BitSet;

.field private static final UNRESERVED:Ljava/util/BitSet;

.field private static final URIC:Ljava/util/BitSet;

.field private static final URLENCODER:Ljava/util/BitSet;

.field private static final USERINFO:Ljava/util/BitSet;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/16 v8, 0x2c

    const/16 v7, 0x2b

    const/16 v6, 0x26

    const/16 v5, 0x24

    const/16 v4, 0x100

    .line 202
    const/4 v1, 0x2

    new-array v1, v1, [C

    fill-array-data v1, :array_0

    sput-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->QP_SEPS:[C

    .line 207
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/lang/String;

    sget-object v3, Lorg/apache/http/client/utils/URLEncodedUtils;->QP_SEPS:[C

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->QP_SEP_PATTERN:Ljava/lang/String;

    .line 357
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v4}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    .line 363
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v4}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    .line 366
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v4}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->USERINFO:Ljava/util/BitSet;

    .line 369
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v4}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    .line 372
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v4}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->URIC:Ljava/util/BitSet;

    .line 382
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v4}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    .line 389
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v4}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->URLENCODER:Ljava/util/BitSet;

    .line 394
    const/16 v0, 0x61

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_0

    .line 395
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 394
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 397
    :cond_0
    const/16 v0, 0x41

    :goto_1
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_1

    .line 398
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 397
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 401
    :cond_1
    const/16 v0, 0x30

    :goto_2
    const/16 v1, 0x39

    if-gt v0, v1, :cond_2

    .line 402
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 401
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 404
    :cond_2
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x5f

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 405
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x2d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 406
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 407
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x2a

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 408
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->URLENCODER:Ljava/util/BitSet;

    sget-object v2, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 409
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x21

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 410
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x7e

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 411
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x27

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 412
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x28

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 413
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 415
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    invoke-virtual {v1, v8}, Ljava/util/BitSet;->set(I)V

    .line 416
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    const/16 v2, 0x3b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 417
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 418
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 419
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 420
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    invoke-virtual {v1, v7}, Ljava/util/BitSet;->set(I)V

    .line 421
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 423
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->USERINFO:Ljava/util/BitSet;

    sget-object v2, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 424
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->USERINFO:Ljava/util/BitSet;

    sget-object v2, Lorg/apache/http/client/utils/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 427
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    sget-object v2, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 428
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 429
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/16 v2, 0x3b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 430
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 431
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 432
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 433
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 434
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    invoke-virtual {v1, v7}, Ljava/util/BitSet;->set(I)V

    .line 435
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 436
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    invoke-virtual {v1, v8}, Ljava/util/BitSet;->set(I)V

    .line 438
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x3b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 439
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 440
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x3f

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 441
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 442
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 443
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 444
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 445
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v7}, Ljava/util/BitSet;->set(I)V

    .line 446
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 447
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v8}, Ljava/util/BitSet;->set(I)V

    .line 448
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 449
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 451
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->URIC:Ljava/util/BitSet;

    sget-object v2, Lorg/apache/http/client/utils/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 452
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->URIC:Ljava/util/BitSet;

    sget-object v2, Lorg/apache/http/client/utils/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 453
    return-void

    .line 202
    nop

    :array_0
    .array-data 2
        0x26s
        0x3bs
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static decodeFormFields(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 533
    if-nez p0, :cond_0

    .line 534
    const/4 v0, 0x0

    .line 536
    :goto_0
    return-object v0

    :cond_0
    if-eqz p1, :cond_1

    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    :goto_1
    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/apache/http/client/utils/URLEncodedUtils;->urlDecode(Ljava/lang/String;Ljava/nio/charset/Charset;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    goto :goto_1
.end method

.method private static decodeFormFields(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 547
    if-nez p0, :cond_0

    .line 548
    const/4 v0, 0x0

    .line 550
    .end local p1    # "charset":Ljava/nio/charset/Charset;
    :goto_0
    return-object v0

    .restart local p1    # "charset":Ljava/nio/charset/Charset;
    :cond_0
    if-eqz p1, :cond_1

    .end local p1    # "charset":Ljava/nio/charset/Charset;
    :goto_1
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/http/client/utils/URLEncodedUtils;->urlDecode(Ljava/lang/String;Ljava/nio/charset/Charset;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .restart local p1    # "charset":Ljava/nio/charset/Charset;
    :cond_1
    sget-object p1, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    goto :goto_1
.end method

.method static encPath(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 625
    sget-object v0, Lorg/apache/http/client/utils/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/http/client/utils/URLEncodedUtils;->urlEncode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static encUric(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 612
    sget-object v0, Lorg/apache/http/client/utils/URLEncodedUtils;->URIC:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/http/client/utils/URLEncodedUtils;->urlEncode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static encUserInfo(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 599
    sget-object v0, Lorg/apache/http/client/utils/URLEncodedUtils;->USERINFO:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/http/client/utils/URLEncodedUtils;->urlEncode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static encodeFormFields(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 565
    if-nez p0, :cond_0

    .line 566
    const/4 v0, 0x0

    .line 568
    :goto_0
    return-object v0

    :cond_0
    if-eqz p1, :cond_1

    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    :goto_1
    sget-object v1, Lorg/apache/http/client/utils/URLEncodedUtils;->URLENCODER:Ljava/util/BitSet;

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Lorg/apache/http/client/utils/URLEncodedUtils;->urlEncode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    goto :goto_1
.end method

.method private static encodeFormFields(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 583
    if-nez p0, :cond_0

    .line 584
    const/4 v0, 0x0

    .line 586
    .end local p1    # "charset":Ljava/nio/charset/Charset;
    :goto_0
    return-object v0

    .restart local p1    # "charset":Ljava/nio/charset/Charset;
    :cond_0
    if-eqz p1, :cond_1

    .end local p1    # "charset":Ljava/nio/charset/Charset;
    :goto_1
    sget-object v0, Lorg/apache/http/client/utils/URLEncodedUtils;->URLENCODER:Ljava/util/BitSet;

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lorg/apache/http/client/utils/URLEncodedUtils;->urlEncode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .restart local p1    # "charset":Ljava/nio/charset/Charset;
    :cond_1
    sget-object p1, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    goto :goto_1
.end method

.method public static format(Ljava/lang/Iterable;CLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 6
    .param p1, "parameterSeparator"    # C
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/http/NameValuePair;",
            ">;C",
            "Ljava/nio/charset/Charset;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 335
    .local p0, "parameters":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/apache/http/NameValuePair;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 336
    .local v4, "result":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/NameValuePair;

    .line 337
    .local v3, "parameter":Lorg/apache/http/NameValuePair;
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p2}, Lorg/apache/http/client/utils/URLEncodedUtils;->encodeFormFields(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    .line 338
    .local v0, "encodedName":Ljava/lang/String;
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p2}, Lorg/apache/http/client/utils/URLEncodedUtils;->encodeFormFields(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v1

    .line 339
    .local v1, "encodedValue":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_1

    .line 340
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 342
    :cond_1
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    if-eqz v1, :cond_0

    .line 344
    const-string/jumbo v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 348
    .end local v0    # "encodedName":Ljava/lang/String;
    .end local v1    # "encodedValue":Ljava/lang/String;
    .end local v3    # "parameter":Lorg/apache/http/NameValuePair;
    :cond_2
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static format(Ljava/lang/Iterable;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 317
    .local p0, "parameters":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/apache/http/NameValuePair;>;"
    const/16 v0, 0x26

    invoke-static {p0, v0, p1}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/lang/Iterable;CLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static format(Ljava/util/List;CLjava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "parameterSeparator"    # C
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/apache/http/NameValuePair;",
            ">;C",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 288
    .local p0, "parameters":Ljava/util/List;, "Ljava/util/List<+Lorg/apache/http/NameValuePair;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 289
    .local v4, "result":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/NameValuePair;

    .line 290
    .local v3, "parameter":Lorg/apache/http/NameValuePair;
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p2}, Lorg/apache/http/client/utils/URLEncodedUtils;->encodeFormFields(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 291
    .local v0, "encodedName":Ljava/lang/String;
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p2}, Lorg/apache/http/client/utils/URLEncodedUtils;->encodeFormFields(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 292
    .local v1, "encodedValue":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_1

    .line 293
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 295
    :cond_1
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    if-eqz v1, :cond_0

    .line 297
    const-string/jumbo v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 301
    .end local v0    # "encodedName":Ljava/lang/String;
    .end local v1    # "encodedValue":Ljava/lang/String;
    .end local v3    # "parameter":Lorg/apache/http/NameValuePair;
    :cond_2
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 270
    .local p0, "parameters":Ljava/util/List;, "Ljava/util/List<+Lorg/apache/http/NameValuePair;>;"
    const/16 v0, 0x26

    invoke-static {p0, v0, p1}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;CLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isEncoded(Lorg/apache/http/HttpEntity;)Z
    .locals 5
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    const/4 v3, 0x0

    .line 131
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v2

    .line 132
    .local v2, "h":Lorg/apache/http/Header;
    if-eqz v2, :cond_0

    .line 133
    invoke-interface {v2}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v1

    .line 134
    .local v1, "elems":[Lorg/apache/http/HeaderElement;
    array-length v4, v1

    if-lez v4, :cond_0

    .line 135
    aget-object v3, v1, v3

    invoke-interface {v3}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "contentType":Ljava/lang/String;
    const-string/jumbo v3, "application/x-www-form-urlencoded"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    .line 139
    .end local v0    # "contentType":Ljava/lang/String;
    .end local v1    # "elems":[Lorg/apache/http/HeaderElement;
    :cond_0
    return v3
.end method

.method public static parse(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/util/List;
    .locals 1
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 222
    sget-object v0, Lorg/apache/http/client/utils/URLEncodedUtils;->QP_SEPS:[C

    invoke-static {p0, p1, v0}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/lang/String;Ljava/nio/charset/Charset;[C)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parse(Ljava/lang/String;Ljava/nio/charset/Charset;[C)Ljava/util/List;
    .locals 8
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .param p2, "parameterSeparator"    # [C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/nio/charset/Charset;",
            "[C)",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 240
    if-nez p0, :cond_1

    .line 241
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 256
    :cond_0
    return-object v2

    .line 243
    :cond_1
    sget-object v4, Lorg/apache/http/message/BasicHeaderValueParser;->INSTANCE:Lorg/apache/http/message/BasicHeaderValueParser;

    .line 244
    .local v4, "parser":Lorg/apache/http/message/BasicHeaderValueParser;
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v0, v5}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 245
    .local v0, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {v0, p0}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 246
    new-instance v1, Lorg/apache/http/message/ParserCursor;

    const/4 v5, 0x0

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v6

    invoke-direct {v1, v5, v6}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .line 247
    .local v1, "cursor":Lorg/apache/http/message/ParserCursor;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 248
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    :cond_2
    :goto_0
    invoke-virtual {v1}, Lorg/apache/http/message/ParserCursor;->atEnd()Z

    move-result v5

    if-nez v5, :cond_0

    .line 249
    invoke-virtual {v4, v0, v1, p2}, Lorg/apache/http/message/BasicHeaderValueParser;->parseNameValuePair(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;[C)Lorg/apache/http/NameValuePair;

    move-result-object v3

    .line 250
    .local v3, "nvp":Lorg/apache/http/NameValuePair;
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 251
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, p1}, Lorg/apache/http/client/utils/URLEncodedUtils;->decodeFormFields(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, p1}, Lorg/apache/http/client/utils/URLEncodedUtils;->decodeFormFields(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public static parse(Ljava/net/URI;Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .param p0, "uri"    # Ljava/net/URI;
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 88
    invoke-virtual {p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "query":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 90
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v2, Ljava/util/Scanner;

    invoke-direct {v2, v0}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 92
    .local v2, "scanner":Ljava/util/Scanner;
    sget-object v3, Lorg/apache/http/client/utils/URLEncodedUtils;->QP_SEP_PATTERN:Ljava/lang/String;

    invoke-static {v1, v2, v3, p1}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/util/List;Ljava/util/Scanner;Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .end local v1    # "result":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v2    # "scanner":Ljava/util/Scanner;
    :goto_0
    return-object v1

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    goto :goto_0
.end method

.method public static parse(Lorg/apache/http/HttpEntity;)Ljava/util/List;
    .locals 5
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/HttpEntity;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    invoke-static {p0}, Lorg/apache/http/entity/ContentType;->get(Lorg/apache/http/HttpEntity;)Lorg/apache/http/entity/ContentType;

    move-result-object v2

    .line 113
    .local v2, "contentType":Lorg/apache/http/entity/ContentType;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lorg/apache/http/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "application/x-www-form-urlencoded"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 114
    sget-object v3, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-static {p0, v3}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v1

    .line 115
    .local v1, "content":Ljava/lang/String;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 116
    invoke-virtual {v2}, Lorg/apache/http/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    .line 117
    .local v0, "charset":Ljava/nio/charset/Charset;
    if-nez v0, :cond_0

    .line 118
    sget-object v0, Lorg/apache/http/protocol/HTTP;->DEF_CONTENT_CHARSET:Ljava/nio/charset/Charset;

    .line 120
    :cond_0
    sget-object v3, Lorg/apache/http/client/utils/URLEncodedUtils;->QP_SEPS:[C

    invoke-static {v1, v0, v3}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/lang/String;Ljava/nio/charset/Charset;[C)Ljava/util/List;

    move-result-object v3

    .line 123
    .end local v0    # "charset":Ljava/nio/charset/Charset;
    .end local v1    # "content":Ljava/lang/String;
    :goto_0
    return-object v3

    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    goto :goto_0
.end method

.method public static parse(Ljava/util/List;Ljava/util/Scanner;Ljava/lang/String;)V
    .locals 1
    .param p1, "scanner"    # Ljava/util/Scanner;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/util/Scanner;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 159
    .local p0, "parameters":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    sget-object v0, Lorg/apache/http/client/utils/URLEncodedUtils;->QP_SEP_PATTERN:Ljava/lang/String;

    invoke-static {p0, p1, v0, p2}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/util/List;Ljava/util/Scanner;Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    return-void
.end method

.method public static parse(Ljava/util/List;Ljava/util/Scanner;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "scanner"    # Ljava/util/Scanner;
    .param p2, "parameterSepartorPattern"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/util/Scanner;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 183
    .local p0, "parameters":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    invoke-virtual {p1, p2}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    .line 184
    :goto_0
    invoke-virtual {p1}, Ljava/util/Scanner;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 185
    const/4 v1, 0x0

    .line 186
    .local v1, "name":Ljava/lang/String;
    const/4 v3, 0x0

    .line 187
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v2

    .line 188
    .local v2, "token":Ljava/lang/String;
    const-string/jumbo v4, "="

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 189
    .local v0, "i":I
    const/4 v4, -0x1

    if-eq v0, v4, :cond_0

    .line 190
    const/4 v4, 0x0

    invoke-virtual {v2, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p3}, Lorg/apache/http/client/utils/URLEncodedUtils;->decodeFormFields(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 191
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p3}, Lorg/apache/http/client/utils/URLEncodedUtils;->decodeFormFields(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 195
    :goto_1
    new-instance v4, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v4, v1, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 193
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p3}, Lorg/apache/http/client/utils/URLEncodedUtils;->decodeFormFields(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 197
    .end local v0    # "i":I
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "token":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private static urlDecode(Ljava/lang/String;Ljava/nio/charset/Charset;Z)Ljava/lang/String;
    .locals 12
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .param p2, "plusAsBlank"    # Z

    .prologue
    const/16 v11, 0x25

    const/16 v10, 0x10

    const/4 v9, -0x1

    .line 496
    if-nez p0, :cond_0

    .line 497
    const/4 v7, 0x0

    .line 522
    :goto_0
    return-object v7

    .line 499
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 500
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-static {p0}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object v2

    .line 501
    .local v2, "cb":Ljava/nio/CharBuffer;
    :goto_1
    invoke-virtual {v2}, Ljava/nio/CharBuffer;->hasRemaining()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 502
    invoke-virtual {v2}, Ljava/nio/CharBuffer;->get()C

    move-result v1

    .line 503
    .local v1, "c":C
    if-ne v1, v11, :cond_2

    invoke-virtual {v2}, Ljava/nio/CharBuffer;->remaining()I

    move-result v7

    const/4 v8, 0x2

    if-lt v7, v8, :cond_2

    .line 504
    invoke-virtual {v2}, Ljava/nio/CharBuffer;->get()C

    move-result v6

    .line 505
    .local v6, "uc":C
    invoke-virtual {v2}, Ljava/nio/CharBuffer;->get()C

    move-result v4

    .line 506
    .local v4, "lc":C
    invoke-static {v6, v10}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    .line 507
    .local v5, "u":I
    invoke-static {v4, v10}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    .line 508
    .local v3, "l":I
    if-eq v5, v9, :cond_1

    if-eq v3, v9, :cond_1

    .line 509
    shl-int/lit8 v7, v5, 0x4

    add-int/2addr v7, v3

    int-to-byte v7, v7

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 511
    :cond_1
    invoke-virtual {v0, v11}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 512
    int-to-byte v7, v6

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 513
    int-to-byte v7, v4

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 515
    .end local v3    # "l":I
    .end local v4    # "lc":C
    .end local v5    # "u":I
    .end local v6    # "uc":C
    :cond_2
    if-eqz p2, :cond_3

    const/16 v7, 0x2b

    if-ne v1, v7, :cond_3

    .line 516
    const/16 v7, 0x20

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 518
    :cond_3
    int-to-byte v7, v1

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 521
    .end local v1    # "c":C
    :cond_4
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 522
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_0
.end method

.method private static urlEncode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;
    .locals 7
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .param p2, "safechars"    # Ljava/util/BitSet;
    .param p3, "blankAsPlus"    # Z

    .prologue
    const/16 v6, 0x10

    .line 462
    if-nez p0, :cond_0

    .line 463
    const/4 v5, 0x0

    .line 481
    :goto_0
    return-object v5

    .line 465
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 466
    .local v2, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p1, p0}, Ljava/nio/charset/Charset;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 467
    .local v1, "bb":Ljava/nio/ByteBuffer;
    :goto_1
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 468
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    and-int/lit16 v0, v5, 0xff

    .line 469
    .local v0, "b":I
    invoke-virtual {p2, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 470
    int-to-char v5, v0

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 471
    :cond_1
    if-eqz p3, :cond_2

    const/16 v5, 0x20

    if-ne v0, v5, :cond_2

    .line 472
    const/16 v5, 0x2b

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 474
    :cond_2
    const-string/jumbo v5, "%"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 475
    shr-int/lit8 v5, v0, 0x4

    and-int/lit8 v5, v5, 0xf

    invoke-static {v5, v6}, Ljava/lang/Character;->forDigit(II)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    .line 476
    .local v3, "hex1":C
    and-int/lit8 v5, v0, 0xf

    invoke-static {v5, v6}, Ljava/lang/Character;->forDigit(II)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v4

    .line 477
    .local v4, "hex2":C
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 478
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 481
    .end local v0    # "b":I
    .end local v3    # "hex1":C
    .end local v4    # "hex2":C
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method
