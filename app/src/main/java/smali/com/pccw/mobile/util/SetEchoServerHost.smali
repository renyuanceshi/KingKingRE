.class public Lcom/pccw/mobile/util/SetEchoServerHost;
.super Ljava/lang/Object;
.source "SetEchoServerHost.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setEchoServerHost(Landroid/content/Context;)V
    .locals 9
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 15
    new-instance v1, Lcom/pccw/pref/EchoServerPref;

    invoke-direct {v1, p0}, Lcom/pccw/pref/EchoServerPref;-><init>(Landroid/content/Context;)V

    .line 16
    .local v1, "echoServerPref":Lcom/pccw/pref/EchoServerPref;
    const/4 v0, 0x0

    .line 19
    .local v0, "echoHostFieldStr":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/pccw/pref/EchoServerPref;->getEchoServer()Ljava/lang/String;

    move-result-object v0

    .line 21
    const-string/jumbo v6, "NA"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string/jumbo v6, ""

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 23
    :cond_0
    invoke-virtual {v1}, Lcom/pccw/pref/EchoServerPref;->getEchoServerTest()Ljava/lang/String;

    move-result-object v0

    .line 26
    const-string/jumbo v6, "NA"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string/jumbo v6, ""

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 28
    :cond_1
    const-string/jumbo v6, "NA"

    invoke-virtual {v1, v6}, Lcom/pccw/pref/EchoServerPref;->setEchoServerHost1(Ljava/lang/String;)V

    .line 29
    const-string/jumbo v6, "NA"

    invoke-virtual {v1, v6}, Lcom/pccw/pref/EchoServerPref;->setEchoServerHost2(Ljava/lang/String;)V

    .line 61
    :goto_0
    return-void

    .line 36
    :cond_2
    const/4 v4, 0x0

    .line 37
    .local v4, "host_1":Ljava/lang/String;
    const/4 v5, 0x0

    .line 38
    .local v5, "host_2":Ljava/lang/String;
    const-string/jumbo v6, ";"

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 39
    const-string/jumbo v6, ";"

    invoke-virtual {v0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 40
    .local v2, "hostArr":[Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .local v3, "hostArrList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    aget-object v6, v2, v7

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    aget-object v6, v2, v8

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    invoke-static {v3}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 45
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "host_1":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .line 46
    .restart local v4    # "host_1":Ljava/lang/String;
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "host_2":Ljava/lang/String;
    check-cast v5, Ljava/lang/String;

    .line 57
    .end local v2    # "hostArr":[Ljava/lang/String;
    .end local v3    # "hostArrList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v5    # "host_2":Ljava/lang/String;
    :goto_1
    invoke-virtual {v1, v4}, Lcom/pccw/pref/EchoServerPref;->setEchoServerHost1(Ljava/lang/String;)V

    .line 58
    invoke-virtual {v1, v5}, Lcom/pccw/pref/EchoServerPref;->setEchoServerHost2(Ljava/lang/String;)V

    goto :goto_0

    .line 50
    :cond_3
    move-object v4, v0

    .line 51
    move-object v5, v0

    goto :goto_1
.end method
