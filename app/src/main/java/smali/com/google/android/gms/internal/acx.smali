.class public final Lcom/google/android/gms/internal/acx;
.super Ljava/lang/Object;


# instance fields
.field private final buffer:[B

.field private zzcrP:I

.field private zzcrQ:I

.field private zzcrR:I

.field private zzcrS:I

.field private zzcrT:I

.field private zzcrU:I

.field private zzcrV:I

.field private zzcrW:I

.field private zzcrX:I


# direct methods
.method private constructor <init>([BII)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7fffffff

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrU:I

    const/16 v0, 0x40

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrW:I

    const/high16 v0, 0x4000000

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrX:I

    iput-object p1, p0, Lcom/google/android/gms/internal/acx;->buffer:[B

    iput p2, p0, Lcom/google/android/gms/internal/acx;->zzcrP:I

    add-int v0, p2, p3

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrQ:I

    iput p2, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    return-void
.end method

.method public static zzH([B)Lcom/google/android/gms/internal/acx;
    .locals 2

    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/google/android/gms/internal/acx;->zzb([BII)Lcom/google/android/gms/internal/acx;

    move-result-object v0

    return-object v0
.end method

.method private final zzLH()V
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrQ:I

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrR:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrQ:I

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrQ:I

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrU:I

    if-le v0, v1, :cond_0

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrU:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrR:I

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrQ:I

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrR:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrQ:I

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrR:I

    goto :goto_0
.end method

.method private final zzLJ()B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrQ:I

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLO()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/acx;->buffer:[B

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    aget-byte v0, v0, v1

    return v0
.end method

.method public static zzb([BII)Lcom/google/android/gms/internal/acx;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/acx;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p2}, Lcom/google/android/gms/internal/acx;-><init>([BII)V

    return-object v0
.end method

.method private final zzcq(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-gez p1, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLP()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0

    :cond_0
    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    add-int/2addr v0, p1

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrU:I

    if-le v0, v1, :cond_1

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrU:I

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    sub-int/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/acx;->zzcq(I)V

    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLO()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0

    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrQ:I

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    sub-int/2addr v0, v1

    if-gt p1, v0, :cond_2

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    return-void

    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLO()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public final getPosition()I
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrP:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public final readBytes()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLD()I

    move-result v1

    if-gez v1, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLP()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0

    :cond_0
    if-nez v1, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/adj;->zzcst:[B

    :goto_0
    return-object v0

    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrQ:I

    iget v2, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    sub-int/2addr v0, v2

    if-le v1, v0, :cond_2

    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLO()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0

    :cond_2
    new-array v0, v1, [B

    iget-object v2, p0, Lcom/google/android/gms/internal/acx;->buffer:[B

    iget v3, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    const/4 v4, 0x0

    invoke-static {v2, v3, v0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v2, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    goto :goto_0
.end method

.method public final readString()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLD()I

    move-result v0

    if-gez v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLP()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0

    :cond_0
    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrQ:I

    iget v2, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    sub-int/2addr v1, v2

    if-le v0, v1, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLO()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0

    :cond_1
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/acx;->buffer:[B

    iget v3, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    sget-object v4, Lcom/google/android/gms/internal/ade;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3, v0, v4}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    iget v2, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    return-object v1
.end method

.method public final zzLA()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLD()I

    move-result v0

    return v0
.end method

.method public final zzLB()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLD()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final zzLC()J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLE()J

    move-result-wide v0

    const/4 v2, 0x1

    ushr-long v2, v0, v2

    const-wide/16 v4, 0x1

    and-long/2addr v0, v4

    neg-long v0, v0

    xor-long/2addr v0, v2

    return-wide v0
.end method

.method public final zzLD()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v0

    if-ltz v0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    and-int/lit8 v0, v0, 0x7f

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v1

    if-ltz v1, :cond_2

    shl-int/lit8 v1, v1, 0x7

    or-int/2addr v0, v1

    goto :goto_0

    :cond_2
    and-int/lit8 v1, v1, 0x7f

    shl-int/lit8 v1, v1, 0x7

    or-int/2addr v0, v1

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v1

    if-ltz v1, :cond_3

    shl-int/lit8 v1, v1, 0xe

    or-int/2addr v0, v1

    goto :goto_0

    :cond_3
    and-int/lit8 v1, v1, 0x7f

    shl-int/lit8 v1, v1, 0xe

    or-int/2addr v0, v1

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v1

    if-ltz v1, :cond_4

    shl-int/lit8 v1, v1, 0x15

    or-int/2addr v0, v1

    goto :goto_0

    :cond_4
    and-int/lit8 v1, v1, 0x7f

    shl-int/lit8 v1, v1, 0x15

    or-int/2addr v0, v1

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v1

    shl-int/lit8 v2, v1, 0x1c

    or-int/2addr v0, v2

    if-gez v1, :cond_0

    const/4 v1, 0x0

    :goto_1
    const/4 v2, 0x5

    if-ge v1, v2, :cond_5

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v2

    if-gez v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLQ()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0
.end method

.method public final zzLE()J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x0

    const-wide/16 v0, 0x0

    :goto_0
    const/16 v3, 0x40

    if-ge v2, v3, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v3

    and-int/lit8 v4, v3, 0x7f

    int-to-long v4, v4

    shl-long/2addr v4, v2

    or-long/2addr v0, v4

    and-int/lit16 v3, v3, 0x80

    if-nez v3, :cond_0

    return-wide v0

    :cond_0
    add-int/lit8 v2, v2, 0x7

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLQ()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0
.end method

.method public final zzLF()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v0

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v1

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v2

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v3

    and-int/lit16 v0, v0, 0xff

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    and-int/lit16 v1, v2, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    and-int/lit16 v1, v3, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method public final zzLG()J
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v12, 0xff

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v0

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v1

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v2

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v3

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v4

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v5

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v6

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLJ()B

    move-result v7

    int-to-long v8, v0

    and-long/2addr v8, v12

    int-to-long v0, v1

    and-long/2addr v0, v12

    const/16 v10, 0x8

    shl-long/2addr v0, v10

    or-long/2addr v0, v8

    int-to-long v8, v2

    and-long/2addr v8, v12

    const/16 v2, 0x10

    shl-long/2addr v8, v2

    or-long/2addr v0, v8

    int-to-long v2, v3

    and-long/2addr v2, v12

    const/16 v8, 0x18

    shl-long/2addr v2, v8

    or-long/2addr v0, v2

    int-to-long v2, v4

    and-long/2addr v2, v12

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, v5

    and-long/2addr v2, v12

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, v6

    and-long/2addr v2, v12

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, v7

    and-long/2addr v2, v12

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public final zzLI()I
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrU:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrU:I

    sub-int v0, v1, v0

    goto :goto_0
.end method

.method public final zzLy()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    iget v2, p0, Lcom/google/android/gms/internal/acx;->zzcrQ:I

    if-ne v1, v2, :cond_0

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrT:I

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLD()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrT:I

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrT:I

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/adf;

    const-string/jumbo v1, "Protocol message contained an invalid tag (zero)."

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/adf;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrT:I

    goto :goto_0
.end method

.method public final zzLz()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLE()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zza(Lcom/google/android/gms/internal/adg;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLD()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrV:I

    iget v2, p0, Lcom/google/android/gms/internal/acx;->zzcrW:I

    if-lt v1, v2, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLR()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/acx;->zzcn(I)I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrV:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/android/gms/internal/acx;->zzcrV:I

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/adg;->zza(Lcom/google/android/gms/internal/acx;)Lcom/google/android/gms/internal/adg;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/acx;->zzcl(I)V

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrV:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/android/gms/internal/acx;->zzcrV:I

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/acx;->zzco(I)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/adg;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrV:I

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrW:I

    if-lt v0, v1, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLR()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0

    :cond_0
    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrV:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrV:I

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/adg;->zza(Lcom/google/android/gms/internal/acx;)Lcom/google/android/gms/internal/adg;

    shl-int/lit8 v0, p2, 0x3

    or-int/lit8 v0, v0, 0x4

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/acx;->zzcl(I)V

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrV:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrV:I

    return-void
.end method

.method public final zzcl(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/adf;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrT:I

    if-eq v0, p1, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/adf;

    const-string/jumbo v1, "Protocol message end-group tag did not match expected tag."

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/adf;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method public final zzcm(I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    and-int/lit8 v1, p1, 0x7

    packed-switch v1, :pswitch_data_0

    new-instance v0, Lcom/google/android/gms/internal/adf;

    const-string/jumbo v1, "Protocol message tag had invalid wire type."

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/adf;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLD()I

    :goto_0
    return v0

    :pswitch_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLG()J

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLD()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/acx;->zzcq(I)V

    goto :goto_0

    :cond_0
    :pswitch_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLy()I

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/acx;->zzcm(I)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_1
    ushr-int/lit8 v1, p1, 0x3

    shl-int/lit8 v1, v1, 0x3

    or-int/lit8 v1, v1, 0x4

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/acx;->zzcl(I)V

    goto :goto_0

    :pswitch_4
    const/4 v0, 0x0

    goto :goto_0

    :pswitch_5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLF()I

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public final zzcn(I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/adf;
        }
    .end annotation

    if-gez p1, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLP()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0

    :cond_0
    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    add-int/2addr v0, p1

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrU:I

    if-le v0, v1, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/adf;->zzLO()Lcom/google/android/gms/internal/adf;

    move-result-object v0

    throw v0

    :cond_1
    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrU:I

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLH()V

    return v1
.end method

.method public final zzco(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/acx;->zzcrU:I

    invoke-direct {p0}, Lcom/google/android/gms/internal/acx;->zzLH()V

    return-void
.end method

.method public final zzcp(I)V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrT:I

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/acx;->zzq(II)V

    return-void
.end method

.method public final zzp(II)[B
    .locals 4

    if-nez p2, :cond_0

    sget-object v0, Lcom/google/android/gms/internal/adj;->zzcst:[B

    :goto_0
    return-object v0

    :cond_0
    new-array v0, p2, [B

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrP:I

    add-int/2addr v1, p1

    iget-object v2, p0, Lcom/google/android/gms/internal/acx;->buffer:[B

    const/4 v3, 0x0

    invoke-static {v2, v1, v0, v3, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method final zzq(II)V
    .locals 4

    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrP:I

    sub-int/2addr v0, v1

    if-le p1, v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    iget v1, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    iget v2, p0, Lcom/google/android/gms/internal/acx;->zzcrP:I

    sub-int/2addr v1, v2

    const/16 v2, 0x32

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "Position "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " is beyond current "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    if-gez p1, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/16 v1, 0x18

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v1, "Bad position "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/acx;->zzcrP:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/google/android/gms/internal/acx;->zzcrS:I

    iput p2, p0, Lcom/google/android/gms/internal/acx;->zzcrT:I

    return-void
.end method
