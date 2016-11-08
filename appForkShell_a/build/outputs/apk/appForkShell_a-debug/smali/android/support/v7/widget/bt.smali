.class Landroid/support/v7/widget/bt;
.super Landroid/database/DataSetObserver;


# instance fields
.field final synthetic a:Landroid/support/v7/widget/bk;


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/bk;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/widget/bt;->a:Landroid/support/v7/widget/bk;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/widget/bk;Landroid/support/v7/widget/bl;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v7/widget/bt;-><init>(Landroid/support/v7/widget/bk;)V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/bt;->a:Landroid/support/v7/widget/bk;

    invoke-virtual {v0}, Landroid/support/v7/widget/bk;->k()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/bt;->a:Landroid/support/v7/widget/bk;

    invoke-virtual {v0}, Landroid/support/v7/widget/bk;->c()V

    :cond_0
    return-void
.end method

.method public onInvalidated()V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/bt;->a:Landroid/support/v7/widget/bk;

    invoke-virtual {v0}, Landroid/support/v7/widget/bk;->i()V

    return-void
.end method
