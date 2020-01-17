.class Lcom/orhanobut/logger/LoggerPrinter;
.super Ljava/lang/Object;
.source "LoggerPrinter.java"

# interfaces
.implements Lcom/orhanobut/logger/Printer;


# static fields
.field private static final JSON_INDENT:I = 0x2


# instance fields
.field private final localTag:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final logAdapters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/orhanobut/logger/LogAdapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->localTag:Ljava/lang/ThreadLocal;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->logAdapters:Ljava/util/List;

    return-void
.end method

.method private varargs createMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 171
    if-eqz p2, :cond_0

    array-length v0, p2

    if-nez v0, :cond_1

    .end local p1    # "message":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .restart local p1    # "message":Ljava/lang/String;
    :cond_1
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private getTag()Ljava/lang/String;
    .locals 2

    .prologue
    .line 162
    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->localTag:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 163
    .local v0, "tag":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 164
    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->localTag:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    .line 167
    .end local v0    # "tag":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "tag":Ljava/lang/String;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private varargs declared-synchronized log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 3
    .param p1, "priority"    # I
    .param p2, "throwable"    # Ljava/lang/Throwable;
    .param p3, "msg"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 153
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/orhanobut/logger/LoggerPrinter;->getTag()Ljava/lang/String;

    move-result-object v1

    .line 154
    .local v1, "tag":Ljava/lang/String;
    invoke-direct {p0, p3, p4}, Lcom/orhanobut/logger/LoggerPrinter;->createMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 155
    .local v0, "message":Ljava/lang/String;
    invoke-virtual {p0, p1, v1, v0, p2}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    monitor-exit p0

    return-void

    .line 153
    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "tag":Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method


# virtual methods
.method public addAdapter(Lcom/orhanobut/logger/LogAdapter;)V
    .locals 1
    .param p1, "adapter"    # Lcom/orhanobut/logger/LogAdapter;

    .prologue
    .line 146
    iget-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->logAdapters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    return-void
.end method

.method public clearLogAdapters()V
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->logAdapters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 143
    return-void
.end method

.method public d(Ljava/lang/Object;)V
    .locals 4
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 53
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-static {p1}, Lcom/orhanobut/logger/Utils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 54
    return-void
.end method

