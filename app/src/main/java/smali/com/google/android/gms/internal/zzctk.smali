.class public final Lcom/google/android/gms/internal/zzctk;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/Api$ApiOptions$Optional;


# static fields
.field public static final zzbCM:Lcom/google/android/gms/internal/zzctk;


# instance fields
.field private final zzalh:Z

.field private final zzali:Ljava/lang/String;

.field private final zzama:Z

.field private final zzamb:Ljava/lang/String;

.field private final zzbCN:Z

.field private final zzbCO:Z

.field private final zzbCP:Ljava/lang/Long;

.field private final zzbCQ:Ljava/lang/Long;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v3, 0x0

    const/4 v1, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzctl;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzctl;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/zzctk;

    move v2, v1

    move v4, v1

    move-object v5, v3

    move v6, v1

    move-object v7, v3

    move-object v8, v3

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/zzctk;-><init>(ZZLjava/lang/String;ZLjava/lang/String;ZLjava/lang/Long;Ljava/lang/Long;)V

    sput-object v0, Lcom/google/android/gms/internal/zzctk;->zzbCM:Lcom/google/android/gms/internal/zzctk;

    return-void
.end method

.method private constructor <init>(ZZLjava/lang/String;ZLjava/lang/String;ZLjava/lang/Long;Ljava/lang/Long;)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzctk;->zzbCN:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzctk;->zzalh:Z

    iput-object v1, p0, Lcom/google/android/gms/internal/zzctk;->zzali:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzctk;->zzama:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzctk;->zzbCO:Z

    iput-object v1, p0, Lcom/google/android/gms/internal/zzctk;->zzamb:Ljava/lang/String;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzctk;->zzbCP:Ljava/lang/Long;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzctk;->zzbCQ:Ljava/lang/Long;

    return-void
.end method


# virtual methods
.method public final getServerClientId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzctk;->zzali:Ljava/lang/String;

    return-object v0
.end method

.method public final isIdTokenRequested()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzctk;->zzalh:Z

    return v0
.end method

.method public final zzAr()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzctk;->zzbCN:Z

    return v0
.end method

.method public final zzAs()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzctk;->zzama:Z

    return v0
.end method

.method public final zzAt()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzctk;->zzamb:Ljava/lang/String;

    return-object v0
.end method

.method public final zzAu()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzctk;->zzbCO:Z

    return v0
.end method

.method public final zzAv()Ljava/lang/Long;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzctk;->zzbCP:Ljava/lang/Long;

    return-object v0
.end method

.method public final zzAw()Ljava/lang/Long;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzctk;->zzbCQ:Ljava/lang/Long;

    return-object v0
.end method
