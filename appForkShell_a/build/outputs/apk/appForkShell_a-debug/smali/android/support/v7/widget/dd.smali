.class Landroid/support/v7/widget/dd;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final a:Landroid/support/v7/view/menu/a;

.field final synthetic b:Landroid/support/v7/widget/dc;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/dc;)V
    .locals 7

    const/4 v2, 0x0

    iput-object p1, p0, Landroid/support/v7/widget/dd;->b:Landroid/support/v7/widget/dc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/support/v7/view/menu/a;

    iget-object v1, p0, Landroid/support/v7/widget/dd;->b:Landroid/support/v7/widget/dc;

    invoke-static {v1}, Landroid/support/v7/widget/dc;->a(Landroid/support/v7/widget/dc;)Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x102002c

    iget-object v4, p0, Landroid/support/v7/widget/dd;->b:Landroid/support/v7/widget/dc;

    invoke-static {v4}, Landroid/support/v7/widget/dc;->b(Landroid/support/v7/widget/dc;)Ljava/lang/CharSequence;

    move-result-object v6

    move v4, v2

    move v5, v2

    invoke-direct/range {v0 .. v6}, Landroid/support/v7/view/menu/a;-><init>(Landroid/content/Context;IIIILjava/lang/CharSequence;)V

    iput-object v0, p0, Landroid/support/v7/widget/dd;->a:Landroid/support/v7/view/menu/a;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Landroid/support/v7/widget/dd;->b:Landroid/support/v7/widget/dc;

    invoke-static {v0}, Landroid/support/v7/widget/dc;->c(Landroid/support/v7/widget/dc;)Landroid/view/Window$Callback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/dd;->b:Landroid/support/v7/widget/dc;

    invoke-static {v0}, Landroid/support/v7/widget/dc;->d(Landroid/support/v7/widget/dc;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/dd;->b:Landroid/support/v7/widget/dc;

    invoke-static {v0}, Landroid/support/v7/widget/dc;->c(Landroid/support/v7/widget/dc;)Landroid/view/Window$Callback;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Landroid/support/v7/widget/dd;->a:Landroid/support/v7/view/menu/a;

    invoke-interface {v0, v1, v2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    :cond_0
    return-void
.end method
