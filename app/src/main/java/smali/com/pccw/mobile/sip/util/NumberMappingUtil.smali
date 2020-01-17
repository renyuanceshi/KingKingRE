.class public Lcom/pccw/mobile/sip/util/NumberMappingUtil;
.super Ljava/lang/Object;
.source "NumberMappingUtil.java"


# static fields
.field private static BAR_PHONE_NUMBERS:[Ljava/lang/String; = null

.field private static CSL_IDD_PREFIX:[Ljava/lang/String; = null

.field private static CSL_PREPAID_IDD_PREFIX:[Ljava/lang/String; = null

.field private static PCCW_IDD_PREFIX:[Ljava/lang/String; = null

.field private static PCCW_PREPAID_IDD_PREFIX:[Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "NumberMappingUtil"

.field private static final cslNumMapPrefix:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final cslNumMapWhole:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final cslPrepaidNumMapPrefix:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final cslPrepaidNumMapWhole:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final pccwNumMapPrefix:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final pccwNumMapWhole:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final pccwPrepaidNumMapPrefix:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final pccwPrepaidNumMapWhole:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    .line 33
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "+"

    const-string/jumbo v2, "1964"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "001"

    const-string/jumbo v2, "1964"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "0060"

    const-string/jumbo v2, "19155"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1330060"

    const-string/jumbo v2, "13319155"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "13570060"

    const-string/jumbo v2, "135719155"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1678"

    const-string/jumbo v2, "19775"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1331678"

    const-string/jumbo v2, "13319775"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "13571678"

    const-string/jumbo v2, "135719775"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1718"

    const-string/jumbo v2, "19776"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1331718"

    const-string/jumbo v2, "13319776"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "13571718"

    const-string/jumbo v2, "135719776"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapWhole:Ljava/util/Map;

    .line 46
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "*90"

    const-string/jumbo v2, "1761290"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "*92"

    const-string/jumbo v2, "1761292"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "*988"

    const-string/jumbo v2, "1761292"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "112"

    const-string/jumbo v2, "999"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapPrefix:Ljava/util/Map;

    .line 53
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "+"

    const-string/jumbo v2, "1964"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "001"

    const-string/jumbo v2, "1964"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1718"

    const-string/jumbo v2, "19776"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1331718"

    const-string/jumbo v2, "13319776"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "13571718"

    const-string/jumbo v2, "135719776"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapWhole:Ljava/util/Map;

    .line 60
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "*90"

    const-string/jumbo v2, "1761290"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "*92"

    const-string/jumbo v2, "1761292"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "*988"

    const-string/jumbo v2, "1761292"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "112"

    const-string/jumbo v2, "999"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    .line 67
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "+"

    const-string/jumbo v2, "19770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "133+"

    const-string/jumbo v2, "13319770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1357+"

    const-string/jumbo v2, "135719770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "001"

    const-string/jumbo v2, "19770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "133001"

    const-string/jumbo v2, "13319770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1357001"

    const-string/jumbo v2, "135719770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1718"

    const-string/jumbo v2, "19771"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1331718"

    const-string/jumbo v2, "13319771"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "13571718"

    const-string/jumbo v2, "135719771"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "0060"

    const-string/jumbo v2, "19155"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1330060"

    const-string/jumbo v2, "13319155"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "13570060"

    const-string/jumbo v2, "135719155"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapWhole:Ljava/util/Map;

    .line 81
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "*988"

    const-string/jumbo v2, "98866622"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "112"

    const-string/jumbo v2, "999"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    .line 86
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "+"

    const-string/jumbo v2, "19770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "133+"

    const-string/jumbo v2, "13319770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1357+"

    const-string/jumbo v2, "135719770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "001"

    const-string/jumbo v2, "19770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "133001"

    const-string/jumbo v2, "13319770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1357001"

    const-string/jumbo v2, "135719770"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1718"

    const-string/jumbo v2, "19771"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1331718"

    const-string/jumbo v2, "13319771"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "13571718"

    const-string/jumbo v2, "135719771"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "0060"

    const-string/jumbo v2, "19155"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "1330060"

    const-string/jumbo v2, "13319155"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    const-string/jumbo v1, "13570060"

    const-string/jumbo v2, "135719155"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapWhole:Ljava/util/Map;

    .line 100
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "*988"

    const-string/jumbo v2, "98866622"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapWhole:Ljava/util/Map;

    const-string/jumbo v1, "112"

    const-string/jumbo v2, "999"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    new-array v0, v5, [Ljava/lang/String;

    const-string/jumbo v1, "*"

    aput-object v1, v0, v3

    const-string/jumbo v1, "#"

    aput-object v1, v0, v4

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->BAR_PHONE_NUMBERS:[Ljava/lang/String;

    .line 108
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "+"

    aput-object v1, v0, v3

    const-string/jumbo v1, "001"

    aput-object v1, v0, v4

    const-string/jumbo v1, "0060"

    aput-object v1, v0, v5

    const-string/jumbo v1, "1678"

    aput-object v1, v0, v6

    const-string/jumbo v1, "1718"

    aput-object v1, v0, v7

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->PCCW_IDD_PREFIX:[Ljava/lang/String;

    .line 112
    new-array v0, v7, [Ljava/lang/String;

    const-string/jumbo v1, "+"

    aput-object v1, v0, v3

    const-string/jumbo v1, "001"

    aput-object v1, v0, v4

    const-string/jumbo v1, "0060"

    aput-object v1, v0, v5

    const-string/jumbo v1, "1718"

    aput-object v1, v0, v6

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->PCCW_PREPAID_IDD_PREFIX:[Ljava/lang/String;

    .line 116
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "+"

    aput-object v1, v0, v3

    const-string/jumbo v1, "001"

    aput-object v1, v0, v4

    const-string/jumbo v1, "0060"

    aput-object v1, v0, v5

    const-string/jumbo v1, "1678"

    aput-object v1, v0, v6

    const-string/jumbo v1, "1718"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string/jumbo v2, "1513"

    aput-object v2, v0, v1

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->CSL_IDD_PREFIX:[Ljava/lang/String;

    .line 120
    new-array v0, v7, [Ljava/lang/String;

    const-string/jumbo v1, "+"

    aput-object v1, v0, v3

    const-string/jumbo v1, "001"

    aput-object v1, v0, v4

    const-string/jumbo v1, "0060"

    aput-object v1, v0, v5

    const-string/jumbo v1, "1718"

    aput-object v1, v0, v6

    sput-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->CSL_PREPAID_IDD_PREFIX:[Ljava/lang/String;

    .line 125
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->BAR_PHONE_NUMBERS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 126
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->PCCW_IDD_PREFIX:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 127
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->PCCW_PREPAID_IDD_PREFIX:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 128
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->CSL_IDD_PREFIX:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 129
    sget-object v0, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->CSL_PREPAID_IDD_PREFIX:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 130
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hasIDDPrefix(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 7
    .param p0, "address"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 274
    const-string/jumbo v3, "+852"

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 299
    :cond_0
    :goto_0
    return v1

    .line 278
    :cond_1
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPostpaid(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 279
    sget-object v4, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->CSL_IDD_PREFIX:[Ljava/lang/String;

    array-length v5, v4

    move v3, v1

    :goto_1
    if-ge v3, v5, :cond_0

    aget-object v0, v4, v3

    .line 280
    .local v0, "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v1, v2

    .line 281
    goto :goto_0

    .line 279
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 283
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_3
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 284
    sget-object v4, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->CSL_PREPAID_IDD_PREFIX:[Ljava/lang/String;

    array-length v5, v4

    move v3, v1

    :goto_2
    if-ge v3, v5, :cond_0

    aget-object v0, v4, v3

    .line 285
    .restart local v0    # "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    move v1, v2

    .line 286
    goto :goto_0

    .line 284
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 288
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_5
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPostpaid(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 289
    sget-object v4, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->PCCW_IDD_PREFIX:[Ljava/lang/String;

    array-length v5, v4

    move v3, v1

    :goto_3
    if-ge v3, v5, :cond_0

    aget-object v0, v4, v3

    .line 290
    .restart local v0    # "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    move v1, v2

    .line 291
    goto :goto_0

    .line 289
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 293
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_7
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPrepaid(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 294
    sget-object v4, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->PCCW_PREPAID_IDD_PREFIX:[Ljava/lang/String;

    array-length v5, v4

    move v3, v1

    :goto_4
    if-ge v3, v5, :cond_0

    aget-object v0, v4, v3

    .line 295
    .restart local v0    # "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8

    move v1, v2

    .line 296
    goto :goto_0

    .line 294
    :cond_8
    add-int/lit8 v3, v3, 0x1

    goto :goto_4
.end method

.method public static mapPhoneNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "number"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 137
    if-nez p0, :cond_0

    move-object v1, v2

    .line 229
    :goto_0
    return-object v1

    .line 139
    :cond_0
    const-string/jumbo v1, "+852"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 140
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 143
    :cond_1
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSL(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 144
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 147
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapWhole:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 152
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapWhole:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0

    .line 155
    :cond_2
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslPrepaidNumMapPrefix:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 156
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 161
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 164
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPostpaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 167
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapWhole:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 172
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapWhole:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto/16 :goto_0

    .line 175
    :cond_5
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->cslNumMapPrefix:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 176
    .restart local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_6

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 181
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 185
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_7
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKT(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 188
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 190
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapWhole:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 195
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapWhole:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto/16 :goto_0

    .line 198
    :cond_8
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwPrepaidNumMapPrefix:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 199
    .restart local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_9

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 204
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 209
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_a
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapWhole:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 214
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapWhole:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto/16 :goto_0

    .line 217
    :cond_b
    sget-object v1, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->pccwNumMapPrefix:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 218
    .restart local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_c

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 223
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_d
    move-object v1, v2

    .line 229
    goto/16 :goto_0
.end method

.method public static shouldBarPhoneNumber(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 4
    .param p0, "number"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 233
    if-nez p0, :cond_1

    .line 263
    :cond_0
    :goto_0
    return v0

    .line 236
    :cond_1
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSL(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 239
    const-string/jumbo v2, "*988"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 250
    :cond_2
    const-string/jumbo v2, "19"

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    move v0, v1

    .line 251
    goto :goto_0

    .line 242
    :cond_3
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKT(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 245
    const-string/jumbo v2, "*92"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "*90"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "*988"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    .line 255
    :cond_4
    const-string/jumbo v2, "900"

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    move v0, v1

    .line 256
    goto :goto_0

    .line 257
    :cond_5
    invoke-static {p0}, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->shouldIgnoreVoipCall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6

    if-eqz p0, :cond_0

    .line 258
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v2, v1, :cond_0

    sget-object v2, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->BAR_PHONE_NUMBERS:[Ljava/lang/String;

    .line 259
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 258
    invoke-static {v2, v3}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-ltz v2, :cond_0

    :cond_6
    move v0, v1

    .line 260
    goto :goto_0
.end method

.method public static shouldIgnoreVoipCall(Ljava/lang/String;)Z
    .locals 1
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 133
    if-eqz p0, :cond_1

    const-string/jumbo v0, "**21*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "##21#"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
