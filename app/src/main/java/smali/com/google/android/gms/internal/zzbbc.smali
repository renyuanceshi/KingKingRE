.class final Lcom/google/android/gms/internal/zzbbc;
.super Lcom/google/android/gms/internal/zzbdk;


# instance fields
.field private synthetic zzaBT:Landroid/app/Dialog;

.field private synthetic zzaBU:Lcom/google/android/gms/internal/zzbbb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbbb;Landroid/app/Dialog;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbbc;->zzaBU:Lcom/google/android/gms/internal/zzbbb;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbbc;->zzaBT:Landroid/app/Dialog;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbdk;-><init>()V

    return-void
.end method


# virtual methods
.method public final zzpA()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbc;->zzaBU:Lcom/google/android/gms/internal/zzbbb;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzbbb;->zzaBS:Lcom/google/android/gms/internal/zzbaz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbaz;->zzpx()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbc;->zzaBT:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbbc;->zzaBT:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    return-void
.end method
