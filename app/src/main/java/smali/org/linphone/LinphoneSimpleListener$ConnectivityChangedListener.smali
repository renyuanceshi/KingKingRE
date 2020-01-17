.class public interface abstract Lorg/linphone/LinphoneSimpleListener$ConnectivityChangedListener;
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
    name = "ConnectivityChangedListener"
.end annotation


# virtual methods
.method public abstract onConnectivityChanged(Landroid/content/Context;Landroid/net/NetworkInfo;Landroid/net/ConnectivityManager;)V
.end method
