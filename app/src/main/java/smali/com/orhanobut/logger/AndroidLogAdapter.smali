.class public Lcom/orhanobut/logger/AndroidLogAdapter;
.super Ljava/lang/Object;
.source "AndroidLogAdapter.java"

# interfaces
.implements Lcom/orhanobut/logger/LogAdapter;


# instance fields
.field private final formatStrategy:Lcom/orhanobut/logger/FormatStrategy;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    invoke-static {}, Lcom/orhanobut/logger/PrettyFormatStrategy;->newBuilder()Lcom/orhanobut/logger/PrettyFormatStrategy$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/orhanobut/logger/PrettyFormatStrategy$Builder;->build()Lcom/orhanobut/logger/PrettyFormatStrategy;

    move-result-object v0

    iput-object v0, p0, Lcom/orhanobut/logger/AndroidLogAdapter;->formatStrategy:Lcom/orhanobut/logger/FormatStrategy;

    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/orhanobut/logger/FormatStrategy;)V
    .locals 0
    .param p1, "formatStrategy"    # Lcom/orhanobut/logger/FormatStrategy;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/orhanobut/logger/AndroidLogAdapter;->formatStrategy:Lcom/orhanobut/logger/FormatStrategy;

    .line 13
    return-void
.end method


# virtual methods
.method public isLoggable(ILjava/lang/String;)Z
    .locals 1
    .param p1, "priority"    # I
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 16
    const/4 v0, 0x1

    return v0
.end method

.method public log(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "priority"    # I
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/orhanobut/logger/AndroidLogAdapter;->formatStrategy:Lcom/orhanobut/logger/FormatStrategy;

    invoke-interface {v0, p1, p2, p3}, Lcom/orhanobut/logger/FormatStrategy;->log(ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    return-void
.end method
