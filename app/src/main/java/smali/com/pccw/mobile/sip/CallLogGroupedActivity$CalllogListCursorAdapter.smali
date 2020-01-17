.class public Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;
.super Landroid/support/v4/widget/CursorAdapter;
.source "CallLogGroupedActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CallLogGroupedActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CalllogListCursorAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/CallLogGroupedActivity;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Landroid/content/Context;Landroid/database/Cursor;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/CallLogGroupedActivity;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "c"    # Landroid/database/Cursor;
    .param p4, "autoRequery"    # Z

    .prologue
    .line 293
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogGroupedActivity;

    .line 294
    invoke-direct {p0, p2, p3, p4}, Landroid/support/v4/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 295
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 15
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 315
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;

    .line 317
    .local v14, "views":Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;
    const/4 v3, 0x1

    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 319
    .local v13, "number":Ljava/lang/String;
    const/4 v3, 0x7

    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 320
    .local v2, "callerNumberLabel":Ljava/lang/String;
    const-string/jumbo v3, "KKIM"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "bindView number="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogGroupedActivity;

    invoke-static {v3, v13}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->access$100(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 327
    .local v12, "num":Ljava/lang/String;
    iget-object v3, v14, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->numberView:Landroid/widget/TextView;

    invoke-virtual {v3, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 328
    iget-object v3, v14, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->numberTypeView:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 331
    new-instance v3, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter$1;

    invoke-direct {v3, p0, v13}, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter$1;-><init>(Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 344
    const/4 v3, 0x2

    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 347
    .local v4, "date":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/32 v8, 0xea60

    const/high16 v10, 0x40000

    move-object/from16 v3, p2

    .line 346
    invoke-static/range {v3 .. v10}, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->getRelativeTimeSpanString(Landroid/content/Context;JJJI)Ljava/lang/CharSequence;

    move-result-object v11

    .line 350
    .local v11, "dateClause":Ljava/lang/CharSequence;
    iget-object v3, v14, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->dateView:Landroid/widget/TextView;

    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 352
    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CalllogListCursorAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogGroupedActivity;

    const/4 v6, 0x4

    move-object/from16 v0, p3

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    invoke-static {v3, v14, v6}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->access$300(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;I)V

    .line 353
    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 299
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 300
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v3, 0x7f040034

    const/4 v4, 0x0

    invoke-virtual {v0, v3, p3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 301
    .local v1, "retView":Landroid/view/View;
    new-instance v2, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;

    invoke-direct {v2}, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;-><init>()V

    .line 302
    .local v2, "views":Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;
    const v3, 0x7f0e00f7

    .line 303
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v2, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->callTypeTextView:Landroid/widget/TextView;

    .line 304
    const v3, 0x7f0e00f9

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v2, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->numberView:Landroid/widget/TextView;

    .line 305
    const v3, 0x7f0e00f8

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v2, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->numberTypeView:Landroid/widget/TextView;

    .line 306
    const v3, 0x7f0e00fa

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v2, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->dateView:Landroid/widget/TextView;

    .line 307
    const v3, 0x7f0e00f5

    .line 308
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, v2, Lcom/pccw/mobile/sip/CallLogGroupedActivity$CallLogGroupedItemViews;->callTypeImageView:Landroid/widget/ImageView;

    .line 309
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 310
    return-object v1
.end method
