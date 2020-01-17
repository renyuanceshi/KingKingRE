.class public Lorg/apache/commons/lang/ObjectUtils;
.super Ljava/lang/Object;
.source "ObjectUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang/ObjectUtils$Null;
    }
.end annotation


# static fields
.field public static final NULL:Lorg/apache/commons/lang/ObjectUtils$Null;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    new-instance v0, Lorg/apache/commons/lang/ObjectUtils$Null;

    invoke-direct {v0}, Lorg/apache/commons/lang/ObjectUtils$Null;-><init>()V

    sput-object v0, Lorg/apache/commons/lang/ObjectUtils;->NULL:Lorg/apache/commons/lang/ObjectUtils$Null;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    return-void
.end method

.method public static appendIdentityToString(Ljava/lang/StringBuffer;Ljava/lang/Object;)Ljava/lang/StringBuffer;
    .locals 2
    .param p0, "buffer"    # Ljava/lang/StringBuffer;
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 209
    if-nez p1, :cond_0

    .line 210
    const/4 v0, 0x0

    .line 215
    :goto_0
    return-object v0

    .line 212
    :cond_0
    if-nez p0, :cond_1

    .line 213
    new-instance p0, Ljava/lang/StringBuffer;

    .end local p0    # "buffer":Ljava/lang/StringBuffer;
    invoke-direct {p0}, Ljava/lang/StringBuffer;-><init>()V

    .line 215
    .restart local p0    # "buffer":Ljava/lang/StringBuffer;
    :cond_1
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

    move-result-object v0

    goto :goto_0
.end method

.method public static defaultIfNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 89
    if-eqz p0, :cond_0

    .end local p0    # "object":Ljava/lang/Object;
    :goto_0
    return-object p0

    .restart local p0    # "object":Ljava/lang/Object;
    :cond_0
    move-object p0, p1

    goto :goto_0
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "object1"    # Ljava/lang/Object;
    .param p1, "object2"    # Ljava/lang/Object;

    .prologue
    .line 112
    if-ne p0, p1, :cond_0

    .line 113
    const/4 v0, 0x1

    .line 118
    :goto_0
    return v0

    .line 115
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 116
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 118
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public static hashCode(Ljava/lang/Object;)I
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 135
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public static identityToString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 157
    if-nez p0, :cond_0

    .line 158
    const/4 v1, 0x0

    .line 162
    :goto_0
    return-object v1

    .line 160
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 161
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-static {v0, p0}, Lorg/apache/commons/lang/ObjectUtils;->identityToString(Ljava/lang/StringBuffer;Ljava/lang/Object;)V

    .line 162
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static identityToString(Ljava/lang/StringBuffer;Ljava/lang/Object;)V
    .locals 2
    .param p0, "buffer"    # Ljava/lang/StringBuffer;
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 181
    if-nez p1, :cond_0

    .line 182
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Cannot get the toString of a null identity"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 184
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

    .line 187
    return-void
.end method

.method public static max(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/lang/Object;
    .locals 1
    .param p0, "c1"    # Ljava/lang/Comparable;
    .param p1, "c2"    # Ljava/lang/Comparable;

    .prologue
    .line 304
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    .line 305
    invoke-interface {p0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_1

    .line 307
    .end local p0    # "c1":Ljava/lang/Comparable;
    :cond_0
    :goto_0
    return-object p0

    .restart local p0    # "c1":Ljava/lang/Comparable;
    :cond_1
    move-object p0, p1

    .line 305
    goto :goto_0

    .line 307
    :cond_2
    if-nez p0, :cond_0

    move-object p0, p1

    goto :goto_0
.end method

.method public static min(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/lang/Object;
    .locals 2
    .param p0, "c1"    # Ljava/lang/Comparable;
    .param p1, "c2"    # Ljava/lang/Comparable;

    .prologue
    .line 283
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    .line 284
    invoke-interface {p0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_1

    .line 286
    .end local p0    # "c1":Ljava/lang/Comparable;
    :cond_0
    :goto_0
    return-object p0

    .restart local p0    # "c1":Ljava/lang/Comparable;
    :cond_1
    move-object p0, p1

    .line 284
    goto :goto_0

    .line 286
    :cond_2
    if-nez p0, :cond_0

    move-object p0, p1

    goto :goto_0
.end method

.method public static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 241
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

    .prologue
    .line 264
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
