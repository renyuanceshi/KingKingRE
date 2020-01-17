.class final Lcom/google/android/gms/internal/zzbcd;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic zzaDp:Lcom/google/android/gms/internal/zzbcc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbcc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbcd;->zzaDp:Lcom/google/android/gms/internal/zzbcc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbcd;->zzaDp:Lcom/google/android/gms/internal/zzbcc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbcc;->zza(Lcom/google/android/gms/internal/zzbcc;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/zze;->zzat(Landroid/content/Context;)V

    return-void
.end method
