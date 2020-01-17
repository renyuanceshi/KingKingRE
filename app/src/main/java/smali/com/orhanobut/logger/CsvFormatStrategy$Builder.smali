.class public final Lcom/orhanobut/logger/CsvFormatStrategy$Builder;
.super Ljava/lang/Object;
.source "CsvFormatStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/orhanobut/logger/CsvFormatStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# static fields
.field private static final MAX_BYTES:I = 0x7d000


# instance fields
.field date:Ljava/util/Date;

.field dateFormat:Ljava/text/SimpleDateFormat;

.field logStrategy:Lcom/orhanobut/logger/LogStrategy;

.field tag:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    const-string/jumbo v0, "PRETTY_LOGGER"

    iput-object v0, p0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->tag:Ljava/lang/String;

    .line 91
    return-void
.end method

.method synthetic constructor <init>(Lcom/orhanobut/logger/CsvFormatStrategy$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/orhanobut/logger/CsvFormatStrategy$1;

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lcom/orhanobut/logger/CsvFormatStrategy;
    .locals 7

    .prologue
    .line 114
    iget-object v4, p0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->date:Ljava/util/Date;

    if-nez v4, :cond_0

    .line 115
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    iput-object v4, p0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->date:Ljava/util/Date;

    .line 117
    :cond_0
    iget-object v4, p0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->dateFormat:Ljava/text/SimpleDateFormat;

    if-nez v4, :cond_1

    .line 118
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string/jumbo v5, "yyyy.MM.dd HH:mm:ss.SSS"

    sget-object v6, Ljava/util/Locale;->UK:Ljava/util/Locale;

    invoke-direct {v4, v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v4, p0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->dateFormat:Ljava/text/SimpleDateFormat;

    .line 120
    :cond_1
    iget-object v4, p0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->logStrategy:Lcom/orhanobut/logger/LogStrategy;

    if-nez v4, :cond_2

    .line 121
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "diskPath":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-char v5, Ljava/io/File;->separatorChar:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "logger"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, "folder":Ljava/lang/String;
    new-instance v3, Landroid/os/HandlerThread;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "AndroidFileLogger."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 125
    .local v3, "ht":Landroid/os/HandlerThread;
    invoke-virtual {v3}, Landroid/os/HandlerThread;->start()V

    .line 126
    new-instance v2, Lcom/orhanobut/logger/DiskLogStrategy$WriteHandler;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v4

    const v5, 0x7d000

    invoke-direct {v2, v4, v1, v5}, Lcom/orhanobut/logger/DiskLogStrategy$WriteHandler;-><init>(Landroid/os/Looper;Ljava/lang/String;I)V

    .line 127
    .local v2, "handler":Landroid/os/Handler;
    new-instance v4, Lcom/orhanobut/logger/DiskLogStrategy;

    invoke-direct {v4, v2}, Lcom/orhanobut/logger/DiskLogStrategy;-><init>(Landroid/os/Handler;)V

    iput-object v4, p0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->logStrategy:Lcom/orhanobut/logger/LogStrategy;

    .line 129
    .end local v0    # "diskPath":Ljava/lang/String;
    .end local v1    # "folder":Ljava/lang/String;
    .end local v2    # "handler":Landroid/os/Handler;
    .end local v3    # "ht":Landroid/os/HandlerThread;
    :cond_2
    new-instance v4, Lcom/orhanobut/logger/CsvFormatStrategy;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/orhanobut/logger/CsvFormatStrategy;-><init>(Lcom/orhanobut/logger/CsvFormatStrategy$Builder;Lcom/orhanobut/logger/CsvFormatStrategy$1;)V

    return-object v4
.end method

.method public date(Ljava/util/Date;)Lcom/orhanobut/logger/CsvFormatStrategy$Builder;
    .locals 0
    .param p1, "val"    # Ljava/util/Date;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->date:Ljava/util/Date;

    .line 95
    return-object p0
.end method

.method public dateFormat(Ljava/text/SimpleDateFormat;)Lcom/orhanobut/logger/CsvFormatStrategy$Builder;
    .locals 0
    .param p1, "val"    # Ljava/text/SimpleDateFormat;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->dateFormat:Ljava/text/SimpleDateFormat;

    .line 100
    return-object p0
.end method

.method public logStrategy(Lcom/orhanobut/logger/LogStrategy;)Lcom/orhanobut/logger/CsvFormatStrategy$Builder;
    .locals 0
    .param p1, "val"    # Lcom/orhanobut/logger/LogStrategy;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->logStrategy:Lcom/orhanobut/logger/LogStrategy;

    .line 105
    return-object p0
.end method

.method public tag(Ljava/lang/String;)Lcom/orhanobut/logger/CsvFormatStrategy$Builder;
    .locals 0
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->tag:Ljava/lang/String;

    .line 110
    return-object p0
.end method
