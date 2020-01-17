.class public Lcom/google/android/gms/internal/zzbdr;
.super Ljava/lang/Object;


# instance fields
.field protected final zzaEG:Lcom/google/android/gms/internal/zzbds;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/internal/zzbds;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbdr;->zzaEG:Lcom/google/android/gms/internal/zzbds;

    return-void
.end method

.method protected static zzb(Lcom/google/android/gms/internal/zzbdq;)Lcom/google/android/gms/internal/zzbds;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbdq;->zzqC()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbdq;->zzqE()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzben;->zza(Landroid/support/v4/app/FragmentActivity;)Lcom/google/android/gms/internal/zzben;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbdq;->zzqD()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdt;->zzo(Landroid/app/Activity;)Lcom/google/android/gms/internal/zzbdt;

    move-result-object v0

    goto :goto_0
.end method

.method public static zzn(Landroid/app/Activity;)Lcom/google/android/gms/internal/zzbds;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzbdq;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzbdq;-><init>(Landroid/app/Activity;)V

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbdr;->zzb(Lcom/google/android/gms/internal/zzbdq;)Lcom/google/android/gms/internal/zzbds;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 0
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    return-void
.end method

.method public final getActivity()Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbdr;->zzaEG:Lcom/google/android/gms/internal/zzbds;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzbds;->zzqF()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    return-void
.end method

.method public onDestroy()V
    .locals 0
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    return-void
.end method

.method public onResume()V
    .locals 0
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    return-void
.end method

.method public onStart()V
    .locals 0
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    return-void
.end method

.method public onStop()V
    .locals 0
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    return-void
.end method
