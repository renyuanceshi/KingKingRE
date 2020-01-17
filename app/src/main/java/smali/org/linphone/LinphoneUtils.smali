.class public final Lorg/linphone/LinphoneUtils;
.super Ljava/lang/Object;
.source "LinphoneUtils.java"


# static fields
.field private static preventVolumeBarToDisplay:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    const/4 v0, 0x0

    sput-boolean v0, Lorg/linphone/LinphoneUtils;->preventVolumeBarToDisplay:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final countConferenceCalls(Lorg/linphone/core/LinphoneCore;)I
    .locals 2
    .param p0, "lc"    # Lorg/linphone/core/LinphoneCore;

    .prologue
    .line 224
    invoke-interface {p0}, Lorg/linphone/core/LinphoneCore;->getConferenceSize()I

    move-result v0

    .line 225
    .local v0, "count":I
    invoke-interface {p0}, Lorg/linphone/core/LinphoneCore;->isInConference()Z

    move-result v1

    if-eqz v1, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 226
    :cond_0
    return v0
.end method

.method public static countNonConferenceCalls(Lorg/linphone/core/LinphoneCore;)I
    .locals 2
    .param p0, "lc"    # Lorg/linphone/core/LinphoneCore;

    .prologue
    .line 233
    invoke-interface {p0}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v0

    invoke-static {p0}, Lorg/linphone/LinphoneUtils;->countConferenceCalls(Lorg/linphone/core/LinphoneCore;)I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public static countVirtualCalls(Lorg/linphone/core/LinphoneCore;)I
    .locals 2
    .param p0, "lc"    # Lorg/linphone/core/LinphoneCore;

    .prologue
    .line 230
    invoke-interface {p0}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v0

    invoke-static {p0}, Lorg/linphone/LinphoneUtils;->countConferenceCalls(Lorg/linphone/core/LinphoneCore;)I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public static downloadBitmap(Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .locals 6
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 137
    const/4 v1, 0x0

    .line 139
    .local v1, "is":Ljava/io/InputStream;
    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 140
    .local v2, "url":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v1

    .line 141
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 147
    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 149
    .end local v2    # "url":Ljava/net/URL;
    :goto_0
    return-object v3

    .line 142
    :catch_0
    move-exception v0

    .line 143
    .local v0, "e":Ljava/net/MalformedURLException;
    const/4 v3, 0x2

    :try_start_2
    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v4, 0x1

    invoke-virtual {v0}, Ljava/net/MalformedURLException;->getMessage()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v3}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 147
    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    .line 149
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :goto_1
    const/4 v3, 0x0

    goto :goto_0

    .line 144
    :catch_1
    move-exception v0

    .line 145
    .local v0, "e":Ljava/io/IOException;
    const/4 v3, 0x2

    :try_start_4
    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v4, 0x1

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v3}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 147
    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_1

    :catch_2
    move-exception v3

    goto :goto_1

    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    :goto_2
    throw v3

    .restart local v2    # "url":Ljava/net/URL;
    :catch_3
    move-exception v4

    goto :goto_0

    .end local v2    # "url":Ljava/net/URL;
    .local v0, "e":Ljava/net/MalformedURLException;
    :catch_4
    move-exception v3

    goto :goto_1

    .end local v0    # "e":Ljava/net/MalformedURLException;
    :catch_5
    move-exception v4

    goto :goto_2
.end method

.method public static enableView(Landroid/view/View;ILandroid/view/View$OnClickListener;Z)V
    .locals 2
    .param p0, "root"    # Landroid/view/View;
    .param p1, "id"    # I
    .param p2, "l"    # Landroid/view/View$OnClickListener;
    .param p3, "enable"    # Z

    .prologue
    .line 243
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 244
    .local v0, "v":Landroid/view/View;
    if-eqz p3, :cond_0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 245
    invoke-virtual {v0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 246
    return-void

    .line 244
    :cond_0
    const/16 v1, 0x8

    goto :goto_0
.end method

.method public static final getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;
    .locals 4
    .param p0, "lc"    # Lorg/linphone/core/LinphoneCore;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/linphone/core/LinphoneCore;",
            "Ljava/util/Collection",
            "<",
            "Lorg/linphone/core/LinphoneCall$State;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/linphone/core/LinphoneCall;",
            ">;"
        }
    .end annotation

    .prologue
    .line 208
    .local p1, "states":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/linphone/core/LinphoneCall$State;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 209
    .local v1, "foundCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    invoke-static {p0}, Lorg/linphone/LinphoneUtils;->getLinphoneCalls(Lorg/linphone/core/LinphoneCore;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneCall;

    .line 210
    .local v0, "call":Lorg/linphone/core/LinphoneCall;
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 211
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 214
    .end local v0    # "call":Lorg/linphone/core/LinphoneCall;
    :cond_1
    return-object v1
.end method

