.class Lcom/orhanobut/logger/DiskLogStrategy$WriteHandler;
.super Landroid/os/Handler;
.source "DiskLogStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/orhanobut/logger/DiskLogStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "WriteHandler"
.end annotation


# instance fields
.field private final folder:Ljava/lang/String;

.field private final maxFileSize:I


# direct methods
.method constructor <init>(Landroid/os/Looper;Ljava/lang/String;I)V
    .locals 0
    .param p1, "looper"    # Landroid/os/Looper;
    .param p2, "folder"    # Ljava/lang/String;
    .param p3, "maxFileSize"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 35
    iput-object p2, p0, Lcom/orhanobut/logger/DiskLogStrategy$WriteHandler;->folder:Ljava/lang/String;

    .line 36
    iput p3, p0, Lcom/orhanobut/logger/DiskLogStrategy$WriteHandler;->maxFileSize:I

    .line 37
    return-void
.end method

.method private getLogFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 10
    .param p1, "folderName"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 76
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 77
    .local v1, "folder":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 79
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 82
    :cond_0
    const/4 v3, 0x0

    .line 84
    .local v3, "newFileCount":I
    const/4 v0, 0x0

    .line 86
    .local v0, "existingFile":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string/jumbo v4, "%s_%s.csv"

    new-array v5, v9, [Ljava/lang/Object;

    aput-object p2, v5, v7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 87
    .local v2, "newFile":Ljava/io/File;
    :goto_0
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 88
    move-object v0, v2

    .line 89
    add-int/lit8 v3, v3, 0x1

    .line 90
    new-instance v2, Ljava/io/File;

    .end local v2    # "newFile":Ljava/io/File;
    const-string/jumbo v4, "%s_%s.csv"

    new-array v5, v9, [Ljava/lang/Object;

    aput-object p2, v5, v7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .restart local v2    # "newFile":Ljava/io/File;
    goto :goto_0

    .line 93
    :cond_1
    if-eqz v0, :cond_2

    .line 94
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    iget v6, p0, Lcom/orhanobut/logger/DiskLogStrategy$WriteHandler;->maxFileSize:I

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-ltz v4, :cond_3

    .line 100
    .end local v2    # "newFile":Ljava/io/File;
    :cond_2
    :goto_1
    return-object v2

    .restart local v2    # "newFile":Ljava/io/File;
    :cond_3
    move-object v2, v0

    .line 97
    goto :goto_1
.end method

.method private writeLog(Ljava/io/FileWriter;Ljava/lang/String;)V
    .locals 0
    .param p1, "fileWriter"    # Ljava/io/FileWriter;
    .param p2, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-virtual {p1, p2}, Ljava/io/FileWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 72
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 41
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 43
    .local v0, "content":Ljava/lang/String;
    const/4 v2, 0x0

    .line 44
    .local v2, "fileWriter":Ljava/io/FileWriter;
    iget-object v5, p0, Lcom/orhanobut/logger/DiskLogStrategy$WriteHandler;->folder:Ljava/lang/String;

    const-string/jumbo v6, "logs"

    invoke-direct {p0, v5, v6}, Lcom/orhanobut/logger/DiskLogStrategy$WriteHandler;->getLogFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 47
    .local v4, "logFile":Ljava/io/File;
    :try_start_0
    new-instance v3, Ljava/io/FileWriter;

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .end local v2    # "fileWriter":Ljava/io/FileWriter;
    .local v3, "fileWriter":Ljava/io/FileWriter;
    :try_start_1
    invoke-direct {p0, v3, v0}, Lcom/orhanobut/logger/DiskLogStrategy$WriteHandler;->writeLog(Ljava/io/FileWriter;Ljava/lang/String;)V

    .line 51
    invoke-virtual {v3}, Ljava/io/FileWriter;->flush()V

    .line 52
    invoke-virtual {v3}, Ljava/io/FileWriter;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-object v2, v3

    .line 61
    .end local v3    # "fileWriter":Ljava/io/FileWriter;
    .restart local v2    # "fileWriter":Ljava/io/FileWriter;
    :cond_0
    :goto_0
    return-void

    .line 53
    :catch_0
    move-exception v1

    .line 54
    .local v1, "e":Ljava/io/IOException;
    :goto_1
    if-eqz v2, :cond_0

    .line 56
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileWriter;->flush()V

    .line 57
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 58
    :catch_1
    move-exception v5

    goto :goto_0

    .line 53
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "fileWriter":Ljava/io/FileWriter;
    .restart local v3    # "fileWriter":Ljava/io/FileWriter;
    :catch_2
    move-exception v1

    move-object v2, v3

    .end local v3    # "fileWriter":Ljava/io/FileWriter;
    .restart local v2    # "fileWriter":Ljava/io/FileWriter;
    goto :goto_1
.end method
