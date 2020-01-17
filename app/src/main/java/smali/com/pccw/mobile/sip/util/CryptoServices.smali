.class public Lcom/pccw/mobile/sip/util/CryptoServices;
.super Ljava/lang/Object;
.source "CryptoServices.java"


# static fields
.field public static final ENCRYPTION_KEY:Ljava/lang/String; = "77874a39558e0c4e2cc7137da464eca4"

.field private static final FACEBOOK_LINK_ENCRYPTION_KEY:Ljava/lang/String; = "832a89d9687e86788c8687b7897d7997"

.field public static final GET_CALLEE_STATUS_ENCRYPTION_KEY:Ljava/lang/String; = "3c4549745a47335e2756593746394065"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static aesDecryptByCalleeStatusKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 27
    const-string/jumbo v0, "3c4549745a47335e2756593746394065"

    invoke-static {v0, p0}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static aesDecryptByFacebookShareKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "encryptString"    # Ljava/lang/String;

    .prologue
    .line 94
    const-string/jumbo v0, "832a89d9687e86788c8687b7897d7997"

    invoke-static {v0, p0}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesDecryptByMasterKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static aesDecryptByFacebookShareKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "keys"    # Ljava/lang/String;
    .param p1, "encryptString"    # Ljava/lang/String;

    .prologue
    .line 100
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 101
    .local v2, "keyString":Ljava/lang/String;
    invoke-static {v2}, Lcom/pccw/mobile/sip/util/CryptoServices;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v1

    .line 102
    .local v1, "key":[B
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string/jumbo v4, "AES"

    invoke-direct {v3, v1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 103
    .local v3, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const/4 v0, 0x0

    .line 105
    .local v0, "aesDecryptKey":Ljava/lang/String;
    :try_start_0
    invoke-static {p1, v3}, Lcom/pccw/mobile/sip/util/CryptoServices;->decrypt(Ljava/lang/String;Ljavax/crypto/spec/SecretKeySpec;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 113
    :goto_0
    return-object v0

    .line 108
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public static aesDecryptByMasterKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "encryptString"    # Ljava/lang/String;

    .prologue
    .line 48
    const-string/jumbo v0, "77874a39558e0c4e2cc7137da464eca4"

    invoke-static {v0, p0}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesDecryptByMasterKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static aesDecryptByMasterKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "keys"    # Ljava/lang/String;
    .param p1, "encryptString"    # Ljava/lang/String;

    .prologue
    .line 54
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 55
    .local v2, "keyString":Ljava/lang/String;
    invoke-static {v2}, Lcom/pccw/mobile/sip/util/CryptoServices;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v1

    .line 56
    .local v1, "key":[B
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string/jumbo v4, "AES"

    invoke-direct {v3, v1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 57
    .local v3, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const/4 v0, 0x0

    .line 59
    .local v0, "aesDecryptKey":Ljava/lang/String;
    :try_start_0
    invoke-static {p1, v3}, Lcom/pccw/mobile/sip/util/CryptoServices;->decrypt(Ljava/lang/String;Ljavax/crypto/spec/SecretKeySpec;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 67
    :goto_0
    return-object v0

    .line 62
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public static aesEncryptedByFacebookShareKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 71
    const-string/jumbo v0, "832a89d9687e86788c8687b7897d7997"

    invoke-static {v0, p0}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static aesEncryptedByFacebookShareKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "keys"    # Ljava/lang/String;
    .param p1, "encryptString"    # Ljava/lang/String;

    .prologue
    .line 77
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 78
    .local v2, "keyString":Ljava/lang/String;
    invoke-static {v2}, Lcom/pccw/mobile/sip/util/CryptoServices;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v1

    .line 79
    .local v1, "key":[B
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string/jumbo v4, "AES"

    invoke-direct {v3, v1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 80
    .local v3, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const/4 v0, 0x0

    .line 82
    .local v0, "aesDecryptKey":Ljava/lang/String;
    :try_start_0
    invoke-static {p1, v3}, Lcom/pccw/mobile/sip/util/CryptoServices;->decrypt(Ljava/lang/String;Ljavax/crypto/spec/SecretKeySpec;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 90
    :goto_0
    return-object v0

    .line 85
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public static aesEncryptedByMasterKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 23
    const-string/jumbo v0, "77874a39558e0c4e2cc7137da464eca4"

    invoke-static {v0, p0}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static aesEncryptedByMasterKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "keys"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 31
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 32
    .local v2, "keyString":Ljava/lang/String;
    invoke-static {v2}, Lcom/pccw/mobile/sip/util/CryptoServices;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v1

    .line 33
    .local v1, "key":[B
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string/jumbo v4, "AES"

    invoke-direct {v3, v1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 34
    .local v3, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const/4 v0, 0x0

    .line 36
    .local v0, "encrypted":Ljava/lang/String;
    :try_start_0
    invoke-static {p1, v3}, Lcom/pccw/mobile/sip/util/CryptoServices;->encrypt(Ljava/lang/String;Ljavax/crypto/spec/SecretKeySpec;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 44
    :goto_0
    return-object v0

    .line 39
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private static asHexString([B)Ljava/lang/String;
    .locals 5
    .param p0, "buf"    # [B

    .prologue
    const/16 v4, 0x10

    .line 123
    new-instance v1, Ljava/lang/StringBuffer;

    array-length v2, p0

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 126
    .local v1, "strbuf":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 127
    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    if-ge v2, v4, :cond_0

    .line 128
    const-string/jumbo v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 130
    :cond_0
    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    int-to-long v2, v2

    invoke-static {v2, v3, v4}, Ljava/lang/Long;->toString(JI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 126
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 133
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static decrypt(Ljava/lang/String;Ljavax/crypto/spec/SecretKeySpec;)Ljava/lang/String;
    .locals 4
    .param p0, "encryptedMessage"    # Ljava/lang/String;
    .param p1, "skeySpec"    # Ljavax/crypto/spec/SecretKeySpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljavax/crypto/NoSuchPaddingException;,
            Ljava/security/InvalidKeyException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 151
    const-string/jumbo v3, "AES"

    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 152
    .local v0, "cipher1":Ljavax/crypto/Cipher;
    const/4 v3, 0x2

    invoke-virtual {v0, v3, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 153
    invoke-static {p0}, Lcom/pccw/mobile/sip/util/CryptoServices;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v0, v3}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 154
    .local v1, "original":[B
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([B)V

    .line 155
    .local v2, "originalString":Ljava/lang/String;
    return-object v2
.end method

.method private static encrypt(Ljava/lang/String;Ljavax/crypto/spec/SecretKeySpec;)Ljava/lang/String;
    .locals 3
    .param p0, "messageToEncrypt"    # Ljava/lang/String;
    .param p1, "skeySpec"    # Ljavax/crypto/spec/SecretKeySpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljavax/crypto/NoSuchPaddingException;,
            Ljava/security/InvalidKeyException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 161
    const-string/jumbo v2, "AES"

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 162
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v2, 0x1

    invoke-virtual {v0, v2, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 163
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 164
    .local v1, "encrypted":[B
    invoke-static {v1}, Lcom/pccw/mobile/sip/util/CryptoServices;->asHexString([B)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static hexStringToByteArray(Ljava/lang/String;)[B
    .locals 7
    .param p0, "hexString"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x10

    .line 138
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 139
    .local v2, "len":I
    div-int/lit8 v3, v2, 0x2

    new-array v0, v3, [B

    .line 140
    .local v0, "data":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 141
    div-int/lit8 v3, v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    add-int/lit8 v5, v1, 0x1

    .line 142
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 141
    invoke-static {v5, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    add-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    .line 140
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 144
    :cond_0
    return-object v0
.end method
