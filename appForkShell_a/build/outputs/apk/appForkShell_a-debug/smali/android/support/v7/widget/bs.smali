.class Landroid/support/v7/widget/bs;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/support/v7/widget/bk;


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/bk;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/widget/bs;->a:Landroid/support/v7/widget/bk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/widget/bk;Landroid/support/v7/widget/bl;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v7/widget/bs;-><init>(Landroid/support/v7/widget/bk;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/bs;->a:Landroid/support/v7/widget/bk;

    invoke-virtual {v0}, Landroid/support/v7/widget/bk;->j()V

    return-void
.end method
