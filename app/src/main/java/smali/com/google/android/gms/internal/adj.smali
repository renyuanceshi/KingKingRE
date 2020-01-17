.class public final Lcom/google/android/gms/internal/adj;
.super Ljava/lang/Object;


# static fields
.field public static final EMPTY_STRING_ARRAY:[Ljava/lang/String;

.field private static zzcsj:I

.field private static zzcsk:I

.field private static zzcsl:I

.field private static zzcsm:I

.field public static final zzcsn:[I

.field public static final zzcso:[J

.field public static final zzcsp:[F

.field private static zzcsq:[D

.field public static final zzcsr:[Z

.field public static final zzcss:[[B

.field public static final zzcst:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v1, 0x0

    const/16 v0, 0xb

    sput v0, Lcom/google/android/gms/internal/adj;->zzcsj:I

    const/16 v0, 0xc

    sput v0, Lcom/google/android/gms/internal/adj;->zzcsk:I

    const/16 v0, 0x10

    sput v0, Lcom/google/android/gms/internal/adj;->zzcsl:I

    const/16 v0, 0x1a

    sput v0, Lcom/google/android/gms/internal/adj;->zzcsm:I

    new-array v0, v1, [I

    sput-object v0, Lcom/google/android/gms/internal/adj;->zzcsn:[I

    new-array v0, v1, [J

    sput-object v0, Lcom/google/android/gms/internal/adj;->zzcso:[J

    new-array v0, v1, [F

    sput-object v0, Lcom/google/android/gms/internal/adj;->zzcsp:[F

    new-array v0, v1, [D

    sput-object v0, Lcom/google/android/gms/internal/adj;->zzcsq:[D

    new-array v0, v1, [Z

    sput-object v0, Lcom/google/android/gms/internal/adj;->zzcsr:[Z

    new-array v0, v1, [Ljava/lang/String;

    sput-object v0, Lcom/google/android/gms/internal/adj;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    new-array v0, v1, [[B

    sput-object v0, Lcom/google/android/gms/internal/adj;->zzcss:[[B

    new-array v0, v1, [B

    sput-object v0, Lcom/google/android/gms/internal/adj;->zzcst:[B

    return-void
.end method

.method public static final zzb(Lcom/google/android/gms/internal/acx;I)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->getPosition()I

    move-result v1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/acx;->zzcm(I)Z

    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/acx;->zzLy()I

    move-result v2

    if-ne v2, p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/acx;->zzcm(I)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v1, p1}, Lcom/google/android/gms/internal/acx;->zzq(II)V

    return v0
.end method
