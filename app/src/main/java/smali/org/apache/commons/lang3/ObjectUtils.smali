.class public Lorg/apache/commons/lang3/ObjectUtils;
.super Ljava/lang/Object;
.source "ObjectUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/ObjectUtils$Null;
    }
.end annotation


# static fields
.field public static final NULL:Lorg/apache/commons/lang3/ObjectUtils$Null;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    new-instance v0, Lorg/apache/commons/lang3/ObjectUtils$Null;

    invoke-direct {v0}, Lorg/apache/commons/lang3/ObjectUtils$Null;-><init>()V

    sput-object v0, Lorg/apache/commons/lang3/ObjectUtils;->NULL:Lorg/apache/commons/lang3/ObjectUtils$Null;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    return-void
.end method

.method public static CONST(B)B
    .locals 0
    .param p0, "v"    # B

    .prologue
    .line 759
    return p0
.end method

.method public static CONST(C)C
    .locals 0
    .param p0, "v"    # C

    .prologue
    .line 805
    return p0
.end method

.method public static CONST(D)D
    .locals 0
    .param p0, "v"    # D

    .prologue
    .line 928
    return-wide p0
.end method

.method public static CONST(F)F
    .locals 0
    .param p0, "v"    # F

    .prologue
    .line 909
    return p0
.end method

.method public static CONST(I)I
    .locals 0
    .param p0, "v"    # I

    .prologue
    .line 871
    return p0
.end method

.method public static CONST(J)J
    .locals 0
    .param p0, "v"    # J

    .prologue
    .line 890
    return-wide p0
.end method

