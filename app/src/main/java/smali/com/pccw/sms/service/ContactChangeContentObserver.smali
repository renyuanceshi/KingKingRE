.class public Lcom/pccw/sms/service/ContactChangeContentObserver;
.super Landroid/database/ContentObserver;
.source "ContactChangeContentObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;
    }
.end annotation


# static fields
.field static final LAST_CONTACT_HASH_CODE:Ljava/lang/String; = "LAST_CONTACT_HASH_CODE"

.field static contactChangeContentObserver:Lcom/pccw/sms/service/ContactChangeContentObserver;

.field static nextCallTime:J

.field static queueCount:I


# instance fields
.field final LOG_TAG:Ljava/lang/String;

.field context:Landroid/content/Context;

.field final thresholdTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 19
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/pccw/sms/service/ContactChangeContentObserver;->nextCallTime:J

    .line 27
    const/4 v0, 0x0

    sput v0, Lcom/pccw/sms/service/ContactChangeContentObserver;->queueCount:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 18
    const-string/jumbo v0, "ContactChangeContentObserver"

    iput-object v0, p0, Lcom/pccw/sms/service/ContactChangeContentObserver;->LOG_TAG:Ljava/lang/String;

    .line 20
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lcom/pccw/sms/service/ContactChangeContentObserver;->thresholdTime:J

    .line 40
    iput-object p1, p0, Lcom/pccw/sms/service/ContactChangeContentObserver;->context:Landroid/content/Context;

    .line 41
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/pccw/sms/service/ContactChangeContentObserver;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 30
    sget-object v0, Lcom/pccw/sms/service/ContactChangeContentObserver;->contactChangeContentObserver:Lcom/pccw/sms/service/ContactChangeContentObserver;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lcom/pccw/sms/service/ContactChangeContentObserver;

    invoke-direct {v0, p0}, Lcom/pccw/sms/service/ContactChangeContentObserver;-><init>(Landroid/content/Context;)V

    .line 33
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/pccw/sms/service/ContactChangeContentObserver;->contactChangeContentObserver:Lcom/pccw/sms/service/ContactChangeContentObserver;

    goto :goto_0
.end method

.method public static getLastContactHashCode(Landroid/content/Context;)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 182
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "LAST_CONTACT_HASH_CODE"

    const/4 v2, -0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static setLastContactHashCode(ILandroid/content/Context;)V
    .locals 3
    .param p0, "hashCode"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 186
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 187
    .local v0, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "LAST_CONTACT_HASH_CODE"

    invoke-interface {v1, v2, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 188
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 6
    .param p1, "selfChange"    # Z

    .prologue
    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 47
    .local v0, "currentTime":J
    sget-wide v4, Lcom/pccw/sms/service/ContactChangeContentObserver;->nextCallTime:J

    cmp-long v3, v0, v4

    if-gez v3, :cond_0

    .line 80
    :goto_0
    return-void

    .line 50
    :cond_0
    const-wide/16 v4, 0x3e8

    add-long/2addr v4, v0

    sput-wide v4, Lcom/pccw/sms/service/ContactChangeContentObserver;->nextCallTime:J

    .line 54
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/pccw/sms/service/ContactChangeContentObserver$1;

    invoke-direct {v3, p0}, Lcom/pccw/sms/service/ContactChangeContentObserver$1;-><init>(Lcom/pccw/sms/service/ContactChangeContentObserver;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 78
    .local v2, "thread":Ljava/lang/Thread;
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 79
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    goto :goto_0
.end method

.method public startSyncIMUserThread(I)V
    .locals 2
    .param p1, "updateHashCode"    # I

    .prologue
    .line 83
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/pccw/sms/service/ContactChangeContentObserver$2;

    invoke-direct {v1, p0}, Lcom/pccw/sms/service/ContactChangeContentObserver$2;-><init>(Lcom/pccw/sms/service/ContactChangeContentObserver;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 98
    .local v0, "syncThread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 99
    return-void
.end method
