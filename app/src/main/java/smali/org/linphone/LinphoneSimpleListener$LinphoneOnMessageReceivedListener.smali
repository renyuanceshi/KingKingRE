.class public interface abstract Lorg/linphone/LinphoneSimpleListener$LinphoneOnMessageReceivedListener;
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
    name = "LinphoneOnMessageReceivedListener"
.end annotation


# virtual methods
.method public abstract onMessageReceived(Lorg/linphone/core/LinphoneAddress;Lorg/linphone/core/LinphoneChatMessage;I)V
.end method