.method public static final getLinphoneCalls(Lorg/linphone/core/LinphoneCore;)Ljava/util/List;
    .locals 2
    .param p0, "lc"    # Lorg/linphone/core/LinphoneCore;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/linphone/core/LinphoneCore;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/linphone/core/LinphoneCall;",
            ">;"
        }
    .end annotation

    .prologue
    .line 195
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Lorg/linphone/core/LinphoneCore;->getCalls()[Lorg/linphone/core/LinphoneCall;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public static final getLinphoneCallsInConf(Lorg/linphone/core/LinphoneCore;)Ljava/util/List;
    .locals 6
    .param p0, "lc"    # Lorg/linphone/core/LinphoneCore;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/linphone/core/LinphoneCore;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/linphone/core/LinphoneCall;",
            ">;"
        }
    .end annotation

    .prologue
    .line 184
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .local v1, "l":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    invoke-interface {p0}, Lorg/linphone/core/LinphoneCore;->getCalls()[Lorg/linphone/core/LinphoneCall;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v0, v3, v2

    .line 186
    .local v0, "c":Lorg/linphone/core/LinphoneCall;
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->isInConference()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 187
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 190
    .end local v0    # "c":Lorg/linphone/core/LinphoneCall;
    :cond_1
    return-object v1
.end method

.method public static final getLinphoneCallsNotInConf(Lorg/linphone/core/LinphoneCore;)Ljava/util/List;
    .locals 6
    .param p0, "lc"    # Lorg/linphone/core/LinphoneCore;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/linphone/core/LinphoneCore;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/linphone/core/LinphoneCall;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .local v1, "l":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    invoke-interface {p0}, Lorg/linphone/core/LinphoneCore;->getCalls()[Lorg/linphone/core/LinphoneCall;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v0, v3, v2

    .line 176
    .local v0, "c":Lorg/linphone/core/LinphoneCall;
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->isInConference()Z

    move-result v5

    if-nez v5, :cond_0

    .line 177
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 180
    .end local v0    # "c":Lorg/linphone/core/LinphoneCall;
    :cond_1
    return-object v1
.end method

.method public static final getRunningOrPausedCalls(Lorg/linphone/core/LinphoneCore;)Ljava/util/List;
    .locals 3
    .param p0, "lc"    # Lorg/linphone/core/LinphoneCore;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/linphone/core/LinphoneCore;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/linphone/core/LinphoneCall;",
            ">;"
        }
    .end annotation

    .prologue
    .line 217
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/linphone/core/LinphoneCall$State;

    const/4 v1, 0x0

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->PausedByRemote:Lorg/linphone/core/LinphoneCall$State;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getUsernameFromAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "address"    # Ljava/lang/String;

    .prologue
    .line 84
    const-string/jumbo v0, "sip:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    const-string/jumbo v0, "sip:"

    const-string/jumbo v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 87
    :cond_0
    const-string/jumbo v0, "@"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 88
    const-string/jumbo v0, "@"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object p0, v0, v1

    .line 90
    :cond_1
    return-object p0
.end method

