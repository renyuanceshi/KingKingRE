.class public Lorg/linphone/core/tools/AndroidPlatformHelper;
.super Ljava/lang/Object;
.source "AndroidPlatformHelper.java"


# instance fields
.field private mConnectivityManager:Landroid/net/ConnectivityManager;

.field private mContext:Landroid/content/Context;

.field private mErrorToneFile:Ljava/lang/String;

.field private mGrammarCpimFile:Ljava/lang/String;

.field private mGrammarVcardFile:Ljava/lang/String;

.field private mLinphoneRootCaFile:Ljava/lang/String;

.field private mMcastLock:Landroid/net/wifi/WifiManager$MulticastLock;

.field private mPauseSoundFile:Ljava/lang/String;

.field private mPowerManager:Landroid/os/PowerManager;

.field private mResources:Landroid/content/res/Resources;

.field private mRingSoundFile:Ljava/lang/String;

.field private mRingbackSoundFile:Ljava/lang/String;

.field private mUserCertificatePath:Ljava/lang/String;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 6
    .param p1, "ctx_obj"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    check-cast p1, Landroid/content/Context;

    .end local p1    # "ctx_obj":Ljava/lang/Object;
    iput-object p1, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    .line 71
    iget-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mResources:Landroid/content/res/Resources;

    .line 72
    iget-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->setContext(Ljava/lang/Object;)V

    .line 74
    iget-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "wifi"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    .line 75
    .local v2, "wifiMgr":Landroid/net/wifi/WifiManager;
    iget-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "power"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mPowerManager:Landroid/os/PowerManager;

    .line 76
    iget-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "connectivity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/ConnectivityManager;

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mConnectivityManager:Landroid/net/ConnectivityManager;

    .line 78
    iget-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mPowerManager:Landroid/os/PowerManager;

    const-string/jumbo v4, "AndroidPlatformHelper"

    invoke-virtual {v3, v5, v4}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 79
    iget-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3, v5}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 80
    const-string/jumbo v3, "AndroidPlatformHelper"

    invoke-virtual {v2, v3}, Landroid/net/wifi/WifiManager;->createMulticastLock(Ljava/lang/String;)Landroid/net/wifi/WifiManager$MulticastLock;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mMcastLock:Landroid/net/wifi/WifiManager$MulticastLock;

    .line 81
    iget-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mMcastLock:Landroid/net/wifi/WifiManager$MulticastLock;

    invoke-virtual {v3, v5}, Landroid/net/wifi/WifiManager$MulticastLock;->setReferenceCounted(Z)V

    .line 82
    const/4 v3, 0x3

    const-string/jumbo v4, "AndroidPlatformHelper"

    invoke-virtual {v2, v3, v4}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 83
    iget-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v3, v5}, Landroid/net/wifi/WifiManager$WifiLock;->setReferenceCounted(Z)V

    .line 85
    iget-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "basePath":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/share/linphone/rootca.pem"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mLinphoneRootCaFile:Ljava/lang/String;

    .line 88
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/share/sounds/linphone/rings/notes_of_the_optimistic.mkv"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mRingSoundFile:Ljava/lang/String;

    .line 89
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/share/sounds/linphone/ringback.wav"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mRingbackSoundFile:Ljava/lang/String;

    .line 90
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/share/sounds/linphone/rings/dont_wait_too_long.mkv"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mPauseSoundFile:Ljava/lang/String;

    .line 91
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/share/sounds/linphone/incoming_chat.wav"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mErrorToneFile:Ljava/lang/String;

    .line 92
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/share/belr/grammars/cpim_grammar"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mGrammarCpimFile:Ljava/lang/String;

    .line 93
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/share/belr/grammars/vcard_grammar"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mGrammarVcardFile:Ljava/lang/String;

    .line 94
    iput-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mUserCertificatePath:Ljava/lang/String;

    .line 97
    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyAssetsFromPackage()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    :goto_0
    return-void

    .line 98
    :catch_0
    move-exception v1

    .line 99
    .local v1, "e":Ljava/io/IOException;
    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "AndroidPlatformHelper(): failed to install some resources."

    aput-object v5, v3, v4

    invoke-static {v3}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private copyAssetsFromPackage()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 189
    new-array v0, v4, [Ljava/lang/Object;

    const-string/jumbo v1, "Starting copy from assets to application files directory"

    aput-object v1, v0, v3

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 190
    iget-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "org.linphone.core"

    const-string/jumbo v2, "."

    invoke-static {v0, v1, v2}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyAssetsFromPackage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    new-array v0, v4, [Ljava/lang/Object;

    const-string/jumbo v1, "Copy from assets done"

    aput-object v1, v0, v3

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 192
    new-array v0, v4, [Ljava/lang/Object;

    const-string/jumbo v1, "Starting copy from legacy  resources to application files directory"

    aput-object v1, v0, v3

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 194
    const-string/jumbo v0, "cpim_grammar"

    invoke-direct {p0, v0}, Lorg/linphone/core/tools/AndroidPlatformHelper;->getResourceIdentifierFromName(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mGrammarCpimFile:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyEvenIfExists(ILjava/lang/String;)V

    .line 195
    const-string/jumbo v0, "vcard_grammar"

    invoke-direct {p0, v0}, Lorg/linphone/core/tools/AndroidPlatformHelper;->getResourceIdentifierFromName(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mGrammarVcardFile:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyEvenIfExists(ILjava/lang/String;)V

    .line 196
    const-string/jumbo v0, "rootca"

    invoke-direct {p0, v0}, Lorg/linphone/core/tools/AndroidPlatformHelper;->getResourceIdentifierFromName(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mLinphoneRootCaFile:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyEvenIfExists(ILjava/lang/String;)V

    .line 197
    const-string/jumbo v0, "notes_of_the_optimistic"

    invoke-direct {p0, v0}, Lorg/linphone/core/tools/AndroidPlatformHelper;->getResourceIdentifierFromName(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mRingSoundFile:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyEvenIfExists(ILjava/lang/String;)V

    .line 198
    const-string/jumbo v0, "ringback"

    invoke-direct {p0, v0}, Lorg/linphone/core/tools/AndroidPlatformHelper;->getResourceIdentifierFromName(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mRingbackSoundFile:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyEvenIfExists(ILjava/lang/String;)V

    .line 199
    const-string/jumbo v0, "hold"

    invoke-direct {p0, v0}, Lorg/linphone/core/tools/AndroidPlatformHelper;->getResourceIdentifierFromName(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mPauseSoundFile:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyEvenIfExists(ILjava/lang/String;)V

    .line 200
    const-string/jumbo v0, "incoming_chat"

    invoke-direct {p0, v0}, Lorg/linphone/core/tools/AndroidPlatformHelper;->getResourceIdentifierFromName(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mErrorToneFile:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyEvenIfExists(ILjava/lang/String;)V

    .line 201
    new-array v0, v4, [Ljava/lang/Object;

    const-string/jumbo v1, "Copy from legacy resources done"

    aput-object v1, v0, v3

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 202
    return-void
.end method

.method public static copyAssetsFromPackage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 15
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "fromPath"    # Ljava/lang/String;
    .param p2, "toPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 237
    new-instance v9, Ljava/io/File;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p2

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->mkdir()Z

    .line 239
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    array-length v11, v10

    const/4 v9, 0x0

    :goto_0
    if-ge v9, v11, :cond_1

    aget-object v5, v10, v9

    .line 240
    .local v5, "f":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 241
    .local v3, "current_name":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 244
    .local v2, "current_dest":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v12

    invoke-virtual {v12, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 250
    .local v6, "lInputStream":Ljava/io/InputStream;
    new-instance v7, Ljava/io/FileOutputStream;

    new-instance v12, Ljava/io/File;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v14

    invoke-virtual {v14}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v7, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 254
    .local v7, "lOutputStream":Ljava/io/FileOutputStream;
    const/16 v12, 0x1f70

    new-array v1, v12, [B

    .line 255
    .local v1, "buff":[B
    :goto_1
    invoke-virtual {v6, v1}, Ljava/io/InputStream;->read([B)I

    move-result v8

    .local v8, "readByte":I
    const/4 v12, -0x1

    if-eq v8, v12, :cond_0

    .line 256
    const/4 v12, 0x0

    invoke-virtual {v7, v1, v12, v8}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_1

    .line 245
    .end local v1    # "buff":[B
    .end local v6    # "lInputStream":Ljava/io/InputStream;
    .end local v7    # "lOutputStream":Ljava/io/FileOutputStream;
    .end local v8    # "readByte":I
    :catch_0
    move-exception v4

    .line 247
    .local v4, "e":Ljava/io/IOException;
    invoke-static {p0, v3, v2}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyAssetsFromPackage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    .end local v4    # "e":Ljava/io/IOException;
    :goto_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 258
    .restart local v1    # "buff":[B
    .restart local v6    # "lInputStream":Ljava/io/InputStream;
    .restart local v7    # "lOutputStream":Ljava/io/FileOutputStream;
    .restart local v8    # "readByte":I
    :cond_0
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->flush()V

    .line 259
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 260
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    goto :goto_2

    .line 262
    .end local v1    # "buff":[B
    .end local v2    # "current_dest":Ljava/lang/String;
    .end local v3    # "current_name":Ljava/lang/String;
    .end local v5    # "f":Ljava/lang/String;
    .end local v6    # "lInputStream":Ljava/io/InputStream;
    .end local v7    # "lOutputStream":Ljava/io/FileOutputStream;
    .end local v8    # "readByte":I
    :cond_1
    return-void
.end method

.method private getResourceIdentifierFromName(Ljava/lang/String;)I
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 177
    iget-object v1, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mResources:Landroid/content/res/Resources;

    const-string/jumbo v2, "raw"

    iget-object v3, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 178
    .local v0, "resId":I
    if-nez v0, :cond_0

    .line 179
    new-array v1, v5, [Ljava/lang/Object;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "App doesn\'t seem to embed resource "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "in it\'s res/raw/ directory, use linphone\'s instead"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 180
    iget-object v1, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mResources:Landroid/content/res/Resources;

    const-string/jumbo v2, "raw"

    const-string/jumbo v3, "org.linphone"

    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 181
    if-nez v0, :cond_0

    .line 182
    new-array v1, v5, [Ljava/lang/Object;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "App doesn\'t seem to embed resource "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "in it\'s res/raw/ directory. Make sure this file is either brought as an asset or a resource"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 185
    :cond_0
    return v0
.end method


# virtual methods
.method public acquireCpuLock()V
    .locals 3

    .prologue
    .line 167
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "acquireCpuLock()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 168
    iget-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 169
    return-void
.end method

.method public acquireMcastLock()V
    .locals 3

    .prologue
    .line 157
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "acquireMcastLock()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 158
    iget-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mMcastLock:Landroid/net/wifi/WifiManager$MulticastLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$MulticastLock;->acquire()V

    .line 159
    return-void
.end method

.method public acquireWifiLock()V
    .locals 3

    .prologue
    .line 147
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "acquireWifiLock()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 148
    iget-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    .line 149
    return-void
.end method

.method public copyEvenIfExists(ILjava/lang/String;)V
    .locals 1
    .param p1, "ressourceId"    # I
    .param p2, "target"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 206
    .local v0, "lFileToCopy":Ljava/io/File;
    invoke-virtual {p0, p1, v0}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyFromPackage(ILjava/io/File;)V

    .line 207
    return-void
.end method

.method public copyFromPackage(ILjava/io/File;)V
    .locals 8
    .param p1, "ressourceId"    # I
    .param p2, "target"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 217
    if-nez p1, :cond_0

    .line 218
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Resource identifier null for target ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 234
    :goto_0
    return-void

    .line 221
    :cond_0
    invoke-virtual {p2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    .line 222
    invoke-virtual {p2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 224
    :cond_1
    iget-object v4, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1

    .line 225
    .local v1, "lInputStream":Ljava/io/InputStream;
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 227
    .local v2, "lOutputStream":Ljava/io/FileOutputStream;
    const/16 v4, 0x1f70

    new-array v0, v4, [B

    .line 228
    .local v0, "buff":[B
    :goto_1
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "readByte":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_2

    .line 229
    invoke-virtual {v2, v0, v7, v3}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_1

    .line 231
    :cond_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 232
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 233
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    goto :goto_0
.end method

.method public copyIfNotExist(ILjava/lang/String;)V
    .locals 2
    .param p1, "ressourceId"    # I
    .param p2, "target"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 210
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 211
    .local v0, "lFileToCopy":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 212
    invoke-virtual {p0, p1, v0}, Lorg/linphone/core/tools/AndroidPlatformHelper;->copyFromPackage(ILjava/io/File;)V

    .line 214
    :cond_0
    return-void
.end method

.method public getCachePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConfigPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDataPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDnsServers()[Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 109
    iget-object v5, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mConnectivityManager:Landroid/net/ConnectivityManager;

    if-eqz v5, :cond_0

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x17

    if-ge v5, v6, :cond_1

    .line 126
    :cond_0
    :goto_0
    return-object v4

    .line 112
    :cond_1
    iget-object v5, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v5}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mConnectivityManager:Landroid/net/ConnectivityManager;

    iget-object v6, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mConnectivityManager:Landroid/net/ConnectivityManager;

    .line 113
    invoke-virtual {v6}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 116
    const/4 v1, 0x0

    .line 117
    .local v1, "i":I
    const/4 v3, 0x0

    .line 118
    .local v3, "inetServers":Ljava/util/List;, "Ljava/util/List<Ljava/net/InetAddress;>;"
    iget-object v5, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mConnectivityManager:Landroid/net/ConnectivityManager;

    iget-object v6, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v6}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/LinkProperties;->getDnsServers()Ljava/util/List;

    move-result-object v3

    .line 120
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    new-array v4, v5, [Ljava/lang/String;

    .line 122
    .local v4, "servers":[Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    .line 123
    .local v0, "address":Ljava/net/InetAddress;
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v1

    move v1, v2

    .line 124
    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_1

    .line 125
    .end local v0    # "address":Ljava/net/InetAddress;
    :cond_2
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "getDnsServers() returning"

    aput-object v7, v5, v6

    invoke-static {v5}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public getNativeLibraryDir()Ljava/lang/String;
    .locals 2

    .prologue
    .line 142
    iget-object v1, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 143
    .local v0, "info":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    return-object v1
.end method

.method public getPowerManager()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mPowerManager:Landroid/os/PowerManager;

    return-object v0
.end method

.method public releaseCpuLock()V
    .locals 3

    .prologue
    .line 172
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "releaseCpuLock()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 173
    iget-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 174
    return-void
.end method

.method public releaseMcastLock()V
    .locals 3

    .prologue
    .line 162
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "releaseMcastLock()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 163
    iget-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mMcastLock:Landroid/net/wifi/WifiManager$MulticastLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$MulticastLock;->release()V

    .line 164
    return-void
.end method

.method public releaseWifiLock()V
    .locals 3

    .prologue
    .line 152
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "releaseWifiLock()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 153
    iget-object v0, p0, Lorg/linphone/core/tools/AndroidPlatformHelper;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    .line 154
    return-void
.end method
