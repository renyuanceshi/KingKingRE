.class final Lcom/google/android/gms/internal/zzbev;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzbew;


# instance fields
.field private synthetic zzaFn:Lcom/google/android/gms/internal/zzbeu;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbeu;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbev;->zzaFn:Lcom/google/android/gms/internal/zzbeu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zzc(Lcom/google/android/gms/internal/zzbbd;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzbbd",
            "<*>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbev;->zzaFn:Lcom/google/android/gms/internal/zzbeu;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzbeu;->zzaFl:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbbd;->zzpo()Ljava/lang/Integer;

    return-void
.end method
