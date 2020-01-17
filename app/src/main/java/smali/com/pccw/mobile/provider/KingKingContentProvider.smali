.class public Lcom/pccw/mobile/provider/KingKingContentProvider;
.super Landroid/content/ContentProvider;
.source "KingKingContentProvider.java"


# static fields
.field public static AUTHORITY:Ljava/lang/String; = null

.field public static final CALL_LOG_URI:Landroid/net/Uri;

.field public static COLLLOG_PATH:Ljava/lang/String; = null

.field static TAG:Ljava/lang/String; = null

.field public static final callLogCode:I = 0x1

.field public static final callLogCodes:I = 0x2

.field private static uriMatcher:Landroid/content/UriMatcher;


# instance fields
.field private db:Landroid/database/sqlite/SQLiteDatabase;

.field private dbHelper:Lcom/pccw/database/helper/DBHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 15
    const-class v0, Lcom/pccw/mobile/provider/KingKingContentProvider;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->TAG:Ljava/lang/String;

    .line 17
    const/4 v0, 0x0

    sput-object v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    .line 18
    const-string/jumbo v0, "kingking"

    sput-object v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->AUTHORITY:Ljava/lang/String;

    .line 19
    const-string/jumbo v0, "call_log"

    sput-object v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->COLLLOG_PATH:Ljava/lang/String;

    .line 22
    const-string/jumbo v0, "content://kingking/call_log"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    .line 28
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    .line 29
    sget-object v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lcom/pccw/mobile/provider/KingKingContentProvider;->AUTHORITY:Ljava/lang/String;

    sget-object v2, Lcom/pccw/mobile/provider/KingKingContentProvider;->COLLLOG_PATH:Ljava/lang/String;

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 30
    sget-object v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lcom/pccw/mobile/provider/KingKingContentProvider;->AUTHORITY:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/pccw/mobile/provider/KingKingContentProvider;->COLLLOG_PATH:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/#"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 31
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 35
    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 79
    iget-object v3, p0, Lcom/pccw/mobile/provider/KingKingContentProvider;->dbHelper:Lcom/pccw/database/helper/DBHelper;

    invoke-virtual {v3}, Lcom/pccw/database/helper/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/mobile/provider/KingKingContentProvider;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 80
    sget-object v3, Lcom/pccw/mobile/provider/KingKingContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 90
    const/4 v3, -0x1

    :goto_0
    return v3

    .line 82
    :pswitch_0
    invoke-static {p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v0

    .line 83
    .local v0, "id":J
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 84
    .local v2, "where":Ljava/lang/String;
    if-eqz p2, :cond_0

    const-string/jumbo v3, ""

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 85
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " and "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 87
    :cond_0
    iget-object v3, p0, Lcom/pccw/mobile/provider/KingKingContentProvider;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "call_log"

    invoke-virtual {v3, v4, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    goto :goto_0

    .line 80
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 116
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    const/4 v1, 0x0

    .line 46
    sget-object v4, Lcom/pccw/mobile/provider/KingKingContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v4, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v4

    packed-switch v4, :pswitch_data_0

    move-object p1, v1

    .line 55
    .end local p1    # "uri":Landroid/net/Uri;
    :goto_0
    return-object p1

    .line 48
    .restart local p1    # "uri":Landroid/net/Uri;
    :pswitch_0
    iget-object v4, p0, Lcom/pccw/mobile/provider/KingKingContentProvider;->dbHelper:Lcom/pccw/database/helper/DBHelper;

    invoke-virtual {v4}, Lcom/pccw/database/helper/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    iput-object v4, p0, Lcom/pccw/mobile/provider/KingKingContentProvider;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 49
    iget-object v4, p0, Lcom/pccw/mobile/provider/KingKingContentProvider;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v5, "call_log"

    const-string/jumbo v6, "_id"

    invoke-virtual {v4, v5, v6, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 50
    .local v2, "rowId":J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 51
    .local v0, "insertUri":Landroid/net/Uri;
    sget-object v4, Lcom/pccw/mobile/provider/KingKingContentProvider;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "insertUri:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    invoke-virtual {p0}, Lcom/pccw/mobile/provider/KingKingContentProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, p1, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    goto :goto_0

    .line 46
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate()Z
    .locals 1

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/pccw/mobile/provider/KingKingContentProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/database/helper/DBHelper;->getInstance(Landroid/content/Context;)Lcom/pccw/database/helper/DBHelper;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/provider/KingKingContentProvider;->dbHelper:Lcom/pccw/database/helper/DBHelper;

    .line 41
    iget-object v0, p0, Lcom/pccw/mobile/provider/KingKingContentProvider;->dbHelper:Lcom/pccw/database/helper/DBHelper;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 16
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 61
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->dbHelper:Lcom/pccw/database/helper/DBHelper;

    invoke-virtual {v2}, Lcom/pccw/database/helper/DBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 62
    sget-object v2, Lcom/pccw/mobile/provider/KingKingContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 74
    const/4 v2, 0x0

    :goto_0
    return-object v2

    .line 64
    :pswitch_0
    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v14

    .line 65
    .local v14, "id":J
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 66
    .local v5, "where":Ljava/lang/String;
    if-eqz p3, :cond_0

    const-string/jumbo v2, ""

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 67
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " and "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 69
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v3, "call_log"

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v4, p2

    move-object/from16 v6, p4

    move-object/from16 v9, p5

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_0

    .line 71
    .end local v5    # "where":Ljava/lang/String;
    .end local v14    # "id":J
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/provider/KingKingContentProvider;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v7, "call_log"

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v13, p5

    invoke-virtual/range {v6 .. v13}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_0

    .line 62
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 97
    iget-object v3, p0, Lcom/pccw/mobile/provider/KingKingContentProvider;->dbHelper:Lcom/pccw/database/helper/DBHelper;

    invoke-virtual {v3}, Lcom/pccw/database/helper/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/mobile/provider/KingKingContentProvider;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 98
    sget-object v3, Lcom/pccw/mobile/provider/KingKingContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 109
    const/4 v3, -0x1

    :goto_0
    return v3

    .line 100
    :pswitch_0
    invoke-static {p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v0

    .line 101
    .local v0, "id":J
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 102
    .local v2, "where":Ljava/lang/String;
    if-eqz p3, :cond_0

    const-string/jumbo v3, ""

    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 103
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " and "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 105
    :cond_0
    iget-object v3, p0, Lcom/pccw/mobile/provider/KingKingContentProvider;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "call_log"

    invoke-virtual {v3, v4, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    goto :goto_0

    .line 98
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
