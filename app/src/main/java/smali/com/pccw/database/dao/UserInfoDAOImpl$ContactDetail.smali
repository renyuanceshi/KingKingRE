.class public Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;
.super Ljava/lang/Object;
.source "UserInfoDAOImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/database/dao/UserInfoDAOImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ContactDetail"
.end annotation


# instance fields
.field public nickname:Ljava/lang/String;

.field public profilePicPath:Ljava/lang/String;

.field final synthetic this$0:Lcom/pccw/database/dao/UserInfoDAOImpl;


# direct methods
.method public constructor <init>(Lcom/pccw/database/dao/UserInfoDAOImpl;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/database/dao/UserInfoDAOImpl;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "profilePicPath"    # Ljava/lang/String;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->this$0:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p2, p0, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    .line 31
    iput-object p3, p0, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->profilePicPath:Ljava/lang/String;

    .line 32
    return-void
.end method
