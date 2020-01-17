.class public abstract Lcom/google/android/gms/internal/zzbzt;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final zzBO:I

.field private final zzBP:Ljava/lang/String;

.field private final zzBQ:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(ILjava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/zzbzt;->zzBO:I

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbzt;->zzBP:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzbzt;->zzBQ:Ljava/lang/Object;

    invoke-static {}, Lcom/google/android/gms/internal/zzcae;->zzub()Lcom/google/android/gms/internal/zzbzz;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzbzz;->zza(Lcom/google/android/gms/internal/zzbzt;)V

    return-void
.end method

.method synthetic constructor <init>(ILjava/lang/String;Ljava/lang/Object;Lcom/google/android/gms/internal/zzbzu;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzbzt;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static zzb(ILjava/lang/String;Ljava/lang/Boolean;)Lcom/google/android/gms/internal/zzbzv;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzbzv;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1, p2}, Lcom/google/android/gms/internal/zzbzv;-><init>(ILjava/lang/String;Ljava/lang/Boolean;)V

    return-object v0
.end method

.method public static zzb(ILjava/lang/String;I)Lcom/google/android/gms/internal/zzbzw;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzbzw;

    const/4 v1, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lcom/google/android/gms/internal/zzbzw;-><init>(ILjava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method

.method public static zzb(ILjava/lang/String;J)Lcom/google/android/gms/internal/zzbzx;
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/zzbzx;

    const/4 v1, 0x0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lcom/google/android/gms/internal/zzbzx;-><init>(ILjava/lang/String;Ljava/lang/Long;)V

    return-object v0
.end method


# virtual methods
.method public final getKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbzt;->zzBP:Ljava/lang/String;

    return-object v0
.end method

.method public final getSource()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzbzt;->zzBO:I

    return v0
.end method

.method protected abstract zza(Lcom/google/android/gms/internal/zzcab;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzcab;",
            ")TT;"
        }
    .end annotation
.end method

.method public final zzdI()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbzt;->zzBQ:Ljava/lang/Object;

    return-object v0
.end method
