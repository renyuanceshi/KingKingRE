.class public Lorg/apache/commons/lang/ClassUtils;
.super Ljava/lang/Object;
.source "ClassUtils.java"


# static fields
.field public static final INNER_CLASS_SEPARATOR:Ljava/lang/String;

.field public static final INNER_CLASS_SEPARATOR_CHAR:C = '$'

.field public static final PACKAGE_SEPARATOR:Ljava/lang/String;

.field public static final PACKAGE_SEPARATOR_CHAR:C = '.'

.field private static final abbreviationMap:Ljava/util/Map;

.field static class$java$lang$Boolean:Ljava/lang/Class;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Character:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$org$apache$commons$lang$ClassUtils:Ljava/lang/Class;

.field private static final primitiveWrapperMap:Ljava/util/Map;

.field private static final reverseAbbreviationMap:Ljava/util/Map;

.field private static final wrapperPrimitiveMap:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    .line 57
    const/16 v3, 0x2e

    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->PACKAGE_SEPARATOR:Ljava/lang/String;

    .line 67
    const/16 v3, 0x24

    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->INNER_CLASS_SEPARATOR:Ljava/lang/String;

    .line 72
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    .line 74
    sget-object v4, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v3, :cond_1

    const-string/jumbo v3, "java.lang.Boolean"

    invoke-static {v3}, Lorg/apache/commons/lang/ClassUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_0
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v4, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    sget-object v5, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v3, :cond_2

    const-string/jumbo v3, "java.lang.Byte"

    invoke-static {v3}, Lorg/apache/commons/lang/ClassUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_1
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v4, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    sget-object v5, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v3, :cond_3

    const-string/jumbo v3, "java.lang.Character"

    invoke-static {v3}, Lorg/apache/commons/lang/ClassUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Character:Ljava/lang/Class;

    :goto_2
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v4, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    sget-object v5, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v3, :cond_4

    const-string/jumbo v3, "java.lang.Short"

    invoke-static {v3}, Lorg/apache/commons/lang/ClassUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Short:Ljava/lang/Class;

    :goto_3
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v4, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v3, :cond_5

    const-string/jumbo v3, "java.lang.Integer"

    invoke-static {v3}, Lorg/apache/commons/lang/ClassUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_4
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v4, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    sget-object v5, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v3, :cond_6

    const-string/jumbo v3, "java.lang.Long"

    invoke-static {v3}, Lorg/apache/commons/lang/ClassUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Long:Ljava/lang/Class;

    :goto_5
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v4, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    sget-object v5, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v3, :cond_7

    const-string/jumbo v3, "java.lang.Double"

    invoke-static {v3}, Lorg/apache/commons/lang/ClassUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Double:Ljava/lang/Class;

    :goto_6
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v4, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v3, :cond_8

    const-string/jumbo v3, "java.lang.Float"

    invoke-static {v3}, Lorg/apache/commons/lang/ClassUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Float:Ljava/lang/Class;

    :goto_7
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    sget-object v4, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    sget-object v5, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->wrapperPrimitiveMap:Ljava/util/Map;

    .line 90
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :cond_0
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 91
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 92
    .local v1, "primitiveClass":Ljava/lang/Class;
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 93
    .local v2, "wrapperClass":Ljava/lang/Class;
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 94
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->wrapperPrimitiveMap:Ljava/util/Map;

    invoke-interface {v3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    .line 74
    .end local v0    # "it":Ljava/util/Iterator;
    .end local v1    # "primitiveClass":Ljava/lang/Class;
    .end local v2    # "wrapperClass":Ljava/lang/Class;
    :cond_1
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Boolean:Ljava/lang/Class;

    goto/16 :goto_0

    .line 75
    :cond_2
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Byte:Ljava/lang/Class;

    goto/16 :goto_1

    .line 76
    :cond_3
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Character:Ljava/lang/Class;

    goto/16 :goto_2

    .line 77
    :cond_4
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Short:Ljava/lang/Class;

    goto/16 :goto_3

    .line 78
    :cond_5
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Integer:Ljava/lang/Class;

    goto/16 :goto_4

    .line 79
    :cond_6
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_5

    .line 80
    :cond_7
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_6

    .line 81
    :cond_8
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_7

    .line 102
    .restart local v0    # "it":Ljava/util/Iterator;
    :cond_9
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->abbreviationMap:Ljava/util/Map;

    .line 107
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lorg/apache/commons/lang/ClassUtils;->reverseAbbreviationMap:Ljava/util/Map;

    .line 124
    const-string/jumbo v3, "int"

    const-string/jumbo v4, "I"

    invoke-static {v3, v4}, Lorg/apache/commons/lang/ClassUtils;->addAbbreviation(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    const-string/jumbo v3, "boolean"

    const-string/jumbo v4, "Z"

    invoke-static {v3, v4}, Lorg/apache/commons/lang/ClassUtils;->addAbbreviation(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    const-string/jumbo v3, "float"

    const-string/jumbo v4, "F"

    invoke-static {v3, v4}, Lorg/apache/commons/lang/ClassUtils;->addAbbreviation(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    const-string/jumbo v3, "long"

    const-string/jumbo v4, "J"

    invoke-static {v3, v4}, Lorg/apache/commons/lang/ClassUtils;->addAbbreviation(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    const-string/jumbo v3, "short"

    const-string/jumbo v4, "S"

    invoke-static {v3, v4}, Lorg/apache/commons/lang/ClassUtils;->addAbbreviation(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    const-string/jumbo v3, "byte"

    const-string/jumbo v4, "B"

    invoke-static {v3, v4}, Lorg/apache/commons/lang/ClassUtils;->addAbbreviation(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    const-string/jumbo v3, "double"

    const-string/jumbo v4, "D"

    invoke-static {v3, v4}, Lorg/apache/commons/lang/ClassUtils;->addAbbreviation(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    const-string/jumbo v3, "char"

    const-string/jumbo v4, "C"

    invoke-static {v3, v4}, Lorg/apache/commons/lang/ClassUtils;->addAbbreviation(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    return-void
.end method

.method private static addAbbreviation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "primitive"    # Ljava/lang/String;
    .param p1, "abbreviation"    # Ljava/lang/String;

    .prologue
    .line 116
    sget-object v0, Lorg/apache/commons/lang/ClassUtils;->abbreviationMap:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lorg/apache/commons/lang/ClassUtils;->reverseAbbreviationMap:Ljava/util/Map;

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 74
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

.method public static convertClassNamesToClasses(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .param p0, "classNames"    # Ljava/util/List;

    .prologue
    const/4 v4, 0x0

    .line 360
    if-nez p0, :cond_1

    move-object v1, v4

    .line 372
    :cond_0
    return-object v1

    .line 363
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 364
    .local v1, "classes":Ljava/util/List;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 365
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 367
    .local v0, "className":Ljava/lang/String;
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 368
    :catch_0
    move-exception v2

    .line 369
    .local v2, "ex":Ljava/lang/Exception;
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public static convertClassesToClassNames(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .param p0, "classes"    # Ljava/util/List;

    .prologue
    const/4 v3, 0x0

    .line 388
    if-nez p0, :cond_1

    move-object v0, v3

    .line 400
    :cond_0
    return-object v0

    .line 391
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 392
    .local v0, "classNames":Ljava/util/List;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 393
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 394
    .local v1, "cls":Ljava/lang/Class;
    if-nez v1, :cond_2

    .line 395
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 397
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public static getAllInterfaces(Ljava/lang/Class;)Ljava/util/List;
    .locals 1
    .param p0, "cls"    # Ljava/lang/Class;

    .prologue
    .line 314
    if-nez p0, :cond_0

    .line 315
    const/4 v0, 0x0

    .line 321
    :goto_0
    return-object v0

    .line 318
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 319
    .local v0, "interfacesFound":Ljava/util/List;
    invoke-static {p0, v0}, Lorg/apache/commons/lang/ClassUtils;->getAllInterfaces(Ljava/lang/Class;Ljava/util/List;)V

    goto :goto_0
.end method

.method private static getAllInterfaces(Ljava/lang/Class;Ljava/util/List;)V
    .locals 3
    .param p0, "cls"    # Ljava/lang/Class;
    .param p1, "interfacesFound"    # Ljava/util/List;

    .prologue
    .line 331
    :goto_0
    if-eqz p0, :cond_2

    .line 332
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v1

    .line 334
    .local v1, "interfaces":[Ljava/lang/Class;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 335
    aget-object v2, v1, v0

    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 336
    aget-object v2, v1, v0

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 337
    aget-object v2, v1, v0

    invoke-static {v2, p1}, Lorg/apache/commons/lang/ClassUtils;->getAllInterfaces(Ljava/lang/Class;Ljava/util/List;)V

    .line 334
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 341
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    .line 342
    goto :goto_0

    .line 343
    .end local v0    # "i":I
    .end local v1    # "interfaces":[Ljava/lang/Class;
    :cond_2
    return-void
.end method

.method public static getAllSuperclasses(Ljava/lang/Class;)Ljava/util/List;
    .locals 2
    .param p0, "cls"    # Ljava/lang/Class;

    .prologue
    .line 288
    if-nez p0, :cond_1

    .line 289
    const/4 v0, 0x0

    .line 297
    :cond_0
    return-object v0

    .line 291
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 292
    .local v0, "classes":Ljava/util/List;
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    .line 293
    .local v1, "superclass":Ljava/lang/Class;
    :goto_0
    if-eqz v1, :cond_0

    .line 294
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 295
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_0
.end method

.method private static getCanonicalName(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "className"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 1017
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->deleteWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1018
    if-nez p0, :cond_1

    .line 1019
    const/4 p0, 0x0

    .line 1045
    .end local p0    # "className":Ljava/lang/String;
    .local v1, "dim":I
    :cond_0
    :goto_0
    return-object p0

    .line 1021
    .end local v1    # "dim":I
    .restart local p0    # "className":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    .line 1022
    .restart local v1    # "dim":I
    :goto_1
    const-string/jumbo v3, "["

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1023
    add-int/lit8 v1, v1, 0x1

    .line 1024
    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 1026
    :cond_2
    if-lt v1, v5, :cond_0

    .line 1029
    const-string/jumbo v3, "L"

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1030
    const-string/jumbo v3, ";"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    :goto_2
    invoke-virtual {p0, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 1041
    :cond_3
    :goto_3
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1042
    .local v0, "canonicalClassNameBuffer":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    if-ge v2, v1, :cond_6

    .line 1043
    const-string/jumbo v3, "[]"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1042
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 1030
    .end local v0    # "canonicalClassNameBuffer":Ljava/lang/StringBuffer;
    .end local v2    # "i":I
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_2

    .line 1036
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3

    .line 1037
    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->reverseAbbreviationMap:Ljava/util/Map;

    const/4 v4, 0x0

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "className":Ljava/lang/String;
    check-cast p0, Ljava/lang/String;

    .restart local p0    # "className":Ljava/lang/String;
    goto :goto_3

    .line 1045
    .restart local v0    # "canonicalClassNameBuffer":Ljava/lang/StringBuffer;
    .restart local v2    # "i":I
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static getClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 771
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ClassUtils;->getClass(Ljava/lang/ClassLoader;Ljava/lang/String;Z)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static getClass(Ljava/lang/ClassLoader;Ljava/lang/String;Z)Ljava/lang/Class;
    .locals 4
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "initialize"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 750
    sget-object v2, Lorg/apache/commons/lang/ClassUtils;->abbreviationMap:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 751
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v3, Lorg/apache/commons/lang/ClassUtils;->abbreviationMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 752
    .local v1, "clsName":Ljava/lang/String;
    invoke-static {v1, p2, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    .line 756
    .end local v1    # "clsName":Ljava/lang/String;
    .local v0, "clazz":Ljava/lang/Class;
    :goto_0
    return-object v0

    .line 754
    .end local v0    # "clazz":Ljava/lang/Class;
    :cond_0
    invoke-static {p1}, Lorg/apache/commons/lang/ClassUtils;->toCanonicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p2, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .restart local v0    # "clazz":Ljava/lang/Class;
    goto :goto_0
.end method

.method public static getClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .param p0, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 785
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/lang/ClassUtils;->getClass(Ljava/lang/String;Z)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static getClass(Ljava/lang/String;Z)Ljava/lang/Class;
    .locals 3
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "initialize"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 800
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 801
    .local v0, "contextCL":Ljava/lang/ClassLoader;
    if-nez v0, :cond_1

    sget-object v2, Lorg/apache/commons/lang/ClassUtils;->class$org$apache$commons$lang$ClassUtils:Ljava/lang/Class;

    if-nez v2, :cond_0

    const-string/jumbo v2, "org.apache.commons.lang.ClassUtils"

    invoke-static {v2}, Lorg/apache/commons/lang/ClassUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/lang/ClassUtils;->class$org$apache$commons$lang$ClassUtils:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 802
    .local v1, "loader":Ljava/lang/ClassLoader;
    :goto_1
    invoke-static {v1, p0, p1}, Lorg/apache/commons/lang/ClassUtils;->getClass(Ljava/lang/ClassLoader;Ljava/lang/String;Z)Ljava/lang/Class;

    move-result-object v2

    return-object v2

    .line 801
    .end local v1    # "loader":Ljava/lang/ClassLoader;
    :cond_0
    sget-object v2, Lorg/apache/commons/lang/ClassUtils;->class$org$apache$commons$lang$ClassUtils:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    move-object v1, v0

    goto :goto_1
.end method

.method public static getPackageCanonicalName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 1
    .param p0, "cls"    # Ljava/lang/Class;

    .prologue
    .line 980
    if-nez p0, :cond_0

    .line 981
    const-string/jumbo v0, ""

    .line 983
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/ClassUtils;->getPackageCanonicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getPackageCanonicalName(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "valueIfNull"    # Ljava/lang/String;

    .prologue
    .line 966
    if-nez p0, :cond_0

    .line 969
    .end local p1    # "valueIfNull":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "valueIfNull":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/ClassUtils;->getPackageCanonicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public static getPackageCanonicalName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "canonicalName"    # Ljava/lang/String;

    .prologue
    .line 997
    invoke-static {p0}, Lorg/apache/commons/lang/ClassUtils;->getCanonicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/ClassUtils;->getPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPackageName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 1
    .param p0, "cls"    # Ljava/lang/Class;

    .prologue
    .line 242
    if-nez p0, :cond_0

    .line 243
    const-string/jumbo v0, ""

    .line 245
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/ClassUtils;->getPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getPackageName(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "valueIfNull"    # Ljava/lang/String;

    .prologue
    .line 229
    if-nez p0, :cond_0

    .line 232
    .end local p1    # "valueIfNull":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "valueIfNull":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/ClassUtils;->getPackageName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public static getPackageName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "className"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 258
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 259
    :cond_0
    const-string/jumbo v1, ""

    .line 275
    :goto_0
    return-object v1

    .line 263
    :cond_1
    :goto_1
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x5b

    if-ne v1, v2, :cond_2

    .line 264
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 267
    :cond_2
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x4c

    if-ne v1, v2, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x3b

    if-ne v1, v2, :cond_3

    .line 268
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 271
    :cond_3
    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 272
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_4

    .line 273
    const-string/jumbo v1, ""

    goto :goto_0

    .line 275
    :cond_4
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static getPublicMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 9
    .param p0, "cls"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 831
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 832
    .local v3, "declaredMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 852
    .end local v3    # "declaredMethod":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 836
    .restart local v3    # "declaredMethod":Ljava/lang/reflect/Method;
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 837
    .local v1, "candidateClasses":Ljava/util/List;
    invoke-static {p0}, Lorg/apache/commons/lang/ClassUtils;->getAllInterfaces(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 838
    invoke-static {p0}, Lorg/apache/commons/lang/ClassUtils;->getAllSuperclasses(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 840
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "it":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 841
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 842
    .local v0, "candidateClass":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 847
    :try_start_0
    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 851
    .local v2, "candidateMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v6

    if-eqz v6, :cond_1

    move-object v3, v2

    .line 852
    goto :goto_0

    .line 848
    .end local v2    # "candidateMethod":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v4

    .line 849
    .local v4, "ex":Ljava/lang/NoSuchMethodException;
    goto :goto_1

    .line 856
    .end local v0    # "candidateClass":Ljava/lang/Class;
    .end local v4    # "ex":Ljava/lang/NoSuchMethodException;
    :cond_2
    new-instance v6, Ljava/lang/NoSuchMethodException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Can\'t find a public method for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-static {p2}, Lorg/apache/commons/lang/ArrayUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public static getShortCanonicalName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 1
    .param p0, "cls"    # Ljava/lang/Class;

    .prologue
    .line 936
    if-nez p0, :cond_0

    .line 937
    const-string/jumbo v0, ""

    .line 939
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/ClassUtils;->getShortCanonicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getShortCanonicalName(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "valueIfNull"    # Ljava/lang/String;

    .prologue
    .line 922
    if-nez p0, :cond_0

    .line 925
    .end local p1    # "valueIfNull":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "valueIfNull":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/ClassUtils;->getShortCanonicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public static getShortCanonicalName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "canonicalName"    # Ljava/lang/String;

    .prologue
    .line 952
    invoke-static {p0}, Lorg/apache/commons/lang/ClassUtils;->getCanonicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/ClassUtils;->getShortClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getShortClassName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 1
    .param p0, "cls"    # Ljava/lang/Class;

    .prologue
    .line 169
    if-nez p0, :cond_0

    .line 170
    const-string/jumbo v0, ""

    .line 172
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/ClassUtils;->getShortClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getShortClassName(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "valueIfNull"    # Ljava/lang/String;

    .prologue
    .line 156
    if-nez p0, :cond_0

    .line 159
    .end local p1    # "valueIfNull":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "valueIfNull":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/ClassUtils;->getShortClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public static getShortClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "className"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x2e

    const/16 v9, 0x24

    const/4 v8, 0x1

    const/4 v7, -0x1

    const/4 v4, 0x0

    .line 184
    if-nez p0, :cond_0

    .line 185
    const-string/jumbo v4, ""

    .line 216
    :goto_0
    return-object v4

    .line 187
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_1

    .line 188
    const-string/jumbo v4, ""

    goto :goto_0

    .line 191
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 194
    .local v0, "arrayPrefix":Ljava/lang/StringBuffer;
    const-string/jumbo v5, "["

    invoke-virtual {p0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 195
    :goto_1
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x5b

    if-ne v5, v6, :cond_2

    .line 196
    invoke-virtual {p0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 197
    const-string/jumbo v5, "[]"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 200
    :cond_2
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x4c

    if-ne v5, v6, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x3b

    if-ne v5, v6, :cond_3

    .line 201
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {p0, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 205
    :cond_3
    sget-object v5, Lorg/apache/commons/lang/ClassUtils;->reverseAbbreviationMap:Ljava/util/Map;

    invoke-interface {v5, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 206
    sget-object v5, Lorg/apache/commons/lang/ClassUtils;->reverseAbbreviationMap:Ljava/util/Map;

    invoke-interface {v5, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "className":Ljava/lang/String;
    check-cast p0, Ljava/lang/String;

    .line 209
    .restart local p0    # "className":Ljava/lang/String;
    :cond_4
    invoke-virtual {p0, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 210
    .local v2, "lastDotIdx":I
    if-ne v2, v7, :cond_6

    :goto_2
    invoke-virtual {p0, v9, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 212
    .local v1, "innerIdx":I
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 213
    .local v3, "out":Ljava/lang/String;
    if-eq v1, v7, :cond_5

    .line 214
    invoke-virtual {v3, v9, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    .line 216
    :cond_5
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    .line 210
    .end local v1    # "innerIdx":I
    .end local v3    # "out":Ljava/lang/String;
    :cond_6
    add-int/lit8 v4, v2, 0x1

    goto :goto_2
.end method

.method public static isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z
    .locals 1
    .param p0, "cls"    # Ljava/lang/Class;
    .param p1, "toClass"    # Ljava/lang/Class;

    .prologue
    .line 518
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ClassUtils;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;Z)Z

    move-result v0

    return v0
.end method

.method public static isAssignable(Ljava/lang/Class;Ljava/lang/Class;Z)Z
    .locals 3
    .param p0, "cls"    # Ljava/lang/Class;
    .param p1, "toClass"    # Ljava/lang/Class;
    .param p2, "autoboxing"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 550
    if-nez p1, :cond_1

    .line 619
    :cond_0
    :goto_0
    return v1

    .line 554
    :cond_1
    if-nez p0, :cond_3

    .line 555
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-nez v2, :cond_2

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1

    .line 558
    :cond_3
    if-eqz p2, :cond_5

    .line 559
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-nez v2, :cond_4

    .line 560
    invoke-static {p0}, Lorg/apache/commons/lang/ClassUtils;->primitiveToWrapper(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p0

    .line 561
    if-eqz p0, :cond_0

    .line 565
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-nez v2, :cond_5

    .line 566
    invoke-static {p0}, Lorg/apache/commons/lang/ClassUtils;->wrapperToPrimitive(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p0

    .line 567
    if-eqz p0, :cond_0

    .line 572
    :cond_5
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    move v1, v0

    .line 573
    goto :goto_0

    .line 575
    :cond_6
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 576
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 579
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 580
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_7
    move v1, v0

    goto :goto_0

    .line 584
    :cond_8
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 585
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_9
    move v1, v0

    goto/16 :goto_0

    .line 588
    :cond_a
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 591
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 594
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 595
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto/16 :goto_0

    .line 597
    :cond_b
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 598
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_c
    move v1, v0

    goto/16 :goto_0

    .line 603
    :cond_d
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 604
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_e
    move v1, v0

    goto/16 :goto_0

    .line 609
    :cond_f
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 610
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_10
    move v1, v0

    goto/16 :goto_0

    .line 619
    :cond_11
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    goto/16 :goto_0
.end method

.method public static isAssignable([Ljava/lang/Class;[Ljava/lang/Class;)Z
    .locals 1
    .param p0, "classArray"    # [Ljava/lang/Class;
    .param p1, "toClassArray"    # [Ljava/lang/Class;

    .prologue
    .line 437
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ClassUtils;->isAssignable([Ljava/lang/Class;[Ljava/lang/Class;Z)Z

    move-result v0

    return v0
.end method

.method public static isAssignable([Ljava/lang/Class;[Ljava/lang/Class;Z)Z
    .locals 4
    .param p0, "classArray"    # [Ljava/lang/Class;
    .param p1, "toClassArray"    # [Ljava/lang/Class;
    .param p2, "autoboxing"    # Z

    .prologue
    const/4 v1, 0x0

    .line 474
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->isSameLength([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 488
    :cond_0
    :goto_0
    return v1

    .line 477
    :cond_1
    if-nez p0, :cond_2

    .line 478
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CLASS_ARRAY:[Ljava/lang/Class;

    .line 480
    :cond_2
    if-nez p1, :cond_3

    .line 481
    sget-object p1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CLASS_ARRAY:[Ljava/lang/Class;

    .line 483
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_4

    .line 484
    aget-object v2, p0, v0

    aget-object v3, p1, v0

    invoke-static {v2, v3, p2}, Lorg/apache/commons/lang/ClassUtils;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 483
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 488
    :cond_4
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isInnerClass(Ljava/lang/Class;)Z
    .locals 3
    .param p0, "cls"    # Ljava/lang/Class;

    .prologue
    const/4 v0, 0x0

    .line 728
    if-nez p0, :cond_1

    .line 731
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x24

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static primitiveToWrapper(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 2
    .param p0, "cls"    # Ljava/lang/Class;

    .prologue
    .line 635
    move-object v0, p0

    .line 636
    .local v0, "convertedClass":Ljava/lang/Class;
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 637
    sget-object v1, Lorg/apache/commons/lang/ClassUtils;->primitiveWrapperMap:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "convertedClass":Ljava/lang/Class;
    check-cast v0, Ljava/lang/Class;

    .line 639
    .restart local v0    # "convertedClass":Ljava/lang/Class;
    :cond_0
    return-object v0
.end method

.method public static primitivesToWrappers([Ljava/lang/Class;)[Ljava/lang/Class;
    .locals 3
    .param p0, "classes"    # [Ljava/lang/Class;

    .prologue
    .line 653
    if-nez p0, :cond_1

    .line 654
    const/4 p0, 0x0

    .line 665
    .end local p0    # "classes":[Ljava/lang/Class;
    :cond_0
    :goto_0
    return-object p0

    .line 657
    .restart local p0    # "classes":[Ljava/lang/Class;
    :cond_1
    array-length v2, p0

    if-eqz v2, :cond_0

    .line 661
    array-length v2, p0

    new-array v0, v2, [Ljava/lang/Class;

    .line 662
    .local v0, "convertedClasses":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, p0

    if-ge v1, v2, :cond_2

    .line 663
    aget-object v2, p0, v1

    invoke-static {v2}, Lorg/apache/commons/lang/ClassUtils;->primitiveToWrapper(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v2

    aput-object v2, v0, v1

    .line 662
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    move-object p0, v0

    .line 665
    goto :goto_0
.end method

.method private static toCanonicalName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "className"    # Ljava/lang/String;

    .prologue
    .line 868
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->deleteWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 869
    if-nez p0, :cond_0

    .line 870
    new-instance v2, Lorg/apache/commons/lang/NullArgumentException;

    const-string/jumbo v3, "className"

    invoke-direct {v2, v3}, Lorg/apache/commons/lang/NullArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 871
    :cond_0
    const-string/jumbo v2, "[]"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 872
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 873
    .local v1, "classNameBuffer":Ljava/lang/StringBuffer;
    :goto_0
    const-string/jumbo v2, "[]"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 874
    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 875
    const-string/jumbo v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 877
    :cond_1
    sget-object v2, Lorg/apache/commons/lang/ClassUtils;->abbreviationMap:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 878
    .local v0, "abbreviation":Ljava/lang/String;
    if-eqz v0, :cond_3

    .line 879
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 883
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 885
    .end local v0    # "abbreviation":Ljava/lang/String;
    .end local v1    # "classNameBuffer":Ljava/lang/StringBuffer;
    :cond_2
    return-object p0

    .line 881
    .restart local v0    # "abbreviation":Ljava/lang/String;
    .restart local v1    # "classNameBuffer":Ljava/lang/StringBuffer;
    :cond_3
    const-string/jumbo v2, "L"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ";"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method public static toClass([Ljava/lang/Object;)[Ljava/lang/Class;
    .locals 4
    .param p0, "array"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 899
    if-nez p0, :cond_0

    .line 908
    :goto_0
    return-object v3

    .line 901
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 902
    sget-object v3, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CLASS_ARRAY:[Ljava/lang/Class;

    goto :goto_0

    .line 904
    :cond_1
    array-length v2, p0

    new-array v0, v2, [Ljava/lang/Class;

    .line 905
    .local v0, "classes":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, p0

    if-ge v1, v2, :cond_3

    .line 906
    aget-object v2, p0, v1

    if-nez v2, :cond_2

    move-object v2, v3

    :goto_2
    aput-object v2, v0, v1

    .line 905
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 906
    :cond_2
    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_2

    :cond_3
    move-object v3, v0

    .line 908
    goto :goto_0
.end method

.method public static wrapperToPrimitive(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 1
    .param p0, "cls"    # Ljava/lang/Class;

    .prologue
    .line 685
    sget-object v0, Lorg/apache/commons/lang/ClassUtils;->wrapperPrimitiveMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    return-object v0
.end method

.method public static wrappersToPrimitives([Ljava/lang/Class;)[Ljava/lang/Class;
    .locals 3
    .param p0, "classes"    # [Ljava/lang/Class;

    .prologue
    .line 703
    if-nez p0, :cond_1

    .line 704
    const/4 p0, 0x0

    .line 715
    .end local p0    # "classes":[Ljava/lang/Class;
    :cond_0
    :goto_0
    return-object p0

    .line 707
    .restart local p0    # "classes":[Ljava/lang/Class;
    :cond_1
    array-length v2, p0

    if-eqz v2, :cond_0

    .line 711
    array-length v2, p0

    new-array v0, v2, [Ljava/lang/Class;

    .line 712
    .local v0, "convertedClasses":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, p0

    if-ge v1, v2, :cond_2

    .line 713
    aget-object v2, p0, v1

    invoke-static {v2}, Lorg/apache/commons/lang/ClassUtils;->wrapperToPrimitive(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v2

    aput-object v2, v0, v1

    .line 712
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    move-object p0, v0

    .line 715
    goto :goto_0
.end method
