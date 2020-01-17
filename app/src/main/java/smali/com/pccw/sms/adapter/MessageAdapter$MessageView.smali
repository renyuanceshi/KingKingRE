.class Lcom/pccw/sms/adapter/MessageAdapter$MessageView;
.super Ljava/lang/Object;
.source "MessageAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/adapter/MessageAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MessageView"
.end annotation


# instance fields
.field CallImg:Landroid/widget/ImageView;

.field Header:Landroid/widget/RelativeLayout;

.field LastMsgTime:Landroid/widget/TextView;

.field MsgContent:Landroid/widget/TextView;

.field MsgData:Landroid/widget/LinearLayout;

.field MsgDate:Landroid/widget/TextView;

.field MsgSender:Landroid/widget/TextView;

.field MsgStatusImg:Landroid/widget/ImageView;

.field MsgSystem:Landroid/widget/TextView;

.field SystemBubble:Landroid/widget/RelativeLayout;

.field UnreadMessage:Landroid/widget/LinearLayout;

.field UnreadMessageTxt:Landroid/widget/TextView;

.field bubble:Landroid/widget/RelativeLayout;

.field final synthetic this$0:Lcom/pccw/sms/adapter/MessageAdapter;


# direct methods
.method private constructor <init>(Lcom/pccw/sms/adapter/MessageAdapter;)V
    .locals 0

    .prologue
    .line 99
    iput-object p1, p0, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/pccw/sms/adapter/MessageAdapter;Lcom/pccw/sms/adapter/MessageAdapter$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/pccw/sms/adapter/MessageAdapter;
    .param p2, "x1"    # Lcom/pccw/sms/adapter/MessageAdapter$1;

    .prologue
    .line 99
    invoke-direct {p0, p1}, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;-><init>(Lcom/pccw/sms/adapter/MessageAdapter;)V

    return-void
.end method
