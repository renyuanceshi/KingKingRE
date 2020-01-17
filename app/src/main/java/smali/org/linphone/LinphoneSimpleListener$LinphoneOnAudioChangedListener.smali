.class public interface abstract Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;
.super Ljava/lang/Object;
.source "LinphoneSimpleListener.java"

# interfaces
.implements Lorg/linphone/LinphoneSimpleListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/LinphoneSimpleListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "LinphoneOnAudioChangedListener"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;
    }
.end annotation


# virtual methods
.method public abstract onAudioStateChanged(Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;)V
.end method
