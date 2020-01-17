.class public Lorg/apache/commons/lang/builder/HashCodeBuilder;
.super Ljava/lang/Object;
.source "HashCodeBuilder.java"


# static fields
.field private static final REGISTRY:Ljava/lang/ThreadLocal;

.field static class$org$apache$commons$lang$builder$HashCodeBuilder:Ljava/lang/Class;


# instance fields
.field private final iConstant:I

.field private iTotal:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 104
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 568
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 561
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 569
    const/16 v0, 0x25

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    .line 570
    const/16 v0, 0x11

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 571
    return-void
.end method

.method public constructor <init>(II)V
    .locals 2
    .param p1, "initialNonZeroOddNumber"    # I
    .param p2, "multiplierNonZeroOddNumber"    # I

    .prologue
    .line 590
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 561
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 591
    if-nez p1, :cond_0

    .line 592
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "HashCodeBuilder requires a non zero initial value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 594
    :cond_0
    rem-int/lit8 v0, p1, 0x2

    if-nez v0, :cond_1

    .line 595
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "HashCodeBuilder requires an odd initial value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 597
    :cond_1
    if-nez p2, :cond_2

    .line 598
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "HashCodeBuilder requires a non zero multiplier"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 600
    :cond_2
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_3

    .line 601
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "HashCodeBuilder requires an odd multiplier"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 603
    :cond_3
    iput p2, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    .line 604
    iput p1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 605
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 519
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static getRegistry()Ljava/util/Set;
    .locals 1

    .prologue
    .line 132
    sget-object v0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    return-object v0
.end method

