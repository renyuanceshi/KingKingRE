.class public Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;
.super Landroid/support/v4/widget/CursorAdapter;
.source "AddCallContactDetailsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PhoneListCursorAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;Landroid/content/Context;Landroid/database/Cursor;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "c"    # Landroid/database/Cursor;
    .param p4, "autoRequery"    # Z

    .prologue
    .line 254
    iput-object p1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;

    .line 255
    invoke-direct {p0, p2, p3, p4}, Landroid/support/v4/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 256
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 15
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 273
    const v14, 0x7f0e00a2

    .line 274
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 275
    .local v9, "phoneNumView":Landroid/widget/TextView;
    const v14, 0x7f0e00a1

    .line 276
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 277
    .local v10, "phoneTypeView":Landroid/widget/TextView;
    const v14, 0x7f0e00a6

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 278
    .local v6, "imStatus":Landroid/widget/TextView;
    const v14, 0x7f0e00a7

    .line 279
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 280
    .local v5, "imLastOnline":Landroid/widget/TextView;
    const v14, 0x7f0e00a4

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 281
    .local v1, "callBtn":Landroid/widget/ImageView;
    const v14, 0x7f0e00a3

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/ImageView;

    .line 282
    .local v11, "smsBtn":Landroid/widget/ImageView;
    const v14, 0x7f0e009e

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 283
    .local v3, "iMBtn":Landroid/widget/ImageView;
    const v14, 0x7f0e00a5

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    .line 285
    .local v4, "iMLayout":Landroid/widget/LinearLayout;
    const/4 v14, 0x1

    move-object/from16 v0, p3

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 286
    .local v8, "phoneNum":Ljava/lang/String;
    invoke-static {v8}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 289
    .local v7, "normPhoneNum":Ljava/lang/String;
    invoke-static {v8}, Landroid/telephony/PhoneNumberUtils;->convertKeypadLettersToDigits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 288
    invoke-static {v14}, Landroid/telephony/PhoneNumberUtils;->extractNetworkPortion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 291
    .local v2, "formattedNumber":Ljava/lang/String;
    const/4 v14, 0x2

    move-object/from16 v0, p3

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 292
    .local v12, "type":I
    if-nez v12, :cond_0

    const/4 v14, 0x3

    .line 293
    move-object/from16 v0, p3

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_0

    .line 294
    const/4 v14, 0x3

    move-object/from16 v0, p3

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 301
    :goto_0
    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 304
    const/16 v14, 0x8

    invoke-virtual {v1, v14}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 305
    new-instance v14, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter$1;

    invoke-direct {v14, p0, v8}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter$1;-><init>(Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 318
    const/16 v14, 0x8

    invoke-virtual {v4, v14}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 319
    const/4 v14, 0x4

    invoke-virtual {v3, v14}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 321
    return-void

    .line 296
    :cond_0
    const/4 v14, 0x2

    .line 297
    move-object/from16 v0, p3

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    .line 296
    invoke-static {v14}, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->getTypeLabelResource(I)I

    move-result v13

    .line 298
    .local v13, "typeLabelResource":I
    iget-object v14, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;

    invoke-virtual {v14, v13}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 262
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 263
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v2, 0x7f040026

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 265
    .local v1, "retView":Landroid/view/View;
    return-object v1
.end method
