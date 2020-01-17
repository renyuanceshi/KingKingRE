.class public interface abstract Lorg/linphone/LinphoneSimpleListener$LinphoneOnCallStateChangedListener;
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
    name = "LinphoneOnCallStateChangedListener"
.end annotation


# virtual methods
.method public abstract onCallStateChanged(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
.end method
