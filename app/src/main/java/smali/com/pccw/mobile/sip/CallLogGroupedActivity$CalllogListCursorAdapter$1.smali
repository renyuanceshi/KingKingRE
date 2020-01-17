.class Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter$1;
.super Ljava/lang/Object;
.source "CallLogGroupedActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;->bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;

.field final synthetic val$number:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;

    .prologue
    .line 331
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter$1;->this$1:Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter$1;->val$number:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 335
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter$1;->val$number:Ljava/lang/String;

    const-string/jumbo v1, "-2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter$1;->val$number:Ljava/lang/String;

    const-string/jumbo v1, "-1"

    .line 336
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 340
    :cond_0
    :goto_0
    return-void

    .line 339
    :cond_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter$1;->this$1:Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;

    iget-object v0, v0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogGroupedActivity;

    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter$1;->val$number:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->access$200(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Ljava/lang/String;)V

    goto :goto_0
.end method
