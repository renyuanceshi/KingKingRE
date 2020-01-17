.class public Lorg/linphone/InCallScreen$IncomingCallDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "InCallScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/InCallScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IncomingCallDialogFragment"
.end annotation


# instance fields
.field answerButton:Landroid/widget/Button;

.field answerEndButton:Landroid/widget/Button;

.field callerLabelTextView:Landroid/widget/TextView;

.field callerNameTextView:Landroid/widget/TextView;

.field callerNumberTextView:Landroid/widget/TextView;

.field public callerPhoto:Landroid/widget/ImageView;

.field rejectButton:Landroid/widget/ImageButton;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1905
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance()Lorg/linphone/InCallScreen$IncomingCallDialogFragment;
    .locals 2

    .prologue
    .line 1915
    new-instance v1, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;

    invoke-direct {v1}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;-><init>()V

    .line 1916
    .local v1, "frag":Lorg/linphone/InCallScreen$IncomingCallDialogFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1917
    .local v0, "args":Landroid/os/Bundle;
    invoke-virtual {v1, v0}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 1918
    return-object v1
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    const v4, 0x7f07022b

    .line 1924
    const v2, 0x7f04004e

    invoke-virtual {p1, v2, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 1925
    .local v1, "view":Landroid/view/View;
    const v2, 0x7f0e0166

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerNameTextView:Landroid/widget/TextView;

    .line 1926
    const v2, 0x7f0e0168

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerLabelTextView:Landroid/widget/TextView;

    .line 1927
    const v2, 0x7f0e0169

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerNumberTextView:Landroid/widget/TextView;

    .line 1928
    const v2, 0x7f0e0165

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerPhoto:Landroid/widget/ImageView;

    .line 1930
    invoke-virtual {p0}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 1931
    invoke-virtual {p0, v5}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->setCancelable(Z)V

    .line 1933
    sget-object v2, Lorg/linphone/InCallScreen;->incomingCallerName:Ljava/lang/String;

    if-eqz v2, :cond_0

    sget-object v2, Lorg/linphone/InCallScreen;->incomingCallerName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1934
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerNameTextView:Landroid/widget/TextView;

    sget-object v3, Lorg/linphone/InCallScreen;->incomingCallerName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1939
    :goto_0
    const-string/jumbo v2, "-1"

    sget-object v3, Lorg/linphone/InCallScreen;->incomingCallerNumber:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1940
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerNumberTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    .line 1950
    :goto_1
    sget-object v2, Lorg/linphone/InCallScreen;->incomingCallerLabel:Ljava/lang/String;

    if-eqz v2, :cond_5

    sget-object v2, Lorg/linphone/InCallScreen;->incomingCallerLabel:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 1951
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerLabelTextView:Landroid/widget/TextView;

    sget-object v3, Lorg/linphone/InCallScreen;->incomingCallerLabel:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1952
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerLabelTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1957
    :goto_2
    sget-object v2, Lorg/linphone/InCallScreen;->incomingCallerPhoto:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_6

    .line 1958
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerPhoto:Landroid/widget/ImageView;

    sget-object v3, Lorg/linphone/InCallScreen;->incomingCallerPhoto:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1963
    :goto_3
    const v2, 0x7f0e016a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->answerButton:Landroid/widget/Button;

    .line 1964
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->answerButton:Landroid/widget/Button;

    new-instance v3, Lorg/linphone/InCallScreen$IncomingCallDialogFragment$1;

    invoke-direct {v3, p0}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment$1;-><init>(Lorg/linphone/InCallScreen$IncomingCallDialogFragment;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1972
    const v2, 0x7f0e016b

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->answerEndButton:Landroid/widget/Button;

    .line 1973
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->answerEndButton:Landroid/widget/Button;

    new-instance v3, Lorg/linphone/InCallScreen$IncomingCallDialogFragment$2;

    invoke-direct {v3, p0}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment$2;-><init>(Lorg/linphone/InCallScreen$IncomingCallDialogFragment;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1981
    const v2, 0x7f0e016c

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->rejectButton:Landroid/widget/ImageButton;

    .line 1982
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->rejectButton:Landroid/widget/ImageButton;

    new-instance v3, Lorg/linphone/InCallScreen$IncomingCallDialogFragment$3;

    invoke-direct {v3, p0}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment$3;-><init>(Lorg/linphone/InCallScreen$IncomingCallDialogFragment;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1990
    return-object v1

    .line 1936
    :cond_0
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerNameTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 1941
    :cond_1
    const-string/jumbo v2, "-2"

    sget-object v3, Lorg/linphone/InCallScreen;->incomingCallerNumber:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1942
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerNumberTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 1943
    :cond_2
    sget-object v2, Lorg/linphone/InCallScreen;->incomingCallerNumber:Ljava/lang/String;

    if-eqz v2, :cond_4

    sget-object v2, Lorg/linphone/InCallScreen;->incomingCallerNumber:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    .line 1944
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    sget-object v3, Lorg/linphone/InCallScreen;->incomingCallerNumber:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRestoreMapPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1945
    .local v0, "n":Ljava/lang/String;
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerNumberTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    .end local v0    # "n":Ljava/lang/String;
    :goto_4
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .restart local v0    # "n":Ljava/lang/String;
    :cond_3
    sget-object v0, Lorg/linphone/InCallScreen;->incomingCallerNumber:Ljava/lang/String;

    goto :goto_4

    .line 1947
    .end local v0    # "n":Ljava/lang/String;
    :cond_4
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerNumberTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_1

    .line 1954
    :cond_5
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerLabelTextView:Landroid/widget/TextView;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 1960
    :cond_6
    iget-object v2, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->callerPhoto:Landroid/widget/ImageView;

    const v3, 0x7f0200ce

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_3
.end method