.method public varargs d(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 49
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 50
    return-void
.end method

.method public varargs e(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 58
    return-void
.end method

.method public varargs e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1
    .param p1, "throwable"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 61
    const/4 v0, 0x6

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 62
    return-void
.end method

.method public varargs i(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 69
    const/4 v0, 0x4

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 70
    return-void
.end method

.method public json(Ljava/lang/String;)V
    .locals 7
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 81
    invoke-static {p1}, Lcom/orhanobut/logger/Utils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 82
    const-string/jumbo v4, "Empty/Null json content"

    invoke-virtual {p0, v4}, Lcom/orhanobut/logger/LoggerPrinter;->d(Ljava/lang/Object;)V

    .line 103
    :goto_0
    return-void

    .line 86
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 87
    const-string/jumbo v4, "{"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 88
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 89
    .local v2, "jsonObject":Lorg/json/JSONObject;
    const/4 v4, 0x2

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v3

    .line 90
    .local v3, "message":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/orhanobut/logger/LoggerPrinter;->d(Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 100
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .end local v3    # "message":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 101
    .local v0, "e":Lorg/json/JSONException;
    const-string/jumbo v4, "Invalid Json"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-virtual {p0, v4, v5}, Lcom/orhanobut/logger/LoggerPrinter;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 93
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_1
    :try_start_1
    const-string/jumbo v4, "["

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 94
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 95
    .local v1, "jsonArray":Lorg/json/JSONArray;
    const/4 v4, 0x2

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v3

    .line 96
    .restart local v3    # "message":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/orhanobut/logger/LoggerPrinter;->d(Ljava/lang/Object;)V

    goto :goto_0

    .line 99
    .end local v1    # "jsonArray":Lorg/json/JSONArray;
    .end local v3    # "message":Ljava/lang/String;
    :cond_2
    const-string/jumbo v4, "Invalid Json"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0, v4, v5}, Lcom/orhanobut/logger/LoggerPrinter;->e(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public declared-synchronized log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "priority"    # I
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 124
    monitor-enter p0

    if-eqz p4, :cond_0

    if-eqz p3, :cond_0

    .line 125
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p4}, Lcom/orhanobut/logger/Utils;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 127
    :cond_0
    if-eqz p4, :cond_1

    if-nez p3, :cond_1

    .line 128
    invoke-static {p4}, Lcom/orhanobut/logger/Utils;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    .line 130
    :cond_1
    invoke-static {p3}, Lcom/orhanobut/logger/Utils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 131
    const-string/jumbo p3, "Empty/NULL log message"

    .line 134
    :cond_2
    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->logAdapters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/orhanobut/logger/LogAdapter;

    .line 135
    .local v0, "adapter":Lcom/orhanobut/logger/LogAdapter;
    invoke-interface {v0, p1, p2}, Lcom/orhanobut/logger/LogAdapter;->isLoggable(ILjava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 136
    invoke-interface {v0, p1, p2, p3}, Lcom/orhanobut/logger/LogAdapter;->log(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 124
    .end local v0    # "adapter":Lcom/orhanobut/logger/LogAdapter;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 139
    :cond_4
    monitor-exit p0

    return-void
.end method

.method public t(Ljava/lang/String;)Lcom/orhanobut/logger/Printer;
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 42
    if-eqz p1, :cond_0

    .line 43
    iget-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->localTag:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, p1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 45
    :cond_0
    return-object p0
.end method

.method public varargs v(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 73
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 74
    return-void
.end method

.method public varargs w(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 65
    const/4 v0, 0x5

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 66
    return-void
.end method

.method public varargs wtf(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 77
    const/4 v0, 0x7

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 78
    return-void
.end method

.method public xml(Ljava/lang/String;)V
    .locals 7
    .param p1, "xml"    # Ljava/lang/String;

    .prologue
    .line 106
    invoke-static {p1}, Lcom/orhanobut/logger/Utils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 107
    const-string/jumbo v4, "Empty/Null xml content"

    invoke-virtual {p0, v4}, Lcom/orhanobut/logger/LoggerPrinter;->d(Ljava/lang/Object;)V

    .line 121
    :goto_0
    return-void

    .line 111
    :cond_0
    :try_start_0
    new-instance v2, Ljavax/xml/transform/stream/StreamSource;

    new-instance v4, Ljava/io/StringReader;

    invoke-direct {v4, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v4}, Ljavax/xml/transform/stream/StreamSource;-><init>(Ljava/io/Reader;)V

    .line 112
    .local v2, "xmlInput":Ljavax/xml/transform/Source;
    new-instance v3, Ljavax/xml/transform/stream/StreamResult;

    new-instance v4, Ljava/io/StringWriter;

    invoke-direct {v4}, Ljava/io/StringWriter;-><init>()V

    invoke-direct {v3, v4}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 113
    .local v3, "xmlOutput":Ljavax/xml/transform/stream/StreamResult;
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v1

    .line 114
    .local v1, "transformer":Ljavax/xml/transform/Transformer;
    const-string/jumbo v4, "indent"

    const-string/jumbo v5, "yes"

    invoke-virtual {v1, v4, v5}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    const-string/jumbo v4, "{http://xml.apache.org/xslt}indent-amount"

    const-string/jumbo v5, "2"

    invoke-virtual {v1, v4, v5}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    invoke-virtual {v1, v2, v3}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 117
    invoke-virtual {v3}, Ljavax/xml/transform/stream/StreamResult;->getWriter()Ljava/io/Writer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, ">"

    const-string/jumbo v6, ">\n"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/orhanobut/logger/LoggerPrinter;->d(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 118
    .end local v1    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v2    # "xmlInput":Ljavax/xml/transform/Source;
    .end local v3    # "xmlOutput":Ljavax/xml/transform/stream/StreamResult;
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Ljavax/xml/transform/TransformerException;
    const-string/jumbo v4, "Invalid xml"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0, v4, v5}, Lcom/orhanobut/logger/LoggerPrinter;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method
