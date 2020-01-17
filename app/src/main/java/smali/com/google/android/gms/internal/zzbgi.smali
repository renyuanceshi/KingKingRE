.class public final Lcom/google/android/gms/internal/zzbgi;
.super Lcom/google/android/gms/common/internal/safeparcel/zza;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        "O:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/common/internal/safeparcel/zza;"
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/zzbgl;


# instance fields
.field protected final zzaIH:I

.field protected final zzaII:Z

.field protected final zzaIJ:I

.field protected final zzaIK:Z

.field protected final zzaIL:Ljava/lang/String;

.field protected final zzaIM:I

.field protected final zzaIN:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lcom/google/android/gms/internal/zzbgh;",
            ">;"
        }
    .end annotation
.end field

.field private zzaIO:Ljava/lang/String;

.field private zzaIP:Lcom/google/android/gms/internal/zzbgn;

.field private zzaIQ:Lcom/google/android/gms/internal/zzbgj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzbgj",
            "<TI;TO;>;"
        }
    .end annotation
.end field

.field private final zzaku:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzbgl;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzbgl;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzbgi;->CREATOR:Lcom/google/android/gms/internal/zzbgl;

    return-void
.end method

.method constructor <init>(IIZIZLjava/lang/String;ILjava/lang/String;Lcom/google/android/gms/internal/zzbgb;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/zza;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/zzbgi;->zzaku:I

    iput p2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIH:I

    iput-boolean p3, p0, Lcom/google/android/gms/internal/zzbgi;->zzaII:Z

    iput p4, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIJ:I

    iput-boolean p5, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIK:Z

    iput-object p6, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIL:Ljava/lang/String;

    iput p7, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIM:I

    if-nez p8, :cond_0

    iput-object v1, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIN:Ljava/lang/Class;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIO:Ljava/lang/String;

    :goto_0
    if-nez p9, :cond_1

    iput-object v1, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIQ:Lcom/google/android/gms/internal/zzbgj;

    :goto_1
    return-void

    :cond_0
    const-class v0, Lcom/google/android/gms/internal/zzbgs;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIN:Ljava/lang/Class;

    iput-object p8, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIO:Ljava/lang/String;

    goto :goto_0

    :cond_1
    invoke-virtual {p9}, Lcom/google/android/gms/internal/zzbgb;->zzrK()Lcom/google/android/gms/internal/zzbgj;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIQ:Lcom/google/android/gms/internal/zzbgj;

    goto :goto_1
.end method

.method private constructor <init>(IZIZLjava/lang/String;ILjava/lang/Class;Lcom/google/android/gms/internal/zzbgj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZIZ",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/Class",
            "<+",
            "Lcom/google/android/gms/internal/zzbgh;",
            ">;",
            "Lcom/google/android/gms/internal/zzbgj",
            "<TI;TO;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/zza;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaku:I

    iput p1, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIH:I

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaII:Z

    iput p3, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIJ:I

    iput-boolean p4, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIK:Z

    iput-object p5, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIL:Ljava/lang/String;

    iput p6, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIM:I

    iput-object p7, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIN:Ljava/lang/Class;

    if-nez p7, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIO:Ljava/lang/String;

    :goto_0
    iput-object p8, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIQ:Lcom/google/android/gms/internal/zzbgj;

    return-void

    :cond_0
    invoke-virtual {p7}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIO:Ljava/lang/String;

    goto :goto_0
.end method

.method public static zza(Ljava/lang/String;ILcom/google/android/gms/internal/zzbgj;Z)Lcom/google/android/gms/internal/zzbgi;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Lcom/google/android/gms/internal/zzbgj",
            "<**>;Z)",
            "Lcom/google/android/gms/internal/zzbgi;"
        }
    .end annotation

    const/4 v2, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzbgi;

    const/4 v1, 0x7

    const/4 v7, 0x0

    move v3, v2

    move v4, v2

    move-object v5, p0

    move v6, p1

    move-object v8, p2

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/zzbgi;-><init>(IZIZLjava/lang/String;ILjava/lang/Class;Lcom/google/android/gms/internal/zzbgj;)V

    return-object v0
.end method

.method public static zza(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/zzbgi;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/google/android/gms/internal/zzbgh;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/google/android/gms/internal/zzbgi",
            "<TT;TT;>;"
        }
    .end annotation

    const/16 v1, 0xb

    const/4 v2, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzbgi;

    const/4 v8, 0x0

    move v3, v1

    move v4, v2

    move-object v5, p0

    move v6, p1

    move-object v7, p2

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/zzbgi;-><init>(IZIZLjava/lang/String;ILjava/lang/Class;Lcom/google/android/gms/internal/zzbgj;)V

    return-object v0
.end method

.method public static zzb(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/zzbgi;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/google/android/gms/internal/zzbgh;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/google/android/gms/internal/zzbgi",
            "<",
            "Ljava/util/ArrayList",
            "<TT;>;",
            "Ljava/util/ArrayList",
            "<TT;>;>;"
        }
    .end annotation

    const/16 v1, 0xb

    const/4 v2, 0x1

    new-instance v0, Lcom/google/android/gms/internal/zzbgi;

    const/4 v8, 0x0

    move v3, v1

    move v4, v2

    move-object v5, p0

    move v6, p1

    move-object v7, p2

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/zzbgi;-><init>(IZIZLjava/lang/String;ILjava/lang/Class;Lcom/google/android/gms/internal/zzbgj;)V

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzbgi;)Lcom/google/android/gms/internal/zzbgj;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIQ:Lcom/google/android/gms/internal/zzbgj;

    return-object v0
