.class public interface abstract Lorg/linphone/LinphoneSimpleListener$LinphoneServiceListener;
.super Ljava/lang/Object;
.source "LinphoneSimpleListener.java"

# interfaces
.implements Lorg/linphone/LinphoneSimpleListener$LinphoneOnGlobalStateChangedListener;
.implements Lorg/linphone/LinphoneSimpleListener$LinphoneOnCallStateChangedListener;
.implements Lorg/linphone/LinphoneSimpleListener$LinphoneOnCallEncryptionChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/LinphoneSimpleListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "LinphoneServiceListener"
.end annotation


# virtual methods
.method public abstract onDisplayStatus(Ljava/lang/String;)V
.end method

.method public abstract onRegistrationStateChanged(Lorg/linphone/core/LinphoneCore$RegistrationState;Ljava/lang/String;)V
.end method

.method public abstract onRingerPlayerCreated(Landroid/media/MediaPlayer;)V
.end method

.method public abstract tryingNewOutgoingCallButAlreadyInCall()V
.end method

.method public abstract tryingNewOutgoingCallButCannotGetCallParameters()V
.end method

.method public abstract tryingNewOutgoingCallButWrongDestinationAddress()V
.end method
