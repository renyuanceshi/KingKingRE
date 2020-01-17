.class final Lcom/google/android/gms/internal/zzbej;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic zzaDx:Lcom/google/android/gms/internal/zzctw;

.field private synthetic zzaEY:Lcom/google/android/gms/internal/zzbei;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbei;Lcom/google/android/gms/internal/zzctw;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbej;->zzaEY:Lcom/google/android/gms/internal/zzbei;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbej;->zzaDx:Lcom/google/android/gms/internal/zzctw;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbej;->zzaEY:Lcom/google/android/gms/internal/zzbei;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbej;->zzaDx:Lcom/google/android/gms/internal/zzctw;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzbei;->zza(Lcom/google/android/gms/internal/zzbei;Lcom/google/android/gms/internal/zzctw;)V

    return-void
.end method
