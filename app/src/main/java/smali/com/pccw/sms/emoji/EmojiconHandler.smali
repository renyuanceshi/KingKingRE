.class public final Lcom/pccw/sms/emoji/EmojiconHandler;
.super Ljava/lang/Object;
.source "EmojiconHandler.java"


# static fields
.field private static final sEmojisMap:Landroid/util/SparseIntArray;

.field private static final sSoftbanksMap:Landroid/util/SparseIntArray;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const v7, 0x7f0200df

    const v6, 0x7f0200de

    const v5, 0x7f0200dd

    const v4, 0xe44b

    const v3, 0x7f02010c

    .line 14
    new-instance v0, Landroid/util/SparseIntArray;

    const/16 v1, 0x34e

    invoke-direct {v0, v1}, Landroid/util/SparseIntArray;-><init>(I)V

    sput-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    .line 15
    new-instance v0, Landroid/util/SparseIntArray;

    const/16 v1, 0x1d7

    invoke-direct {v0, v1}, Landroid/util/SparseIntArray;-><init>(I)V

    sput-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    .line 19
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f604

    const v2, 0x7f02031d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 20
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f603

    const v2, 0x7f02031c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 21
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f600

    const v2, 0x7f020319

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 22
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f60a

    const v2, 0x7f020323

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 23
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x263a

    const v2, 0x7f0203cf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 24
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f609

    const v2, 0x7f020322

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 25
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f60d

    const v2, 0x7f020326

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 26
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f618

    const v2, 0x7f020331

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 27
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f61a

    const v2, 0x7f020333

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 28
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f617

    const v2, 0x7f020330

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 29
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f619

    const v2, 0x7f020332

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 30
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f61c

    const v2, 0x7f020335

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 31
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f61d

    const v2, 0x7f020336

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 32
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f61b

    const v2, 0x7f020334

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 33
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f633

    const v2, 0x7f02034c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 34
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f601

    const v2, 0x7f02031a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 35
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f614

    const v2, 0x7f02032d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 36
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f60c

    const v2, 0x7f020325

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 37
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f612

    const v2, 0x7f02032b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 38
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f61e

    const v2, 0x7f020337

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 39
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f623

    const v2, 0x7f02033c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 40
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f622

    const v2, 0x7f02033b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 41
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f602

    const v2, 0x7f02031b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 42
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f62d

    const v2, 0x7f020346

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 43
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f62a

    const v2, 0x7f020343

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 44
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f625

    const v2, 0x7f02033e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 45
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f630

    const v2, 0x7f020349

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 46
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f605

    const v2, 0x7f02031e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 47
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f613

    const v2, 0x7f02032c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 48
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f629

    const v2, 0x7f020342

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 49
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f62b

    const v2, 0x7f020344

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 50
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f628

    const v2, 0x7f020341

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 51
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f631

    const v2, 0x7f02034a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 52
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f620

    const v2, 0x7f020339

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 53
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f621

    const v2, 0x7f02033a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 54
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f624

    const v2, 0x7f02033d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 55
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f616

    const v2, 0x7f02032f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 56
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f606

    const v2, 0x7f02031f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 57
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f60b

    const v2, 0x7f020324

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 58
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f637

    const v2, 0x7f020350

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 59
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f60e

    const v2, 0x7f020327

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 60
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f634

    const v2, 0x7f02034d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 61
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f635

    const v2, 0x7f02034e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 62
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f632

    const v2, 0x7f02034b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 63
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f61f

    const v2, 0x7f020338

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 64
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f626

    const v2, 0x7f02033f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 65
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f627

    const v2, 0x7f020340

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 66
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f608

    const v2, 0x7f020321

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 67
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f47f

    const v2, 0x7f020241

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 68
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f62e

    const v2, 0x7f020347

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 69
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f62c

    const v2, 0x7f020345

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 70
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f610

    const v2, 0x7f020329

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 71
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f615

    const v2, 0x7f02032e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 72
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f62f

    const v2, 0x7f020348

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 73
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f636

    const v2, 0x7f02034f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 74
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f607

    const v2, 0x7f020320

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 75
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f60f

    const v2, 0x7f020328

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 76
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f611

    const v2, 0x7f02032a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 77
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f472

    const v2, 0x7f020234

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 78
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f473

    const v2, 0x7f020235

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 79
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f46e

    const v2, 0x7f020230

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 80
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f477

    const v2, 0x7f020239

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 81
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f482

    const v2, 0x7f020244

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 82
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f476

    const v2, 0x7f020238

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 83
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f466

    const v2, 0x7f020228

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 84
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f467

    const v2, 0x7f020229

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 85
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f468

    const v2, 0x7f02022a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 86
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f469

    const v2, 0x7f02022b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 87
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f474

    const v2, 0x7f020236

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 88
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f475

    const v2, 0x7f020237

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 89
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f471

    const v2, 0x7f020233

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 90
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f47c

    const v2, 0x7f02023e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 91
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f478

    const v2, 0x7f02023a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 92
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f63a

    const v2, 0x7f020353

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 93
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f638

    const v2, 0x7f020351

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 94
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f63b

    const v2, 0x7f020354

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 95
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f63d

    const v2, 0x7f020356

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 96
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f63c

    const v2, 0x7f020355

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 97
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f640

    const v2, 0x7f020359

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 98
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f63f

    const v2, 0x7f020358

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 99
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f639

    const v2, 0x7f020352

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 100
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f63e

    const v2, 0x7f020357

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 101
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f479

    const v2, 0x7f02023b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 102
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f47a

    const v2, 0x7f02023c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 103
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f648

    const v2, 0x7f02035d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 104
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f649

    const v2, 0x7f02035e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 105
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f64a

    const v2, 0x7f02035f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 106
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f480

    const v2, 0x7f020242

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 107
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f47d

    const v2, 0x7f02023f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 108
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4a9

    const v2, 0x7f02026b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 109
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f525

    const v2, 0x7f0202e3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 110
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2728

    const v2, 0x7f0203ff

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 111
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f31f

    const v2, 0x7f020128

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 112
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ab

    const v2, 0x7f02026d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 113
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4a5

    const v2, 0x7f020267

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 114
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4a2

    const v2, 0x7f020264

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 115
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4a6

    const v2, 0x7f020268

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 116
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4a7

    const v2, 0x7f020269

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 117
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4a4

    const v2, 0x7f020266

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 118
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4a8

    const v2, 0x7f02026a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 119
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f442

    const v2, 0x7f020204

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 120
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f440

    const v2, 0x7f020203

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 121
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f443

    const v2, 0x7f020205

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 122
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f445

    const v2, 0x7f020207

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 123
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f444

    const v2, 0x7f020206

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 124
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f44d

    const v2, 0x7f02020f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 125
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f44e

    const v2, 0x7f020210

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 126
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f44c

    const v2, 0x7f02020e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 127
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f44a

    const v2, 0x7f02020c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 128
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x270a

    const v2, 0x7f0203f8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 129
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x270c

    const v2, 0x7f0203fa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 130
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f44b

    const v2, 0x7f02020d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 131
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x270b

    const v2, 0x7f0203f9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 132
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f450

    const v2, 0x7f020212

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 133
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f446

    const v2, 0x7f020208

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 134
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f447

    const v2, 0x7f020209

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 135
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f449

    const v2, 0x7f02020b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 136
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f448

    const v2, 0x7f02020a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 137
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f64c

    const v2, 0x7f020361

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 138
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f64f

    const v2, 0x7f020364

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 139
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x261d

    const v2, 0x7f0203ce

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 140
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f44f

    const v2, 0x7f020211

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 141
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4aa

    const v2, 0x7f02026c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 142
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6b6

    const v2, 0x7f02039b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 143
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3c3

    const v2, 0x7f0201ac

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 144
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f483

    const v2, 0x7f020245

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 145
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f46b

    const v2, 0x7f02022d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 146
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f46a

    const v2, 0x7f02022c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 147
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f46c

    const v2, 0x7f02022e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 148
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f46d

    const v2, 0x7f02022f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 149
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f48f

    const v2, 0x7f020251

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 150
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f491

    const v2, 0x7f020253

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 151
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f46f

    const v2, 0x7f020231

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 152
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f646

    const v2, 0x7f02035b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 153
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f645

    const v2, 0x7f02035a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 154
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f481

    const v2, 0x7f020243

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 155
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f64b

    const v2, 0x7f020360

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 156
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f486

    const v2, 0x7f020248

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 157
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f487

    const v2, 0x7f020249

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 158
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f485

    const v2, 0x7f020247

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 159
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f470

    const v2, 0x7f020232

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 160
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f64e

    const v2, 0x7f020363

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 161
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f64d

    const v2, 0x7f020362

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 162
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f647

    const v2, 0x7f02035c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 163
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3a9

    const v2, 0x7f020192

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 164
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f451

    const v2, 0x7f020213

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 165
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f452

    const v2, 0x7f020214

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 166
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f45f

    const v2, 0x7f020221

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 167
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f45e

    const v2, 0x7f020220

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 168
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f461

    const v2, 0x7f020223

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 169
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f460

    const v2, 0x7f020222

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 170
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f462

    const v2, 0x7f020224

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 171
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f455

    const v2, 0x7f020217

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 172
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f454

    const v2, 0x7f020216

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 173
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f45a

    const v2, 0x7f02021c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 174
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f457

    const v2, 0x7f020219

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 175
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3bd

    const v2, 0x7f0201a6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 176
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f456

    const v2, 0x7f020218

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 177
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f458

    const v2, 0x7f02021a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 178
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f459

    const v2, 0x7f02021b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 179
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4bc

    const v2, 0x7f02027e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 180
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f45c

    const v2, 0x7f02021e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 181
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f45d

    const v2, 0x7f02021f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 182
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f45b

    const v2, 0x7f02021d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 183
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f453

    const v2, 0x7f020215

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 184
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f380

    const v2, 0x7f020175

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 185
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f302

    const v2, 0x7f02010b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 186
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f484

    const v2, 0x7f020246

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 187
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f49b

    const v2, 0x7f02025d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 188
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f499

    const v2, 0x7f02025b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 189
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f49c

    const v2, 0x7f02025e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 190
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f49a

    const v2, 0x7f02025c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 191
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2764

    const v2, 0x7f02040a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 192
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f494

    const v2, 0x7f020256

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 193
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f497

    const v2, 0x7f020259

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 194
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f493

    const v2, 0x7f020255

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 195
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f495

    const v2, 0x7f020257

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 196
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f496

    const v2, 0x7f020258

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 197
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f49e

    const v2, 0x7f020260

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 198
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f498

    const v2, 0x7f02025a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 199
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f48c

    const v2, 0x7f02024e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 200
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f48b

    const v2, 0x7f02024d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 201
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f48d

    const v2, 0x7f02024f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 202
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f48e

    const v2, 0x7f020250

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 203
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f464

    const v2, 0x7f020226

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 204
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f465

    const v2, 0x7f020227

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 205
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ac

    const v2, 0x7f02026e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 206
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f463

    const v2, 0x7f020225

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 207
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ad

    const v2, 0x7f02026f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 210
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f436

    const v2, 0x7f0201fa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 211
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f43a

    const v2, 0x7f0201fe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 212
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f431

    const v2, 0x7f0201f5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 213
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f42d

    const v2, 0x7f0201f1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 214
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f439

    const v2, 0x7f0201fd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 215
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f430

    const v2, 0x7f0201f4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 216
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f438

    const v2, 0x7f0201fc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 217
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f42f

    const v2, 0x7f0201f3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 218
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f428

    const v2, 0x7f0201ec

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 219
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f43b

    const v2, 0x7f0201ff

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 220
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f437

    const v2, 0x7f0201fb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 221
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f43d

    const v2, 0x7f020201

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 222
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f42e

    const v2, 0x7f0201f2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 223
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f417

    const v2, 0x7f0201db

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 224
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f435

    const v2, 0x7f0201f9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 225
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f412

    const v2, 0x7f0201d6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 226
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f434

    const v2, 0x7f0201f8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 227
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f411

    const v2, 0x7f0201d5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 228
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f418

    const v2, 0x7f0201dc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 229
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f43c

    const v2, 0x7f020200

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 230
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f427

    const v2, 0x7f0201eb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 231
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f426

    const v2, 0x7f0201ea

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 232
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f424

    const v2, 0x7f0201e8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 233
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f425

    const v2, 0x7f0201e9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 234
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f423

    const v2, 0x7f0201e7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 235
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f414

    const v2, 0x7f0201d8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 236
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f40d

    const v2, 0x7f0201d1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 237
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f422

    const v2, 0x7f0201e6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 238
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f41b

    const v2, 0x7f0201df

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 239
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f41d

    const v2, 0x7f0201e1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 240
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f41c

    const v2, 0x7f0201e0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 241
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f41e

    const v2, 0x7f0201e2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 242
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f40c

    const v2, 0x7f0201d0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 243
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f419

    const v2, 0x7f0201dd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 244
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f41a

    const v2, 0x7f0201de

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 245
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f420

    const v2, 0x7f0201e4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 246
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f41f

    const v2, 0x7f0201e3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 247
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f42c

    const v2, 0x7f0201f0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 248
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f433

    const v2, 0x7f0201f7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 249
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f40b

    const v2, 0x7f0201cf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 250
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f404

    const v2, 0x7f0201c8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 251
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f40f

    const v2, 0x7f0201d3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 252
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f400

    const v2, 0x7f0201c4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 253
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f403

    const v2, 0x7f0201c7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 254
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f405

    const v2, 0x7f0201c9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 255
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f407

    const v2, 0x7f0201cb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 256
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f409

    const v2, 0x7f0201cd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 257
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f40e

    const v2, 0x7f0201d2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 258
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f410

    const v2, 0x7f0201d4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 259
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f413

    const v2, 0x7f0201d7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 260
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f415

    const v2, 0x7f0201d9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 261
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f416

    const v2, 0x7f0201da

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 262
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f401

    const v2, 0x7f0201c5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 263
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f402

    const v2, 0x7f0201c6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 264
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f432

    const v2, 0x7f0201f6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 265
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f421

    const v2, 0x7f0201e5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 266
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f40a

    const v2, 0x7f0201ce

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 267
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f42b

    const v2, 0x7f0201ef

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 268
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f42a

    const v2, 0x7f0201ee

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 269
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f406

    const v2, 0x7f0201ca

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 270
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f408

    const v2, 0x7f0201cc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 271
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f429

    const v2, 0x7f0201ed

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 272
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f43e

    const v2, 0x7f020202

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 273
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f490

    const v2, 0x7f020252

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 274
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f338

    const v2, 0x7f020130

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 275
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f337

    const v2, 0x7f02012f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 276
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f340

    const v2, 0x7f020138

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 277
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f339

    const v2, 0x7f020131

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 278
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f33b

    const v2, 0x7f020133

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 279
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f33a

    const v2, 0x7f020132

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 280
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f341

    const v2, 0x7f020139

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 281
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f343

    const v2, 0x7f02013b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 282
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f342

    const v2, 0x7f02013a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 283
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f33f

    const v2, 0x7f020137

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 284
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f33e

    const v2, 0x7f020136

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 285
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f344

    const v2, 0x7f02013c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 286
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f335

    const v2, 0x7f02012e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 287
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f334

    const v2, 0x7f02012d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 288
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f332

    const v2, 0x7f02012b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 289
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f333

    const v2, 0x7f02012c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 290
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f330

    const v2, 0x7f020129

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 291
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f331

    const v2, 0x7f02012a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 292
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f33c

    const v2, 0x7f020134

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 293
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f310

    const v2, 0x7f020119

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 294
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f31e

    const v2, 0x7f020127

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 295
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f31d

    const v2, 0x7f020126

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 296
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f31a

    const v2, 0x7f020123

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 297
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f311

    const v2, 0x7f02011a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 298
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f312

    const v2, 0x7f02011b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 299
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f313

    const v2, 0x7f02011c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 300
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f314

    const v2, 0x7f02011d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 301
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f315

    const v2, 0x7f02011e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 302
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f316

    const v2, 0x7f02011f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 303
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f317

    const v2, 0x7f020120

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 304
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f318

    const v2, 0x7f020121

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 305
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f31c

    const v2, 0x7f020125

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 306
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f31b

    const v2, 0x7f020124

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 307
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f319

    const v2, 0x7f020122

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 308
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f30d

    const v2, 0x7f020116

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 309
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f30e

    const v2, 0x7f020117

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 310
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f30f

    const v2, 0x7f020118

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 311
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f30b

    const v2, 0x7f020114

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 312
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f30c

    const v2, 0x7f020115

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 313
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f320

    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 314
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2b50

    const v2, 0x7f020418

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 315
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2600

    const v2, 0x7f0203c8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 316
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26c5

    const v2, 0x7f0203eb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 317
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2601

    const v2, 0x7f0203c9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 318
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26a1

    const v2, 0x7f0203e5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 319
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2614

    const v2, 0x7f0203cc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 320
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2744

    const v2, 0x7f020402

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 321
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26c4

    const v2, 0x7f0203ea

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 322
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f300

    const v2, 0x7f020109

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 323
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f301

    const v2, 0x7f02010a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 324
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f308

    const v2, 0x7f020111

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 325
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f30a

    const v2, 0x7f020113

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 328
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f38d

    const v2, 0x7f020182

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 329
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f49d

    const v2, 0x7f02025f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 330
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f38e

    const v2, 0x7f020183

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 331
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f392

    const v2, 0x7f020187

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 332
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f393

    const v2, 0x7f020188

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 333
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f38f

    const v2, 0x7f020184

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 334
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f386

    const v2, 0x7f02017b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 335
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f387

    const v2, 0x7f02017c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 336
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f390

    const v2, 0x7f020185

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 337
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f391

    const v2, 0x7f020186

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 338
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f383

    const v2, 0x7f020178

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 339
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f47b

    const v2, 0x7f02023d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 340
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f385

    const v2, 0x7f02017a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 341
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f384

    const v2, 0x7f020179

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 342
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f381

    const v2, 0x7f020176

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 343
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f38b

    const v2, 0x7f020180

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 344
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f389

    const v2, 0x7f02017e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 345
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f38a

    const v2, 0x7f02017f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 346
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f388

    const v2, 0x7f02017d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 347
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f38c

    const v2, 0x7f020181

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 348
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f52e

    const v2, 0x7f0202ec

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 349
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3a5

    const v2, 0x7f02018e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 350
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4f7

    const v2, 0x7f0202b9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 351
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4f9

    const v2, 0x7f0202ba

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 352
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4fc

    const v2, 0x7f0202bd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 353
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4bf

    const v2, 0x7f020281

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 354
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4c0

    const v2, 0x7f020282

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 355
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4bd

    const v2, 0x7f02027f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 356
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4be

    const v2, 0x7f020280

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 357
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4bb

    const v2, 0x7f02027d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 358
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4f1

    const v2, 0x7f0202b3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 359
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x260e

    const v2, 0x7f0203ca

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 360
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4de

    const v2, 0x7f0202a0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 361
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4df

    const v2, 0x7f0202a1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 362
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4e0

    const v2, 0x7f0202a2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 363
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4e1

    const v2, 0x7f0202a3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 364
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4fa

    const v2, 0x7f0202bb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 365
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4fb

    const v2, 0x7f0202bc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 366
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f50a

    const v2, 0x7f0202c8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 367
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f509

    const v2, 0x7f0202c7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 368
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f508

    const v2, 0x7f0202c6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 369
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f507

    const v2, 0x7f0202c5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 370
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f514

    const v2, 0x7f0202d2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 371
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f515

    const v2, 0x7f0202d3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 372
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4e2

    const v2, 0x7f0202a4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 373
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4e3

    const v2, 0x7f0202a5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 374
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x23f3

    const v2, 0x7f0203be

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 375
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x231b

    const v2, 0x7f0203b8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 376
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x23f0

    const v2, 0x7f0203bd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 377
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x231a

    const v2, 0x7f0203b7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 378
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f513

    const v2, 0x7f0202d1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 379
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f512

    const v2, 0x7f0202d0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 380
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f50f

    const v2, 0x7f0202cd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 381
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f510

    const v2, 0x7f0202ce

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 382
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f511

    const v2, 0x7f0202cf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 383
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f50e

    const v2, 0x7f0202cc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 384
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4a1

    const v2, 0x7f020263

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 385
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f526

    const v2, 0x7f0202e4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 386
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f506

    const v2, 0x7f0202c4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 387
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f505

    const v2, 0x7f0202c3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 388
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f50c

    const v2, 0x7f0202ca

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 389
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f50b

    const v2, 0x7f0202c9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 390
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f50d

    const v2, 0x7f0202cb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 391
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6c1

    const v2, 0x7f0203a6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 392
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6c0

    const v2, 0x7f0203a5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 393
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6bf

    const v2, 0x7f0203a4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 394
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6bd

    const v2, 0x7f0203a2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 395
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f527

    const v2, 0x7f0202e5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 396
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f529

    const v2, 0x7f0202e7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 397
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f528

    const v2, 0x7f0202e6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 398
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6aa

    const v2, 0x7f02038f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 399
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6ac

    const v2, 0x7f020391

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 400
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4a3

    const v2, 0x7f020265

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 401
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f52b

    const v2, 0x7f0202e9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 402
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f52a

    const v2, 0x7f0202e8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 403
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f48a

    const v2, 0x7f02024c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 404
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f489

    const v2, 0x7f02024b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 405
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4b0

    const v2, 0x7f020272

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 406
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4b4

    const v2, 0x7f020276

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 407
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4b5

    const v2, 0x7f020277

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 408
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4b7

    const v2, 0x7f020279

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 409
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4b6

    const v2, 0x7f020278

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 410
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4b3

    const v2, 0x7f020275

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 411
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4b8

    const v2, 0x7f02027a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 412
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4f2

    const v2, 0x7f0202b4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 413
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4e7

    const v2, 0x7f0202a9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 414
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4e5

    const v2, 0x7f0202a7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 415
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4e4

    const v2, 0x7f0202a6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 416
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2709

    const v2, 0x7f0203f7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 417
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4e9

    const v2, 0x7f0202ab

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 418
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4e8

    const v2, 0x7f0202aa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 419
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ef

    const v2, 0x7f0202b1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 420
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4eb

    const v2, 0x7f0202ad

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 421
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ea

    const v2, 0x7f0202ac

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 422
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ec

    const v2, 0x7f0202ae

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 423
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ed

    const v2, 0x7f0202af

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 424
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ee

    const v2, 0x7f0202b0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 425
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4e6

    const v2, 0x7f0202a8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 426
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4dd

    const v2, 0x7f02029f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 427
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4c4

    const v2, 0x7f020286

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 428
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4c3

    const v2, 0x7f020285

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 429
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4d1

    const v2, 0x7f020293

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 430
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ca

    const v2, 0x7f02028c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 431
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4c8

    const v2, 0x7f02028a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 432
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4c9

    const v2, 0x7f02028b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 433
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4dc

    const v2, 0x7f02029e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 434
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4cb

    const v2, 0x7f02028d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 435
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4c5

    const v2, 0x7f020287

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 436
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4c6

    const v2, 0x7f020288

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 437
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4c7

    const v2, 0x7f020289

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 438
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4c1

    const v2, 0x7f020283

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 439
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4c2

    const v2, 0x7f020284

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 440
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2702

    const v2, 0x7f0203f4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 441
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4cc

    const v2, 0x7f02028e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 442
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ce

    const v2, 0x7f020290

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 443
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2712

    const v2, 0x7f0203fc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 444
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x270f

    const v2, 0x7f0203fb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 445
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4cf

    const v2, 0x7f020291

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 446
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4d0

    const v2, 0x7f020292

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 447
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4d5

    const v2, 0x7f020297

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 448
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4d7

    const v2, 0x7f020299

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 449
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4d8

    const v2, 0x7f02029a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 450
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4d9

    const v2, 0x7f02029b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 451
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4d3

    const v2, 0x7f020295

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 452
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4d4

    const v2, 0x7f020296

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 453
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4d2

    const v2, 0x7f020294

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 454
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4da

    const v2, 0x7f02029c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 455
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4d6

    const v2, 0x7f020298

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 456
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f516

    const v2, 0x7f0202d4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 457
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4db

    const v2, 0x7f02029d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 458
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f52c

    const v2, 0x7f0202ea

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 459
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f52d

    const v2, 0x7f0202eb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 460
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4f0

    const v2, 0x7f0202b2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 461
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3a8

    const v2, 0x7f020191

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 462
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3ac

    const v2, 0x7f020195

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 463
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3a4

    const v2, 0x7f02018d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 464
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3a7

    const v2, 0x7f020190

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 465
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3bc

    const v2, 0x7f0201a5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 466
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3b5

    const v2, 0x7f02019e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 467
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3b6

    const v2, 0x7f02019f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 468
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3b9

    const v2, 0x7f0201a2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 469
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3bb

    const v2, 0x7f0201a4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 470
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3ba

    const v2, 0x7f0201a3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 471
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3b7

    const v2, 0x7f0201a0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 472
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3b8

    const v2, 0x7f0201a1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 473
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f47e

    const v2, 0x7f020240

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 474
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3ae

    const v2, 0x7f020197

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 475
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f0cf

    const v2, 0x7f0200e0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 476
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3b4

    const v2, 0x7f02019d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 477
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f004

    invoke-virtual {v0, v1, v7}, Landroid/util/SparseIntArray;->put(II)V

    .line 478
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3b2

    const v2, 0x7f02019b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 479
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3af

    const v2, 0x7f020198

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 480
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3c8

    const v2, 0x7f0201b0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 481
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3c0

    const v2, 0x7f0201a9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 482
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26bd

    const v2, 0x7f0203e8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 483
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26be

    const v2, 0x7f0203e9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 484
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3be

    const v2, 0x7f0201a7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 485
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3b1

    const v2, 0x7f02019a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 486
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3c9

    const v2, 0x7f0201b1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 487
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3b3

    const v2, 0x7f02019c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 488
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26f3

    const v2, 0x7f0203f0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 489
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6b5

    const v2, 0x7f02039a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 490
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6b4

    const v2, 0x7f020399

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 491
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3c1

    const v2, 0x7f0201aa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 492
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3c7

    const v2, 0x7f0201af

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 493
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3c6

    const v2, 0x7f0201ae

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 494
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3bf

    const v2, 0x7f0201a8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 495
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3c2

    const v2, 0x7f0201ab

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 496
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3ca

    const v2, 0x7f0201b2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 497
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3c4

    const v2, 0x7f0201ad

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 498
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3a3

    const v2, 0x7f02018c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 499
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2615

    const v2, 0x7f0203cd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 500
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f375

    const v2, 0x7f02016d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 501
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f376

    const v2, 0x7f02016e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 502
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f37c

    const v2, 0x7f020174

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 503
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f37a

    const v2, 0x7f020172

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 504
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f37b

    const v2, 0x7f020173

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 505
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f378

    const v2, 0x7f020170

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 506
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f379

    const v2, 0x7f020171

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 507
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f377

    const v2, 0x7f02016f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 508
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f374

    const v2, 0x7f02016c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 509
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f355

    const v2, 0x7f02014d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 510
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f354

    const v2, 0x7f02014c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 511
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f35f

    const v2, 0x7f020157

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 512
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f357

    const v2, 0x7f02014f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 513
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f356

    const v2, 0x7f02014e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 514
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f35d

    const v2, 0x7f020155

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 515
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f35b

    const v2, 0x7f020153

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 516
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f364

    const v2, 0x7f02015c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 517
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f371

    const v2, 0x7f020169

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 518
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f363

    const v2, 0x7f02015b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 519
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f365

    const v2, 0x7f02015d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 520
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f359

    const v2, 0x7f020151

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 521
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f358

    const v2, 0x7f020150

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 522
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f35a

    const v2, 0x7f020152

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 523
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f35c

    const v2, 0x7f020154

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 524
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f372

    const v2, 0x7f02016a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 525
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f362

    const v2, 0x7f02015a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 526
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f361

    const v2, 0x7f020159

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 527
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f373

    const v2, 0x7f02016b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 528
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f35e

    const v2, 0x7f020156

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 529
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f369

    const v2, 0x7f020161

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 530
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f36e

    const v2, 0x7f020166

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 531
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f366

    const v2, 0x7f02015e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 532
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f368

    const v2, 0x7f020160

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 533
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f367

    const v2, 0x7f02015f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 534
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f382

    const v2, 0x7f020177

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 535
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f370

    const v2, 0x7f020168

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 536
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f36a

    const v2, 0x7f020162

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 537
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f36b

    const v2, 0x7f020163

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 538
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f36c

    const v2, 0x7f020164

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 539
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f36d

    const v2, 0x7f020165

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 540
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f36f

    const v2, 0x7f020167

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 541
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f34e

    const v2, 0x7f020146

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 542
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f34f

    const v2, 0x7f020147

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 543
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f34a

    const v2, 0x7f020142

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 544
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f34b

    const v2, 0x7f020143

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 545
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f352

    const v2, 0x7f02014a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 546
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f347

    const v2, 0x7f02013f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 547
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f349

    const v2, 0x7f020141

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 548
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f353

    const v2, 0x7f02014b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 549
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f351

    const v2, 0x7f020149

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 550
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f348

    const v2, 0x7f020140

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 551
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f34c

    const v2, 0x7f020144

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 552
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f350

    const v2, 0x7f020148

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 553
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f34d

    const v2, 0x7f020145

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 554
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f360

    const v2, 0x7f020158

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 555
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f346

    const v2, 0x7f02013e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 556
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f345

    const v2, 0x7f02013d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 557
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f33d

    const v2, 0x7f020135

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 560
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3e0

    const v2, 0x7f0201b3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 561
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3e1

    const v2, 0x7f0201b4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 562
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3eb

    const v2, 0x7f0201be

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 563
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3e2

    const v2, 0x7f0201b5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 564
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3e3

    const v2, 0x7f0201b6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 565
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3e5

    const v2, 0x7f0201b8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 566
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3e6

    const v2, 0x7f0201b9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 567
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3ea

    const v2, 0x7f0201bd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 568
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3e9

    const v2, 0x7f0201bc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 569
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3e8

    const v2, 0x7f0201bb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 570
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f492

    const v2, 0x7f020254

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 571
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26ea

    const v2, 0x7f0203ee

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 572
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3ec

    const v2, 0x7f0201bf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 573
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3e4

    const v2, 0x7f0201b7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 574
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f307

    const v2, 0x7f020110

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 575
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f306

    const v2, 0x7f02010f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 576
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3ef

    const v2, 0x7f0201c2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 577
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3f0

    const v2, 0x7f0201c3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 578
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26fa

    const v2, 0x7f0203f2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 579
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3ed

    const v2, 0x7f0201c0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 580
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f5fc

    const v2, 0x7f020315

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 581
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f5fe

    const v2, 0x7f020317

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 582
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f5fb

    const v2, 0x7f020314

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 583
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f304

    const v2, 0x7f02010d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 584
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f305

    const v2, 0x7f02010e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 585
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f303

    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 586
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f5fd

    const v2, 0x7f020316

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 587
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f309

    const v2, 0x7f020112

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 588
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3a0

    const v2, 0x7f020189

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 589
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3a1

    const v2, 0x7f02018a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 590
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26f2

    const v2, 0x7f0203ef

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 591
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3a2

    const v2, 0x7f02018b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 592
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6a2

    const v2, 0x7f020387

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 593
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26f5

    const v2, 0x7f0203f1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 594
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6a4

    const v2, 0x7f020389

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 595
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6a3

    const v2, 0x7f020388

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 596
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2693

    const v2, 0x7f0203e3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 597
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f680

    const v2, 0x7f020365

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 598
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2708

    const v2, 0x7f0203f6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 599
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ba

    const v2, 0x7f02027c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 600
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f681

    const v2, 0x7f020366

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 601
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f682

    const v2, 0x7f020367

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 602
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f68a

    const v2, 0x7f02036f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 603
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f689

    const v2, 0x7f02036e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 604
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f69e

    const v2, 0x7f020383

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 605
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f686

    const v2, 0x7f02036b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 606
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f684

    const v2, 0x7f020369

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 607
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f685

    const v2, 0x7f02036a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 608
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f688

    const v2, 0x7f02036d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 609
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f687

    const v2, 0x7f02036c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 610
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f69d

    const v2, 0x7f020382

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 611
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f68b

    const v2, 0x7f020370

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 612
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f683

    const v2, 0x7f020368

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 613
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f68e

    const v2, 0x7f020373

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 614
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f68c

    const v2, 0x7f020371

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 615
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f68d

    const v2, 0x7f020372

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 616
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f699

    const v2, 0x7f02037e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 617
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f698

    const v2, 0x7f02037d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 618
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f697

    const v2, 0x7f02037c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 619
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f695

    const v2, 0x7f02037a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 620
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f696

    const v2, 0x7f02037b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 621
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f69b

    const v2, 0x7f020380

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 622
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f69a

    const v2, 0x7f02037f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 623
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6a8

    const v2, 0x7f02038d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 624
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f693

    const v2, 0x7f020378

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 625
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f694

    const v2, 0x7f020379

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 626
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f692

    const v2, 0x7f020377

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 627
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f691

    const v2, 0x7f020376

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 628
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f690

    const v2, 0x7f020375

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 629
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6b2

    const v2, 0x7f020397

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 630
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6a1

    const v2, 0x7f020386

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 631
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f69f

    const v2, 0x7f020384

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 632
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6a0

    const v2, 0x7f020385

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 633
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f69c

    const v2, 0x7f020381

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 634
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f488

    const v2, 0x7f02024a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 635
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f68f

    const v2, 0x7f020374

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 636
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3ab

    const v2, 0x7f020194

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 637
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6a6

    const v2, 0x7f02038b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 638
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6a5

    const v2, 0x7f02038a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 639
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26a0

    const v2, 0x7f0203e4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 640
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6a7

    const v2, 0x7f02038c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 641
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f530

    const v2, 0x7f0202ee

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 642
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26fd

    const v2, 0x7f0203f3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 643
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3ee

    const v2, 0x7f0201c1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 644
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3b0

    const v2, 0x7f020199

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 645
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2668

    const v2, 0x7f0203e0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 646
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f5ff

    const v2, 0x7f020318

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 647
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3aa

    const v2, 0x7f020193

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 648
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3ad

    const v2, 0x7f020196

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 649
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4cd

    const v2, 0x7f02028f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 650
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6a9

    const v2, 0x7f02038e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 673
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f51f

    const v2, 0x7f0202dd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 674
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f522

    const v2, 0x7f0202e0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 676
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f523

    const v2, 0x7f0202e1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 677
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2b06

    const v2, 0x7f020414

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 678
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2b07

    const v2, 0x7f020415

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 679
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2b05

    const v2, 0x7f020413

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 680
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x27a1

    const v2, 0x7f02040e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 681
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f520

    const v2, 0x7f0202de

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 682
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f521

    const v2, 0x7f0202df

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 683
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f524

    const v2, 0x7f0202e2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 684
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2197

    const v2, 0x7f0203b2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 685
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2196

    const v2, 0x7f0203b1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 686
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2198

    const v2, 0x7f0203b3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 687
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2199

    const v2, 0x7f0203b4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 688
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2194

    const v2, 0x7f0203af

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 689
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2195

    const v2, 0x7f0203b0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 690
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f504

    const v2, 0x7f0202c2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 691
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x25c0

    const v2, 0x7f0203c3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 692
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x25b6

    const v2, 0x7f0203c2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 693
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f53c

    const v2, 0x7f0202fa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 694
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f53d

    const v2, 0x7f0202fb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 695
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x21a9

    const v2, 0x7f0203b5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 696
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x21aa

    const v2, 0x7f0203b6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 697
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2139

    const v2, 0x7f0203ae

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 698
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x23ea

    const v2, 0x7f0203ba

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 699
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x23e9

    const v2, 0x7f0203b9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 700
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x23eb

    const v2, 0x7f0203bb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 701
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x23ec

    const v2, 0x7f0203bc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 702
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2935

    const v2, 0x7f020412

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 703
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2934

    const v2, 0x7f020411

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 704
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f197

    const v2, 0x7f0200ec

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 705
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f500

    const v2, 0x7f0202be

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 706
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f501

    const v2, 0x7f0202bf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 707
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f502

    const v2, 0x7f0202c0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 708
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f195

    const v2, 0x7f0200ea

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 709
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f199

    const v2, 0x7f0200ee

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 710
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f192

    const v2, 0x7f0200e7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 711
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f193

    const v2, 0x7f0200e8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 712
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f196

    const v2, 0x7f0200eb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 713
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4f6

    const v2, 0x7f0202b8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 714
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3a6

    const v2, 0x7f02018f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 715
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f201

    const v2, 0x7f0200fa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 716
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f22f

    const v2, 0x7f0200fd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 717
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f233

    const v2, 0x7f0200ff

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 718
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f235

    const v2, 0x7f020101

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 719
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f234

    const v2, 0x7f020100

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 720
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f232

    const v2, 0x7f0200fe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 721
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f250

    const v2, 0x7f020107

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 722
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f239

    const v2, 0x7f020105

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 723
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f23a

    const v2, 0x7f020106

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 724
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f236

    const v2, 0x7f020102

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 725
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f21a

    const v2, 0x7f0200fc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 726
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6bb

    const v2, 0x7f0203a0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 727
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6b9

    const v2, 0x7f02039e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 728
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6ba

    const v2, 0x7f02039f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 729
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6bc

    const v2, 0x7f0203a1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 730
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6be

    const v2, 0x7f0203a3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 731
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6b0

    const v2, 0x7f020395

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 732
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6ae

    const v2, 0x7f020393

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 733
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f17f

    const v2, 0x7f0200e4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 734
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x267f

    const v2, 0x7f0203e2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 735
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6ad

    const v2, 0x7f020392

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 736
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f237

    const v2, 0x7f020103

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 737
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f238

    const v2, 0x7f020104

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 738
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f202

    const v2, 0x7f0200fb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 739
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x24c2

    const v2, 0x7f0203bf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 740
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6c2

    const v2, 0x7f0203a7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 741
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6c4

    const v2, 0x7f0203a9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 742
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6c5

    const v2, 0x7f0203aa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 743
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6c3

    const v2, 0x7f0203a8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 744
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f251

    const v2, 0x7f020108

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 745
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x3299

    const v2, 0x7f02041d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 746
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x3297

    const v2, 0x7f02041c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 747
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f191

    const v2, 0x7f0200e6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 748
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f198

    const v2, 0x7f0200ed

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 749
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f194

    const v2, 0x7f0200e9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 750
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6ab

    const v2, 0x7f020390

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 751
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f51e

    const v2, 0x7f0202dc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 752
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4f5

    const v2, 0x7f0202b7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 753
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6af

    const v2, 0x7f020394

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 754
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6b1

    const v2, 0x7f020396

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 755
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6b3

    const v2, 0x7f020398

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 756
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6b7

    const v2, 0x7f02039c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 757
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f6b8

    const v2, 0x7f02039d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 758
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26d4

    const v2, 0x7f0203ed

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 759
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2733

    const v2, 0x7f020400

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 760
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2747

    const v2, 0x7f020403

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 761
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x274e

    const v2, 0x7f020405

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 762
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2705

    const v2, 0x7f0203f5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 763
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2734

    const v2, 0x7f020401

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 764
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f49f

    const v2, 0x7f020261

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 765
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f19a

    const v2, 0x7f0200ef

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 766
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4f3

    const v2, 0x7f0202b5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 767
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4f4

    const v2, 0x7f0202b6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 768
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f170

    const v2, 0x7f0200e1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 769
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f171

    const v2, 0x7f0200e2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 770
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f18e

    const v2, 0x7f0200e5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 771
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f17e

    const v2, 0x7f0200e3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 772
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4a0

    const v2, 0x7f020262

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 773
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x27bf

    const v2, 0x7f020410

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 774
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x267b

    const v2, 0x7f0203e1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 775
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2648

    const v2, 0x7f0203d0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 776
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2649

    const v2, 0x7f0203d1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 777
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x264a

    const v2, 0x7f0203d2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 778
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x264b

    const v2, 0x7f0203d3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 779
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x264c

    const v2, 0x7f0203d4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 780
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x264d

    const v2, 0x7f0203d5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 781
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x264e

    const v2, 0x7f0203d6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 782
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x264f

    const v2, 0x7f0203d7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 783
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2650

    const v2, 0x7f0203d8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 784
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2651

    const v2, 0x7f0203d9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 785
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2652

    const v2, 0x7f0203da

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 786
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2653

    const v2, 0x7f0203db

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 787
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26ce

    const v2, 0x7f0203ec

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 788
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f52f

    const v2, 0x7f0202ed

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 789
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f3e7

    const v2, 0x7f0201ba

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 790
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4b9

    const v2, 0x7f02027b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 791
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4b2

    const v2, 0x7f020274

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 792
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4b1

    const v2, 0x7f020273

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 793
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 794
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0xae

    invoke-virtual {v0, v1, v6}, Landroid/util/SparseIntArray;->put(II)V

    .line 795
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2122

    const v2, 0x7f0203ad

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 796
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x274c

    const v2, 0x7f020404

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 797
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x203c

    const v2, 0x7f0203ab

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 798
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2049

    const v2, 0x7f0203ac

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 799
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2757

    const v2, 0x7f020409

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 800
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2753

    const v2, 0x7f020406

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 801
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2755

    const v2, 0x7f020408

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 802
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2754

    const v2, 0x7f020407

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 803
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2b55

    const v2, 0x7f020419

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 804
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f51d

    const v2, 0x7f0202db

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 805
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f51a

    const v2, 0x7f0202d8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 806
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f519

    const v2, 0x7f0202d7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 807
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f51b

    const v2, 0x7f0202d9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 808
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f51c

    const v2, 0x7f0202da

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 809
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f503

    const v2, 0x7f0202c1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 810
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f55b

    const v2, 0x7f020307

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 811
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f567

    const v2, 0x7f020313

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 812
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f550

    const v2, 0x7f0202fc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 813
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f55c

    const v2, 0x7f020308

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 814
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f551

    const v2, 0x7f0202fd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 815
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f55d

    const v2, 0x7f020309

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 816
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f552

    const v2, 0x7f0202fe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 817
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f55e

    const v2, 0x7f02030a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 818
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f553

    const v2, 0x7f0202ff

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 819
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f55f

    const v2, 0x7f02030b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 820
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f554

    const v2, 0x7f020300

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 821
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f560

    const v2, 0x7f02030c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 822
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f555

    const v2, 0x7f020301

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 823
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f556

    const v2, 0x7f020302

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 824
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f557

    const v2, 0x7f020303

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 825
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f558

    const v2, 0x7f020304

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 826
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f559

    const v2, 0x7f020305

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 827
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f55a

    const v2, 0x7f020306

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 828
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f561

    const v2, 0x7f02030d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 829
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f562

    const v2, 0x7f02030e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 830
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f563

    const v2, 0x7f02030f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 831
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f564

    const v2, 0x7f020310

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 832
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f565

    const v2, 0x7f020311

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 833
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f566

    const v2, 0x7f020312

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 834
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2716

    const v2, 0x7f0203fe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 835
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2795

    const v2, 0x7f02040b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 836
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2796

    const v2, 0x7f02040c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 837
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2797

    const v2, 0x7f02040d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 838
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2660

    const v2, 0x7f0203dc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 839
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2665

    const v2, 0x7f0203de

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 840
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2663

    const v2, 0x7f0203dd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 841
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2666

    const v2, 0x7f0203df

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 842
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4ae

    const v2, 0x7f020270

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 843
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f4af

    const v2, 0x7f020271

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 844
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2714

    const v2, 0x7f0203fd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 845
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2611

    const v2, 0x7f0203cb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 846
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f518

    const v2, 0x7f0202d6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 847
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f517

    const v2, 0x7f0202d5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 848
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x27b0

    const v2, 0x7f02040f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 849
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x3030

    const v2, 0x7f02041a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 850
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x303d

    const v2, 0x7f02041b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 851
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f531

    const v2, 0x7f0202ef

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 852
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x25fc

    const v2, 0x7f0203c5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 853
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x25fb

    const v2, 0x7f0203c4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 854
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x25fe

    const v2, 0x7f0203c7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 855
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x25fd

    const v2, 0x7f0203c6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 856
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x25aa

    const v2, 0x7f0203c0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 857
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x25ab

    const v2, 0x7f0203c1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 858
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f53a

    const v2, 0x7f0202f8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 859
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f532

    const v2, 0x7f0202f0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 860
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f533

    const v2, 0x7f0202f1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 861
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26ab

    const v2, 0x7f0203e7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 862
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x26aa

    const v2, 0x7f0203e6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 863
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f534

    const v2, 0x7f0202f2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 864
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f535

    const v2, 0x7f0202f3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 865
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f53b

    const v2, 0x7f0202f9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 866
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2b1c

    const v2, 0x7f020417

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 867
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2b1b

    const v2, 0x7f020416

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 868
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f536

    const v2, 0x7f0202f4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 869
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f537

    const v2, 0x7f0202f5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 870
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f538

    const v2, 0x7f0202f6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 871
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    const v1, 0x1f539

    const v2, 0x7f0202f7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 874
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe001

    const v2, 0x7f020228

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 875
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe002

    const v2, 0x7f020229

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 876
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe003

    const v2, 0x7f02024d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 877
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe004

    const v2, 0x7f02022a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 878
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe005

    const v2, 0x7f02022b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 879
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe006

    const v2, 0x7f020217

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 880
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe007

    const v2, 0x7f020220

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 881
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe008

    const v2, 0x7f0202b9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 882
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe009

    const v2, 0x7f0202a0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 883
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe00a

    const v2, 0x7f0202b3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 884
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe00b

    const v2, 0x7f0202a2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 885
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe00c

    const v2, 0x7f02027d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 886
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe00d

    const v2, 0x7f02020c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 887
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe00e

    const v2, 0x7f02020f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 888
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe00f

    const v2, 0x7f0203ce

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 889
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe010

    const v2, 0x7f0203f8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 890
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe011

    const v2, 0x7f0203fa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 891
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe012

    const v2, 0x7f020360

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 892
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe013

    const v2, 0x7f0201a8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 893
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe014

    const v2, 0x7f0203f0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 894
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe015

    const v2, 0x7f0201a7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 895
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe016

    const v2, 0x7f0203e9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 896
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe017

    const v2, 0x7f0201ad

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 897
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe018

    const v2, 0x7f0203e8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 898
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe019

    const v2, 0x7f02018c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 899
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe01a

    const v2, 0x7f0201f8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 900
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe01b

    const v2, 0x7f02037c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 901
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe01c

    const v2, 0x7f0203f1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 902
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe01d

    const v2, 0x7f0203f6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 903
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe01e

    const v2, 0x7f020368

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 904
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe01f

    const v2, 0x7f02036a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 905
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe020

    const v2, 0x7f020406

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 906
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe021

    const v2, 0x7f020409

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 907
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe022

    const v2, 0x7f02040a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 908
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe023

    const v2, 0x7f020256

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 909
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe024

    const v2, 0x7f0202fc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 910
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe025

    const v2, 0x7f0202fd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 911
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe026

    const v2, 0x7f0202fe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 912
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe027

    const v2, 0x7f0202ff

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 913
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe028

    const v2, 0x7f020300

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 914
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe029

    const v2, 0x7f020301

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 915
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe02a

    const v2, 0x7f020302

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 916
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe02b

    const v2, 0x7f020303

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 917
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe02c

    const v2, 0x7f020304

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 918
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe02d

    const v2, 0x7f020305

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 919
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe02e

    const v2, 0x7f020306

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 920
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe02f

    const v2, 0x7f020307

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 921
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe030

    const v2, 0x7f020130

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 922
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe031

    const v2, 0x7f0202ef

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 923
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe032

    const v2, 0x7f020131

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 924
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe033

    const v2, 0x7f020179

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 925
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe034

    const v2, 0x7f02024f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 926
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe035

    const v2, 0x7f020250

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 927
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe036

    const v2, 0x7f0201b3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 928
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe037

    const v2, 0x7f0203ee

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 929
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe038

    const v2, 0x7f0201b5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 930
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe039

    const v2, 0x7f02036e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 931
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe03a

    const v2, 0x7f0203f3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 932
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe03b

    const v2, 0x7f020314

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 933
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe03c

    const v2, 0x7f02018d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 934
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe03d

    const v2, 0x7f02018e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 935
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe03e

    const v2, 0x7f02019e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 936
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe03f

    const v2, 0x7f0202cf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 937
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe040

    const v2, 0x7f0201a0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 938
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe041

    const v2, 0x7f0201a1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 939
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe042

    const v2, 0x7f0201a3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 940
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe043

    const v2, 0x7f02016c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 941
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe044

    const v2, 0x7f02016f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 942
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe045

    const v2, 0x7f0203cd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 943
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe046

    const v2, 0x7f020168

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 944
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe047

    const v2, 0x7f020172

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 945
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe048

    const v2, 0x7f0203ea

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 946
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe049

    const v2, 0x7f0203c9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 947
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe04a

    const v2, 0x7f0203c8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 948
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe04b

    const v2, 0x7f0203cc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 949
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe04c

    const v2, 0x7f02011c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 950
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe04d

    const v2, 0x7f02010d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 951
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe04e

    const v2, 0x7f02023e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 952
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe04f

    const v2, 0x7f0201f5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 953
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe050

    const v2, 0x7f0201f3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 954
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe051

    const v2, 0x7f0201ff

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 955
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe052

    const v2, 0x7f0201ed

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 956
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe053

    const v2, 0x7f0201f1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 957
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe054

    const v2, 0x7f0201f7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 958
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe055

    const v2, 0x7f0201eb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 959
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe056

    const v2, 0x7f020323

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 960
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe057

    const v2, 0x7f02031c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 961
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe058

    const v2, 0x7f020337

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 962
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe059

    const v2, 0x7f020339

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 963
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe05a

    const v2, 0x7f02026b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 964
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe101

    const v2, 0x7f0202ac

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 965
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe102

    const v2, 0x7f0202b0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 966
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe103

    const v2, 0x7f0202a9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 967
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe104

    const v2, 0x7f0202b4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 968
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe105

    const v2, 0x7f020335

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 969
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe106

    const v2, 0x7f020326

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 970
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe107

    const v2, 0x7f02034a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 971
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe108

    const v2, 0x7f02032c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 972
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe109

    const v2, 0x7f0201f9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 973
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe10a

    const v2, 0x7f0201dd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 974
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe10b

    const v2, 0x7f0201fb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 975
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe10c

    const v2, 0x7f02023f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 976
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe10d

    const v2, 0x7f020365

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 977
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe10e

    const v2, 0x7f020213

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 978
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe10f

    const v2, 0x7f020263

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 979
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe110

    const v2, 0x7f02012a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 980
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe111

    const v2, 0x7f020251

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 981
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe112

    const v2, 0x7f020176

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 982
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe113

    const v2, 0x7f0202e9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 983
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe114

    const v2, 0x7f0202cb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 984
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe115

    const v2, 0x7f0201ac

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 985
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe116

    const v2, 0x7f0202e6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 986
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe117

    const v2, 0x7f02017b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 987
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe118

    const v2, 0x7f020139

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 988
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe119

    const v2, 0x7f02013a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 989
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe11a

    const v2, 0x7f020241

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 990
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe11b

    const v2, 0x7f02023d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 991
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe11c

    const v2, 0x7f020242

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 992
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe11d

    const v2, 0x7f0202e3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 993
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe11e

    const v2, 0x7f02027e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 994
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe11f

    const v2, 0x7f02027c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 995
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe120

    const v2, 0x7f02014c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 996
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe121

    const v2, 0x7f0203ef

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 997
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe122

    const v2, 0x7f0203f2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 998
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe123

    const v2, 0x7f0203e0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 999
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe124

    const v2, 0x7f02018a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1000
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe125

    const v2, 0x7f020194

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1001
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe126

    const v2, 0x7f020281

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1002
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe127

    const v2, 0x7f020282

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1003
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe128

    const v2, 0x7f0202bc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1004
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe129

    const v2, 0x7f0202bd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1005
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe12a

    const v2, 0x7f0202bb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1006
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe12b

    const v2, 0x7f020240

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1007
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe12c

    const v2, 0x7f02041b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1008
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe12d

    invoke-virtual {v0, v1, v7}, Landroid/util/SparseIntArray;->put(II)V

    .line 1009
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe12e

    const v2, 0x7f0200ef

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1010
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe12f

    const v2, 0x7f020272

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1011
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe130

    const v2, 0x7f020198

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1012
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe131

    const v2, 0x7f0201ae

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1013
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe132

    const v2, 0x7f0201aa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1014
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe133

    const v2, 0x7f020199

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1015
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe134

    const v2, 0x7f0201d2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1016
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe135

    const v2, 0x7f020389

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1017
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe136

    const v2, 0x7f020397

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1018
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe137

    const v2, 0x7f02038c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1019
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe138

    const v2, 0x7f02039e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1020
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe139

    const v2, 0x7f02039f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1021
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe13a

    const v2, 0x7f0203a1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1022
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe13b

    const v2, 0x7f02024b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1023
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe13c

    const v2, 0x7f020266

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1024
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe13d

    const v2, 0x7f0203e5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1025
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe13e

    const v2, 0x7f020222

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1026
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe13f

    const v2, 0x7f0203a5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1027
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe140

    const v2, 0x7f0203a2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1028
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe141

    const v2, 0x7f0202c8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1029
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe142

    const v2, 0x7f0202a4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1030
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe143

    const v2, 0x7f020181

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1031
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe144

    const v2, 0x7f0202cd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1032
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe145

    const v2, 0x7f0202d1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1033
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe146

    const v2, 0x7f02010f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1034
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe147

    const v2, 0x7f02016b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1035
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe148

    const v2, 0x7f020289

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1036
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe149

    const v2, 0x7f020273

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1037
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe14a

    const v2, 0x7f02027b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1038
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe14b

    const v2, 0x7f0202a3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1039
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe14c

    const v2, 0x7f02026c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1040
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe14d

    const v2, 0x7f0201b9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1041
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe14e

    const v2, 0x7f02038a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1042
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe14f

    const v2, 0x7f0200e4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1043
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe150

    const v2, 0x7f020374

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1044
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe151

    const v2, 0x7f0203a0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1045
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe152

    const v2, 0x7f020230

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1046
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe153

    const v2, 0x7f0201b6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1047
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe154

    const v2, 0x7f0201ba

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1048
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe155

    const v2, 0x7f0201b8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1049
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe156

    const v2, 0x7f0201bd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1050
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe157

    const v2, 0x7f0201be

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1051
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe158

    const v2, 0x7f0201bb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1052
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe159

    const v2, 0x7f020371

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1053
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe15a

    const v2, 0x7f02037a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1054
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe201

    const v2, 0x7f02039b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1055
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe202

    const v2, 0x7f020387

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1056
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe203

    const v2, 0x7f0200fa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1057
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe204

    const v2, 0x7f020261

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1058
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe205

    const v2, 0x7f020401

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1059
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe206

    const v2, 0x7f020400

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1060
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe207

    const v2, 0x7f0202dc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1061
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe208

    const v2, 0x7f020392

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1062
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe209

    const v2, 0x7f0202ee

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1063
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe20a

    const v2, 0x7f0203e2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1064
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe20b

    const v2, 0x7f0202b8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1065
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe20c

    const v2, 0x7f0203de

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1066
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe20d

    const v2, 0x7f0203df

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1067
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe20e

    const v2, 0x7f0203dc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1068
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe20f

    const v2, 0x7f0203dd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1069
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe210

    const v2, 0x7f0200d2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1070
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe211

    const v2, 0x7f020410

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1071
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe212

    const v2, 0x7f0200ea

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1072
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe213

    const v2, 0x7f0200ee

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1073
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe214

    const v2, 0x7f0200e7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1074
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe215

    const v2, 0x7f020102

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1075
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe216

    const v2, 0x7f0200fc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1076
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe217

    const v2, 0x7f020103

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1077
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe218

    const v2, 0x7f020104

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1078
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe219

    const v2, 0x7f0202f2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1079
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe21a

    const v2, 0x7f0202f0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1080
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe21b

    const v2, 0x7f0202f1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1081
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe21c

    const v2, 0x7f0200d4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1082
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe21d

    const v2, 0x7f0200d5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1083
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe21e

    const v2, 0x7f0200d6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1084
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe21f

    const v2, 0x7f0200d7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1085
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe220

    const v2, 0x7f0200d8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1086
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe221

    const v2, 0x7f0200d9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1087
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe222

    const v2, 0x7f0200da

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1088
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe223

    const v2, 0x7f0200db

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1089
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe224

    const v2, 0x7f0200dc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1090
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe225

    const v2, 0x7f0200d3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1091
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe226

    const v2, 0x7f020107

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1092
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe227

    const v2, 0x7f020105

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1093
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe228

    const v2, 0x7f0200fb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1094
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe229

    const v2, 0x7f0200e9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1095
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe22a

    const v2, 0x7f020101

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1096
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe22b

    const v2, 0x7f0200ff

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1097
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe22c

    const v2, 0x7f0200fd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1098
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe22d

    const v2, 0x7f020106

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1099
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe22e

    const v2, 0x7f020208

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1100
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe22f

    const v2, 0x7f020209

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1101
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe230

    const v2, 0x7f02020a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1102
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe231

    const v2, 0x7f02020b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1103
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe232

    const v2, 0x7f020414

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1104
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe233

    const v2, 0x7f020415

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1105
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe234

    const v2, 0x7f02040e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1106
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe235

    const v2, 0x7f0202d7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1107
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe236

    const v2, 0x7f0203b2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1108
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe237

    const v2, 0x7f0203b1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1109
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe238

    const v2, 0x7f0203b3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1110
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe239

    const v2, 0x7f0203b4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1111
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe23a

    const v2, 0x7f0203c2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1112
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe23b

    const v2, 0x7f0203c3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1113
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe23c

    const v2, 0x7f0203b9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1114
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe23d

    const v2, 0x7f0203ba

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1115
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe23e

    const v2, 0x7f0202ec

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1116
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe23f

    const v2, 0x7f0203d0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1117
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe240

    const v2, 0x7f0203d1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1118
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe241

    const v2, 0x7f0203d2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1119
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe242

    const v2, 0x7f0203d3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1120
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe243

    const v2, 0x7f0203d4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1121
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe244

    const v2, 0x7f0203d5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1122
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe245

    const v2, 0x7f0203d6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1123
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe246

    const v2, 0x7f0203d7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1124
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe247

    const v2, 0x7f0203d8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1125
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe248

    const v2, 0x7f0203d9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1126
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe249

    const v2, 0x7f0203da

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1127
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe24a

    const v2, 0x7f0203db

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1128
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe24b

    const v2, 0x7f0203ec

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1129
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe24c

    const v2, 0x7f0202db

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1130
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe24d

    const v2, 0x7f0200ec

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1131
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe24e

    invoke-virtual {v0, v1, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 1132
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe24f

    invoke-virtual {v0, v1, v6}, Landroid/util/SparseIntArray;->put(II)V

    .line 1133
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe250

    const v2, 0x7f0202b5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1134
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe251

    const v2, 0x7f0202b6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1135
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe252

    const v2, 0x7f0203e4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1136
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe253

    const v2, 0x7f020243

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1137
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe301

    const v2, 0x7f020285

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1138
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe302

    const v2, 0x7f020216

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1139
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe303

    const v2, 0x7f020132

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1140
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe304

    const v2, 0x7f02012f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1141
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe305

    const v2, 0x7f020133

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1142
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe306

    const v2, 0x7f020252

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1143
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe307

    const v2, 0x7f02012d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1144
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe308

    const v2, 0x7f02012e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1145
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe309

    const v2, 0x7f0203a3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1146
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe30a

    const v2, 0x7f020190

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1147
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe30b

    const v2, 0x7f02016e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1148
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe30c

    const v2, 0x7f020173

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1149
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe30d

    const v2, 0x7f02041c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1150
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe30e

    const v2, 0x7f020391

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1151
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe30f

    const v2, 0x7f02024c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1152
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe310

    const v2, 0x7f02017d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1153
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe311

    const v2, 0x7f020265

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1154
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe312

    const v2, 0x7f02017e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1155
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe313

    const v2, 0x7f0203f4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1156
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe314

    const v2, 0x7f020175

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1157
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe315

    const v2, 0x7f02041d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1158
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe316

    const v2, 0x7f02027f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1159
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe317

    const v2, 0x7f0202a5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1160
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe318

    const v2, 0x7f020214

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1161
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe319

    const v2, 0x7f020219

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1162
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe31a

    const v2, 0x7f020223

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1163
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe31b

    const v2, 0x7f020224

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1164
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe31c

    const v2, 0x7f020246

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1165
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe31d

    const v2, 0x7f020247

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1166
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe31e

    const v2, 0x7f020248

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1167
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe31f

    const v2, 0x7f020249

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1168
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe320

    const v2, 0x7f02024a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1169
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe321

    const v2, 0x7f02021a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1170
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe322

    const v2, 0x7f02021b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1171
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe323

    const v2, 0x7f02021e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1172
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe324

    const v2, 0x7f020195

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1173
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe325

    const v2, 0x7f0202d2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1174
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe326

    const v2, 0x7f02019f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1175
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe327

    const v2, 0x7f020255

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1176
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe328

    const v2, 0x7f02024e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1177
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe329

    const v2, 0x7f02025a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1178
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe32a

    const v2, 0x7f02025b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1179
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe32b

    const v2, 0x7f02025c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1180
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe32c

    const v2, 0x7f02025d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1181
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe32d

    const v2, 0x7f02025e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1182
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe32e

    const v2, 0x7f0203ff

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1183
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe32f

    const v2, 0x7f020418

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1184
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe330

    const v2, 0x7f02026a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1185
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe331

    const v2, 0x7f020268

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1186
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe332

    const v2, 0x7f020419

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1187
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe333

    const v2, 0x7f0203fe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1188
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe334

    const v2, 0x7f020264

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1189
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe335

    const v2, 0x7f020128

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1190
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe336

    const v2, 0x7f020407

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1191
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe337

    const v2, 0x7f020408

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1192
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe338

    const v2, 0x7f02016d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1193
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe339

    const v2, 0x7f020156

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1194
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe33a

    const v2, 0x7f02015e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1195
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe33b

    const v2, 0x7f020157

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1196
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe33c

    const v2, 0x7f020159

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1197
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe33d

    const v2, 0x7f020150

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1198
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe33e

    const v2, 0x7f020152

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1199
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe33f

    const v2, 0x7f020155

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1200
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe340

    const v2, 0x7f020154

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1201
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe341

    const v2, 0x7f020153

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1202
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe342

    const v2, 0x7f020151

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1203
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe343

    const v2, 0x7f02015a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1204
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe344

    const v2, 0x7f02015b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1205
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe345

    const v2, 0x7f020146

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1206
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe346

    const v2, 0x7f020142

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1207
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe347

    const v2, 0x7f02014b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1208
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe348

    const v2, 0x7f020141

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1209
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe349

    const v2, 0x7f02013d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1210
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe34a

    const v2, 0x7f02013e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1211
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe34b

    const v2, 0x7f020177

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1212
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe34c

    const v2, 0x7f020169

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1213
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe34d

    const v2, 0x7f02016a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1214
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe401

    const v2, 0x7f02033e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1215
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe402

    const v2, 0x7f020328

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1216
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe403

    const v2, 0x7f02032d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1217
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe404

    const v2, 0x7f02031a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1218
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe405

    const v2, 0x7f020322

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1219
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe406

    const v2, 0x7f02033c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1220
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe407

    const v2, 0x7f02032f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1221
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe408

    const v2, 0x7f020343

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1222
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe409

    const v2, 0x7f020207

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1223
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe40a

    const v2, 0x7f02031f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1224
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe40b

    const v2, 0x7f020341

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1225
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe40c

    const v2, 0x7f020350

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1226
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe40d

    const v2, 0x7f02034c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1227
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe40e

    const v2, 0x7f02032b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1228
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe40f

    const v2, 0x7f020349

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1229
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe410

    const v2, 0x7f02034b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1230
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe411

    const v2, 0x7f020346

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1231
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe412

    const v2, 0x7f02031b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1232
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe413

    const v2, 0x7f02033b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1233
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe414

    const v2, 0x7f0203cf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1234
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe415

    const v2, 0x7f02031e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1235
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe416

    const v2, 0x7f02033a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1236
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe417

    const v2, 0x7f020333

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1237
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe418

    const v2, 0x7f020331

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1238
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe419

    const v2, 0x7f020203

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1239
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe41a

    const v2, 0x7f020205

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1240
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe41b

    const v2, 0x7f020204

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1241
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe41c

    const v2, 0x7f020206

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1242
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe41d

    const v2, 0x7f020364

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1243
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe41e

    const v2, 0x7f02020d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1244
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe41f

    const v2, 0x7f020211

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1245
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe420

    const v2, 0x7f02020e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1246
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe421

    const v2, 0x7f020210

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1247
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe422

    const v2, 0x7f020212

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1248
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe423

    const v2, 0x7f02035a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1249
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe424

    const v2, 0x7f02035b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1250
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe425

    const v2, 0x7f020253

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1251
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe426

    const v2, 0x7f02035c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1252
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe427

    const v2, 0x7f020361

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1253
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe428

    const v2, 0x7f02022d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1254
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe429

    const v2, 0x7f020231

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1255
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe42a

    const v2, 0x7f0201a9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1256
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe42b

    const v2, 0x7f0201b0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1257
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe42c

    const v2, 0x7f02019a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1258
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe42d

    const v2, 0x7f0201b2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1259
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe42e

    const v2, 0x7f02037e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1260
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe42f

    const v2, 0x7f02037f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1261
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe430

    const v2, 0x7f020377

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1262
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe431

    const v2, 0x7f020376

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1263
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe432

    const v2, 0x7f020378

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1264
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe433

    const v2, 0x7f02018b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1265
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe434

    const v2, 0x7f02036c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1266
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe435

    const v2, 0x7f020369

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1267
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe436

    const v2, 0x7f020182

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1268
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe437

    const v2, 0x7f02025f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1269
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe438

    const v2, 0x7f020183

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1270
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe439

    const v2, 0x7f020188

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1271
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe43a

    const v2, 0x7f020187

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1272
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe43b

    const v2, 0x7f020184

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1273
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe43c

    const v2, 0x7f02010b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1274
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe43d

    const v2, 0x7f020254

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1275
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe43e

    const v2, 0x7f020113

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1276
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe43f

    const v2, 0x7f02015f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1277
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe440

    const v2, 0x7f02017c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1278
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe441

    const v2, 0x7f0201de

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1279
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe442

    const v2, 0x7f020185

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1280
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe443

    const v2, 0x7f020109

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1281
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe444

    const v2, 0x7f020136

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1282
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe445

    const v2, 0x7f020178

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1283
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe446

    const v2, 0x7f020186

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1284
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe447

    const v2, 0x7f02013b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1285
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe448

    const v2, 0x7f02017a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1286
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe449

    const v2, 0x7f02010e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1287
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe44a

    const v2, 0x7f020110

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1288
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    invoke-virtual {v0, v4, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 1289
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0x7f020115

    invoke-virtual {v0, v4, v1}, Landroid/util/SparseIntArray;->put(II)V

    .line 1290
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe44c

    const v2, 0x7f020111

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1291
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe501

    const v2, 0x7f0201bc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1292
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe502

    const v2, 0x7f020191

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1293
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe503

    const v2, 0x7f020192

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1294
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe504

    const v2, 0x7f0201bf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1295
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe505

    const v2, 0x7f0201c2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1296
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe506

    const v2, 0x7f0201c3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1297
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe507

    const v2, 0x7f02018f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1298
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe508

    const v2, 0x7f0201c0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1299
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe509

    const v2, 0x7f020315

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1300
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe50b

    const v2, 0x7f0200f6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1301
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe50c

    const v2, 0x7f0200f9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1302
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe50d

    const v2, 0x7f0200f3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1303
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe50e

    const v2, 0x7f0200f1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1304
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe50f

    const v2, 0x7f0200f5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1305
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe510

    const v2, 0x7f0200f4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1306
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe511

    const v2, 0x7f0200f2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1307
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe512

    const v2, 0x7f0200f8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1308
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe513

    const v2, 0x7f0200f0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1309
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe514

    const v2, 0x7f0200f7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1310
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe515

    const v2, 0x7f020233

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1311
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe516

    const v2, 0x7f020234

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1312
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe517

    const v2, 0x7f020235

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1313
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe518

    const v2, 0x7f020236

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1314
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe519

    const v2, 0x7f020237

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1315
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe51a

    const v2, 0x7f020238

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1316
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe51b

    const v2, 0x7f020239

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1317
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe51c

    const v2, 0x7f02023a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1318
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe51d

    const v2, 0x7f020316

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1319
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe51e

    const v2, 0x7f020244

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1320
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe51f

    const v2, 0x7f020245

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1321
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe520

    const v2, 0x7f0201f0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1322
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe521

    const v2, 0x7f0201ea

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1323
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe522

    const v2, 0x7f0201e4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1324
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe523

    const v2, 0x7f0201e7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1325
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe524

    const v2, 0x7f0201fd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1326
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe525

    const v2, 0x7f0201df

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1327
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe526

    const v2, 0x7f0201dc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1328
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe527

    const v2, 0x7f0201ec

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1329
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe528

    const v2, 0x7f0201d6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1330
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe529

    const v2, 0x7f0201d5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1331
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe52a

    const v2, 0x7f0201fe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1332
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe52b

    const v2, 0x7f0201f2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1333
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe52c

    const v2, 0x7f0201f4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1334
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe52d

    const v2, 0x7f0201d1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1335
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe52e

    const v2, 0x7f0201d8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1336
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe52f

    const v2, 0x7f0201db

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1337
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe530

    const v2, 0x7f0201ef

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1338
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe531

    const v2, 0x7f0201fc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1339
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe532

    const v2, 0x7f0200e1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1340
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe533

    const v2, 0x7f0200e2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1341
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe534

    const v2, 0x7f0200e5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1342
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe535

    const v2, 0x7f0200e3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1343
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe536

    const v2, 0x7f020202

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1344
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    const v1, 0xe537

    const v2, 0x7f0203ad

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 1345
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addEmojis(Landroid/content/Context;Landroid/text/Spannable;I)V
    .locals 20
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "text"    # Landroid/text/Spannable;
    .param p2, "emojiSize"    # I

    .prologue
    .line 1368
    invoke-interface/range {p1 .. p1}, Landroid/text/Spannable;->length()I

    move-result v10

    .line 1369
    .local v10, "length":I
    const/16 v17, 0x0

    const-class v18, Lcom/pccw/sms/emoji/EmojiIconSpan;

    move-object/from16 v0, p1

    move/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v10, v2}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Lcom/pccw/sms/emoji/EmojiIconSpan;

    .line 1370
    .local v11, "oldSpans":[Lcom/pccw/sms/emoji/EmojiIconSpan;
    array-length v0, v11

    move/from16 v18, v0

    const/16 v17, 0x0

    :goto_0
    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_0

    aget-object v14, v11, v17

    .line 1371
    .local v14, "span":Lcom/pccw/sms/emoji/EmojiIconSpan;
    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    .line 1370
    add-int/lit8 v17, v17, 0x1

    goto :goto_0

    .line 1378
    .end local v14    # "span":Lcom/pccw/sms/emoji/EmojiIconSpan;
    :cond_0
    const/4 v13, 0x0

    .line 1379
    .local v13, "skip":I
    new-instance v4, Landroid/text/SpannableStringBuilder;

    invoke-direct {v4}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 1381
    .local v4, "buffer":Landroid/text/SpannableStringBuilder;
    const/16 v16, 0x0

    .local v16, "z":I
    :goto_1
    move/from16 v0, v16

    if-ge v0, v10, :cond_3

    .line 1382
    const/4 v13, 0x0

    .line 1383
    const/4 v9, 0x0

    .line 1384
    .local v9, "icon":I
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-interface {v0, v1}, Landroid/text/Spannable;->charAt(I)C

    move-result v5

    .line 1386
    .local v5, "c":C
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-static {v0, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v15

    .line 1387
    .local v15, "unicode":I
    invoke-static {v15}, Ljava/lang/Character;->charCount(I)I

    move-result v13

    .line 1389
    const/16 v17, 0xff

    move/from16 v0, v17

    if-le v15, v0, :cond_2

    .line 1393
    move-object/from16 v0, p0

    invoke-static {v0, v15}, Lcom/pccw/sms/emoji/EmojiconHandler;->getEmojiResource(Landroid/content/Context;I)I

    move-result v9

    .line 1394
    if-nez v9, :cond_1

    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v13, v0, :cond_1

    .line 1381
    :goto_2
    add-int v16, v16, v13

    goto :goto_1

    .line 1401
    :cond_1
    add-int v17, v16, v13

    move-object/from16 v0, p1

    move/from16 v1, v16

    move/from16 v2, v17

    invoke-interface {v0, v1, v2}, Landroid/text/Spannable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v12

    .line 1402
    .local v12, "s":Ljava/lang/String;
    invoke-virtual {v4, v12}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_2

    .line 1408
    .end local v12    # "s":Ljava/lang/String;
    :cond_2
    add-int/lit8 v17, v16, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v16

    move/from16 v2, v17

    invoke-interface {v0, v1, v2}, Landroid/text/Spannable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v12

    .line 1409
    .restart local v12    # "s":Ljava/lang/String;
    invoke-virtual {v4, v12}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_2

    .line 1422
    .end local v5    # "c":C
    .end local v9    # "icon":I
    .end local v12    # "s":Ljava/lang/String;
    .end local v15    # "unicode":I
    :cond_3
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_3
    if-ge v8, v10, :cond_14

    .line 1423
    const/4 v13, 0x0

    .line 1424
    const/4 v9, 0x0

    .line 1425
    .restart local v9    # "icon":I
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Landroid/text/Spannable;->charAt(I)C

    move-result v5

    .line 1427
    .restart local v5    # "c":C
    invoke-static {v5}, Lcom/pccw/sms/emoji/EmojiconHandler;->isSoftBankEmoji(C)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 1428
    invoke-static {v5}, Lcom/pccw/sms/emoji/EmojiconHandler;->getSoftbankEmojiResource(C)I

    move-result v9

    .line 1429
    if-nez v9, :cond_8

    const/4 v13, 0x0

    .line 1432
    :cond_4
    :goto_4
    if-nez v9, :cond_6

    .line 1434
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v15

    .line 1435
    .restart local v15    # "unicode":I
    invoke-static {v15}, Ljava/lang/Character;->charCount(I)I

    move-result v13

    .line 1437
    const/16 v17, 0xff

    move/from16 v0, v17

    if-le v15, v0, :cond_5

    .line 1439
    move-object/from16 v0, p0

    invoke-static {v0, v15}, Lcom/pccw/sms/emoji/EmojiconHandler;->getEmojiResource(Landroid/content/Context;I)I

    move-result v9

    .line 1442
    :cond_5
    if-nez v9, :cond_6

    add-int v17, v8, v13

    move/from16 v0, v17

    if-ge v0, v10, :cond_6

    .line 1443
    add-int v17, v8, v13

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v7

    .line 1444
    .local v7, "followUnicode":I
    const/16 v17, 0x20e3

    move/from16 v0, v17

    if-ne v7, v0, :cond_9

    .line 1445
    invoke-static {v7}, Ljava/lang/Character;->charCount(I)I

    move-result v6

    .line 1446
    .local v6, "followSkip":I
    packed-switch v15, :pswitch_data_0

    .line 1481
    :pswitch_0
    const/4 v6, 0x0

    .line 1484
    :goto_5
    add-int/2addr v13, v6

    .line 1527
    .end local v6    # "followSkip":I
    .end local v7    # "followUnicode":I
    .end local v15    # "unicode":I
    :cond_6
    :goto_6
    if-lez v9, :cond_7

    .line 1528
    new-instance v17, Lcom/pccw/sms/emoji/EmojiIconSpan;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move/from16 v2, p2

    invoke-direct {v0, v1, v9, v2}, Lcom/pccw/sms/emoji/EmojiIconSpan;-><init>(Landroid/content/Context;II)V

    add-int v18, v8, v13

    const/16 v19, 0x21

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-interface {v0, v1, v8, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1422
    :cond_7
    add-int/2addr v8, v13

    goto :goto_3

    .line 1429
    :cond_8
    const/4 v13, 0x1

    goto :goto_4

    .line 1448
    .restart local v6    # "followSkip":I
    .restart local v7    # "followUnicode":I
    .restart local v15    # "unicode":I
    :pswitch_1
    const v9, 0x7f0200d4

    .line 1449
    goto :goto_5

    .line 1451
    :pswitch_2
    const v9, 0x7f0200d5

    .line 1452
    goto :goto_5

    .line 1454
    :pswitch_3
    const v9, 0x7f0200d6

    .line 1455
    goto :goto_5

    .line 1457
    :pswitch_4
    const v9, 0x7f0200d7

    .line 1458
    goto :goto_5

    .line 1460
    :pswitch_5
    const v9, 0x7f0200d8

    .line 1461
    goto :goto_5

    .line 1463
    :pswitch_6
    const v9, 0x7f0200d9

    .line 1464
    goto :goto_5

    .line 1466
    :pswitch_7
    const v9, 0x7f0200da

    .line 1467
    goto :goto_5

    .line 1469
    :pswitch_8
    const v9, 0x7f0200db

    .line 1470
    goto :goto_5

    .line 1472
    :pswitch_9
    const v9, 0x7f0200dc

    .line 1473
    goto :goto_5

    .line 1475
    :pswitch_a
    const v9, 0x7f0200d3

    .line 1476
    goto :goto_5

    .line 1478
    :pswitch_b
    const v9, 0x7f0200d2

    .line 1479
    goto :goto_5

    .line 1486
    .end local v6    # "followSkip":I
    :cond_9
    invoke-static {v7}, Ljava/lang/Character;->charCount(I)I

    move-result v6

    .line 1487
    .restart local v6    # "followSkip":I
    packed-switch v15, :pswitch_data_1

    .line 1519
    :pswitch_c
    const/4 v6, 0x0

    .line 1522
    :goto_7
    add-int/2addr v13, v6

    goto :goto_6

    .line 1489
    :pswitch_d
    const v17, 0x1f1f5

    move/from16 v0, v17

    if-ne v7, v0, :cond_a

    const v9, 0x7f0200f6

    .line 1490
    :goto_8
    goto :goto_7

    .line 1489
    :cond_a
    const/4 v9, 0x0

    goto :goto_8

    .line 1492
    :pswitch_e
    const v17, 0x1f1f8

    move/from16 v0, v17

    if-ne v7, v0, :cond_b

    const v9, 0x7f0200f9

    .line 1493
    :goto_9
    goto :goto_7

    .line 1492
    :cond_b
    const/4 v9, 0x0

    goto :goto_9

    .line 1495
    :pswitch_f
    const v17, 0x1f1f7

    move/from16 v0, v17

    if-ne v7, v0, :cond_c

    const v9, 0x7f0200f3

    .line 1496
    :goto_a
    goto :goto_7

    .line 1495
    :cond_c
    const/4 v9, 0x0

    goto :goto_a

    .line 1498
    :pswitch_10
    const v17, 0x1f1ea

    move/from16 v0, v17

    if-ne v7, v0, :cond_d

    const v9, 0x7f0200f1

    .line 1499
    :goto_b
    goto :goto_7

    .line 1498
    :cond_d
    const/4 v9, 0x0

    goto :goto_b

    .line 1501
    :pswitch_11
    const v17, 0x1f1f9

    move/from16 v0, v17

    if-ne v7, v0, :cond_e

    const v9, 0x7f0200f5

    .line 1502
    :goto_c
    goto :goto_7

    .line 1501
    :cond_e
    const/4 v9, 0x0

    goto :goto_c

    .line 1504
    :pswitch_12
    const v17, 0x1f1e7

    move/from16 v0, v17

    if-ne v7, v0, :cond_f

    const v9, 0x7f0200f4

    .line 1505
    :goto_d
    goto :goto_7

    .line 1504
    :cond_f
    const/4 v9, 0x0

    goto :goto_d

    .line 1507
    :pswitch_13
    const v17, 0x1f1f8

    move/from16 v0, v17

    if-ne v7, v0, :cond_10

    const v9, 0x7f0200f2

    .line 1508
    :goto_e
    goto :goto_7

    .line 1507
    :cond_10
    const/4 v9, 0x0

    goto :goto_e

    .line 1510
    :pswitch_14
    const v17, 0x1f1fa

    move/from16 v0, v17

    if-ne v7, v0, :cond_11

    const v9, 0x7f0200f8

    .line 1511
    :goto_f
    goto :goto_7

    .line 1510
    :cond_11
    const/4 v9, 0x0

    goto :goto_f

    .line 1513
    :pswitch_15
    const v17, 0x1f1f3

    move/from16 v0, v17

    if-ne v7, v0, :cond_12

    const v9, 0x7f0200f0

    .line 1514
    :goto_10
    goto :goto_7

    .line 1513
    :cond_12
    const/4 v9, 0x0

    goto :goto_10

    .line 1516
    :pswitch_16
    const v17, 0x1f1f7

    move/from16 v0, v17

    if-ne v7, v0, :cond_13

    const v9, 0x7f0200f7

    .line 1517
    :goto_11
    goto/16 :goto_7

    .line 1516
    :cond_13
    const/4 v9, 0x0

    goto :goto_11

    .line 1533
    .end local v5    # "c":C
    .end local v6    # "followSkip":I
    .end local v7    # "followUnicode":I
    .end local v9    # "icon":I
    .end local v15    # "unicode":I
    :cond_14
    return-void

    .line 1446
    nop

    :pswitch_data_0
    .packed-switch 0x23
        :pswitch_b
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_a
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch

    .line 1487
    :pswitch_data_1
    .packed-switch 0x1f1e8
        :pswitch_15
        :pswitch_10
        :pswitch_13
        :pswitch_f
        :pswitch_12
        :pswitch_c
        :pswitch_11
        :pswitch_d
        :pswitch_16
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_14
        :pswitch_c
        :pswitch_c
        :pswitch_e
    .end packed-switch
.end method

.method private static getEmojiResource(Landroid/content/Context;I)I
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "codePoint"    # I

    .prologue
    .line 1352
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sEmojisMap:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    return v0
.end method

.method private static getSoftbankEmojiResource(C)I
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 1356
    sget-object v0, Lcom/pccw/sms/emoji/EmojiconHandler;->sSoftbanksMap:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p0}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    return v0
.end method

.method private static isSoftBankEmoji(C)Z
    .locals 2
    .param p0, "c"    # C

    .prologue
    .line 1348
    shr-int/lit8 v0, p0, 0xc

    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
