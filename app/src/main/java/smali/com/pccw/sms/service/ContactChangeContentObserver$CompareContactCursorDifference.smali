.class public Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;
.super Ljava/lang/Object;
.source "ContactChangeContentObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/service/ContactChangeContentObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CompareContactCursorDifference"
.end annotation


# instance fields
.field cCursor:Landroid/database/Cursor;

.field context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;->cCursor:Landroid/database/Cursor;

    .line 108
    iput-object p1, p0, Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;->context:Landroid/content/Context;

    .line 109
    return-void
.end method


# virtual methods
.method public getCursor()Landroid/database/Cursor;
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 112
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v1, "data1"

    aput-object v1, v2, v0

    .line 113
    .local v2, "projection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v5, "data1 ASC"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;->cCursor:Landroid/database/Cursor;

    .line 114
    iget-object v0, p0, Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;->cCursor:Landroid/database/Cursor;

    return-object v0
.end method

.method public getHashCode()I
    .locals 11

    .prologue
    const v10, 0x7fffffff

    const/4 v7, 0x0

    .line 118
    invoke-virtual {p0}, Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    .line 119
    .local v1, "cursor":Landroid/database/Cursor;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v6

    if-nez v6, :cond_1

    .line 120
    :cond_0
    const/4 v5, -0x1

    .line 139
    :goto_0
    return v5

    .line 123
    :cond_1
    const/16 v5, 0xd

    .line 124
    .local v5, "result":I
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 127
    :cond_2
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 128
    .local v4, "cursorStr":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 129
    .local v2, "cursorChar":[C
    const/16 v0, 0x9

    .line 130
    .local v0, "contentHash":I
    array-length v8, v2

    move v6, v7

    :goto_1
    if-ge v6, v8, :cond_3

    aget-char v3, v2, v6

    .line 131
    .local v3, "cursorInt":I
    mul-int/lit8 v9, v0, 0x65

    add-int/2addr v9, v3

    rem-int v0, v9, v10

    .line 130
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 135
    .end local v3    # "cursorInt":I
    :cond_3
    mul-int/lit8 v6, v5, 0x11

    add-int/2addr v6, v0

    rem-int v5, v6, v10

    .line 136
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_2

    .line 138
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method