.method public static final hasExistingResumeableCall(Lorg/linphone/core/LinphoneCore;)Z
    .locals 4
    .param p0, "lc"    # Lorg/linphone/core/LinphoneCore;

    .prologue
    .line 199
    invoke-static {p0}, Lorg/linphone/LinphoneUtils;->getLinphoneCalls(Lorg/linphone/core/LinphoneCore;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneCall;

    .line 200
    .local v0, "c":Lorg/linphone/core/LinphoneCall;
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v2

    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    if-ne v2, v3, :cond_0

    .line 201
    const/4 v1, 0x1

    .line 204
    .end local v0    # "c":Lorg/linphone/core/LinphoneCall;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isCallEstablished(Lorg/linphone/core/LinphoneCall;)Z
    .locals 3
    .param p0, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    const/4 v1, 0x0

    .line 268
    if-nez p0, :cond_1

    .line 274
    :cond_0
    :goto_0
    return v1

    .line 272
    :cond_1
    invoke-interface {p0}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v0

    .line 274
    .local v0, "state":Lorg/linphone/core/LinphoneCall$State;
    invoke-static {p0}, Lorg/linphone/LinphoneUtils;->isCallRunning(Lorg/linphone/core/LinphoneCall;)Z

    move-result v2

    if-nez v2, :cond_2

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    if-eq v0, v2, :cond_2

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->PausedByRemote:Lorg/linphone/core/LinphoneCall$State;

    if-eq v0, v2, :cond_2

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Pausing:Lorg/linphone/core/LinphoneCall$State;

    if-ne v0, v2, :cond_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isCallPaused(Lorg/linphone/core/LinphoneCall;)Z
    .locals 3
    .param p0, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    const/4 v1, 0x0

    .line 281
    if-nez p0, :cond_1

    .line 287
    :cond_0
    :goto_0
    return v1

    .line 285
    :cond_1
    invoke-interface {p0}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v0

    .line 287
    .local v0, "state":Lorg/linphone/core/LinphoneCall$State;
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    if-eq v0, v2, :cond_2

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->PausedByRemote:Lorg/linphone/core/LinphoneCall$State;

    if-eq v0, v2, :cond_2

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Pausing:Lorg/linphone/core/LinphoneCall$State;

    if-ne v0, v2, :cond_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isCallRunning(Lorg/linphone/core/LinphoneCall;)Z
    .locals 3
    .param p0, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    const/4 v1, 0x0

    .line 254
    if-nez p0, :cond_1

    .line 260
    :cond_0
    :goto_0
    return v1

    .line 258
    :cond_1
    invoke-interface {p0}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v0

    .line 260
    .local v0, "state":Lorg/linphone/core/LinphoneCall$State;
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Connected:Lorg/linphone/core/LinphoneCall$State;

    if-eq v0, v2, :cond_2

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->CallUpdating:Lorg/linphone/core/LinphoneCall$State;

    if-eq v0, v2, :cond_2

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->CallUpdatedByRemote:Lorg/linphone/core/LinphoneCall$State;

    if-eq v0, v2, :cond_2

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    if-eq v0, v2, :cond_2

    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->Resuming:Lorg/linphone/core/LinphoneCall$State;

    if-ne v0, v2, :cond_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private static isConnectionFast(II)Z
    .locals 2
    .param p0, "type"    # I
    .param p1, "subType"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 299
    if-ne p0, v0, :cond_0

    .line 338
    :goto_0
    :pswitch_0
    return v0

    .line 301
    :cond_0
    if-nez p0, :cond_1

    .line 302
    packed-switch p1, :pswitch_data_0

    move v0, v1

    .line 335
    goto :goto_0

    :pswitch_1
    move v0, v1

    .line 304
    goto :goto_0

    :pswitch_2
    move v0, v1

    .line 306
    goto :goto_0

    :pswitch_3
    move v0, v1

    .line 308
    goto :goto_0

    :pswitch_4
    move v0, v1

    .line 310
    goto :goto_0

    :pswitch_5
    move v0, v1

    .line 312
    goto :goto_0

    :cond_1
    move v0, v1

    .line 338
    goto :goto_0

    .line 302
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_5
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static isHightBandwidthConnection(Landroid/content/Context;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 293
    const-string/jumbo v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 294
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 295
    .local v1, "info":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v3

    invoke-static {v2, v3}, Lorg/linphone/LinphoneUtils;->isConnectionFast(II)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static isSipAddress(Ljava/lang/String;)Z
    .locals 2
    .param p0, "numberOrAddress"    # Ljava/lang/String;

    .prologue
    .line 72
    :try_start_0
    invoke-static {}, Lorg/linphone/core/LinphoneCoreFactory;->instance()Lorg/linphone/core/LinphoneCoreFactory;

    move-result-object v1

    invoke-virtual {v1, p0}, Lorg/linphone/core/LinphoneCoreFactory;->createLinphoneAddress(Ljava/lang/String;)Lorg/linphone/core/LinphoneAddress;
    :try_end_0
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    const/4 v1, 0x1

    .line 75
    :goto_0
    return v1

    .line 74
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Lorg/linphone/core/LinphoneCoreException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isStrictSipAddress(Ljava/lang/String;)Z
    .locals 1
    .param p0, "numberOrAddress"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-static {p0}, Lorg/linphone/LinphoneUtils;->isSipAddress(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "sip:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static onKeyBackGoHome(Landroid/app/Activity;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 94
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-eqz v0, :cond_1

    .line 95
    :cond_0
    const/4 v0, 0x0

    .line 101
    :goto_0
    return v0

    .line 98
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v1, "android.intent.action.MAIN"

    .line 99
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.intent.category.HOME"

    .line 100
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 98
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 101
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static pixelsToDpi(Landroid/content/res/Resources;I)I
    .locals 3
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "pixels"    # I

    .prologue
    .line 249
    const/4 v0, 0x1

    int-to-float v1, p1

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public static setImagePictureFromUri(Landroid/content/Context;Landroid/widget/ImageView;Landroid/net/Uri;I)V
    .locals 4
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "view"    # Landroid/widget/ImageView;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "notFoundResource"    # I

    .prologue
    .line 154
    if-nez p2, :cond_0

    .line 155
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 171
    :goto_0
    return-void

    .line 158
    :cond_0
    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "http"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 159
    invoke-static {p2}, Lorg/linphone/LinphoneUtils;->downloadBitmap(Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 160
    .local v1, "bm":Landroid/graphics/Bitmap;
    if-nez v1, :cond_1

    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 161
    :cond_1
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 163
    .end local v1    # "bm":Landroid/graphics/Bitmap;
    :cond_2
    const/4 v2, 0x6

    invoke-static {v2}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 164
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    goto :goto_0

    .line 167
    :cond_3
    const/4 v2, 0x0

    invoke-static {p0, p2, p3, v2}, Landroid/provider/Contacts$People;->loadContactPhoto(Landroid/content/Context;Landroid/net/Uri;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 168
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method public static setVisibility(Landroid/view/View;IZ)V
    .locals 2
    .param p0, "v"    # Landroid/view/View;
    .param p1, "id"    # I
    .param p2, "visible"    # Z

    .prologue
    .line 237
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz p2, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 238
    return-void

    .line 237
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public static setVisibility(Landroid/view/View;Z)V
    .locals 1
    .param p0, "v"    # Landroid/view/View;
    .param p1, "visible"    # Z

    .prologue
    .line 240
    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 241
    return-void

    .line 240
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method