.method public static CONST(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 948
    .local p0, "v":Ljava/lang/Object;, "TT;"
    return-object p0
.end method

.method public static CONST(S)S
    .locals 0
    .param p0, "v"    # S

    .prologue
    .line 824
    return p0
.end method

.method public static CONST(Z)Z
    .locals 0
    .param p0, "v"    # Z

    .prologue
    .line 740
    return p0
.end method

.method public static CONST_BYTE(I)B
    .locals 3
    .param p0, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 782
    const/16 v0, -0x80

    if-lt p0, v0, :cond_0

    const/16 v0, 0x7f

    if-le p0, v0, :cond_1

    .line 783
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Supplied value must be a valid byte literal between -128 and 127: ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 785
    :cond_1
    int-to-byte v0, p0

    return v0
.end method

.method public static CONST_SHORT(I)S
    .locals 3
    .param p0, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 847
    const/16 v0, -0x8000

    if-lt p0, v0, :cond_0

    const/16 v0, 0x7fff

    if-le p0, v0, :cond_1

    .line 848
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Supplied value must be a valid byte literal between -32768 and 32767: ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 850
    :cond_1
    int-to-short v0, p0

    return v0
.end method

.method public static clone(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 603
    .local p0, "obj":Ljava/lang/Object;, "TT;"
    instance-of v7, p0, Ljava/lang/Cloneable;

    if-eqz v7, :cond_3

    .line 605
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 606
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 607
    .local v2, "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v7

    if-nez v7, :cond_1

    .line 608
    check-cast p0, [Ljava/lang/Object;

    .end local p0    # "obj":Ljava/lang/Object;, "TT;"
    check-cast p0, [Ljava/lang/Object;

    invoke-virtual {p0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v6

    .line 633
    .end local v2    # "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v6, "result":Ljava/lang/Object;
    :cond_0
    :goto_0
    move-object v0, v6

    .line 637
    .local v0, "checked":Ljava/lang/Object;, "TT;"
    :goto_1
    return-object v0

    .line 610
    .end local v0    # "checked":Ljava/lang/Object;, "TT;"
    .end local v6    # "result":Ljava/lang/Object;
    .restart local v2    # "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local p0    # "obj":Ljava/lang/Object;, "TT;"
    :cond_1
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v4

    .line 611
    .local v4, "length":I
    invoke-static {v2, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "result":Ljava/lang/Object;
    move v5, v4

    .line 612
    .end local v4    # "length":I
    .local v5, "length":I
    :goto_2
    add-int/lit8 v4, v5, -0x1

    .end local v5    # "length":I
    .restart local v4    # "length":I
    if-lez v5, :cond_0

    .line 613
    invoke-static {p0, v4}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v6, v4, v7}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    move v5, v4

    .end local v4    # "length":I
    .restart local v5    # "length":I
    goto :goto_2

    .line 618
    .end local v2    # "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "length":I
    .end local v6    # "result":Ljava/lang/Object;
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string/jumbo v8, "clone"

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Class;

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 619
    .local v1, "clone":Ljava/lang/reflect/Method;
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v6

    .restart local v6    # "result":Ljava/lang/Object;
    goto :goto_0

    .line 620
    .end local v1    # "clone":Ljava/lang/reflect/Method;
    .end local v6    # "result":Ljava/lang/Object;
    :catch_0
    move-exception v3

    .line 621
    .local v3, "e":Ljava/lang/NoSuchMethodException;
    new-instance v7, Lorg/apache/commons/lang3/exception/CloneFailedException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Cloneable type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " has no clone method"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v3}, Lorg/apache/commons/lang3/exception/CloneFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 624
    .end local v3    # "e":Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v3

    .line 625
    .local v3, "e":Ljava/lang/IllegalAccessException;
    new-instance v7, Lorg/apache/commons/lang3/exception/CloneFailedException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Cannot clone Cloneable type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v3}, Lorg/apache/commons/lang3/exception/CloneFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 627
    .end local v3    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v3

    .line 628
    .local v3, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v7, Lorg/apache/commons/lang3/exception/CloneFailedException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Exception cloning Cloneable type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/commons/lang3/exception/CloneFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 637
    .end local v3    # "e":Ljava/lang/reflect/InvocationTargetException;
    :cond_3
    const/4 v0, 0x0

    goto/16 :goto_1
.end method

.method public static cloneIfPossible(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 657
    .local p0, "obj":Ljava/lang/Object;, "TT;"
    invoke-static {p0}, Lorg/apache/commons/lang3/ObjectUtils;->clone(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 658
    .local v0, "clone":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    .end local p0    # "obj":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object p0

    .restart local p0    # "obj":Ljava/lang/Object;, "TT;"
    :cond_0
    move-object p0, v0

    goto :goto_0
.end method

.method public static compare(Ljava/lang/Comparable;Ljava/lang/Comparable;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<-TT;>;>(TT;TT;)I"
        }
    .end annotation

    .prologue
    .line 483
    .local p0, "c1":Ljava/lang/Comparable;, "TT;"
    .local p1, "c2":Ljava/lang/Comparable;, "TT;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ObjectUtils;->compare(Ljava/lang/Comparable;Ljava/lang/Comparable;Z)I

    move-result v0

    return v0
.end method

.method public static compare(Ljava/lang/Comparable;Ljava/lang/Comparable;Z)I
    .locals 2
    .param p2, "nullGreater"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<-TT;>;>(TT;TT;Z)I"
        }
    .end annotation

    .prologue
    .local p0, "c1":Ljava/lang/Comparable;, "TT;"
    .local p1, "c2":Ljava/lang/Comparable;, "TT;"
    const/4 v0, 0x1

    const/4 v1, -0x1

    .line 500
    if-ne p0, p1, :cond_1

    .line 501
    const/4 v0, 0x0

    .line 507
    :cond_0
    :goto_0
    return v0

    .line 502
    :cond_1
    if-nez p0, :cond_2

    .line 503
    if-nez p2, :cond_0

    move v0, v1

    goto :goto_0

    .line 504
    :cond_2
    if-nez p1, :cond_4

    .line 505
    if-eqz p2, :cond_3

    :goto_1
    move v0, v1

    goto :goto_0

    :cond_3
    move v1, v0

    goto :goto_1

    .line 507
    :cond_4
    invoke-interface {p0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method

.method public static defaultIfNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 96
    .local p0, "object":Ljava/lang/Object;, "TT;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    if-eqz p0, :cond_0

    .end local p0    # "object":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object p0

    .restart local p0    # "object":Ljava/lang/Object;, "TT;"
    :cond_0
    move-object p0, p1

    goto :goto_0
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "object1"    # Ljava/lang/Object;
    .param p1, "object2"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 157
    if-ne p0, p1, :cond_0

    .line 158
    const/4 v0, 0x1

    .line 163
    :goto_0
    return v0

    .line 160
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 161
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 163
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public static varargs firstNonNull([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)TT;"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "values":[Ljava/lang/Object;, "[TT;"
    if-eqz p0, :cond_1

    .line 123
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 124
    .local v3, "val":Ljava/lang/Object;, "TT;"
    if-eqz v3, :cond_0

    .line 129
    .end local v0    # "arr$":[Ljava/lang/Object;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "val":Ljava/lang/Object;, "TT;"
    :goto_1
    return-object v3

    .line 123
    .restart local v0    # "arr$":[Ljava/lang/Object;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v3    # "val":Ljava/lang/Object;, "TT;"
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 129
    .end local v0    # "arr$":[Ljava/lang/Object;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "val":Ljava/lang/Object;, "TT;"
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static hashCode(Ljava/lang/Object;)I
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 207
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public static varargs hashCodeMulti([Ljava/lang/Object;)I
    .locals 7
    .param p0, "objects"    # [Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 234
    const/4 v1, 0x1

    .line 235
    .local v1, "hash":I
    if-eqz p0, :cond_0

    .line 236
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v4, v0, v2

    .line 237
    .local v4, "object":Ljava/lang/Object;
    mul-int/lit8 v5, v1, 0x1f

    invoke-static {v4}, Lorg/apache/commons/lang3/ObjectUtils;->hashCode(Ljava/lang/Object;)I

    move-result v6

    add-int v1, v5, v6

    .line 236
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 240
    .end local v0    # "arr$":[Ljava/lang/Object;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "object":Ljava/lang/Object;
    :cond_0
    return v1
.end method

.method public static identityToString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 262
    if-nez p0, :cond_0

    .line 263
    const/4 v1, 0x0

    .line 267
    :goto_0
    return-object v1

    .line 265
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 266
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-static {v0, p0}, Lorg/apache/commons/lang3/ObjectUtils;->identityToString(Ljava/lang/StringBuilder;Ljava/lang/Object;)V

    .line 267
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static identityToString(Ljava/lang/Appendable;Ljava/lang/Object;)V
    .locals 2
    .param p0, "appendable"    # Ljava/lang/Appendable;
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 287
    if-nez p1, :cond_0

    .line 288
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Cannot get the toString of a null identity"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 290
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    const/16 v1, 0x40

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 293
    return-void
.end method

.method public static identityToString(Ljava/lang/StringBuffer;Ljava/lang/Object;)V
    .locals 2
    .param p0, "buffer"    # Ljava/lang/StringBuffer;
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 335
    if-nez p1, :cond_0

    .line 336
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Cannot get the toString of a null identity"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 338
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 341
    return-void
.end method

.method public static identityToString(Ljava/lang/StringBuilder;Ljava/lang/Object;)V
    .locals 2
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 359
    if-nez p1, :cond_0

    .line 360
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Cannot get the toString of a null identity"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 362
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    return-void
.end method

.method public static identityToString(Lorg/apache/commons/lang3/text/StrBuilder;Ljava/lang/Object;)V
    .locals 2
    .param p0, "builder"    # Lorg/apache/commons/lang3/text/StrBuilder;
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 311
    if-nez p1, :cond_0

    .line 312
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Cannot get the toString of a null identity"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 314
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 317
    return-void
.end method

.method public static varargs max([Ljava/lang/Comparable;)Ljava/lang/Comparable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<-TT;>;>([TT;)TT;"
        }
    .end annotation

    .prologue
    .line 461
    .local p0, "values":[Ljava/lang/Comparable;, "[TT;"
    const/4 v3, 0x0

    .line 462
    .local v3, "result":Ljava/lang/Comparable;, "TT;"
    if-eqz p0, :cond_1

    .line 463
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Comparable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v4, v0, v1

    .line 464
    .local v4, "value":Ljava/lang/Comparable;, "TT;"
    const/4 v5, 0x0

    invoke-static {v4, v3, v5}, Lorg/apache/commons/lang3/ObjectUtils;->compare(Ljava/lang/Comparable;Ljava/lang/Comparable;Z)I

    move-result v5

    if-lez v5, :cond_0

    .line 465
    move-object v3, v4

    .line 463
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 469
    .end local v0    # "arr$":[Ljava/lang/Comparable;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v4    # "value":Ljava/lang/Comparable;, "TT;"
    :cond_1
    return-object v3
.end method

.method public static varargs median([Ljava/lang/Comparable;)Ljava/lang/Comparable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<-TT;>;>([TT;)TT;"
        }
    .end annotation

    .prologue
    .line 521
    .local p0, "items":[Ljava/lang/Comparable;, "[TT;"
    invoke-static {p0}, Lorg/apache/commons/lang3/Validate;->notEmpty([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 522
    invoke-static {p0}, Lorg/apache/commons/lang3/Validate;->noNullElements([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 523
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    .line 524
    .local v1, "sort":Ljava/util/TreeSet;, "Ljava/util/TreeSet<TT;>;"
    invoke-static {v1, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 527
    invoke-virtual {v1}, Ljava/util/TreeSet;->toArray()[Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1}, Ljava/util/TreeSet;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    div-int/lit8 v3, v3, 0x2

    aget-object v0, v2, v3

    check-cast v0, Ljava/lang/Comparable;

    .line 528
    .local v0, "result":Ljava/lang/Comparable;, "TT;"
    return-object v0
.end method

.method public static varargs median(Ljava/util/Comparator;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator",
            "<TT;>;[TT;)TT;"
        }
    .end annotation

    .prologue
    .local p0, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<TT;>;"
    .local p1, "items":[Ljava/lang/Object;, "[TT;"
    const/4 v4, 0x0

    .line 543
    const-string/jumbo v2, "null/empty items"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {p1, v2, v3}, Lorg/apache/commons/lang3/Validate;->notEmpty([Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)[Ljava/lang/Object;

    .line 544
    invoke-static {p1}, Lorg/apache/commons/lang3/Validate;->noNullElements([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 545
    const-string/jumbo v2, "null comparator"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {p0, v2, v3}, Lorg/apache/commons/lang3/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 546
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1, p0}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 547
    .local v1, "sort":Ljava/util/TreeSet;, "Ljava/util/TreeSet<TT;>;"
    invoke-static {v1, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 550
    invoke-virtual {v1}, Ljava/util/TreeSet;->toArray()[Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1}, Ljava/util/TreeSet;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    div-int/lit8 v3, v3, 0x2

    aget-object v0, v2, v3

    .line 551
    .local v0, "result":Ljava/lang/Object;, "TT;"
    return-object v0
.end method

.method public static varargs min([Ljava/lang/Comparable;)Ljava/lang/Comparable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<-TT;>;>([TT;)TT;"
        }
    .end annotation

    .prologue
    .line 436
    .local p0, "values":[Ljava/lang/Comparable;, "[TT;"
    const/4 v3, 0x0

    .line 437
    .local v3, "result":Ljava/lang/Comparable;, "TT;"
    if-eqz p0, :cond_1

    .line 438
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Comparable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v4, v0, v1

    .line 439
    .local v4, "value":Ljava/lang/Comparable;, "TT;"
    const/4 v5, 0x1

    invoke-static {v4, v3, v5}, Lorg/apache/commons/lang3/ObjectUtils;->compare(Ljava/lang/Comparable;Ljava/lang/Comparable;Z)I

    move-result v5

    if-gez v5, :cond_0

    .line 440
    move-object v3, v4

    .line 438
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 444
    .end local v0    # "arr$":[Ljava/lang/Comparable;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v4    # "value":Ljava/lang/Comparable;, "TT;"
    :cond_1
    return-object v3
.end method

.method public static varargs mode([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)TT;"
        }
    .end annotation

    .prologue
    .line 565
    .local p0, "items":[Ljava/lang/Object;, "[TT;"
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->isNotEmpty([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 566
    new-instance v7, Ljava/util/HashMap;

    array-length v10, p0

    invoke-direct {v7, v10}, Ljava/util/HashMap;-><init>(I)V

    .line 567
    .local v7, "occurrences":Ljava/util/HashMap;, "Ljava/util/HashMap<TT;Lorg/apache/commons/lang3/mutable/MutableInt;>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v9, v0, v4

    .line 568
    .local v9, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {v7, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/lang3/mutable/MutableInt;

    .line 569
    .local v2, "count":Lorg/apache/commons/lang3/mutable/MutableInt;
    if-nez v2, :cond_0

    .line 570
    new-instance v10, Lorg/apache/commons/lang3/mutable/MutableInt;

    const/4 v11, 0x1

    invoke-direct {v10, v11}, Lorg/apache/commons/lang3/mutable/MutableInt;-><init>(I)V

    invoke-virtual {v7, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 572
    :cond_0
    invoke-virtual {v2}, Lorg/apache/commons/lang3/mutable/MutableInt;->increment()V

    goto :goto_1

    .line 575
    .end local v2    # "count":Lorg/apache/commons/lang3/mutable/MutableInt;
    .end local v9    # "t":Ljava/lang/Object;, "TT;"
    :cond_1
    const/4 v8, 0x0

    .line 576
    .local v8, "result":Ljava/lang/Object;, "TT;"
    const/4 v6, 0x0

    .line 577
    .local v6, "max":I
    invoke-virtual {v7}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .end local v8    # "result":Ljava/lang/Object;, "TT;"
    .local v4, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 578
    .local v3, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TT;Lorg/apache/commons/lang3/mutable/MutableInt;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/apache/commons/lang3/mutable/MutableInt;

    invoke-virtual {v10}, Lorg/apache/commons/lang3/mutable/MutableInt;->intValue()I

    move-result v1

    .line 579
    .local v1, "cmp":I
    if-ne v1, v6, :cond_3

    .line 580
    const/4 v8, 0x0

    .restart local v8    # "result":Ljava/lang/Object;, "TT;"
    goto :goto_2

    .line 581
    .end local v8    # "result":Ljava/lang/Object;, "TT;"
    :cond_3
    if-le v1, v6, :cond_2

    .line 582
    move v6, v1

    .line 583
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    .restart local v8    # "result":Ljava/lang/Object;, "TT;"
    goto :goto_2

    .line 588
    .end local v0    # "arr$":[Ljava/lang/Object;
    .end local v1    # "cmp":I
    .end local v3    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TT;Lorg/apache/commons/lang3/mutable/MutableInt;>;"
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "len$":I
    .end local v6    # "max":I
    .end local v7    # "occurrences":Ljava/util/HashMap;, "Ljava/util/HashMap<TT;Lorg/apache/commons/lang3/mutable/MutableInt;>;"
    .end local v8    # "result":Ljava/lang/Object;, "TT;"
    :cond_4
    const/4 v8, 0x0

    :cond_5
    return-object v8
.end method

.method public static notEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "object1"    # Ljava/lang/Object;
    .param p1, "object2"    # Ljava/lang/Object;

    .prologue
    .line 186
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ObjectUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 391
    if-nez p0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "nullStr"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 417
    if-nez p0, :cond_0

    .end local p1    # "nullStr":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "nullStr":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method
