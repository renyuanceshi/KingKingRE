.class public abstract Lcom/pccw/mobile/sip/util/ContactsUtils;
.super Ljava/lang/Object;
.source "ContactsUtils.java"


# static fields
.field public static currentApi:I

.field public static instance:Lcom/pccw/mobile/sip/util/ContactsUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const/4 v0, 0x0

    sput v0, Lcom/pccw/mobile/sip/util/ContactsUtils;->currentApi:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getApiLevel()I
    .locals 4

    .prologue
    .line 16
    sget v2, Lcom/pccw/mobile/sip/util/ContactsUtils;->currentApi:I

    if-lez v2, :cond_0

    .line 17
    sget v2, Lcom/pccw/mobile/sip/util/ContactsUtils;->currentApi:I

    .line 31
    .local v1, "f":Ljava/lang/reflect/Field;
    :goto_0
    return v2

    .line 20
    .end local v1    # "f":Ljava/lang/reflect/Field;
    :cond_0
    sget-object v2, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    const-string/jumbo v3, "3"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 21
    const/4 v2, 0x3

    sput v2, Lcom/pccw/mobile/sip/util/ContactsUtils;->currentApi:I

    .line 31
    .restart local v1    # "f":Ljava/lang/reflect/Field;
    :goto_1
    sget v2, Lcom/pccw/mobile/sip/util/ContactsUtils;->currentApi:I

    goto :goto_0

    .line 24
    .end local v1    # "f":Ljava/lang/reflect/Field;
    :cond_1
    :try_start_0
    const-class v2, Landroid/os/Build$VERSION;

    const-string/jumbo v3, "SDK_INT"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 25
    .restart local v1    # "f":Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sput v2, Lcom/pccw/mobile/sip/util/ContactsUtils;->currentApi:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 26
    :catch_0
    move-exception v0

    .line 27
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getInstance()Lcom/pccw/mobile/sip/util/ContactsUtils;
    .locals 2

    .prologue
    .line 35
    sget-object v0, Lcom/pccw/mobile/sip/util/ContactsUtils;->instance:Lcom/pccw/mobile/sip/util/ContactsUtils;

    if-eqz v0, :cond_0

    .line 36
    sget-object v0, Lcom/pccw/mobile/sip/util/ContactsUtils;->instance:Lcom/pccw/mobile/sip/util/ContactsUtils;

    .line 40
    :goto_0
    return-object v0

    .line 37
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/util/ContactsUtils;->getApiLevel()I

    move-result v0

    const/4 v1, 0x5

    if-lt v0, v1, :cond_1

    .line 38
    new-instance v0, Lcom/pccw/mobile/sip/util/ContactsUtils5;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/util/ContactsUtils5;-><init>()V

    goto :goto_0

    .line 40
    :cond_1
    new-instance v0, Lcom/pccw/mobile/sip/util/ContactsUtils3;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/util/ContactsUtils3;-><init>()V

    goto :goto_0
.end method


# virtual methods
.method public abstract queryByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Lcom/pccw/mobile/sip/util/Contact;
.end method

.method public abstract queryPhoneList(Landroid/content/ContentResolver;)Landroid/database/Cursor;
.end method
