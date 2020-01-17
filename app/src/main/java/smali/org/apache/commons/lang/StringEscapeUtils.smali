.class public Lorg/apache/commons/lang/StringEscapeUtils;
.super Ljava/lang/Object;
.source "StringEscapeUtils.java"


# static fields
.field private static final CSV_DELIMITER:C = ','

.field private static final CSV_QUOTE:C = '\"'

.field private static final CSV_QUOTE_STR:Ljava/lang/String;

.field private static final CSV_SEARCH_CHARS:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    const/16 v0, 0x22

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_QUOTE_STR:Ljava/lang/String;

    .line 48
    const/4 v0, 0x4

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_SEARCH_CHARS:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x2cs
        0x22s
        0xds
        0xas
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    return-void
.end method

.method public static escapeCsv(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 722
    sget-object v2, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_SEARCH_CHARS:[C

    invoke-static {p0, v2}, Lorg/apache/commons/lang/StringUtils;->containsNone(Ljava/lang/String;[C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 728
    .end local p0    # "str":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 726
    .restart local p0    # "str":Ljava/lang/String;
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 727
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {v1, p0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeCsv(Ljava/io/Writer;Ljava/lang/String;)V

    .line 728
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    goto :goto_0

    .line 729
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v0

    .line 731
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v2, Lorg/apache/commons/lang/UnhandledException;

    invoke-direct {v2, v0}, Lorg/apache/commons/lang/UnhandledException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static escapeCsv(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 4
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 759
    sget-object v2, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_SEARCH_CHARS:[C

    invoke-static {p1, v2}, Lorg/apache/commons/lang/StringUtils;->containsNone(Ljava/lang/String;[C)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 760
    if-eqz p1, :cond_0

    .line 761
    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 774
    :cond_0
    :goto_0
    return-void

    .line 765
    :cond_1
    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    .line 766
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 767
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 768
    .local v0, "c":C
    if-ne v0, v3, :cond_2

    .line 769
    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    .line 771
    :cond_2
    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    .line 766
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 773
    .end local v0    # "c":C
    :cond_3
    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    goto :goto_0
.end method

.method public static escapeHtml(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 456
    if-nez p0, :cond_0

    .line 457
    const/4 v2, 0x0

    .line 462
    :goto_0
    return-object v2

    .line 460
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    int-to-double v2, v2

    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v2, v4

    double-to-int v2, v2

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 461
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {v1, p0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeHtml(Ljava/io/Writer;Ljava/lang/String;)V

    .line 462
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 463
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v0

    .line 465
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v2, Lorg/apache/commons/lang/UnhandledException;

    invoke-direct {v2, v0}, Lorg/apache/commons/lang/UnhandledException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static escapeHtml(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 499
    if-nez p0, :cond_0

    .line 500
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Writer must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 502
    :cond_0
    if-nez p1, :cond_1

    .line 506
    :goto_0
    return-void

    .line 505
    :cond_1
    sget-object v0, Lorg/apache/commons/lang/Entities;->HTML40:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/lang/Entities;->escape(Ljava/io/Writer;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static escapeJava(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 88
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeJavaStyleString(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeJava(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 1
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 104
    invoke-static {p0, p1, v0, v0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeJavaStyleString(Ljava/io/Writer;Ljava/lang/String;ZZ)V

    .line 105
    return-void
.end method

.method public static escapeJavaScript(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 129
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeJavaStyleString(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeJavaScript(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 1
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 145
    invoke-static {p0, p1, v0, v0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeJavaStyleString(Ljava/io/Writer;Ljava/lang/String;ZZ)V

    .line 146
    return-void
.end method

.method private static escapeJavaStyleString(Ljava/lang/String;ZZ)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "escapeSingleQuotes"    # Z
    .param p2, "escapeForwardSlash"    # Z

    .prologue
    .line 157
    if-nez p0, :cond_0

    .line 158
    const/4 v2, 0x0

    .line 163
    :goto_0
    return-object v2

    .line 161
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 162
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {v1, p0, p1, p2}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeJavaStyleString(Ljava/io/Writer;Ljava/lang/String;ZZ)V

    .line 163
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 164
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v0

    .line 166
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v2, Lorg/apache/commons/lang/UnhandledException;

    invoke-direct {v2, v0}, Lorg/apache/commons/lang/UnhandledException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static escapeJavaStyleString(Ljava/io/Writer;Ljava/lang/String;ZZ)V
    .locals 6
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "escapeSingleQuote"    # Z
    .param p3, "escapeForwardSlash"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x5c

    .line 181
    if-nez p0, :cond_0

    .line 182
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "The Writer must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 184
    :cond_0
    if-nez p1, :cond_2

    .line 257
    :cond_1
    return-void

    .line 188
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 189
    .local v2, "sz":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 190
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 193
    .local v0, "ch":C
    const/16 v3, 0xfff

    if-le v0, v3, :cond_3

    .line 194
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "\\u"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v0}, Lorg/apache/commons/lang/StringEscapeUtils;->hex(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 189
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 195
    :cond_3
    const/16 v3, 0xff

    if-le v0, v3, :cond_4

    .line 196
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "\\u0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v0}, Lorg/apache/commons/lang/StringEscapeUtils;->hex(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 197
    :cond_4
    const/16 v3, 0x7f

    if-le v0, v3, :cond_5

    .line 198
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "\\u00"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v0}, Lorg/apache/commons/lang/StringEscapeUtils;->hex(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 199
    :cond_5
    const/16 v3, 0x20

    if-ge v0, v3, :cond_7

    .line 200
    packed-switch v0, :pswitch_data_0

    .line 222
    :pswitch_0
    const/16 v3, 0xf

    if-le v0, v3, :cond_6

    .line 223
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "\\u00"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v0}, Lorg/apache/commons/lang/StringEscapeUtils;->hex(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 202
    :pswitch_1
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 203
    const/16 v3, 0x62

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 206
    :pswitch_2
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 207
    const/16 v3, 0x6e

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 210
    :pswitch_3
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 211
    const/16 v3, 0x74

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_1

    .line 214
    :pswitch_4
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 215
    const/16 v3, 0x66

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_1

    .line 218
    :pswitch_5
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 219
    const/16 v3, 0x72

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_1

    .line 225
    :cond_6
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "\\u000"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v0}, Lorg/apache/commons/lang/StringEscapeUtils;->hex(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 230
    :cond_7
    sparse-switch v0, :sswitch_data_0

    .line 252
    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_1

    .line 232
    :sswitch_0
    if-eqz p2, :cond_8

    .line 233
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 235
    :cond_8
    const/16 v3, 0x27

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_1

    .line 238
    :sswitch_1
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 239
    const/16 v3, 0x22

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_1

    .line 242
    :sswitch_2
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 243
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_1

    .line 246
    :sswitch_3
    if-eqz p3, :cond_9

    .line 247
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 249
    :cond_9
    const/16 v3, 0x2f

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_1

    .line 200
    nop

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_4
        :pswitch_5
    .end packed-switch

    .line 230
    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_1
        0x27 -> :sswitch_0
        0x2f -> :sswitch_3
        0x5c -> :sswitch_2
    .end sparse-switch
.end method

.method public static escapeSql(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 691
    if-nez p0, :cond_0

    .line 692
    const/4 v0, 0x0

    .line 694
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "\'"

    const-string/jumbo v1, "\'\'"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static escapeXml(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 615
    if-nez p0, :cond_0

    .line 616
    const/4 v0, 0x0

    .line 618
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/commons/lang/Entities;->XML:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/Entities;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static escapeXml(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 588
    if-nez p0, :cond_0

    .line 589
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Writer must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 591
    :cond_0
    if-nez p1, :cond_1

    .line 595
    :goto_0
    return-void

    .line 594
    :cond_1
    sget-object v0, Lorg/apache/commons/lang/Entities;->XML:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/lang/Entities;->escape(Ljava/io/Writer;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static hex(C)Ljava/lang/String;
    .locals 2
    .param p0, "ch"    # C

    .prologue
    .line 267
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeCsv(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 799
    if-nez p0, :cond_0

    .line 800
    const/4 v2, 0x0

    .line 805
    :goto_0
    return-object v2

    .line 803
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 804
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {v1, p0}, Lorg/apache/commons/lang/StringEscapeUtils;->unescapeCsv(Ljava/io/Writer;Ljava/lang/String;)V

    .line 805
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 806
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v0

    .line 808
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v2, Lorg/apache/commons/lang/UnhandledException;

    invoke-direct {v2, v0}, Lorg/apache/commons/lang/UnhandledException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static unescapeCsv(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 4
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 836
    if-nez p1, :cond_0

    .line 857
    :goto_0
    return-void

    .line 839
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_1

    .line 840
    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_0

    .line 843
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v3, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-eq v1, v3, :cond_3

    .line 844
    :cond_2
    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_0

    .line 849
    :cond_3
    const/4 v1, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 851
    .local v0, "quoteless":Ljava/lang/String;
    sget-object v1, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_SEARCH_CHARS:[C

    invoke-static {v0, v1}, Lorg/apache/commons/lang/StringUtils;->containsAny(Ljava/lang/String;[C)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 853
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v2, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_QUOTE_STR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_QUOTE_STR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_QUOTE_STR:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lorg/apache/commons/lang/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 856
    :cond_4
    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static unescapeHtml(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 526
    if-nez p0, :cond_0

    .line 527
    const/4 v2, 0x0

    .line 532
    :goto_0
    return-object v2

    .line 530
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    int-to-double v2, v2

    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v2, v4

    double-to-int v2, v2

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 531
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {v1, p0}, Lorg/apache/commons/lang/StringEscapeUtils;->unescapeHtml(Ljava/io/Writer;Ljava/lang/String;)V

    .line 532
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 533
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v0

    .line 535
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v2, Lorg/apache/commons/lang/UnhandledException;

    invoke-direct {v2, v0}, Lorg/apache/commons/lang/UnhandledException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static unescapeHtml(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 558
    if-nez p0, :cond_0

    .line 559
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Writer must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 561
    :cond_0
    if-nez p1, :cond_1

    .line 565
    :goto_0
    return-void

    .line 564
    :cond_1
    sget-object v0, Lorg/apache/commons/lang/Entities;->HTML40:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/lang/Entities;->unescape(Ljava/io/Writer;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static unescapeJava(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 280
    if-nez p0, :cond_0

    .line 281
    const/4 v2, 0x0

    .line 286
    :goto_0
    return-object v2

    .line 284
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 285
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {v1, p0}, Lorg/apache/commons/lang/StringEscapeUtils;->unescapeJava(Ljava/io/Writer;Ljava/lang/String;)V

    .line 286
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 287
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v0

    .line 289
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v2, Lorg/apache/commons/lang/UnhandledException;

    invoke-direct {v2, v0}, Lorg/apache/commons/lang/UnhandledException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static unescapeJava(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 12
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x4

    const/16 v10, 0x5c

    .line 309
    if-nez p0, :cond_0

    .line 310
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v9, "The Writer must not be null"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 312
    :cond_0
    if-nez p1, :cond_2

    .line 390
    :cond_1
    :goto_0
    return-void

    .line 315
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 316
    .local v5, "sz":I
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6, v11}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 317
    .local v6, "unicode":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .line 318
    .local v1, "hadSlash":Z
    const/4 v3, 0x0

    .line 319
    .local v3, "inUnicode":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v5, :cond_7

    .line 320
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 321
    .local v0, "ch":C
    if-eqz v3, :cond_4

    .line 324
    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 325
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->length()I

    move-result v8

    if-ne v8, v11, :cond_3

    .line 329
    :try_start_0
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x10

    invoke-static {v8, v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v7

    .line 330
    .local v7, "value":I
    int-to-char v8, v7

    invoke-virtual {p0, v8}, Ljava/io/Writer;->write(I)V

    .line 331
    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->setLength(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 332
    const/4 v3, 0x0

    .line 333
    const/4 v1, 0x0

    .line 319
    .end local v7    # "value":I
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 334
    :catch_0
    move-exception v4

    .line 335
    .local v4, "nfe":Ljava/lang/NumberFormatException;
    new-instance v8, Lorg/apache/commons/lang/exception/NestableRuntimeException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Unable to parse unicode value: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v4}, Lorg/apache/commons/lang/exception/NestableRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 340
    .end local v4    # "nfe":Ljava/lang/NumberFormatException;
    :cond_4
    if-eqz v1, :cond_5

    .line 342
    const/4 v1, 0x0

    .line 343
    sparse-switch v0, :sswitch_data_0

    .line 375
    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    .line 345
    :sswitch_0
    invoke-virtual {p0, v10}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    .line 348
    :sswitch_1
    const/16 v8, 0x27

    invoke-virtual {p0, v8}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    .line 351
    :sswitch_2
    const/16 v8, 0x22

    invoke-virtual {p0, v8}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    .line 354
    :sswitch_3
    const/16 v8, 0xd

    invoke-virtual {p0, v8}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    .line 357
    :sswitch_4
    const/16 v8, 0xc

    invoke-virtual {p0, v8}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    .line 360
    :sswitch_5
    const/16 v8, 0x9

    invoke-virtual {p0, v8}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    .line 363
    :sswitch_6
    const/16 v8, 0xa

    invoke-virtual {p0, v8}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    .line 366
    :sswitch_7
    const/16 v8, 0x8

    invoke-virtual {p0, v8}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    .line 371
    :sswitch_8
    const/4 v3, 0x1

    .line 372
    goto :goto_2

    .line 379
    :cond_5
    if-ne v0, v10, :cond_6

    .line 380
    const/4 v1, 0x1

    .line 381
    goto :goto_2

    .line 383
    :cond_6
    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    .line 385
    .end local v0    # "ch":C
    :cond_7
    if-eqz v1, :cond_1

    .line 388
    invoke-virtual {p0, v10}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_0

    .line 343
    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_2
        0x27 -> :sswitch_1
        0x5c -> :sswitch_0
        0x62 -> :sswitch_7
        0x66 -> :sswitch_4
        0x6e -> :sswitch_6
        0x72 -> :sswitch_3
        0x74 -> :sswitch_5
        0x75 -> :sswitch_8
    .end sparse-switch
.end method

.method public static unescapeJavaScript(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 404
    invoke-static {p0}, Lorg/apache/commons/lang/StringEscapeUtils;->unescapeJava(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeJavaScript(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 0
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 424
    invoke-static {p0, p1}, Lorg/apache/commons/lang/StringEscapeUtils;->unescapeJava(Ljava/io/Writer;Ljava/lang/String;)V

    .line 425
    return-void
.end method

.method public static unescapeXml(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 665
    if-nez p0, :cond_0

    .line 666
    const/4 v0, 0x0

    .line 668
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/commons/lang/Entities;->XML:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/Entities;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static unescapeXml(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 640
    if-nez p0, :cond_0

    .line 641
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Writer must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 643
    :cond_0
    if-nez p1, :cond_1

    .line 647
    :goto_0
    return-void

    .line 646
    :cond_1
    sget-object v0, Lorg/apache/commons/lang/Entities;->XML:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/lang/Entities;->unescape(Ljava/io/Writer;Ljava/lang/String;)V

    goto :goto_0
.end method
