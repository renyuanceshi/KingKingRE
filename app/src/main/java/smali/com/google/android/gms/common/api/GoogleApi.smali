.class public Lcom/google/android/gms/common/api/GoogleApi;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/GoogleApi$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<O::",
        "Lcom/google/android/gms/common/api/Api$ApiOptions;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mId:I

.field private final zzaAJ:Lcom/google/android/gms/common/api/Api$ApiOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TO;"
        }
    .end annotation
.end field

.field private final zzaAK:Lcom/google/android/gms/internal/zzbas;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzbas",
            "<TO;>;"
        }
    .end annotation
.end field

.field private final zzaAL:Lcom/google/android/gms/common/api/GoogleApiClient;

.field private final zzaAM:Lcom/google/android/gms/internal/zzbel;

.field protected final zzaAN:Lcom/google/android/gms/internal/zzbda;

.field private final zzajb:Landroid/accounts/Account;

.field private final zzayW:Lcom/google/android/gms/common/api/Api;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api",
            "<TO;>;"
        }
    .end annotation
.end field

.field private final zzrO:Landroid/os/Looper;


# direct methods
.method private constructor <init>(Landroid/app/Activity;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;Lcom/google/android/gms/common/api/GoogleApi$zza;)V
    .locals 2
    .param p1    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/common/api/Api",
            "<TO;>;TO;",
            "Lcom/google/android/gms/common/api/GoogleApi$zza;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "Null activity is not permitted."

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/zzbo;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "Api must not be null."

    invoke-static {p2, v0}, Lcom/google/android/gms/common/internal/zzbo;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "Settings must not be null; use Settings.DEFAULT_SETTINGS instead."

    invoke-static {p4, v0}, Lcom/google/android/gms/common/internal/zzbo;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzayW:Lcom/google/android/gms/common/api/Api;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAJ:Lcom/google/android/gms/common/api/Api$ApiOptions;

    iget-object v0, p4, Lcom/google/android/gms/common/api/GoogleApi$zza;->zzaAQ:Landroid/os/Looper;

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzrO:Landroid/os/Looper;

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzayW:Lcom/google/android/gms/common/api/Api;

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAJ:Lcom/google/android/gms/common/api/Api$ApiOptions;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzbas;->zza(Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;)Lcom/google/android/gms/internal/zzbas;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAK:Lcom/google/android/gms/internal/zzbas;

    new-instance v0, Lcom/google/android/gms/internal/zzbdi;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzbdi;-><init>(Lcom/google/android/gms/common/api/GoogleApi;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAL:Lcom/google/android/gms/common/api/GoogleApiClient;

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbda;->zzay(Landroid/content/Context;)Lcom/google/android/gms/internal/zzbda;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbda;->zzqm()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->mId:I

    iget-object v0, p4, Lcom/google/android/gms/common/api/GoogleApi$zza;->zzaAP:Lcom/google/android/gms/internal/zzbel;

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAM:Lcom/google/android/gms/internal/zzbel;

    iget-object v0, p4, Lcom/google/android/gms/common/api/GoogleApi$zza;->account:Landroid/accounts/Account;

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzajb:Landroid/accounts/Account;

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAK:Lcom/google/android/gms/internal/zzbas;

    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/zzbbv;->zza(Landroid/app/Activity;Lcom/google/android/gms/internal/zzbda;Lcom/google/android/gms/internal/zzbas;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzbda;->zzb(Lcom/google/android/gms/common/api/GoogleApi;)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;Lcom/google/android/gms/internal/zzbel;)V
    .locals 3
    .param p1    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/common/api/Api",
            "<TO;>;TO;",
            "Lcom/google/android/gms/internal/zzbel;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    new-instance v1, Lcom/google/android/gms/common/api/zzd;

    invoke-direct {v1}, Lcom/google/android/gms/common/api/zzd;-><init>()V

    invoke-virtual {v1, p4}, Lcom/google/android/gms/common/api/zzd;->zza(Lcom/google/android/gms/internal/zzbel;)Lcom/google/android/gms/common/api/zzd;

    move-result-object v1

    invoke-virtual {p1}, Landroid/app/Activity;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/api/zzd;->zza(Landroid/os/Looper;)Lcom/google/android/gms/common/api/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/zzd;->zzpj()Lcom/google/android/gms/common/api/GoogleApi$zza;

    move-result-object v1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/google/android/gms/common/api/GoogleApi;-><init>(Landroid/app/Activity;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;Lcom/google/android/gms/common/api/GoogleApi$zza;)V

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/api/Api;Landroid/os/Looper;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/common/api/Api",
            "<TO;>;",
            "Landroid/os/Looper;",
            ")V"
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "Null context is not permitted."

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/zzbo;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "Api must not be null."

    invoke-static {p2, v0}, Lcom/google/android/gms/common/internal/zzbo;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "Looper must not be null."

    invoke-static {p3, v0}, Lcom/google/android/gms/common/internal/zzbo;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzayW:Lcom/google/android/gms/common/api/Api;

    iput-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAJ:Lcom/google/android/gms/common/api/Api$ApiOptions;

    iput-object p3, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzrO:Landroid/os/Looper;

    invoke-static {p2}, Lcom/google/android/gms/internal/zzbas;->zzb(Lcom/google/android/gms/common/api/Api;)Lcom/google/android/gms/internal/zzbas;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAK:Lcom/google/android/gms/internal/zzbas;

    new-instance v0, Lcom/google/android/gms/internal/zzbdi;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzbdi;-><init>(Lcom/google/android/gms/common/api/GoogleApi;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAL:Lcom/google/android/gms/common/api/GoogleApiClient;

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbda;->zzay(Landroid/content/Context;)Lcom/google/android/gms/internal/zzbda;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbda;->zzqm()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->mId:I

    new-instance v0, Lcom/google/android/gms/internal/zzbar;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzbar;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAM:Lcom/google/android/gms/internal/zzbel;

    iput-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzajb:Landroid/accounts/Account;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;Landroid/os/Looper;Lcom/google/android/gms/internal/zzbel;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/common/api/Api",
            "<TO;>;TO;",
            "Landroid/os/Looper;",
            "Lcom/google/android/gms/internal/zzbel;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    new-instance v1, Lcom/google/android/gms/common/api/zzd;

    invoke-direct {v1}, Lcom/google/android/gms/common/api/zzd;-><init>()V

    invoke-virtual {v1, p4}, Lcom/google/android/gms/common/api/zzd;->zza(Landroid/os/Looper;)Lcom/google/android/gms/common/api/zzd;

    move-result-object v1

    invoke-virtual {v1, p5}, Lcom/google/android/gms/common/api/zzd;->zza(Lcom/google/android/gms/internal/zzbel;)Lcom/google/android/gms/common/api/zzd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/zzd;->zzpj()Lcom/google/android/gms/common/api/GoogleApi$zza;

    move-result-object v1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/google/android/gms/common/api/GoogleApi;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;Lcom/google/android/gms/common/api/GoogleApi$zza;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;Lcom/google/android/gms/common/api/GoogleApi$zza;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/common/api/Api",
            "<TO;>;TO;",
            "Lcom/google/android/gms/common/api/GoogleApi$zza;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "Null context is not permitted."

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/zzbo;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "Api must not be null."

    invoke-static {p2, v0}, Lcom/google/android/gms/common/internal/zzbo;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "Settings must not be null; use Settings.DEFAULT_SETTINGS instead."

    invoke-static {p4, v0}, Lcom/google/android/gms/common/internal/zzbo;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzayW:Lcom/google/android/gms/common/api/Api;

    iput-object p3, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAJ:Lcom/google/android/gms/common/api/Api$ApiOptions;

    iget-object v0, p4, Lcom/google/android/gms/common/api/GoogleApi$zza;->zzaAQ:Landroid/os/Looper;

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzrO:Landroid/os/Looper;

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzayW:Lcom/google/android/gms/common/api/Api;

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAJ:Lcom/google/android/gms/common/api/Api$ApiOptions;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzbas;->zza(Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;)Lcom/google/android/gms/internal/zzbas;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAK:Lcom/google/android/gms/internal/zzbas;

    new-instance v0, Lcom/google/android/gms/internal/zzbdi;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzbdi;-><init>(Lcom/google/android/gms/common/api/GoogleApi;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAL:Lcom/google/android/gms/common/api/GoogleApiClient;

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbda;->zzay(Landroid/content/Context;)Lcom/google/android/gms/internal/zzbda;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbda;->zzqm()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->mId:I

    iget-object v0, p4, Lcom/google/android/gms/common/api/GoogleApi$zza;->zzaAP:Lcom/google/android/gms/internal/zzbel;

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAM:Lcom/google/android/gms/internal/zzbel;

    iget-object v0, p4, Lcom/google/android/gms/common/api/GoogleApi$zza;->account:Landroid/accounts/Account;

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzajb:Landroid/accounts/Account;

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzbda;->zzb(Lcom/google/android/gms/common/api/GoogleApi;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;Lcom/google/android/gms/internal/zzbel;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/common/api/Api",
            "<TO;>;TO;",
            "Lcom/google/android/gms/internal/zzbel;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    new-instance v0, Lcom/google/android/gms/common/api/zzd;

    invoke-direct {v0}, Lcom/google/android/gms/common/api/zzd;-><init>()V

    invoke-virtual {v0, p4}, Lcom/google/android/gms/common/api/zzd;->zza(Lcom/google/android/gms/internal/zzbel;)Lcom/google/android/gms/common/api/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzd;->zzpj()Lcom/google/android/gms/common/api/GoogleApi$zza;

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/gms/common/api/GoogleApi;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;Lcom/google/android/gms/common/api/GoogleApi$zza;)V

    return-void
.end method

.method private final zza(ILcom/google/android/gms/internal/zzbax;)Lcom/google/android/gms/internal/zzbax;
    .locals 1
    .param p2    # Lcom/google/android/gms/internal/zzbax;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "T:",
            "Lcom/google/android/gms/internal/zzbax",
            "<+",
            "Lcom/google/android/gms/common/api/Result;",
            "TA;>;>(ITT;)TT;"
        }
    .end annotation

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzbax;->zzpC()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    invoke-virtual {v0, p0, p1, p2}, Lcom/google/android/gms/internal/zzbda;->zza(Lcom/google/android/gms/common/api/GoogleApi;ILcom/google/android/gms/internal/zzbax;)V

    return-object p2
.end method

.method private final zza(ILcom/google/android/gms/internal/zzbep;)Lcom/google/android/gms/tasks/Task;
    .locals 6
    .param p2    # Lcom/google/android/gms/internal/zzbep;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            "A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            ">(I",
            "Lcom/google/android/gms/internal/zzbep",
            "<TA;TTResult;>;)",
            "Lcom/google/android/gms/tasks/Task",
            "<TTResult;>;"
        }
    .end annotation

    new-instance v4, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v4}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAN:Lcom/google/android/gms/internal/zzbda;

    iget-object v5, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAM:Lcom/google/android/gms/internal/zzbel;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/zzbda;->zza(Lcom/google/android/gms/common/api/GoogleApi;ILcom/google/android/gms/internal/zzbep;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/internal/zzbel;)V

    invoke-virtual {v4}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final getApplicationContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public final getInstanceId()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->mId:I

    return v0