.end method

.method public static zzj(Ljava/lang/String;I)Lcom/google/android/gms/internal/zzbgi;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lcom/google/android/gms/internal/zzbgi",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    const/4 v7, 0x0

    const/4 v1, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzbgi;

    move v2, v1

    move v3, v1

    move v4, v1

    move-object v5, p0

    move v6, p1

    move-object v8, v7

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/zzbgi;-><init>(IZIZLjava/lang/String;ILjava/lang/Class;Lcom/google/android/gms/internal/zzbgj;)V

    return-object v0
.end method

.method public static zzk(Ljava/lang/String;I)Lcom/google/android/gms/internal/zzbgi;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lcom/google/android/gms/internal/zzbgi",
            "<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    const/4 v7, 0x0

    const/4 v1, 0x6

    const/4 v2, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzbgi;

    move v3, v1

    move v4, v2

    move-object v5, p0

    move v6, p1

    move-object v8, v7

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/zzbgi;-><init>(IZIZLjava/lang/String;ILjava/lang/Class;Lcom/google/android/gms/internal/zzbgj;)V

    return-object v0
.end method

.method public static zzl(Ljava/lang/String;I)Lcom/google/android/gms/internal/zzbgi;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lcom/google/android/gms/internal/zzbgi",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v7, 0x0

    const/4 v1, 0x7

    const/4 v2, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzbgi;

    move v3, v1

    move v4, v2

    move-object v5, p0

    move v6, p1

    move-object v8, v7

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/zzbgi;-><init>(IZIZLjava/lang/String;ILjava/lang/Class;Lcom/google/android/gms/internal/zzbgj;)V

    return-object v0
.end method

.method private zzrN()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIO:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIO:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public final convertBack(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TO;)TI;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIQ:Lcom/google/android/gms/internal/zzbgj;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzbgj;->convertBack(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzbe;->zzt(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzbg;

    move-result-object v0

    const-string/jumbo v1, "versionCode"

    iget v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaku:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzbg;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzbg;

    move-result-object v0

    const-string/jumbo v1, "typeIn"

    iget v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIH:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzbg;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzbg;

    move-result-object v0

    const-string/jumbo v1, "typeInArray"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaII:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzbg;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzbg;

    move-result-object v0

    const-string/jumbo v1, "typeOut"

    iget v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIJ:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzbg;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzbg;

    move-result-object v0

    const-string/jumbo v1, "typeOutArray"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIK:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzbg;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzbg;

    move-result-object v0

    const-string/jumbo v1, "outputFieldName"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIL:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzbg;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzbg;

    move-result-object v0

    const-string/jumbo v1, "safeParcelFieldId"

    iget v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIM:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzbg;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzbg;

    move-result-object v0

    const-string/jumbo v1, "concreteTypeName"

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbgi;->zzrN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzbg;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzbg;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIN:Ljava/lang/Class;

    if-eqz v1, :cond_0

    const-string/jumbo v2, "concreteType.class"

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzbg;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzbg;

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIQ:Lcom/google/android/gms/internal/zzbgj;

    if-eqz v1, :cond_1

    const-string/jumbo v1, "converterName"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIQ:Lcom/google/android/gms/internal/zzbgj;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzbg;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzbg;

    :cond_1
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzbg;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const/4 v3, 0x0

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zze(Landroid/os/Parcel;)I

    move-result v1

    const/4 v0, 0x1

    iget v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaku:I

    invoke-static {p1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zzc(Landroid/os/Parcel;II)V

    const/4 v0, 0x2

    iget v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIH:I

    invoke-static {p1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zzc(Landroid/os/Parcel;II)V

    const/4 v0, 0x3

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaII:Z

    invoke-static {p1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;IZ)V

    const/4 v0, 0x4

    iget v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIJ:I

    invoke-static {p1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zzc(Landroid/os/Parcel;II)V

    const/4 v0, 0x5

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIK:Z

    invoke-static {p1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;IZ)V

    const/4 v0, 0x6

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIL:Ljava/lang/String;

    invoke-static {p1, v0, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v0, 0x7

    iget v2, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIM:I

    invoke-static {p1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zzc(Landroid/os/Parcel;II)V

    const/16 v0, 0x8

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbgi;->zzrN()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v0, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 v2, 0x9

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIQ:Lcom/google/android/gms/internal/zzbgj;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {p1, v2, v0, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    invoke-static {p1, v1}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zzI(Landroid/os/Parcel;I)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIQ:Lcom/google/android/gms/internal/zzbgj;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbgb;->zza(Lcom/google/android/gms/internal/zzbgj;)Lcom/google/android/gms/internal/zzbgb;

    move-result-object v0

    goto :goto_0
.end method

.method public final zza(Lcom/google/android/gms/internal/zzbgn;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIP:Lcom/google/android/gms/internal/zzbgn;

    return-void
.end method

.method public final zzrM()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIM:I

    return v0
.end method

.method public final zzrO()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIQ:Lcom/google/android/gms/internal/zzbgj;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final zzrP()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzbgi",
            "<**>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIO:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzbo;->zzu(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIP:Lcom/google/android/gms/internal/zzbgn;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzbo;->zzu(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIP:Lcom/google/android/gms/internal/zzbgn;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbgi;->zzaIO:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzbgn;->zzcJ(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
