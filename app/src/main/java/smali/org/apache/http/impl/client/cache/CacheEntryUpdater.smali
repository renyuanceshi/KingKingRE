.class Lorg/apache/http/impl/client/cache/CacheEntryUpdater;
.super Ljava/lang/Object;
.source "CacheEntryUpdater.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lorg/apache/http/impl/client/cache/HeapResourceFactory;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/HeapResourceFactory;-><init>()V

    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;-><init>(Lorg/apache/http/client/cache/ResourceFactory;)V

    .line 62
    return-void
.end method

.method constructor <init>(Lorg/apache/http/client/cache/ResourceFactory;)V
    .locals 0
    .param p1, "resourceFactory"    # Lorg/apache/http/client/cache/ResourceFactory;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;->resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

    .line 67
    return-void
.end method

.method private entryAndResponseHaveDateHeader(Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpResponse;)Z
    .locals 1
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 165
    const-string/jumbo v0, "Date"

    invoke-virtual {p1, v0}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "Date"

    invoke-interface {p2, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 167
    const/4 v0, 0x1

    .line 170
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private entryDateHeaderNewerThenResponse(Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpResponse;)Z
    .locals 4
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    const/4 v2, 0x0

    .line 151
    const-string/jumbo v3, "Date"

    invoke-virtual {p1, v3}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 153
    .local v0, "entryDate":Ljava/util/Date;
    const-string/jumbo v3, "Date"

    invoke-interface {p2, v3}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 155
    .local v1, "responseDate":Ljava/util/Date;
    if-eqz v0, :cond_0

    if-nez v1, :cond_1

    .line 161
    :cond_0
    :goto_0
    return v2

    .line 158
    :cond_1
    invoke-virtual {v0, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 161
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private removeCacheEntry1xxWarnings(Ljava/util/List;Lorg/apache/http/client/cache/HttpCacheEntry;)V
    .locals 8
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/Header;",
            ">;",
            "Lorg/apache/http/client/cache/HttpCacheEntry;",
            ")V"
        }
    .end annotation

    .prologue
    .line 135
    .local p1, "cacheEntryHeaderList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    invoke-interface {p1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 137
    .local v1, "cacheEntryHeaderListIter":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lorg/apache/http/Header;>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 138
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/http/Header;

    invoke-interface {v6}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v2

    .line 140
    .local v2, "cacheEntryHeaderName":Ljava/lang/String;
    const-string/jumbo v6, "Warning"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 141
    const-string/jumbo v6, "Warning"

    invoke-virtual {p2, v6}, Lorg/apache/http/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v3, v0, v4

    .line 142
    .local v3, "cacheEntryWarning":Lorg/apache/http/Header;
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "1"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 143
    invoke-interface {v1}, Ljava/util/ListIterator;->remove()V

    .line 141
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 148
    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v2    # "cacheEntryHeaderName":Ljava/lang/String;
    .end local v3    # "cacheEntryWarning":Lorg/apache/http/Header;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    :cond_2
    return-void
.end method

.method private removeCacheHeadersThatMatchResponse(Ljava/util/List;Lorg/apache/http/HttpResponse;)V
    .locals 7
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/Header;",
            ">;",
            "Lorg/apache/http/HttpResponse;",
            ")V"
        }
    .end annotation

    .prologue
    .line 121
    .local p1, "cacheEntryHeaderList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v5, v0, v3

    .line 122
    .local v5, "responseHeader":Lorg/apache/http/Header;
    invoke-interface {p1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 124
    .local v1, "cacheEntryHeaderListIter":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lorg/apache/http/Header;>;"
    :cond_0
    :goto_1
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 125
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/http/Header;

    invoke-interface {v6}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v2

    .line 127
    .local v2, "cacheEntryHeaderName":Ljava/lang/String;
    invoke-interface {v5}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 128
    invoke-interface {v1}, Ljava/util/ListIterator;->remove()V

    goto :goto_1

    .line 121
    .end local v2    # "cacheEntryHeaderName":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 132
    .end local v1    # "cacheEntryHeaderListIter":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lorg/apache/http/Header;>;"
    .end local v5    # "responseHeader":Lorg/apache/http/Header;
    :cond_2
    return-void
.end method


# virtual methods
.method protected mergeHeaders(Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpResponse;)[Lorg/apache/http/Header;
    .locals 2
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 104
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;->entryAndResponseHaveDateHeader(Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpResponse;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;->entryDateHeaderNewerThenResponse(Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpResponse;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 107
    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    .line 116
    :goto_0
    return-object v1

    .line 110
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 112
    .local v0, "cacheEntryHeaderList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    invoke-direct {p0, v0, p2}, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;->removeCacheHeadersThatMatchResponse(Ljava/util/List;Lorg/apache/http/HttpResponse;)V

    .line 113
    invoke-direct {p0, v0, p1}, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;->removeCacheEntry1xxWarnings(Ljava/util/List;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    .line 114
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 116
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/http/Header;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/apache/http/Header;

    goto :goto_0
.end method

.method public updateCacheEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 6
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p3, "requestDate"    # Ljava/util/Date;
    .param p4, "responseDate"    # Ljava/util/Date;
    .param p5, "response"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-interface {p5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0x130

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    const-string/jumbo v1, "Response must have 304 status code"

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    .line 89
    invoke-virtual {p0, p2, p5}, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;->mergeHeaders(Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpResponse;)[Lorg/apache/http/Header;

    move-result-object v4

    .line 90
    .local v4, "mergedHeaders":[Lorg/apache/http/Header;
    const/4 v5, 0x0

    .line 91
    .local v5, "resource":Lorg/apache/http/client/cache/Resource;
    invoke-virtual {p2}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;->resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

    invoke-virtual {p2}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lorg/apache/http/client/cache/ResourceFactory;->copy(Ljava/lang/String;Lorg/apache/http/client/cache/Resource;)Lorg/apache/http/client/cache/Resource;

    move-result-object v5

    .line 94
    :cond_0
    new-instance v0, Lorg/apache/http/client/cache/HttpCacheEntry;

    invoke-virtual {p2}, Lorg/apache/http/client/cache/HttpCacheEntry;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    move-object v1, p3

    move-object v2, p4

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/client/cache/HttpCacheEntry;-><init>(Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/StatusLine;[Lorg/apache/http/Header;Lorg/apache/http/client/cache/Resource;)V

    return-object v0

    .line 87
    .end local v4    # "mergedHeaders":[Lorg/apache/http/Header;
    .end local v5    # "resource":Lorg/apache/http/client/cache/Resource;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
