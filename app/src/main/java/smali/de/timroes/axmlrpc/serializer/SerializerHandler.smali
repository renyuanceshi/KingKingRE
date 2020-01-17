.class public Lde/timroes/axmlrpc/serializer/SerializerHandler;
.super Ljava/lang/Object;
.source "SerializerHandler.java"


# static fields
.field public static final TYPE_ARRAY:Ljava/lang/String; = "array"

.field public static final TYPE_BASE64:Ljava/lang/String; = "base64"

.field public static final TYPE_BOOLEAN:Ljava/lang/String; = "boolean"

.field public static final TYPE_DATETIME:Ljava/lang/String; = "dateTime.iso8601"

.field public static final TYPE_DOUBLE:Ljava/lang/String; = "double"

.field public static final TYPE_INT:Ljava/lang/String; = "int"

.field public static final TYPE_INT2:Ljava/lang/String; = "i4"

.field public static final TYPE_LONG:Ljava/lang/String; = "i8"

.field public static final TYPE_NULL:Ljava/lang/String; = "nil"

.field public static final TYPE_STRING:Ljava/lang/String; = "string"

.field public static final TYPE_STRUCT:Ljava/lang/String; = "struct"

.field private static instance:Lde/timroes/axmlrpc/serializer/SerializerHandler;


# instance fields
.field private array:Lde/timroes/axmlrpc/serializer/ArraySerializer;

.field private base64:Lde/timroes/axmlrpc/serializer/Base64Serializer;

.field private bool:Lde/timroes/axmlrpc/serializer/BooleanSerializer;

.field private datetime:Lde/timroes/axmlrpc/serializer/DateTimeSerializer;

.field private flags:I

.field private floating:Lde/timroes/axmlrpc/serializer/DoubleSerializer;

.field private integer:Lde/timroes/axmlrpc/serializer/IntSerializer;

.field private long8:Lde/timroes/axmlrpc/serializer/LongSerializer;

.field private nil:Lde/timroes/axmlrpc/serializer/NullSerializer;

.field private string:Lde/timroes/axmlrpc/serializer/StringSerializer;

.field private struct:Lde/timroes/axmlrpc/serializer/StructSerializer;


# direct methods
.method private constructor <init>(I)V
    .locals 1
    .param p1, "flags"    # I

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Lde/timroes/axmlrpc/serializer/StringSerializer;

    invoke-direct {v0}, Lde/timroes/axmlrpc/serializer/StringSerializer;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->string:Lde/timroes/axmlrpc/serializer/StringSerializer;

    .line 62
    new-instance v0, Lde/timroes/axmlrpc/serializer/BooleanSerializer;

    invoke-direct {v0}, Lde/timroes/axmlrpc/serializer/BooleanSerializer;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->bool:Lde/timroes/axmlrpc/serializer/BooleanSerializer;

    .line 63
    new-instance v0, Lde/timroes/axmlrpc/serializer/IntSerializer;

    invoke-direct {v0}, Lde/timroes/axmlrpc/serializer/IntSerializer;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->integer:Lde/timroes/axmlrpc/serializer/IntSerializer;

    .line 64
    new-instance v0, Lde/timroes/axmlrpc/serializer/LongSerializer;

    invoke-direct {v0}, Lde/timroes/axmlrpc/serializer/LongSerializer;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->long8:Lde/timroes/axmlrpc/serializer/LongSerializer;

    .line 65
    new-instance v0, Lde/timroes/axmlrpc/serializer/StructSerializer;

    invoke-direct {v0}, Lde/timroes/axmlrpc/serializer/StructSerializer;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->struct:Lde/timroes/axmlrpc/serializer/StructSerializer;

    .line 66
    new-instance v0, Lde/timroes/axmlrpc/serializer/DoubleSerializer;

    invoke-direct {v0}, Lde/timroes/axmlrpc/serializer/DoubleSerializer;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->floating:Lde/timroes/axmlrpc/serializer/DoubleSerializer;

    .line 67
    new-instance v0, Lde/timroes/axmlrpc/serializer/DateTimeSerializer;

    invoke-direct {v0}, Lde/timroes/axmlrpc/serializer/DateTimeSerializer;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->datetime:Lde/timroes/axmlrpc/serializer/DateTimeSerializer;

    .line 68
    new-instance v0, Lde/timroes/axmlrpc/serializer/ArraySerializer;

    invoke-direct {v0}, Lde/timroes/axmlrpc/serializer/ArraySerializer;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->array:Lde/timroes/axmlrpc/serializer/ArraySerializer;

    .line 69
    new-instance v0, Lde/timroes/axmlrpc/serializer/Base64Serializer;

    invoke-direct {v0}, Lde/timroes/axmlrpc/serializer/Base64Serializer;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->base64:Lde/timroes/axmlrpc/serializer/Base64Serializer;

    .line 70
    new-instance v0, Lde/timroes/axmlrpc/serializer/NullSerializer;

    invoke-direct {v0}, Lde/timroes/axmlrpc/serializer/NullSerializer;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->nil:Lde/timroes/axmlrpc/serializer/NullSerializer;

    .line 81
    iput p1, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->flags:I

    .line 82
    return-void
