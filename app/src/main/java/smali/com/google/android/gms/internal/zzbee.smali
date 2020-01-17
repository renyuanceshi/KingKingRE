.class public final Lcom/google/android/gms/internal/zzbee;
.super Ljava/lang/Object;


# instance fields
.field public final zzaBu:Lcom/google/android/gms/internal/zzbed;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzbed",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "*>;"
        }
    .end annotation
.end field

.field public final zzaBv:Lcom/google/android/gms/internal/zzbex;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzbex",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzbed;Lcom/google/android/gms/internal/zzbex;)V
    .locals 0
    .param p1    # Lcom/google/android/gms/internal/zzbed;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/google/android/gms/internal/zzbex;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzbed",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "*>;",
            "Lcom/google/android/gms/internal/zzbex",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "*>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbee;->zzaBu:Lcom/google/android/gms/internal/zzbed;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbee;->zzaBv:Lcom/google/android/gms/internal/zzbex;

    return-void
.end method
