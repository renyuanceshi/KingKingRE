.class Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;
.super Ljava/lang/Object;
.source "ResponseProtocolCompliance.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final UNEXPECTED_100_CONTINUE:Ljava/lang/String; = "The incoming request did not contain a 100-continue header, but the response was a Status 100, continue."

.field private static final UNEXPECTED_PARTIAL_CONTENT:Ljava/lang/String; = "partial content was returned for a request that did not ask for it"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private backendResponseMustNotHaveBody(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)Z
    .locals 2
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "backendResponse"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 214
    const-string/jumbo v0, "HEAD"

    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0xcc

    if-eq v0, v1, :cond_0

    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0xcd

    if-eq v0, v1, :cond_0

    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0x130

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private consumeBody(Lorg/apache/http/HttpResponse;)V
    .locals 1
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 95
    .local v0, "body":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_0

    .line 96
    invoke-static {v0}, Lorg/apache/http/impl/client/cache/IOUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 98
    :cond_0
    return-void
.end method

.method private ensure200ForOPTIONSRequestWithNoBodyHasContentLengthZero(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V
    .locals 2
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 188
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "OPTIONS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 199
    :cond_0
    :goto_0
    return-void

    .line 192
    :cond_1
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 196
    const-string/jumbo v0, "Content-Length"

    invoke-interface {p2, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-nez v0, :cond_0

    .line 197
    const-string/jumbo v0, "Content-Length"

    const-string/jumbo v1, "0"

    invoke-interface {p2, v0, v1}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private ensure206ContainsDateHeader(Lorg/apache/http/HttpResponse;)V
    .locals 2
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 169
    const-string/jumbo v0, "Date"

    invoke-interface {p1, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-nez v0, :cond_0

    .line 170
    const-string/jumbo v0, "Date"

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-static {v1}, Lorg/apache/http/client/utils/DateUtils;->formatDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    :cond_0
    return-void
.end method

.method private ensure304DoesNotContainExtraEntityHeaders(Lorg/apache/http/HttpResponse;)V
    .locals 7
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 202
    const/16 v5, 0x8

    new-array v1, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "Allow"

    aput-object v6, v1, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "Content-Encoding"

    aput-object v6, v1, v5

    const/4 v5, 0x2

    const-string/jumbo v6, "Content-Language"

    aput-object v6, v1, v5

    const/4 v5, 0x3

    const-string/jumbo v6, "Content-Length"

    aput-object v6, v1, v5

    const/4 v5, 0x4

    const-string/jumbo v6, "Content-MD5"

    aput-object v6, v1, v5

    const/4 v5, 0x5

    const-string/jumbo v6, "Content-Range"

    aput-object v6, v1, v5

    const/4 v5, 0x6

    const-string/jumbo v6, "Content-Type"

    aput-object v6, v1, v5

    const/4 v5, 0x7

    const-string/jumbo v6, "Last-Modified"

    aput-object v6, v1, v5

    .line 206
    .local v1, "disallowedEntityHeaders":[Ljava/lang/String;
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5

    const/16 v6, 0x130

    if-ne v5, v6, :cond_0

    .line 207
    move-object v0, v1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v2, v0, v3

    .line 208
    .local v2, "hdr":Ljava/lang/String;
    invoke-interface {p1, v2}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 207
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 211
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "hdr":Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_0
    return-void
.end method

.method private ensurePartialContentIsNotSentToAClientThatDidNotRequestIt(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V
    .locals 2
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    const-string/jumbo v0, "Range"

    invoke-interface {p1, v0}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0xce

    if-eq v0, v1, :cond_1

    .line 179
    :cond_0
    return-void

    .line 182
    :cond_1
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->consumeBody(Lorg/apache/http/HttpResponse;)V

    .line 183
    new-instance v0, Lorg/apache/http/client/ClientProtocolException;

    const-string/jumbo v1, "partial content was returned for a request that did not ask for it"

    invoke-direct {v0, v1}, Lorg/apache/http/client/ClientProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private identityIsNotUsedInContentEncoding(Lorg/apache/http/HttpResponse;)V
    .locals 17
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 134
    const-string/jumbo v15, "Content-Encoding"

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v7

    .line 135
    .local v7, "hdrs":[Lorg/apache/http/Header;
    if-eqz v7, :cond_0

    array-length v15, v7

    if-nez v15, :cond_1

    .line 166
    :cond_0
    return-void

    .line 138
    :cond_1
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .local v14, "newHeaders":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    const/4 v12, 0x0

    .line 140
    .local v12, "modified":Z
    move-object v1, v7

    .local v1, "arr$":[Lorg/apache/http/Header;
    array-length v10, v1

    .local v10, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    move v9, v8

    .end local v1    # "arr$":[Lorg/apache/http/Header;
    .end local v8    # "i$":I
    .end local v10    # "len$":I
    .local v9, "i$":I
    :goto_0
    if-ge v9, v10, :cond_6

    aget-object v6, v1, v9

    .line 141
    .local v6, "h":Lorg/apache/http/Header;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .local v3, "buf":Ljava/lang/StringBuilder;
    const/4 v5, 0x1

    .line 143
    .local v5, "first":Z
    invoke-interface {v6}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v2

    .local v2, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v11, v2

    .local v11, "len$":I
    const/4 v8, 0x0

    .end local v9    # "i$":I
    .restart local v8    # "i$":I
    :goto_1
    if-ge v8, v11, :cond_4

    aget-object v4, v2, v8

    .line 144
    .local v4, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v15, "identity"

    invoke-interface {v4}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 145
    const/4 v12, 0x1

    .line 143
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 147
    :cond_2
    if-nez v5, :cond_3

    .line 148
    const-string/jumbo v15, ","

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    :cond_3
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    const/4 v5, 0x0

    goto :goto_2

    .line 154
    .end local v4    # "elt":Lorg/apache/http/HeaderElement;
    :cond_4
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 155
    .local v13, "newHeaderValue":Ljava/lang/String;
    const-string/jumbo v15, ""

    invoke-virtual {v15, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_5

    .line 156
    new-instance v15, Lorg/apache/http/message/BasicHeader;

    const-string/jumbo v16, "Content-Encoding"

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v13}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v14, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    :cond_5
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    .end local v8    # "i$":I
    .restart local v9    # "i$":I
    goto :goto_0

    .line 159
    .end local v2    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v3    # "buf":Ljava/lang/StringBuilder;
    .end local v5    # "first":Z
    .end local v6    # "h":Lorg/apache/http/Header;
    .end local v11    # "len$":I
    .end local v13    # "newHeaderValue":Ljava/lang/String;
    :cond_6
    if-eqz v12, :cond_0

    .line 162
    const-string/jumbo v15, "Content-Encoding"

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 163
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .end local v9    # "i$":I
    .local v8, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/http/Header;

    .line 164
    .restart local v6    # "h":Lorg/apache/http/Header;
    move-object/from16 v0, p1

    invoke-interface {v0, v6}, Lorg/apache/http/HttpResponse;->addHeader(Lorg/apache/http/Header;)V

    goto :goto_3
.end method

.method private removeResponseTransferEncoding(Lorg/apache/http/HttpResponse;)V
    .locals 1
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 247
    const-string/jumbo v0, "TE"

    invoke-interface {p1, v0}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 248
    const-string/jumbo v0, "Transfer-Encoding"

    invoke-interface {p1, v0}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 249
    return-void
.end method

.method private requestDidNotExpect100ContinueButResponseIsOne(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/HttpResponse;)V
    .locals 3
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0x64

    if-eq v1, v2, :cond_1

    .line 229
    :cond_0
    return-void

    .line 226
    :cond_1
    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v0

    .line 227
    .local v0, "originalRequest":Lorg/apache/http/HttpRequest;
    instance-of v1, v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v1, :cond_2

    .line 228
    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local v0    # "originalRequest":Lorg/apache/http/HttpRequest;
    invoke-interface {v0}, Lorg/apache/http/HttpEntityEnclosingRequest;->expectContinue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 232
    :cond_2
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->consumeBody(Lorg/apache/http/HttpResponse;)V

    .line 233
    new-instance v1, Lorg/apache/http/client/ClientProtocolException;

    const-string/jumbo v2, "The incoming request did not contain a 100-continue header, but the response was a Status 100, continue."

    invoke-direct {v1, v2}, Lorg/apache/http/client/ClientProtocolException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private transferEncodingIsNotReturnedTo1_0Client(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/HttpResponse;)V
    .locals 3
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 238
    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v0

    .line 239
    .local v0, "originalRequest":Lorg/apache/http/HttpRequest;
    invoke-interface {v0}, Lorg/apache/http/HttpRequest;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v1

    sget-object v2, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-virtual {v1, v2}, Lorg/apache/http/ProtocolVersion;->compareToVersion(Lorg/apache/http/ProtocolVersion;)I

    move-result v1

    if-ltz v1, :cond_0

    .line 244
    :goto_0
    return-void

    .line 243
    :cond_0
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->removeResponseTransferEncoding(Lorg/apache/http/HttpResponse;)V

    goto :goto_0
.end method

.method private warningsWithNonMatchingWarnDatesAreRemoved(Lorg/apache/http/HttpResponse;)V
    .locals 17
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 102
    const-string/jumbo v14, "Date"

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v14

    invoke-interface {v14}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v10

    .line 103
    .local v10, "responseDate":Ljava/util/Date;
    if-nez v10, :cond_1

    .line 131
    :cond_0
    return-void

    .line 107
    :cond_1
    const-string/jumbo v14, "Warning"

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v12

    .line 109
    .local v12, "warningHeaders":[Lorg/apache/http/Header;
    if-eqz v12, :cond_0

    array-length v14, v12

    if-eqz v14, :cond_0

    .line 113
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .local v9, "newWarningHeaders":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    const/4 v8, 0x0

    .line 115
    .local v8, "modified":Z
    move-object v1, v12

    .local v1, "arr$":[Lorg/apache/http/Header;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    move v5, v4

    .end local v1    # "arr$":[Lorg/apache/http/Header;
    .end local v4    # "i$":I
    .end local v6    # "len$":I
    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_5

    aget-object v3, v1, v5

    .line 116
    .local v3, "h":Lorg/apache/http/Header;
    invoke-static {v3}, Lorg/apache/http/impl/client/cache/WarningValue;->getWarningValues(Lorg/apache/http/Header;)[Lorg/apache/http/impl/client/cache/WarningValue;

    move-result-object v2

    .local v2, "arr$":[Lorg/apache/http/impl/client/cache/WarningValue;
    array-length v7, v2

    .local v7, "len$":I
    const/4 v4, 0x0

    .end local v5    # "i$":I
    .restart local v4    # "i$":I
    :goto_1
    if-ge v4, v7, :cond_4

    aget-object v13, v2, v4

    .line 117
    .local v13, "wv":Lorg/apache/http/impl/client/cache/WarningValue;
    invoke-virtual {v13}, Lorg/apache/http/impl/client/cache/WarningValue;->getWarnDate()Ljava/util/Date;

    move-result-object v11

    .line 118
    .local v11, "warnDate":Ljava/util/Date;
    if-eqz v11, :cond_2

    invoke-virtual {v11, v10}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 119
    :cond_2
    new-instance v14, Lorg/apache/http/message/BasicHeader;

    const-string/jumbo v15, "Warning"

    invoke-virtual {v13}, Lorg/apache/http/impl/client/cache/WarningValue;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v14 .. v16}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 121
    :cond_3
    const/4 v8, 0x1

    goto :goto_2

    .line 115
    .end local v11    # "warnDate":Ljava/util/Date;
    .end local v13    # "wv":Lorg/apache/http/impl/client/cache/WarningValue;
    :cond_4
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    .end local v4    # "i$":I
    .restart local v5    # "i$":I
    goto :goto_0

    .line 125
    .end local v2    # "arr$":[Lorg/apache/http/impl/client/cache/WarningValue;
    .end local v3    # "h":Lorg/apache/http/Header;
    .end local v7    # "len$":I
    :cond_5
    if-eqz v8, :cond_0

    .line 126
    const-string/jumbo v14, "Warning"

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 127
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .end local v5    # "i$":I
    .local v4, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/Header;

    .line 128
    .restart local v3    # "h":Lorg/apache/http/Header;
    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Lorg/apache/http/HttpResponse;->addHeader(Lorg/apache/http/Header;)V

    goto :goto_3
.end method


# virtual methods
.method public ensureProtocolCompliance(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/HttpResponse;)V
    .locals 1
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->backendResponseMustNotHaveBody(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->consumeBody(Lorg/apache/http/HttpResponse;)V

    .line 73
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 76
    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->requestDidNotExpect100ContinueButResponseIsOne(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/HttpResponse;)V

    .line 78
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->transferEncodingIsNotReturnedTo1_0Client(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/HttpResponse;)V

    .line 80
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->ensurePartialContentIsNotSentToAClientThatDidNotRequestIt(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V

    .line 82
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->ensure200ForOPTIONSRequestWithNoBodyHasContentLengthZero(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V

    .line 84
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->ensure206ContainsDateHeader(Lorg/apache/http/HttpResponse;)V

    .line 86
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->ensure304DoesNotContainExtraEntityHeaders(Lorg/apache/http/HttpResponse;)V

    .line 88
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->identityIsNotUsedInContentEncoding(Lorg/apache/http/HttpResponse;)V

    .line 90
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->warningsWithNonMatchingWarnDatesAreRemoved(Lorg/apache/http/HttpResponse;)V

    .line 91
    return-void
.end method