.end method

.method public static getDefault()Lde/timroes/axmlrpc/serializer/SerializerHandler;
    .locals 2

    .prologue
    .line 55
    sget-object v0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->instance:Lde/timroes/axmlrpc/serializer/SerializerHandler;

    if-nez v0, :cond_0

    .line 56
    new-instance v0, Lde/timroes/axmlrpc/XMLRPCRuntimeException;

    const-string/jumbo v1, "The SerializerHandler has not been initialized."

    invoke-direct {v0, v1}, Lde/timroes/axmlrpc/XMLRPCRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    sget-object v0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->instance:Lde/timroes/axmlrpc/serializer/SerializerHandler;

    return-object v0
.end method

.method public static initialize(I)V
    .locals 1
    .param p0, "flags"    # I

    .prologue
    .line 45
    new-instance v0, Lde/timroes/axmlrpc/serializer/SerializerHandler;

    invoke-direct {v0, p0}, Lde/timroes/axmlrpc/serializer/SerializerHandler;-><init>(I)V

    sput-object v0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->instance:Lde/timroes/axmlrpc/serializer/SerializerHandler;

    .line 46
    return-void
.end method


# virtual methods
.method public deserialize(Lorg/w3c/dom/Element;)Ljava/lang/Object;
    .locals 5
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 96
    const/4 v0, 0x0

    .line 98
    .local v0, "s":Lde/timroes/axmlrpc/serializer/Serializer;
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v1

    .line 100
    .local v1, "type":Ljava/lang/String;
    iget v2, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->flags:I

    and-int/lit8 v2, v2, 0x8

    if-eqz v2, :cond_0

    const-string/jumbo v2, "nil"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 101
    iget-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->nil:Lde/timroes/axmlrpc/serializer/NullSerializer;

    .line 129
    :goto_0
    invoke-interface {v0, p1}, Lde/timroes/axmlrpc/serializer/Serializer;->deserialize(Lorg/w3c/dom/Element;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 102
    :cond_0
    const-string/jumbo v2, "string"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 103
    iget-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->string:Lde/timroes/axmlrpc/serializer/StringSerializer;

    goto :goto_0

    .line 104
    :cond_1
    const-string/jumbo v2, "boolean"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 105
    iget-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->bool:Lde/timroes/axmlrpc/serializer/BooleanSerializer;

    goto :goto_0

    .line 106
    :cond_2
    const-string/jumbo v2, "double"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 107
    iget-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->floating:Lde/timroes/axmlrpc/serializer/DoubleSerializer;

    goto :goto_0

    .line 108
    :cond_3
    const-string/jumbo v2, "int"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string/jumbo v2, "i4"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 109
    :cond_4
    iget-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->integer:Lde/timroes/axmlrpc/serializer/IntSerializer;

    goto :goto_0

    .line 110
    :cond_5
    const-string/jumbo v2, "dateTime.iso8601"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 111
    iget-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->datetime:Lde/timroes/axmlrpc/serializer/DateTimeSerializer;

    goto :goto_0

    .line 112
    :cond_6
    const-string/jumbo v2, "i8"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 113
    iget v2, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->flags:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_7

    .line 114
    iget-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->long8:Lde/timroes/axmlrpc/serializer/LongSerializer;

    goto :goto_0

    .line 116
    :cond_7
    new-instance v2, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v3, "8 byte integer is not in the specification. You must use FLAGS_8BYTE_INT to enable the i8 tag."

    invoke-direct {v2, v3}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 119
    :cond_8
    const-string/jumbo v2, "struct"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 120
    iget-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->struct:Lde/timroes/axmlrpc/serializer/StructSerializer;

    goto :goto_0

    .line 121
    :cond_9
    const-string/jumbo v2, "array"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 122
    iget-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->array:Lde/timroes/axmlrpc/serializer/ArraySerializer;

    goto :goto_0

    .line 123
    :cond_a
    const-string/jumbo v2, "base64"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 124
    iget-object v0, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->base64:Lde/timroes/axmlrpc/serializer/Base64Serializer;

    goto/16 :goto_0

    .line 126
    :cond_b
    new-instance v2, Lde/timroes/axmlrpc/XMLRPCException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "No deserializer found for type \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\'."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;
    .locals 9
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 144
    const/4 v5, 0x0

    .line 146
    .local v5, "s":Lde/timroes/axmlrpc/serializer/Serializer;
    iget v6, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->flags:I

    and-int/lit8 v6, v6, 0x8

    if-eqz v6, :cond_0

    if-nez p1, :cond_0

    .line 147
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->nil:Lde/timroes/axmlrpc/serializer/NullSerializer;

    .line 195
    .end local p1    # "object":Ljava/lang/Object;
    :goto_0
    invoke-interface {v5, p1}, Lde/timroes/axmlrpc/serializer/Serializer;->serialize(Ljava/lang/Object;)Lde/timroes/axmlrpc/xmlcreator/XmlElement;

    move-result-object v6

    return-object v6

    .line 148
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_0
    instance-of v6, p1, Ljava/lang/String;

    if-eqz v6, :cond_1

    .line 149
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->string:Lde/timroes/axmlrpc/serializer/StringSerializer;

    goto :goto_0

    .line 150
    :cond_1
    instance-of v6, p1, Ljava/lang/Boolean;

    if-eqz v6, :cond_2

    .line 151
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->bool:Lde/timroes/axmlrpc/serializer/BooleanSerializer;

    goto :goto_0

    .line 152
    :cond_2
    instance-of v6, p1, Ljava/lang/Double;

    if-nez v6, :cond_3

    instance-of v6, p1, Ljava/lang/Float;

    if-eqz v6, :cond_4

    .line 153
    :cond_3
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->floating:Lde/timroes/axmlrpc/serializer/DoubleSerializer;

    goto :goto_0

    .line 154
    :cond_4
    instance-of v6, p1, Ljava/lang/Integer;

    if-nez v6, :cond_5

    instance-of v6, p1, Ljava/lang/Short;

    if-nez v6, :cond_5

    instance-of v6, p1, Ljava/lang/Byte;

    if-eqz v6, :cond_6

    .line 156
    :cond_5
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->integer:Lde/timroes/axmlrpc/serializer/IntSerializer;

    goto :goto_0

    .line 157
    :cond_6
    instance-of v6, p1, Ljava/lang/Long;

    if-eqz v6, :cond_a

    .line 159
    iget v6, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->flags:I

    and-int/lit8 v6, v6, 0x2

    if-eqz v6, :cond_7

    .line 160
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->long8:Lde/timroes/axmlrpc/serializer/LongSerializer;

    goto :goto_0

    :cond_7
    move-object v6, p1

    .line 163
    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 164
    .local v2, "l":J
    const-wide/32 v6, 0x7fffffff

    cmp-long v6, v2, v6

    if-gtz v6, :cond_8

    const-wide/32 v6, -0x80000000

    cmp-long v6, v2, v6

    if-gez v6, :cond_9

    .line 165
    :cond_8
    new-instance v6, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v7, "FLAGS_8BYTE_INT must be set, if values outside the 4 byte integer range should be transfered."

    invoke-direct {v6, v7}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 168
    :cond_9
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->integer:Lde/timroes/axmlrpc/serializer/IntSerializer;

    .line 170
    goto :goto_0

    .line 171
    .end local v2    # "l":J
    :cond_a
    instance-of v6, p1, Ljava/util/Date;

    if-eqz v6, :cond_b

    .line 172
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->datetime:Lde/timroes/axmlrpc/serializer/DateTimeSerializer;

    goto :goto_0

    .line 173
    :cond_b
    instance-of v6, p1, Ljava/util/Calendar;

    if-eqz v6, :cond_c

    .line 174
    check-cast p1, Ljava/util/Calendar;

    .end local p1    # "object":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    .line 175
    .local p1, "object":Ljava/util/Date;
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->datetime:Lde/timroes/axmlrpc/serializer/DateTimeSerializer;

    goto :goto_0

    .line 176
    .local p1, "object":Ljava/lang/Object;
    :cond_c
    instance-of v6, p1, Ljava/util/Map;

    if-eqz v6, :cond_d

    .line 177
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->struct:Lde/timroes/axmlrpc/serializer/StructSerializer;

    goto :goto_0

    .line 178
    :cond_d
    instance-of v6, p1, [Ljava/lang/Object;

    if-eqz v6, :cond_e

    .line 179
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->array:Lde/timroes/axmlrpc/serializer/ArraySerializer;

    goto :goto_0

    .line 180
    :cond_e
    instance-of v6, p1, [B

    if-eqz v6, :cond_10

    .line 181
    check-cast p1, [B

    .end local p1    # "object":Ljava/lang/Object;
    move-object v4, p1

    check-cast v4, [B

    .line 182
    .local v4, "old":[B
    array-length v6, v4

    new-array v0, v6, [Ljava/lang/Byte;

    .line 183
    .local v0, "boxed":[Ljava/lang/Byte;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v6, v0

    if-ge v1, v6, :cond_f

    .line 184
    new-instance v6, Ljava/lang/Byte;

    aget-byte v7, v4, v1

    invoke-direct {v6, v7}, Ljava/lang/Byte;-><init>(B)V

    aput-object v6, v0, v1

    .line 183
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 186
    :cond_f
    move-object p1, v0

    .line 187
    .local p1, "object":[Ljava/lang/Byte;
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->base64:Lde/timroes/axmlrpc/serializer/Base64Serializer;

    .line 188
    goto/16 :goto_0

    .end local v0    # "boxed":[Ljava/lang/Byte;
    .end local v1    # "i":I
    .end local v4    # "old":[B
    .local p1, "object":Ljava/lang/Object;
    :cond_10
    instance-of v6, p1, [Ljava/lang/Byte;

    if-eqz v6, :cond_11

    .line 189
    iget-object v5, p0, Lde/timroes/axmlrpc/serializer/SerializerHandler;->base64:Lde/timroes/axmlrpc/serializer/Base64Serializer;

    goto/16 :goto_0

    .line 191
    :cond_11
    new-instance v6, Lde/timroes/axmlrpc/XMLRPCException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "No serializer found for type \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\'."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v6
.end method
