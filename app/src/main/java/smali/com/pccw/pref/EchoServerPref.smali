.class public Lcom/pccw/pref/EchoServerPref;
.super Ljava/lang/Object;
.source "EchoServerPref.java"


# instance fields
.field ctx:Landroid/content/Context;

.field sp:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/pccw/pref/EchoServerPref;->ctx:Landroid/content/Context;

    .line 17
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/pref/EchoServerPref;->sp:Landroid/content/SharedPreferences;

    .line 18
    return-void
.end method


# virtual methods
.method public getEchoServer()Ljava/lang/String;
    .locals 3

    .prologue
    .line 31
    iget-object v0, p0, Lcom/pccw/pref/EchoServerPref;->sp:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "echoServerHost"

    const-string/jumbo v2, "NA"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEchoServerHost1()Ljava/lang/String;
    .locals 3

    .prologue
    .line 51
    iget-object v0, p0, Lcom/pccw/pref/EchoServerPref;->sp:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "echoServerHost1"

    const-string/jumbo v2, "NA"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEchoServerHost2()Ljava/lang/String;
    .locals 3

    .prologue
    .line 61
    iget-object v0, p0, Lcom/pccw/pref/EchoServerPref;->sp:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "echoServerHost2"

    const-string/jumbo v2, "NA"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEchoServerTest()Ljava/lang/String;
    .locals 3

    .prologue
    .line 21
    iget-object v0, p0, Lcom/pccw/pref/EchoServerPref;->sp:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "echoServerHostTest"

    const-string/jumbo v2, "NA"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValidEchoServerHost()Ljava/lang/String;
    .locals 3

    .prologue
    .line 41
    iget-object v0, p0, Lcom/pccw/pref/EchoServerPref;->sp:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "validEchoServerHost"

    const-string/jumbo v2, "NA"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setEchoServer(Ljava/lang/String;)V
    .locals 2
    .param p1, "echoServer"    # Ljava/lang/String;

    .prologue
    .line 35
    iget-object v1, p0, Lcom/pccw/pref/EchoServerPref;->sp:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 36
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v1, "echoServerHost"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 37
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 38
    return-void
.end method

.method public setEchoServerHost1(Ljava/lang/String;)V
    .locals 2
    .param p1, "echoServerHost1"    # Ljava/lang/String;

    .prologue
    .line 55
    iget-object v1, p0, Lcom/pccw/pref/EchoServerPref;->sp:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 56
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v1, "echoServerHost1"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 57
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 58
    return-void
.end method

.method public setEchoServerHost2(Ljava/lang/String;)V
    .locals 2
    .param p1, "echoServerHost2"    # Ljava/lang/String;

    .prologue
    .line 65
    iget-object v1, p0, Lcom/pccw/pref/EchoServerPref;->sp:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 66
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v1, "echoServerHost2"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 67
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 68
    return-void
.end method

.method public setEchoServerTest(Ljava/lang/String;)V
    .locals 2
    .param p1, "echoServerTest"    # Ljava/lang/String;

    .prologue
    .line 25
    iget-object v1, p0, Lcom/pccw/pref/EchoServerPref;->sp:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 26
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v1, "echoServerHostTest"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 27
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 28
    return-void
.end method

.method public setValidEchoServerHost(Ljava/lang/String;)V
    .locals 2
    .param p1, "validEchoServerHost"    # Ljava/lang/String;

    .prologue
    .line 45
    iget-object v1, p0, Lcom/pccw/pref/EchoServerPref;->sp:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 46
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v1, "validEchoServerHost"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 47
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 48
    return-void
.end method
