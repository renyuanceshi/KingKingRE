.class public final enum Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;
.super Ljava/lang/Enum;
.source "EmojiTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/emoji/EmojiTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EllipsizeRange"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

.field public static final enum ELLIPSIS_AT_END:Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

.field public static final enum ELLIPSIS_AT_START:Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 21
    new-instance v0, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    const-string/jumbo v1, "ELLIPSIS_AT_START"

    invoke-direct {v0, v1, v2}, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;->ELLIPSIS_AT_START:Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    new-instance v0, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    const-string/jumbo v1, "ELLIPSIS_AT_END"

    invoke-direct {v0, v1, v3}, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;->ELLIPSIS_AT_END:Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    .line 20
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    sget-object v1, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;->ELLIPSIS_AT_START:Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    aput-object v1, v0, v2

    sget-object v1, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;->ELLIPSIS_AT_END:Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    aput-object v1, v0, v3

    sput-object v0, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;->$VALUES:[Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    return-object v0
.end method

.method public static values()[Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;->$VALUES:[Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    invoke-virtual {v0}, [Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/pccw/sms/emoji/EmojiTextView$EllipsizeRange;

    return-object v0
.end method
