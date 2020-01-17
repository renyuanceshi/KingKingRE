.class final Lcom/google/android/gms/internal/zzbdu;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic zzO:Ljava/lang/String;

.field private synthetic zzaEK:Lcom/google/android/gms/internal/zzbdr;

.field private synthetic zzaEL:Lcom/google/android/gms/internal/zzbdt;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbdt;Lcom/google/android/gms/internal/zzbdr;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEL:Lcom/google/android/gms/internal/zzbdt;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEK:Lcom/google/android/gms/internal/zzbdr;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzbdu;->zzO:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEL:Lcom/google/android/gms/internal/zzbdt;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdt;->zza(Lcom/google/android/gms/internal/zzbdt;)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEK:Lcom/google/android/gms/internal/zzbdr;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEL:Lcom/google/android/gms/internal/zzbdt;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdt;->zzb(Lcom/google/android/gms/internal/zzbdt;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEL:Lcom/google/android/gms/internal/zzbdt;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdt;->zzb(Lcom/google/android/gms/internal/zzbdt;)Landroid/os/Bundle;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbdu;->zzO:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzbdr;->onCreate(Landroid/os/Bundle;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEL:Lcom/google/android/gms/internal/zzbdt;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdt;->zza(Lcom/google/android/gms/internal/zzbdt;)I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEK:Lcom/google/android/gms/internal/zzbdr;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbdr;->onStart()V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEL:Lcom/google/android/gms/internal/zzbdt;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdt;->zza(Lcom/google/android/gms/internal/zzbdt;)I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEK:Lcom/google/android/gms/internal/zzbdr;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbdr;->onResume()V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEL:Lcom/google/android/gms/internal/zzbdt;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdt;->zza(Lcom/google/android/gms/internal/zzbdt;)I

    move-result v0

    const/4 v1, 0x4

    if-lt v0, v1, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEK:Lcom/google/android/gms/internal/zzbdr;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbdr;->onStop()V

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEL:Lcom/google/android/gms/internal/zzbdt;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdt;->zza(Lcom/google/android/gms/internal/zzbdt;)I

    move-result v0

    const/4 v1, 0x5

    if-lt v0, v1, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdu;->zzaEK:Lcom/google/android/gms/internal/zzbdr;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbdr;->onDestroy()V

    :cond_4
    return-void

    :cond_5
    const/4 v0, 0x0

    goto :goto_0
.end method
