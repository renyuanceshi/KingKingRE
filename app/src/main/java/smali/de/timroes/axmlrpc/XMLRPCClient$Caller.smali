.class Lde/timroes/axmlrpc/XMLRPCClient$Caller;
.super Ljava/lang/Thread;
.source "XMLRPCClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/timroes/axmlrpc/XMLRPCClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Caller"
.end annotation


# instance fields
.field private volatile canceled:Z

.field private http:Ljava/net/HttpURLConnection;

.field private listener:Lde/timroes/axmlrpc/XMLRPCCallback;

.field private methodName:Ljava/lang/String;

.field private params:[Ljava/lang/Object;

.field final synthetic this$0:Lde/timroes/axmlrpc/XMLRPCClient;

.field private threadId:J


# direct methods
.method public constructor <init>(Lde/timroes/axmlrpc/XMLRPCClient;)V
    .locals 0

    .prologue
    .line 537
    iput-object p1, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method public constructor <init>(Lde/timroes/axmlrpc/XMLRPCClient;Lde/timroes/axmlrpc/XMLRPCCallback;JLjava/lang/String;[Ljava/lang/Object;)V
    .locals 1
    .param p2, "listener"    # Lde/timroes/axmlrpc/XMLRPCCallback;
    .param p3, "threadId"    # J
    .param p5, "methodName"    # Ljava/lang/String;
    .param p6, "params"    # [Ljava/lang/Object;

    .prologue
    .line 524
    iput-object p1, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 525
    iput-object p2, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->listener:Lde/timroes/axmlrpc/XMLRPCCallback;

    .line 526
    iput-wide p3, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->threadId:J

    .line 527
    iput-object p5, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->methodName:Ljava/lang/String;

    .line 528
    iput-object p6, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->params:[Ljava/lang/Object;

    .line 529
    return-void
.end method


# virtual methods
.method public call(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/timroes/axmlrpc/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 594
    :try_start_0
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v7, p1, p2}, Lde/timroes/axmlrpc/XMLRPCClient;->access$100(Lde/timroes/axmlrpc/XMLRPCClient;Ljava/lang/String;[Ljava/lang/Object;)Lde/timroes/axmlrpc/Call;

    move-result-object v0

    .line 596
    .local v0, "c":Lde/timroes/axmlrpc/Call;
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v7}, Lde/timroes/axmlrpc/XMLRPCClient;->access$200(Lde/timroes/axmlrpc/XMLRPCClient;)Ljava/net/URL;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 597
    .local v1, "conn":Ljava/net/URLConnection;
    instance-of v7, v1, Ljava/net/HttpURLConnection;

    if-nez v7, :cond_1

    .line 598
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v8, "The URL is not for a http connection."

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 637
    .end local v0    # "c":Lde/timroes/axmlrpc/Call;
    .end local v1    # "conn":Ljava/net/URLConnection;
    :catch_0
    move-exception v2

    .line 641
    .local v2, "ex":Ljava/net/SocketException;
    iget-boolean v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->canceled:Z

    if-eqz v7, :cond_0

    iget-wide v8, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->threadId:J

    const-wide/16 v10, 0x0

    cmp-long v7, v8, v10

    if-gtz v7, :cond_5

    .line 642
    :cond_0
    new-instance v7, Lde/timroes/axmlrpc/XMLRPCException;

    invoke-direct {v7, v2}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/Exception;)V

    throw v7

    .line 601
    .end local v2    # "ex":Ljava/net/SocketException;
    .restart local v0    # "c":Lde/timroes/axmlrpc/Call;
    .restart local v1    # "conn":Ljava/net/URLConnection;
    :cond_1
    :try_start_1
    check-cast v1, Ljava/net/HttpURLConnection;

    .end local v1    # "conn":Ljava/net/URLConnection;
    iput-object v1, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    .line 602
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    const-string/jumbo v8, "POST"

    invoke-virtual {v7, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 603
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 604
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 607
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v7}, Lde/timroes/axmlrpc/XMLRPCClient;->access$300(Lde/timroes/axmlrpc/XMLRPCClient;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 608
    .local v5, "param":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v9, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v7, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 646
    .end local v0    # "c":Lde/timroes/axmlrpc/Call;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "param":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_1
    move-exception v2

    .line 647
    .local v2, "ex":Ljava/io/IOException;
    new-instance v7, Lde/timroes/axmlrpc/XMLRPCException;

    invoke-direct {v7, v2}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/Exception;)V

    throw v7

    .line 611
    .end local v2    # "ex":Ljava/io/IOException;
    .restart local v0    # "c":Lde/timroes/axmlrpc/Call;
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    :try_start_2
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v7}, Lde/timroes/axmlrpc/XMLRPCClient;->access$400(Lde/timroes/axmlrpc/XMLRPCClient;)Lde/timroes/axmlrpc/AuthenticationManager;

    move-result-object v7

    iget-object v8, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    invoke-virtual {v7, v8}, Lde/timroes/axmlrpc/AuthenticationManager;->setAuthentication(Ljava/net/HttpURLConnection;)V

    .line 612
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v7}, Lde/timroes/axmlrpc/XMLRPCClient;->access$500(Lde/timroes/axmlrpc/XMLRPCClient;)Lde/timroes/axmlrpc/CookieManager;

    move-result-object v7

    iget-object v8, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    invoke-virtual {v7, v8}, Lde/timroes/axmlrpc/CookieManager;->setCookies(Ljava/net/HttpURLConnection;)V

    .line 614
    new-instance v6, Ljava/io/OutputStreamWriter;

    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 615
    .local v6, "stream":Ljava/io/OutputStreamWriter;
    invoke-virtual {v0}, Lde/timroes/axmlrpc/Call;->getXML()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 616
    invoke-virtual {v6}, Ljava/io/OutputStreamWriter;->flush()V

    .line 617
    invoke-virtual {v6}, Ljava/io/OutputStreamWriter;->close()V

    .line 619
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 621
    .local v4, "istream":Ljava/io/InputStream;
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    const/16 v8, 0x10

    invoke-static {v7, v8}, Lde/timroes/axmlrpc/XMLRPCClient;->access$600(Lde/timroes/axmlrpc/XMLRPCClient;I)Z

    move-result v7

    if-nez v7, :cond_3

    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7

    const/16 v8, 0xc8

    if-eq v7, v8, :cond_3

    .line 623
    new-instance v7, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v8, "The status code of the http response must be 200."

    invoke-direct {v7, v8}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 627
    :cond_3
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    const/4 v8, 0x1

    invoke-static {v7, v8}, Lde/timroes/axmlrpc/XMLRPCClient;->access$600(Lde/timroes/axmlrpc/XMLRPCClient;I)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 628
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "text/xml"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 629
    new-instance v7, Lde/timroes/axmlrpc/XMLRPCException;

    const-string/jumbo v8, "The Content-Type of the response must be text/xml."

    invoke-direct {v7, v8}, Lde/timroes/axmlrpc/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 633
    :cond_4
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v7}, Lde/timroes/axmlrpc/XMLRPCClient;->access$500(Lde/timroes/axmlrpc/XMLRPCClient;)Lde/timroes/axmlrpc/CookieManager;

    move-result-object v7

    iget-object v8, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    invoke-virtual {v7, v8}, Lde/timroes/axmlrpc/CookieManager;->readCookies(Ljava/net/HttpURLConnection;)V

    .line 635
    iget-object v7, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v7}, Lde/timroes/axmlrpc/XMLRPCClient;->access$700(Lde/timroes/axmlrpc/XMLRPCClient;)Lde/timroes/axmlrpc/ResponseParser;

    move-result-object v7

    invoke-virtual {v7, v4}, Lde/timroes/axmlrpc/ResponseParser;->parse(Ljava/io/InputStream;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/net/SocketException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v7

    return-object v7

    .line 644
    .end local v0    # "c":Lde/timroes/axmlrpc/Call;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "istream":Ljava/io/InputStream;
    .end local v6    # "stream":Ljava/io/OutputStreamWriter;
    .local v2, "ex":Ljava/net/SocketException;
    :cond_5
    new-instance v7, Lde/timroes/axmlrpc/XMLRPCClient$CancelException;

    iget-object v8, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    const/4 v9, 0x0

    invoke-direct {v7, v8, v9}, Lde/timroes/axmlrpc/XMLRPCClient$CancelException;-><init>(Lde/timroes/axmlrpc/XMLRPCClient;Lde/timroes/axmlrpc/XMLRPCClient$1;)V

    throw v7
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 571
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->canceled:Z

    .line 573
    iget-object v0, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->http:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 574
    return-void
.end method

.method public run()V
    .locals 6

    .prologue
    .line 547
    iget-object v2, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->listener:Lde/timroes/axmlrpc/XMLRPCCallback;

    if-nez v2, :cond_0

    .line 564
    :goto_0
    return-void

    .line 551
    :cond_0
    :try_start_0
    iget-object v2, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v2}, Lde/timroes/axmlrpc/XMLRPCClient;->access$000(Lde/timroes/axmlrpc/XMLRPCClient;)Ljava/util/Map;

    move-result-object v2

    iget-wide v4, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->threadId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 552
    iget-object v2, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->methodName:Ljava/lang/String;

    iget-object v3, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->params:[Ljava/lang/Object;

    invoke-virtual {p0, v2, v3}, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->call(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 553
    .local v1, "o":Ljava/lang/Object;
    iget-object v2, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->listener:Lde/timroes/axmlrpc/XMLRPCCallback;

    iget-wide v4, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->threadId:J

    invoke-interface {v2, v4, v5, v1}, Lde/timroes/axmlrpc/XMLRPCCallback;->onResponse(JLjava/lang/Object;)V
    :try_end_0
    .catch Lde/timroes/axmlrpc/XMLRPCClient$CancelException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lde/timroes/axmlrpc/XMLRPCServerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lde/timroes/axmlrpc/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 561
    iget-object v2, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v2}, Lde/timroes/axmlrpc/XMLRPCClient;->access$000(Lde/timroes/axmlrpc/XMLRPCClient;)Ljava/util/Map;

    move-result-object v2

    iget-wide v4, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->threadId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 554
    .end local v1    # "o":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 561
    iget-object v2, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v2}, Lde/timroes/axmlrpc/XMLRPCClient;->access$000(Lde/timroes/axmlrpc/XMLRPCClient;)Ljava/util/Map;

    move-result-object v2

    iget-wide v4, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->threadId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 556
    :catch_1
    move-exception v0

    .line 557
    .local v0, "ex":Lde/timroes/axmlrpc/XMLRPCServerException;
    :try_start_1
    iget-object v2, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->listener:Lde/timroes/axmlrpc/XMLRPCCallback;

    iget-wide v4, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->threadId:J

    invoke-interface {v2, v4, v5, v0}, Lde/timroes/axmlrpc/XMLRPCCallback;->onServerError(JLde/timroes/axmlrpc/XMLRPCServerException;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 561
    iget-object v2, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v2}, Lde/timroes/axmlrpc/XMLRPCClient;->access$000(Lde/timroes/axmlrpc/XMLRPCClient;)Ljava/util/Map;

    move-result-object v2

    iget-wide v4, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->threadId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 558
    .end local v0    # "ex":Lde/timroes/axmlrpc/XMLRPCServerException;
    :catch_2
    move-exception v0

    .line 559
    .local v0, "ex":Lde/timroes/axmlrpc/XMLRPCException;
    :try_start_2
    iget-object v2, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->listener:Lde/timroes/axmlrpc/XMLRPCCallback;

    iget-wide v4, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->threadId:J

    invoke-interface {v2, v4, v5, v0}, Lde/timroes/axmlrpc/XMLRPCCallback;->onError(JLde/timroes/axmlrpc/XMLRPCException;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 561
    iget-object v2, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v2}, Lde/timroes/axmlrpc/XMLRPCClient;->access$000(Lde/timroes/axmlrpc/XMLRPCClient;)Ljava/util/Map;

    move-result-object v2

    iget-wide v4, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->threadId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .end local v0    # "ex":Lde/timroes/axmlrpc/XMLRPCException;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-static {v3}, Lde/timroes/axmlrpc/XMLRPCClient;->access$000(Lde/timroes/axmlrpc/XMLRPCClient;)Ljava/util/Map;

    move-result-object v3

    iget-wide v4, p0, Lde/timroes/axmlrpc/XMLRPCClient$Caller;->threadId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    throw v2
.end method
