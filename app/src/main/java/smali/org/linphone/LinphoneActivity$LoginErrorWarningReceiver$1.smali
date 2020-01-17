.class Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;
.super Ljava/lang/Object;
.source "LinphoneActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;Landroid/content/Intent;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    .prologue
    .line 735
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iput-object p2, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$intent:Landroid/content/Intent;

    iput-object p3, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 738
    const-string/jumbo v15, "com.pccw.mobile.sip.intent.loginerror"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$intent:Landroid/content/Intent;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 739
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v15}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v15

    const-string/jumbo v16, "MESSAGE"

    invoke-virtual/range {v15 .. v16}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 741
    .local v13, "msg":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v15}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v15

    const-string/jumbo v16, "IS_OVERSEA"

    invoke-virtual/range {v15 .. v16}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v14

    .line 743
    .local v14, "shouldShowOverseaErrorMSG":Z
    new-instance v3, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v15, v15, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-direct {v3, v15}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 744
    .local v3, "alertDialog":Landroid/app/AlertDialog$Builder;
    if-eqz v13, :cond_0

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$ctx:Landroid/content/Context;

    .line 745
    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f0701b5

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 747
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    invoke-static {v15}, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->access$000(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;)Landroid/app/Activity;

    move-result-object v15

    const v16, 0x7f0700aa

    invoke-virtual/range {v15 .. v16}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 748
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v15, v15, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    const v16, 0x7f07015b

    .line 749
    invoke-virtual/range {v15 .. v16}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v15

    new-instance v16, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$1;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$1;-><init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;)V

    .line 748
    move-object/from16 v0, v16

    invoke-virtual {v3, v15, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 756
    const/high16 v15, 0x1040000

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v3, v15, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 758
    const v15, 0x7f0701f4

    :try_start_0
    invoke-virtual {v3, v15}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const v16, 0x7f020436

    .line 759
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    invoke-virtual {v15, v13}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const/16 v16, 0x1

    .line 760
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    invoke-virtual {v15}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5

    .line 960
    .end local v3    # "alertDialog":Landroid/app/AlertDialog$Builder;
    .end local v13    # "msg":Ljava/lang/String;
    .end local v14    # "shouldShowOverseaErrorMSG":Z
    :cond_1
    :goto_0
    return-void

    .line 765
    .restart local v3    # "alertDialog":Landroid/app/AlertDialog$Builder;
    .restart local v13    # "msg":Ljava/lang/String;
    .restart local v14    # "shouldShowOverseaErrorMSG":Z
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$ctx:Landroid/content/Context;

    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f07011c

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 768
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v15, v15, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    const v16, 0x7f070075

    .line 769
    invoke-virtual/range {v15 .. v16}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v15

    new-instance v16, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$2;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$2;-><init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;)V

    .line 768
    move-object/from16 v0, v16

    invoke-virtual {v3, v15, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 779
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v15, v15, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    const/high16 v16, 0x1040000

    invoke-virtual/range {v15 .. v16}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v3, v15, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 782
    const v15, 0x7f0701f4

    :try_start_1
    invoke-virtual {v3, v15}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const v16, 0x7f020436

    .line 783
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    invoke-virtual {v15, v13}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const/16 v16, 0x1

    .line 784
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    invoke-virtual {v15}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 785
    :catch_0
    move-exception v15

    goto :goto_0

    .line 789
    :cond_3
    if-nez v14, :cond_4

    .line 791
    const v15, 0x104000a

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v3, v15, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 793
    const v15, 0x7f0701f4

    :try_start_2
    invoke-virtual {v3, v15}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const v16, 0x7f020436

    .line 794
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    invoke-virtual {v15, v13}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const/16 v16, 0x1

    .line 795
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    invoke-virtual {v15}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 796
    :catch_1
    move-exception v15

    goto/16 :goto_0

    .line 802
    :cond_4
    const/high16 v15, 0x1040000

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v3, v15, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 803
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v15, v15, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    const v16, 0x7f0701d3

    .line 804
    invoke-virtual/range {v15 .. v16}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    .line 803
    move-object/from16 v0, v16

    invoke-virtual {v3, v15, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 806
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v15, v15, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    const v16, 0x7f0701d4

    .line 808
    invoke-virtual/range {v15 .. v16}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    .line 807
    move-object/from16 v0, v16

    invoke-virtual {v3, v15, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 810
    const v15, 0x7f0701f4

    invoke-virtual {v3, v15}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const v16, 0x7f020436

    .line 811
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    invoke-virtual {v15, v13}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const/16 v16, 0x1

    .line 812
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    invoke-virtual {v15}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    .line 813
    .local v10, "dialog":Landroid/app/AlertDialog;
    new-instance v15, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;

    move-object/from16 v0, p0

    invoke-direct {v15, v0, v10}, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$3;-><init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;Landroid/app/AlertDialog;)V

    invoke-virtual {v10, v15}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 837
    invoke-virtual {v10}, Landroid/app/AlertDialog;->show()V

    .line 838
    const/4 v15, -0x1

    .line 839
    invoke-virtual {v10, v15}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v6

    .line 840
    .local v6, "bPositive":Landroid/widget/Button;
    const/4 v15, -0x3

    invoke-virtual {v10, v15}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v5

    .line 841
    .local v5, "bNeutral":Landroid/widget/Button;
    const/4 v15, -0x2

    .line 842
    invoke-virtual {v10, v15}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v4

    .line 843
    .local v4, "bNegative":Landroid/widget/Button;
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v16, -0x1

    const/16 v17, -0x1

    invoke-direct/range {v15 .. v17}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v15}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 845
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v16, -0x1

    const/16 v17, -0x1

    invoke-direct/range {v15 .. v17}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v15}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 847
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v16, -0x1

    const/16 v17, -0x1

    invoke-direct/range {v15 .. v17}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v15}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 849
    invoke-virtual {v6}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout;

    .line 850
    .local v8, "buttonLine":Landroid/widget/LinearLayout;
    const/4 v15, 0x1

    invoke-virtual {v8, v15}, Landroid/widget/LinearLayout;->setOrientation(I)V

    goto/16 :goto_0

    .line 852
    .end local v3    # "alertDialog":Landroid/app/AlertDialog$Builder;
    .end local v4    # "bNegative":Landroid/widget/Button;
    .end local v5    # "bNeutral":Landroid/widget/Button;
    .end local v6    # "bPositive":Landroid/widget/Button;
    .end local v8    # "buttonLine":Landroid/widget/LinearLayout;
    .end local v10    # "dialog":Landroid/app/AlertDialog;
    .end local v13    # "msg":Ljava/lang/String;
    .end local v14    # "shouldShowOverseaErrorMSG":Z
    :cond_5
    const-string/jumbo v15, "com.pccw.mobile.sip.intent.loginwarning"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$intent:Landroid/content/Intent;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 853
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v15}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v15

    const-string/jumbo v16, "MESSAGE"

    invoke-virtual/range {v15 .. v16}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 855
    .restart local v13    # "msg":Ljava/lang/String;
    if-eqz v13, :cond_1

    .line 857
    :try_start_3
    new-instance v15, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    move-object/from16 v16, v0

    invoke-direct/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v16, 0x7f07006a

    .line 858
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const v16, 0x7f020436

    .line 859
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    invoke-virtual {v15, v13}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const/16 v16, 0x1

    .line 860
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const v16, 0x104000a

    const/16 v17, 0x0

    .line 861
    invoke-virtual/range {v15 .. v17}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    invoke-virtual {v15}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0

    .line 862
    :catch_2
    move-exception v15

    goto/16 :goto_0

    .line 867
    .end local v13    # "msg":Ljava/lang/String;
    :cond_6
    const-string/jumbo v15, "com.pccw.mobile.sip.intent.logindisconnected"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$intent:Landroid/content/Intent;

    move-object/from16 v16, v0

    .line 868
    invoke-virtual/range {v16 .. v16}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v16

    .line 867
    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 869
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$intent:Landroid/content/Intent;

    const-string/jumbo v16, "NEED_SHOW_MESSAGE"

    const/16 v17, 0x1

    .line 870
    invoke-virtual/range {v15 .. v17}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 874
    :try_start_4
    new-instance v7, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v15, v15, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-direct {v7, v15}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 876
    .local v7, "builder":Landroid/app/AlertDialog$Builder;
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v15, v15, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    const v16, 0x7f070105

    invoke-virtual/range {v15 .. v16}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v7, v15}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const/16 v16, 0x1

    .line 877
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    move-object/from16 v16, v0

    const v17, 0x104000a

    .line 878
    invoke-virtual/range {v16 .. v17}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v16

    const/16 v17, 0x0

    invoke-virtual/range {v15 .. v17}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 879
    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .line 880
    .local v2, "alert":Landroid/app/AlertDialog;
    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto/16 :goto_0

    .line 881
    .end local v2    # "alert":Landroid/app/AlertDialog;
    .end local v7    # "builder":Landroid/app/AlertDialog$Builder;
    :catch_3
    move-exception v15

    goto/16 :goto_0

    .line 886
    :cond_7
    const-string/jumbo v15, "com.pccw.mobile.sip.intent.callforwardsucceed"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$intent:Landroid/content/Intent;

    move-object/from16 v16, v0

    .line 887
    invoke-virtual/range {v16 .. v16}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v16

    .line 886
    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_1

    .line 924
    const-string/jumbo v15, "com.pccw.mobile.sip.intent.daypass"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$intent:Landroid/content/Intent;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 926
    :try_start_5
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v15, v15, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-virtual {v15}, Lorg/linphone/LinphoneActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v12

    .line 927
    .local v12, "inflater":Landroid/view/LayoutInflater;
    const v15, 0x7f040042

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v12, v15, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    .line 928
    .local v9, "containView":Landroid/view/View;
    const v15, 0x7f0e012a

    invoke-virtual {v9, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/CheckBox;

    .line 929
    .local v11, "doNotShowAgainBox":Landroid/widget/CheckBox;
    const/4 v15, 0x0

    invoke-virtual {v11, v15}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 930
    sget v15, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v16, 0xb

    move/from16 v0, v16

    if-gt v15, v0, :cond_8

    .line 931
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    iget-object v15, v15, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-virtual {v15}, Lorg/linphone/LinphoneActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f0b0016

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getColor(I)I

    move-result v15

    invoke-virtual {v11, v15}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 933
    :cond_8
    new-instance v15, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->this$1:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;->this$0:Lorg/linphone/LinphoneActivity;

    move-object/from16 v16, v0

    invoke-direct/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v16, 0x7f07006a

    .line 934
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const v16, 0x7f020436

    .line 935
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const/16 v16, 0x1

    .line 936
    invoke-virtual/range {v15 .. v16}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    .line 937
    invoke-virtual {v15, v9}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const v16, 0x104000a

    new-instance v17, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$4;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11}, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$4;-><init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;Landroid/widget/CheckBox;)V

    .line 938
    invoke-virtual/range {v15 .. v17}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    const/high16 v16, 0x1040000

    const/16 v17, 0x0

    .line 953
    invoke-virtual/range {v15 .. v17}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v15

    .line 954
    invoke-virtual {v15}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto/16 :goto_0

    .line 955
    .end local v9    # "containView":Landroid/view/View;
    .end local v11    # "doNotShowAgainBox":Landroid/widget/CheckBox;
    .end local v12    # "inflater":Landroid/view/LayoutInflater;
    :catch_4
    move-exception v15

    goto/16 :goto_0

    .line 761
    .restart local v3    # "alertDialog":Landroid/app/AlertDialog$Builder;
    .restart local v13    # "msg":Ljava/lang/String;
    .restart local v14    # "shouldShowOverseaErrorMSG":Z
    :catch_5
    move-exception v15

    goto/16 :goto_0
.end method
