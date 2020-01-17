.class public interface abstract Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;
.super Ljava/lang/Object;
.source "MessageAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/adapter/MessageAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MessageAdapterActionResponse"
.end annotation


# virtual methods
.method public abstract onAdapterItemRefresh(I)V
.end method

.method public abstract onMessageItemClicked(Ljava/lang/String;Ljava/lang/String;I)V
.end method

.method public abstract onMessageItemClicked(Ljava/lang/String;Ljava/lang/String;ILandroid/widget/SeekBar;Landroid/widget/ImageView;)V
.end method

.method public abstract onMessageItemDeleted(I)V
.end method

.method public abstract onMessageResent(I)V
.end method
