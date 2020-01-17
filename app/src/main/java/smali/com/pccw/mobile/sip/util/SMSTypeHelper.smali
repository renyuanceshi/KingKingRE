.class public Lcom/pccw/mobile/sip/util/SMSTypeHelper;
.super Ljava/lang/Object;
.source "SMSTypeHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static callSMSTypeAPI(Ljava/lang/String;)Ljava/util/List;
    .locals 26
    .param p0, "msisdnlist"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 26
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, "KingKing"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 27
    .local v8, "keyValue":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    .line 28
    .local v18, "time":J
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string/jumbo v22, "yyyyMMddHHmmss"

    move-object/from16 v0, v22

    invoke-direct {v6, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 29
    .local v6, "format":Ljava/text/SimpleDateFormat;
    new-instance v3, Ljava/sql/Date;

    move-wide/from16 v0, v18

    invoke-direct {v3, v0, v1}, Ljava/sql/Date;-><init>(J)V

    .line 30
    .local v3, "d1":Ljava/sql/Date;
    invoke-virtual {v6, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v16

    .line 31
    .local v16, "t1":Ljava/lang/String;
    invoke-static {}, Lcom/pccw/mobile/sip/util/SMSTypeHelper;->gen8DigiRandomNumber()Ljava/lang/String;

    move-result-object v11

    .line 32
    .local v11, "random8Digi":Ljava/lang/String;
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 34
    .local v5, "entity":Ljava/lang/String;
    invoke-static {v8}, Lcom/pccw/mobile/sip/util/M5DUtils;->ecodeByMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 35
    .local v9, "m5dResult":Ljava/lang/String;
    const-string/jumbo v2, ""

    .line 37
    .local v2, "aesResult":Ljava/lang/String;
    :try_start_0
    invoke-static {v9, v5}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 43
    :goto_0
    const/4 v13, 0x0

    .line 44
    .local v13, "retryCount":I
    const/4 v10, 0x1

    .line 45
    .local v10, "needTry":Z
    :goto_1
    const/16 v22, 0x2

    move/from16 v0, v22

    if-ge v13, v0, :cond_1

    if-eqz v10, :cond_1

    .line 47
    :try_start_1
    const-string/jumbo v22, "https://sip.pccwmobile.com/voip02/getSMSType.do"

    const/16 v23, 0x6

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string/jumbo v25, "msisdnlist"

    aput-object v25, v23, v24

    const/16 v24, 0x1

    aput-object p0, v23, v24

    const/16 v24, 0x2

    const-string/jumbo v25, "sender"

    aput-object v25, v23, v24

    const/16 v24, 0x3

    aput-object v11, v23, v24

    const/16 v24, 0x4

    const-string/jumbo v25, "r"

    aput-object v25, v23, v24

    const/16 v24, 0x5

    aput-object v2, v23, v24

    invoke-static/range {v22 .. v23}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 48
    .local v7, "hlContent":Ljava/lang/String;
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v15

    .line 49
    .local v15, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v15}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v14

    .line 50
    .local v14, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v14}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v21

    .line 52
    .local v21, "xr":Lorg/xml/sax/XMLReader;
    new-instance v20, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;

    invoke-direct/range {v20 .. v20}, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;-><init>()V

    .line 53
    .local v20, "xmlHandler":Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;
    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 54
    new-instance v22, Lorg/xml/sax/InputSource;

    new-instance v23, Ljava/io/StringReader;

    move-object/from16 v0, v23

    invoke-direct {v0, v7}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v22 .. v23}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface/range {v21 .. v22}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 55
    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->typeList:Ljava/util/List;

    move-object/from16 v17, v0

    .line 56
    .local v17, "typeList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    const/4 v10, 0x0

    .line 57
    move-object/from16 v0, v20

    iget-object v12, v0, Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;->resultCode:Ljava/lang/String;

    .line 58
    .local v12, "result":Ljava/lang/String;
    const-string/jumbo v22, "0"

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v22

    if-eqz v22, :cond_0

    .line 69
    .end local v7    # "hlContent":Ljava/lang/String;
    .end local v12    # "result":Ljava/lang/String;
    .end local v14    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v15    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v17    # "typeList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    .end local v20    # "xmlHandler":Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;
    .end local v21    # "xr":Lorg/xml/sax/XMLReader;
    :goto_2
    return-object v17

    .line 39
    .end local v10    # "needTry":Z
    .end local v13    # "retryCount":I
    :catch_0
    move-exception v4

    .line 40
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 61
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v7    # "hlContent":Ljava/lang/String;
    .restart local v10    # "needTry":Z
    .restart local v12    # "result":Ljava/lang/String;
    .restart local v13    # "retryCount":I
    .restart local v14    # "sp":Ljavax/xml/parsers/SAXParser;
    .restart local v15    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .restart local v17    # "typeList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    .restart local v20    # "xmlHandler":Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;
    .restart local v21    # "xr":Lorg/xml/sax/XMLReader;
    :cond_0
    const/16 v17, 0x0

    goto :goto_2

    .line 63
    .end local v7    # "hlContent":Ljava/lang/String;
    .end local v12    # "result":Ljava/lang/String;
    .end local v14    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v15    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v17    # "typeList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    .end local v20    # "xmlHandler":Lcom/pccw/mobile/sip/GetSMSTypeXmlHandler;
    .end local v21    # "xr":Lorg/xml/sax/XMLReader;
    :catch_1
    move-exception v22

    .line 67
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_1

    .line 69
    :cond_1
    const/16 v17, 0x0

    goto :goto_2
.end method

.method public static createListOfInternationalSMSType(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p0, "msisdnlist"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .local v3, "typeList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    invoke-static {p0}, Lcom/pccw/sms/util/SMSFormatUtil;->convertSplittingStringToSortedArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 75
    .local v1, "numbersList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 76
    .local v0, "number":Ljava/lang/String;
    new-instance v2, Lcom/pccw/mobile/sip/SMSType;

    const-string/jumbo v5, "intl"

    invoke-direct {v2, v0, v5}, Lcom/pccw/mobile/sip/SMSType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .local v2, "type":Lcom/pccw/mobile/sip/SMSType;
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 79
    .end local v0    # "number":Ljava/lang/String;
    .end local v2    # "type":Lcom/pccw/mobile/sip/SMSType;
    :cond_0
    return-object v3
.end method

.method public static createListOfUnknownSMSType(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p0, "msisdnlist"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .local v3, "typeList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    invoke-static {p0}, Lcom/pccw/sms/util/SMSFormatUtil;->convertSplittingStringToSortedArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 85
    .local v1, "numbersList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 86
    .local v0, "number":Ljava/lang/String;
    new-instance v2, Lcom/pccw/mobile/sip/SMSType;

    const-string/jumbo v5, "na"

    invoke-direct {v2, v0, v5}, Lcom/pccw/mobile/sip/SMSType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .local v2, "type":Lcom/pccw/mobile/sip/SMSType;
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 89
    .end local v0    # "number":Ljava/lang/String;
    .end local v2    # "type":Lcom/pccw/mobile/sip/SMSType;
    :cond_0
    return-object v3
.end method

.method private static gen8DigiRandomNumber()Ljava/lang/String;
    .locals 4

    .prologue
    .line 93
    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 94
    .local v1, "rnd":Ljava/util/Random;
    const v2, 0x989680

    const v3, 0x55d4a80

    invoke-virtual {v1, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    add-int v0, v2, v3

    .line 95
    .local v0, "n":I
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
