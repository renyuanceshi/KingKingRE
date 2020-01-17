.class public Lorg/linphone/core/LinphoneAccountCreatorImpl;
.super Ljava/lang/Object;
.source "LinphoneAccountCreatorImpl.java"

# interfaces
.implements Lorg/linphone/core/LinphoneAccountCreator;


# instance fields
.field protected nativePtr:J


# direct methods
.method protected constructor <init>(J)V
    .locals 1
    .param p1, "aNativePtr"    # J

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-wide p1, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    .line 25
    return-void
.end method

.method public constructor <init>(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 2
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    check-cast p1, Lorg/linphone/core/LinphoneCoreImpl;

    .end local p1    # "lc":Lorg/linphone/core/LinphoneCore;
    iget-wide v0, p1, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p2}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->newLinphoneAccountCreator(JLjava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    .line 30
    return-void
.end method

.method private native activateAccount(J)I
.end method

.method private native activatePhoneNumberLink(J)I
.end method

.method private native configure(J)Lorg/linphone/core/LinphoneProxyConfig;
.end method

.method private native createAccount(J)I
.end method

.method private native getDisplayName(J)Ljava/lang/String;
.end method

.method private native getDomain(J)Ljava/lang/String;
.end method

.method private native getEmail(J)Ljava/lang/String;
.end method

.method private native getHa1(J)Ljava/lang/String;
.end method

.method private native getPassword(J)Ljava/lang/String;
.end method

.method private native getPhoneNumber(J)Ljava/lang/String;
.end method

.method private native getPrefix(JLjava/lang/String;)Ljava/lang/String;
.end method

.method private native getUsername(J)Ljava/lang/String;
.end method

.method private native isAccountActivated(J)I
.end method

.method private native isAccountLinked(J)I
.end method

.method private native isAccountUsed(J)I
.end method

.method private native isPhoneNumberUsed(J)I
.end method

.method private native linkPhoneNumberWithAccount(J)I
.end method

.method private native newLinphoneAccountCreator(JLjava/lang/String;)J
.end method

.method private native recoverPhoneAccount(J)I
.end method

.method private native setActivationCode(JLjava/lang/String;)I
.end method

.method private native setDisplayName(JLjava/lang/String;)I
.end method

.method private native setDomain(JLjava/lang/String;)I
.end method

.method private native setEmail(JLjava/lang/String;)I
.end method

.method private native setHa1(JLjava/lang/String;)I
.end method

.method private native setLanguage(JLjava/lang/String;)I
.end method

.method private native setListener(JLorg/linphone/core/LinphoneAccountCreator$LinphoneAccountCreatorListener;)V
.end method

.method private native setPassword(JLjava/lang/String;)I
.end method

.method private native setPhoneNumber(JLjava/lang/String;Ljava/lang/String;)I
.end method

.method private native setUsername(JLjava/lang/String;)I
.end method

.method private native unref(J)V
.end method

.method private native updatePassword(JLjava/lang/String;)I
.end method


# virtual methods
.method public activateAccount()Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;
    .locals 2

    .prologue
    .line 170
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->activateAccount(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;

    move-result-object v0

    return-object v0
.end method

.method public activatePhoneNumberLink()Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;
    .locals 2

    .prologue
    .line 200
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->activatePhoneNumberLink(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;

    move-result-object v0

    return-object v0
.end method

.method public configure()Lorg/linphone/core/LinphoneProxyConfig;
    .locals 2

    .prologue
    .line 152
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->configure(J)Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v0

    return-object v0
.end method

.method public createAccount()Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;
    .locals 2

    .prologue
    .line 164
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->createAccount(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;

    move-result-object v0

    return-object v0
.end method

.method protected finalize()V
    .locals 4

    .prologue
    .line 38
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->unref(J)V

    .line 39
    :cond_0
    return-void
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 116
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->getDisplayName(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 2

    .prologue
    .line 146
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->getDomain(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 2

    .prologue
    .line 128
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->getEmail(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHa1()Ljava/lang/String;
    .locals 2

    .prologue
    .line 92
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->getHa1(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNativePtr()J
    .locals 2

    .prologue
    .line 33
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    return-wide v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 2

    .prologue
    .line 80
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->getPassword(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPhoneNumber()Ljava/lang/String;
    .locals 2

    .prologue
    .line 68
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->getPhoneNumber(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "phone"    # Ljava/lang/String;

    .prologue
    .line 134
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->getPrefix(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 2

    .prologue
    .line 56
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->getUsername(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isAccountActivated()Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;
    .locals 2

    .prologue
    .line 188
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->isAccountActivated(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;

    move-result-object v0

    return-object v0
.end method

.method public isAccountLinked()Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;
    .locals 2

    .prologue
    .line 176
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->isAccountLinked(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;

    move-result-object v0

    return-object v0
.end method

.method public isAccountUsed()Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;
    .locals 2

    .prologue
    .line 158
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->isAccountUsed(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;

    move-result-object v0

    return-object v0
.end method

.method public isPhoneNumberUsed()Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;
    .locals 2

    .prologue
    .line 182
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->isPhoneNumberUsed(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;

    move-result-object v0

    return-object v0
.end method

.method public linkPhoneNumberWithAccount()Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;
    .locals 2

    .prologue
    .line 194
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->linkPhoneNumberWithAccount(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;

    move-result-object v0

    return-object v0
.end method

.method public recoverPhoneAccount()Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;
    .locals 2

    .prologue
    .line 206
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->recoverPhoneAccount(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;

    move-result-object v0

    return-object v0
.end method

.method public setActivationCode(Ljava/lang/String;)Lorg/linphone/core/LinphoneAccountCreator$ActivationCodeCheck;
    .locals 2
    .param p1, "activationCode"    # Ljava/lang/String;

    .prologue
    .line 98
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->setActivationCode(JLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$ActivationCodeCheck;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$ActivationCodeCheck;

    move-result-object v0

    return-object v0
.end method

.method public setDisplayName(Ljava/lang/String;)Lorg/linphone/core/LinphoneAccountCreator$UsernameCheck;
    .locals 2
    .param p1, "displayName"    # Ljava/lang/String;

    .prologue
    .line 110
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->setDisplayName(JLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$UsernameCheck;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$UsernameCheck;

    move-result-object v0

    return-object v0
.end method

.method public setDomain(Ljava/lang/String;)Lorg/linphone/core/LinphoneAccountCreator$DomainCheck;
    .locals 2
    .param p1, "domain"    # Ljava/lang/String;

    .prologue
    .line 140
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->setDomain(JLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$DomainCheck;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$DomainCheck;

    move-result-object v0

    return-object v0
.end method

.method public setEmail(Ljava/lang/String;)Lorg/linphone/core/LinphoneAccountCreator$EmailCheck;
    .locals 2
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 122
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->setEmail(JLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$EmailCheck;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$EmailCheck;

    move-result-object v0

    return-object v0
.end method

.method public setHa1(Ljava/lang/String;)Lorg/linphone/core/LinphoneAccountCreator$PasswordCheck;
    .locals 2
    .param p1, "ha1"    # Ljava/lang/String;

    .prologue
    .line 86
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->setHa1(JLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$PasswordCheck;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$PasswordCheck;

    move-result-object v0

    return-object v0
.end method

.method public setLanguage(Ljava/lang/String;)Lorg/linphone/core/LinphoneAccountCreator$LanguageCheck;
    .locals 2
    .param p1, "lang"    # Ljava/lang/String;

    .prologue
    .line 104
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->setLanguage(JLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$LanguageCheck;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$LanguageCheck;

    move-result-object v0

    return-object v0
.end method

.method public setListener(Lorg/linphone/core/LinphoneAccountCreator$LinphoneAccountCreatorListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/linphone/core/LinphoneAccountCreator$LinphoneAccountCreatorListener;

    .prologue
    .line 44
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->setListener(JLorg/linphone/core/LinphoneAccountCreator$LinphoneAccountCreatorListener;)V

    .line 45
    return-void
.end method

.method public setPassword(Ljava/lang/String;)Lorg/linphone/core/LinphoneAccountCreator$PasswordCheck;
    .locals 2
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 74
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->setPassword(JLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$PasswordCheck;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$PasswordCheck;

    move-result-object v0

    return-object v0
.end method

.method public setPhoneNumber(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p1, "phoneNumber"    # Ljava/lang/String;
    .param p2, "countryCode"    # Ljava/lang/String;

    .prologue
    .line 62
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->setPhoneNumber(JLjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public setUsername(Ljava/lang/String;)Lorg/linphone/core/LinphoneAccountCreator$UsernameCheck;
    .locals 2
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 50
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->setUsername(JLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$UsernameCheck;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$UsernameCheck;

    move-result-object v0

    return-object v0
.end method

.method public updatePassword(Ljava/lang/String;)Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;
    .locals 2
    .param p1, "newPassword"    # Ljava/lang/String;

    .prologue
    .line 212
    iget-wide v0, p0, Lorg/linphone/core/LinphoneAccountCreatorImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneAccountCreatorImpl;->updatePassword(JLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;->fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$RequestStatus;

    move-result-object v0

    return-object v0
.end method