.method static isRegistered(Ljava/lang/Object;)Z
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 147
    invoke-static {}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v0

    .line 148
    .local v0, "registry":Ljava/util/Set;
    if-eqz v0, :cond_0

    new-instance v1, Lorg/apache/commons/lang/builder/IDKey;

    invoke-direct {v1, p0}, Lorg/apache/commons/lang/builder/IDKey;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static reflectionAppend(Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang/builder/HashCodeBuilder;Z[Ljava/lang/String;)V
    .locals 7
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "builder"    # Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .param p3, "useTransients"    # Z
    .param p4, "excludeFields"    # [Ljava/lang/String;

    .prologue
    .line 169
    invoke-static {p0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->isRegistered(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 195
    :goto_0
    return-void

    .line 173
    :cond_0
    :try_start_0
    invoke-static {p0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->register(Ljava/lang/Object;)V

    .line 174
    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 175
    .local v3, "fields":[Ljava/lang/reflect/Field;
    const/4 v5, 0x1

    invoke-static {v3, v5}, Ljava/lang/reflect/AccessibleObject;->setAccessible([Ljava/lang/reflect/AccessibleObject;Z)V

    .line 176
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v5, v3

    if-ge v4, v5, :cond_3

    .line 177
    aget-object v1, v3, v4

    .line 178
    .local v1, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {p4, v5}, Lorg/apache/commons/lang/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x24

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_2

    if-nez p3, :cond_1

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v5

    if-nez v5, :cond_2

    :cond_1
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_2

    .line 183
    :try_start_1
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 184
    .local v2, "fieldValue":Ljava/lang/Object;
    invoke-virtual {p2, v2}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 176
    .end local v2    # "fieldValue":Ljava/lang/Object;
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 185
    :catch_0
    move-exception v0

    .line 188
    .local v0, "e":Ljava/lang/IllegalAccessException;
    :try_start_2
    new-instance v5, Ljava/lang/InternalError;

    const-string/jumbo v6, "Unexpected IllegalAccessException"

    invoke-direct {v5, v6}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 193
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "fields":[Ljava/lang/reflect/Field;
    .end local v4    # "i":I
    :catchall_0
    move-exception v5

    invoke-static {p0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->unregister(Ljava/lang/Object;)V

    throw v5

    .restart local v3    # "fields":[Ljava/lang/reflect/Field;
    .restart local v4    # "i":I
    :cond_3
    invoke-static {p0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->unregister(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static reflectionHashCode(IILjava/lang/Object;)I
    .locals 6
    .param p0, "initialNonZeroOddNumber"    # I
    .param p1, "multiplierNonZeroOddNumber"    # I
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 235
    const/4 v3, 0x0

    move v0, p0

    move v1, p1

    move-object v2, p2

    move-object v5, v4

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionHashCode(IILjava/lang/Object;Z)I
    .locals 6
    .param p0, "initialNonZeroOddNumber"    # I
    .param p1, "multiplierNonZeroOddNumber"    # I
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "testTransients"    # Z

    .prologue
    const/4 v4, 0x0

    .line 279
    move v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, v4

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;)I
    .locals 6
    .param p0, "initialNonZeroOddNumber"    # I
    .param p1, "multiplierNonZeroOddNumber"    # I
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "testTransients"    # Z
    .param p4, "reflectUpToClass"    # Ljava/lang/Class;

    .prologue
    .line 301
    const/4 v5, 0x0

    move v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I
    .locals 4
    .param p0, "initialNonZeroOddNumber"    # I
    .param p1, "multiplierNonZeroOddNumber"    # I
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "testTransients"    # Z
    .param p4, "reflectUpToClass"    # Ljava/lang/Class;
    .param p5, "excludeFields"    # [Ljava/lang/String;

    .prologue
    .line 353
    if-nez p2, :cond_0

    .line 354
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "The object to build a hash code for must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 356
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/builder/HashCodeBuilder;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;-><init>(II)V

    .line 357
    .local v0, "builder":Lorg/apache/commons/lang/builder/HashCodeBuilder;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 358
    .local v1, "clazz":Ljava/lang/Class;
    invoke-static {p2, v1, v0, p3, p5}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang/builder/HashCodeBuilder;Z[Ljava/lang/String;)V

    .line 359
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_1

    if-eq v1, p4, :cond_1

    .line 360
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    .line 361
    invoke-static {p2, v1, v0, p3, p5}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang/builder/HashCodeBuilder;Z[Ljava/lang/String;)V

    goto :goto_0

    .line 363
    :cond_1
    invoke-virtual {v0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->toHashCode()I

    move-result v2

    return v2
.end method

.method public static reflectionHashCode(Ljava/lang/Object;)I
    .locals 6
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 397
    const/16 v0, 0x11

    const/16 v1, 0x25

    const/4 v3, 0x0

    move-object v2, p0

    move-object v5, v4

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionHashCode(Ljava/lang/Object;Ljava/util/Collection;)I
    .locals 1
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "excludeFields"    # Ljava/util/Collection;

    .prologue
    .line 469
    invoke-static {p1}, Lorg/apache/commons/lang/builder/ReflectionToStringBuilder;->toNoNullStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionHashCode(Ljava/lang/Object;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionHashCode(Ljava/lang/Object;Z)I
    .locals 6
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "testTransients"    # Z

    .prologue
    const/4 v4, 0x0

    .line 433
    const/16 v0, 0x11

    const/16 v1, 0x25

    move-object v2, p0

    move v3, p1

    move-object v5, v4

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionHashCode(Ljava/lang/Object;[Ljava/lang/String;)I
    .locals 6
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "excludeFields"    # [Ljava/lang/String;

    .prologue
    .line 507
    const/16 v0, 0x11

    const/16 v1, 0x25

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p0

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static register(Ljava/lang/Object;)V
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 519
    sget-object v0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->class$org$apache$commons$lang$builder$HashCodeBuilder:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.commons.lang.builder.HashCodeBuilder"

    invoke-static {v0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->class$org$apache$commons$lang$builder$HashCodeBuilder:Ljava/lang/Class;

    :goto_0
    monitor-enter v0

    .line 520
    :try_start_0
    invoke-static {}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v1

    if-nez v1, :cond_0

    .line 521
    sget-object v1, Lorg/apache/commons/lang/builder/HashCodeBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 523
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 524
    invoke-static {}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v0

    new-instance v1, Lorg/apache/commons/lang/builder/IDKey;

    invoke-direct {v1, p0}, Lorg/apache/commons/lang/builder/IDKey;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 525
    return-void

    .line 519
    :cond_1
    sget-object v0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->class$org$apache$commons$lang$builder$HashCodeBuilder:Ljava/lang/Class;

    goto :goto_0

    .line 523
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method static unregister(Ljava/lang/Object;)V
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 540
    invoke-static {}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v0

    .line 541
    .local v0, "registry":Ljava/util/Set;
    if-eqz v0, :cond_1

    .line 542
    new-instance v1, Lorg/apache/commons/lang/builder/IDKey;

    invoke-direct {v1, p0}, Lorg/apache/commons/lang/builder/IDKey;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 543
    sget-object v1, Lorg/apache/commons/lang/builder/HashCodeBuilder;->class$org$apache$commons$lang$builder$HashCodeBuilder:Ljava/lang/Class;

    if-nez v1, :cond_2

    const-string/jumbo v1, "org.apache.commons.lang.builder.HashCodeBuilder"

    invoke-static {v1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/lang/builder/HashCodeBuilder;->class$org$apache$commons$lang$builder$HashCodeBuilder:Ljava/lang/Class;

    :goto_0
    monitor-enter v1

    .line 545
    :try_start_0
    invoke-static {}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v0

    .line 546
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 547
    sget-object v2, Lorg/apache/commons/lang/builder/HashCodeBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 549
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 551
    :cond_1
    return-void

    .line 543
    :cond_2
    sget-object v1, Lorg/apache/commons/lang/builder/HashCodeBuilder;->class$org$apache$commons$lang$builder$HashCodeBuilder:Ljava/lang/Class;

    goto :goto_0

    .line 549
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method


# virtual methods
.method public append(B)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 2
    .param p1, "value"    # B

    .prologue
    .line 658
    iget v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 659
    return-object p0
.end method

.method public append(C)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 2
    .param p1, "value"    # C

    .prologue
    .line 694
    iget v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 695
    return-object p0
.end method

.method public append(D)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 3
    .param p1, "value"    # D

    .prologue
    .line 728
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(J)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(F)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 2
    .param p1, "value"    # F

    .prologue
    .line 761
    iget v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 762
    return-object p0
.end method

.method public append(I)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 795
    iget v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 796
    return-object p0
.end method

.method public append(J)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 5
    .param p1, "value"    # J

    .prologue
    .line 833
    iget v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    const/16 v1, 0x20

    shr-long v2, p1, v1

    xor-long/2addr v2, p1

    long-to-int v1, v2

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 834
    return-object p0
.end method

.method public append(Ljava/lang/Object;)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 867
    if-nez p1, :cond_0

    .line 868
    iget v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 898
    .end local p1    # "object":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 871
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 874
    instance-of v0, p1, [J

    if-eqz v0, :cond_1

    .line 875
    check-cast p1, [J

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p1, [J

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append([J)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    goto :goto_0

    .line 876
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_1
    instance-of v0, p1, [I

    if-eqz v0, :cond_2

    .line 877
    check-cast p1, [I

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p1, [I

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append([I)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    goto :goto_0

    .line 878
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_2
    instance-of v0, p1, [S

    if-eqz v0, :cond_3

    .line 879
    check-cast p1, [S

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p1, [S

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append([S)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    goto :goto_0

    .line 880
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_3
    instance-of v0, p1, [C

    if-eqz v0, :cond_4

    .line 881
    check-cast p1, [C

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p1, [C

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append([C)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    goto :goto_0

    .line 882
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_4
    instance-of v0, p1, [B

    if-eqz v0, :cond_5

    .line 883
    check-cast p1, [B

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append([B)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    goto :goto_0

    .line 884
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_5
    instance-of v0, p1, [D

    if-eqz v0, :cond_6

    .line 885
    check-cast p1, [D

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p1, [D

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append([D)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    goto :goto_0

    .line 886
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_6
    instance-of v0, p1, [F

    if-eqz v0, :cond_7

    .line 887
    check-cast p1, [F

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p1, [F

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append([F)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    goto :goto_0

    .line 888
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_7
    instance-of v0, p1, [Z

    if-eqz v0, :cond_8

    .line 889
    check-cast p1, [Z

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p1, [Z

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append([Z)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    goto :goto_0

    .line 892
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_8
    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append([Ljava/lang/Object;)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    goto :goto_0

    .line 895
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_9
    iget v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    goto :goto_0
.end method

.method public append(S)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 2
    .param p1, "value"    # S

    .prologue
    .line 931
    iget v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 932
    return-object p0
.end method

.method public append(Z)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 2
    .param p1, "value"    # Z

    .prologue
    .line 622
    iget v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v0

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 623
    return-object p0

    .line 622
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public append([B)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 3
    .param p1, "array"    # [B

    .prologue
    .line 674
    if-nez p1, :cond_1

    .line 675
    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 681
    :cond_0
    return-object p0

    .line 677
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 678
    aget-byte v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(B)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    .line 677
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public append([C)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 3
    .param p1, "array"    # [C

    .prologue
    .line 708
    if-nez p1, :cond_1

    .line 709
    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 715
    :cond_0
    return-object p0

    .line 711
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 712
    aget-char v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(C)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    .line 711
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public append([D)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 4
    .param p1, "array"    # [D

    .prologue
    .line 741
    if-nez p1, :cond_1

    .line 742
    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 748
    :cond_0
    return-object p0

    .line 744
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 745
    aget-wide v2, p1, v0

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(D)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    .line 744
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public append([F)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 3
    .param p1, "array"    # [F

    .prologue
    .line 775
    if-nez p1, :cond_1

    .line 776
    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 782
    :cond_0
    return-object p0

    .line 778
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 779
    aget v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(F)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    .line 778
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public append([I)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 3
    .param p1, "array"    # [I

    .prologue
    .line 809
    if-nez p1, :cond_1

    .line 810
    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 816
    :cond_0
    return-object p0

    .line 812
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 813
    aget v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(I)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    .line 812
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public append([J)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 4
    .param p1, "array"    # [J

    .prologue
    .line 847
    if-nez p1, :cond_1

    .line 848
    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 854
    :cond_0
    return-object p0

    .line 850
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 851
    aget-wide v2, p1, v0

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(J)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    .line 850
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public append([Ljava/lang/Object;)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 3
    .param p1, "array"    # [Ljava/lang/Object;

    .prologue
    .line 911
    if-nez p1, :cond_1

    .line 912
    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 918
    :cond_0
    return-object p0

    .line 914
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 915
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    .line 914
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public append([S)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 3
    .param p1, "array"    # [S

    .prologue
    .line 945
    if-nez p1, :cond_1

    .line 946
    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 952
    :cond_0
    return-object p0

    .line 948
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 949
    aget-short v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(S)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    .line 948
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public append([Z)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 3
    .param p1, "array"    # [Z

    .prologue
    .line 636
    if-nez p1, :cond_1

    .line 637
    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 643
    :cond_0
    return-object p0

    .line 639
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 640
    aget-boolean v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(Z)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    .line 639
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public appendSuper(I)Lorg/apache/commons/lang/builder/HashCodeBuilder;
    .locals 2
    .param p1, "superHashCode"    # I

    .prologue
    .line 966
    iget v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    .line 967
    return-object p0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 991
    invoke-virtual {p0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->toHashCode()I

    move-result v0

    return v0
.end method

.method public toHashCode()I
    .locals 1

    .prologue
    .line 978
    iget v0, p0, Lorg/apache/commons/lang/builder/HashCodeBuilder;->iTotal:I

    return v0
.end method
