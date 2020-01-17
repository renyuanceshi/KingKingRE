.class public Lcom/pccwmobile/common/utilities/CryptoUtilities;
.super Ljava/lang/Object;
.source "CryptoUtilities.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static tripleDesCbcNoPaddingEncryption(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11
    .param p0, "HexKeyStr"    # Ljava/lang/String;
    .param p1, "ivStr"    # Ljava/lang/String;
    .param p2, "plainTextStr"    # Ljava/lang/String;

    .prologue
    .line 24
    .line 25
    invoke-static {p0}, Lcom/pccwmobile/common/utilities/HexUtilities;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v2

    .line 26
    .local v2, "derivedKeyBytes":[B
    invoke-static {p1}, Lcom/pccwmobile/common/utilities/HexUtilities;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v5

    .line 28
    .local v5, "iv":[B
    invoke-static {p2}, Lcom/pccwmobile/common/utilities/HexUtilities;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v6

    .line 34
    .local v6, "plainText":[B
    :try_start_0
    const-string/jumbo v8, "DESede"

    invoke-static {v8}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v4

    .line 35
    .local v4, "factory":Ljavax/crypto/SecretKeyFactory;
    new-instance v8, Ljavax/crypto/spec/DESedeKeySpec;

    invoke-direct {v8, v2}, Ljavax/crypto/spec/DESedeKeySpec;-><init>([B)V

    invoke-virtual {v4, v8}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v1

    .line 38
    .local v1, "derivedKey":Ljavax/crypto/SecretKey;
    const-string/jumbo v8, "DESede/CBC/NoPadding"

    invoke-static {v8}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 40
    .local v0, "c":Ljavax/crypto/Cipher;
    const/4 v8, 0x1

    new-instance v9, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v9, v5}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v0, v8, v1, v9}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 42
    invoke-virtual {v0, v6}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v7

    .line 43
    .local v7, "result":[B
    const-string/jumbo v8, "testing"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "result="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 44
    invoke-static {v7}, Lcom/pccwmobile/common/utilities/HexUtilities;->byteArrayToHexString([B)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 43
    invoke-static {v8, v9}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .end local v0    # "c":Ljavax/crypto/Cipher;
    .end local v1    # "derivedKey":Ljavax/crypto/SecretKey;
    .end local v4    # "factory":Ljavax/crypto/SecretKeyFactory;
    .end local v7    # "result":[B
    :goto_0
    return-void

    .line 46
    :catch_0
    move-exception v3

    .line 48
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