.end method

.method public final getLooper()Landroid/os/Looper;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzrO:Landroid/os/Looper;

    return-object v0
.end method

.method public zza(Landroid/os/Looper;Lcom/google/android/gms/internal/zzbdc;)Lcom/google/android/gms/common/api/Api$zze;
    .locals 7
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Looper;",
            "Lcom/google/android/gms/internal/zzbdc",
            "<TO;>;)",
            "Lcom/google/android/gms/common/api/Api$zze;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzajb:Landroid/accounts/Account;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zze(Landroid/accounts/Account;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzpn()Lcom/google/android/gms/common/internal/zzq;

    move-result-object v3

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzayW:Lcom/google/android/gms/common/api/Api;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Api;->zzpc()Lcom/google/android/gms/common/api/Api$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAJ:Lcom/google/android/gms/common/api/Api$ApiOptions;

    move-object v2, p1

    move-object v5, p2

    move-object v6, p2

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/common/api/Api$zza;->zza(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzq;Ljava/lang/Object;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/Api$zze;

    move-result-object v0

    return-object v0
.end method

.method public final zza(Lcom/google/android/gms/internal/zzbax;)Lcom/google/android/gms/internal/zzbax;
    .locals 1
    .param p1    # Lcom/google/android/gms/internal/zzbax;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "T:",
            "Lcom/google/android/gms/internal/zzbax",
            "<+",
            "Lcom/google/android/gms/common/api/Result;",
            "TA;>;>(TT;)TT;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/common/api/GoogleApi;->zza(ILcom/google/android/gms/internal/zzbax;)Lcom/google/android/gms/internal/zzbax;

    move-result-object v0

    return-object v0
.end method

.method public zza(Landroid/content/Context;Landroid/os/Handler;)Lcom/google/android/gms/internal/zzbei;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzbei;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/zzbei;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    return-object v0
.end method

.method public final zza(Lcom/google/android/gms/internal/zzbep;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            "A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            ">(",
            "Lcom/google/android/gms/internal/zzbep",
            "<TA;TTResult;>;)",
            "Lcom/google/android/gms/tasks/Task",
            "<TTResult;>;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/common/api/GoogleApi;->zza(ILcom/google/android/gms/internal/zzbep;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public final zzb(Lcom/google/android/gms/internal/zzbax;)Lcom/google/android/gms/internal/zzbax;
    .locals 1
    .param p1    # Lcom/google/android/gms/internal/zzbax;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "T:",
            "Lcom/google/android/gms/internal/zzbax",
            "<+",
            "Lcom/google/android/gms/common/api/Result;",
            "TA;>;>(TT;)TT;"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/common/api/GoogleApi;->zza(ILcom/google/android/gms/internal/zzbax;)Lcom/google/android/gms/internal/zzbax;

    move-result-object v0

    return-object v0
.end method

.method public final zzb(Lcom/google/android/gms/internal/zzbep;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            "A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            ">(",
            "Lcom/google/android/gms/internal/zzbep",
            "<TA;TTResult;>;)",
            "Lcom/google/android/gms/tasks/Task",
            "<TTResult;>;"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/common/api/GoogleApi;->zza(ILcom/google/android/gms/internal/zzbep;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public final zzc(Lcom/google/android/gms/internal/zzbax;)Lcom/google/android/gms/internal/zzbax;
    .locals 1
    .param p1    # Lcom/google/android/gms/internal/zzbax;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "T:",
            "Lcom/google/android/gms/internal/zzbax",
            "<+",
            "Lcom/google/android/gms/common/api/Result;",
            "TA;>;>(TT;)TT;"
        }
    .end annotation

    const/4 v0, 0x2

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/common/api/GoogleApi;->zza(ILcom/google/android/gms/internal/zzbax;)Lcom/google/android/gms/internal/zzbax;

    move-result-object v0

    return-object v0
.end method

.method public final zzpg()Lcom/google/android/gms/common/api/Api;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/common/api/Api",
            "<TO;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzayW:Lcom/google/android/gms/common/api/Api;

    return-object v0
.end method

.method public final zzph()Lcom/google/android/gms/internal/zzbas;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzbas",
            "<TO;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAK:Lcom/google/android/gms/internal/zzbas;

    return-object v0
.end method

.method public final zzpi()Lcom/google/android/gms/common/api/GoogleApiClient;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzaAL:Lcom/google/android/gms/common/api/GoogleApiClient;

    return-object v0
.end method
