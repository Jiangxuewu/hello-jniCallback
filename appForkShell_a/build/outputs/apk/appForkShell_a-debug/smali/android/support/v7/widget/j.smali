.class Landroid/support/v7/widget/j;
.super Landroid/support/v7/view/menu/d;

# interfaces
.implements Landroid/support/v4/g/o;


# instance fields
.field private A:Landroid/support/v7/widget/m;

.field final g:Landroid/support/v7/widget/r;

.field h:I

.field private i:Landroid/support/v7/widget/o;

.field private j:Landroid/graphics/drawable/Drawable;

.field private k:Z

.field private l:Z

.field private m:Z

.field private n:I

.field private o:I

.field private p:I

.field private q:Z

.field private r:Z

.field private s:Z

.field private t:Z

.field private u:I

.field private final v:Landroid/util/SparseBooleanArray;

.field private w:Landroid/view/View;

.field private x:Landroid/support/v7/widget/q;

.field private y:Landroid/support/v7/widget/l;

.field private z:Landroid/support/v7/widget/n;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    sget v0, Landroid/support/v7/b/h;->abc_action_menu_layout:I

    sget v1, Landroid/support/v7/b/h;->abc_action_menu_item_layout:I

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/view/menu/d;-><init>(Landroid/content/Context;II)V

    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/j;->v:Landroid/util/SparseBooleanArray;

    new-instance v0, Landroid/support/v7/widget/r;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/r;-><init>(Landroid/support/v7/widget/j;Landroid/support/v7/widget/k;)V

    iput-object v0, p0, Landroid/support/v7/widget/j;->g:Landroid/support/v7/widget/r;

    return-void
.end method

.method static synthetic a(Landroid/support/v7/widget/j;Landroid/support/v7/widget/l;)Landroid/support/v7/widget/l;
    .locals 0

    iput-object p1, p0, Landroid/support/v7/widget/j;->y:Landroid/support/v7/widget/l;

    return-object p1
.end method

.method static synthetic a(Landroid/support/v7/widget/j;Landroid/support/v7/widget/n;)Landroid/support/v7/widget/n;
    .locals 0

    iput-object p1, p0, Landroid/support/v7/widget/j;->z:Landroid/support/v7/widget/n;

    return-object p1
.end method

.method static synthetic a(Landroid/support/v7/widget/j;)Landroid/support/v7/widget/q;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->x:Landroid/support/v7/widget/q;

    return-object v0
.end method

.method static synthetic a(Landroid/support/v7/widget/j;Landroid/support/v7/widget/q;)Landroid/support/v7/widget/q;
    .locals 0

    iput-object p1, p0, Landroid/support/v7/widget/j;->x:Landroid/support/v7/widget/q;

    return-object p1
.end method

.method private a(Landroid/view/MenuItem;)Landroid/view/View;
    .locals 6

    const/4 v3, 0x0

    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    check-cast v0, Landroid/view/ViewGroup;

    if-nez v0, :cond_1

    move-object v2, v3

    :cond_0
    :goto_0
    return-object v2

    :cond_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    const/4 v1, 0x0

    move v4, v1

    :goto_1
    if-ge v4, v5, :cond_3

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v1, v2, Landroid/support/v7/view/menu/x;

    if-eqz v1, :cond_2

    move-object v1, v2

    check-cast v1, Landroid/support/v7/view/menu/x;

    invoke-interface {v1}, Landroid/support/v7/view/menu/x;->getItemData()Landroid/support/v7/view/menu/j;

    move-result-object v1

    if-eq v1, p1, :cond_0

    :cond_2
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_1

    :cond_3
    move-object v2, v3

    goto :goto_0
.end method

.method static synthetic b(Landroid/support/v7/widget/j;)Landroid/support/v7/widget/n;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->z:Landroid/support/v7/widget/n;

    return-object v0
.end method

.method static synthetic c(Landroid/support/v7/widget/j;)Landroid/support/v7/view/menu/g;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    return-object v0
.end method

.method static synthetic d(Landroid/support/v7/widget/j;)Landroid/support/v7/view/menu/g;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    return-object v0
.end method

.method static synthetic e(Landroid/support/v7/widget/j;)Landroid/support/v7/widget/o;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    return-object v0
.end method

.method static synthetic f(Landroid/support/v7/widget/j;)Landroid/support/v7/view/menu/w;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    return-object v0
.end method

.method static synthetic g(Landroid/support/v7/widget/j;)Landroid/support/v7/view/menu/g;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    return-object v0
.end method

.method static synthetic h(Landroid/support/v7/widget/j;)Landroid/support/v7/view/menu/w;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    return-object v0
.end method

.method static synthetic i(Landroid/support/v7/widget/j;)Landroid/support/v7/widget/l;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->y:Landroid/support/v7/widget/l;

    return-object v0
.end method


# virtual methods
.method public a(Landroid/support/v7/view/menu/j;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    invoke-virtual {p1}, Landroid/support/v7/view/menu/j;->getActionView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/support/v7/view/menu/j;->n()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/view/menu/d;->a(Landroid/support/v7/view/menu/j;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    :cond_1
    invoke-virtual {p1}, Landroid/support/v7/view/menu/j;->isActionViewExpanded()Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    check-cast p3, Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {p3, v1}, Landroid/support/v7/widget/ActionMenuView;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p3, v1}, Landroid/support/v7/widget/ActionMenuView;->a(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/v;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_2
    return-object v0

    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public a(Landroid/content/Context;Landroid/support/v7/view/menu/g;)V
    .locals 6

    const/4 v5, 0x0

    const/4 v4, 0x0

    invoke-super {p0, p1, p2}, Landroid/support/v7/view/menu/d;->a(Landroid/content/Context;Landroid/support/v7/view/menu/g;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {p1}, Landroid/support/v7/view/a;->a(Landroid/content/Context;)Landroid/support/v7/view/a;

    move-result-object v0

    iget-boolean v2, p0, Landroid/support/v7/widget/j;->m:Z

    if-nez v2, :cond_0

    invoke-virtual {v0}, Landroid/support/v7/view/a;->b()Z

    move-result v2

    iput-boolean v2, p0, Landroid/support/v7/widget/j;->l:Z

    :cond_0
    iget-boolean v2, p0, Landroid/support/v7/widget/j;->s:Z

    if-nez v2, :cond_1

    invoke-virtual {v0}, Landroid/support/v7/view/a;->c()I

    move-result v2

    iput v2, p0, Landroid/support/v7/widget/j;->n:I

    :cond_1
    iget-boolean v2, p0, Landroid/support/v7/widget/j;->q:Z

    if-nez v2, :cond_2

    invoke-virtual {v0}, Landroid/support/v7/view/a;->a()I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/j;->p:I

    :cond_2
    iget v0, p0, Landroid/support/v7/widget/j;->n:I

    iget-boolean v2, p0, Landroid/support/v7/widget/j;->l:Z

    if-eqz v2, :cond_5

    iget-object v2, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    if-nez v2, :cond_4

    new-instance v2, Landroid/support/v7/widget/o;

    iget-object v3, p0, Landroid/support/v7/widget/j;->a:Landroid/content/Context;

    invoke-direct {v2, p0, v3}, Landroid/support/v7/widget/o;-><init>(Landroid/support/v7/widget/j;Landroid/content/Context;)V

    iput-object v2, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    iget-boolean v2, p0, Landroid/support/v7/widget/j;->k:Z

    if-eqz v2, :cond_3

    iget-object v2, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    iget-object v3, p0, Landroid/support/v7/widget/j;->j:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/o;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iput-object v5, p0, Landroid/support/v7/widget/j;->j:Landroid/graphics/drawable/Drawable;

    iput-boolean v4, p0, Landroid/support/v7/widget/j;->k:Z

    :cond_3
    invoke-static {v4, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    invoke-virtual {v3, v2, v2}, Landroid/support/v7/widget/o;->measure(II)V

    :cond_4
    iget-object v2, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    invoke-virtual {v2}, Landroid/support/v7/widget/o;->getMeasuredWidth()I

    move-result v2

    sub-int/2addr v0, v2

    :goto_0
    iput v0, p0, Landroid/support/v7/widget/j;->o:I

    const/high16 v0, 0x42600000    # 56.0f

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Landroid/support/v7/widget/j;->u:I

    iput-object v5, p0, Landroid/support/v7/widget/j;->w:Landroid/view/View;

    return-void

    :cond_5
    iput-object v5, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    goto :goto_0
.end method

.method public a(Landroid/content/res/Configuration;)V
    .locals 2

    iget-boolean v0, p0, Landroid/support/v7/widget/j;->q:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/j;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroid/support/v7/b/g;->abc_max_action_buttons:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/j;->p:I

    :cond_0
    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/view/menu/g;->b(Z)V

    :cond_1
    return-void
.end method

.method public a(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/o;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/j;->k:Z

    iput-object p1, p0, Landroid/support/v7/widget/j;->j:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method

.method public a(Landroid/support/v7/view/menu/g;Z)V
    .locals 0

    invoke-virtual {p0}, Landroid/support/v7/widget/j;->f()Z

    invoke-super {p0, p1, p2}, Landroid/support/v7/view/menu/d;->a(Landroid/support/v7/view/menu/g;Z)V

    return-void
.end method

.method public a(Landroid/support/v7/view/menu/j;Landroid/support/v7/view/menu/x;)V
    .locals 2

    const/4 v0, 0x0

    invoke-interface {p2, p1, v0}, Landroid/support/v7/view/menu/x;->a(Landroid/support/v7/view/menu/j;I)V

    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    check-cast v0, Landroid/support/v7/widget/ActionMenuView;

    check-cast p2, Landroid/support/v7/view/menu/ActionMenuItemView;

    invoke-virtual {p2, v0}, Landroid/support/v7/view/menu/ActionMenuItemView;->setItemInvoker(Landroid/support/v7/view/menu/i;)V

    iget-object v0, p0, Landroid/support/v7/widget/j;->A:Landroid/support/v7/widget/m;

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v7/widget/m;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/m;-><init>(Landroid/support/v7/widget/j;Landroid/support/v7/widget/k;)V

    iput-object v0, p0, Landroid/support/v7/widget/j;->A:Landroid/support/v7/widget/m;

    :cond_0
    iget-object v0, p0, Landroid/support/v7/widget/j;->A:Landroid/support/v7/widget/m;

    invoke-virtual {p2, v0}, Landroid/support/v7/view/menu/ActionMenuItemView;->setPopupCallback(Landroid/support/v7/view/menu/c;)V

    return-void
.end method

.method public a(Landroid/support/v7/widget/ActionMenuView;)V
    .locals 1

    iput-object p1, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/ActionMenuView;->a(Landroid/support/v7/view/menu/g;)V

    return-void
.end method

.method public a(Z)V
    .locals 2

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    invoke-super {p0, v0}, Landroid/support/v7/view/menu/d;->a(Landroid/support/v7/view/menu/aa;)Z

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/view/menu/g;->a(Z)V

    goto :goto_0
.end method

.method public a(ILandroid/support/v7/view/menu/j;)Z
    .locals 1

    invoke-virtual {p2}, Landroid/support/v7/view/menu/j;->j()Z

    move-result v0

    return v0
.end method

.method public a(Landroid/support/v7/view/menu/aa;)Z
    .locals 4

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/support/v7/view/menu/aa;->hasVisibleItems()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    move-object v0, p1

    :goto_1
    invoke-virtual {v0}, Landroid/support/v7/view/menu/aa;->o()Landroid/view/Menu;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    if-eq v2, v3, :cond_1

    invoke-virtual {v0}, Landroid/support/v7/view/menu/aa;->o()Landroid/view/Menu;

    move-result-object v0

    check-cast v0, Landroid/support/v7/view/menu/aa;

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Landroid/support/v7/view/menu/aa;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/j;->a(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    if-nez v0, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    :cond_3
    invoke-virtual {p1}, Landroid/support/v7/view/menu/aa;->getItem()Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    iput v1, p0, Landroid/support/v7/widget/j;->h:I

    new-instance v1, Landroid/support/v7/widget/l;

    iget-object v2, p0, Landroid/support/v7/widget/j;->b:Landroid/content/Context;

    invoke-direct {v1, p0, v2, p1}, Landroid/support/v7/widget/l;-><init>(Landroid/support/v7/widget/j;Landroid/content/Context;Landroid/support/v7/view/menu/aa;)V

    iput-object v1, p0, Landroid/support/v7/widget/j;->y:Landroid/support/v7/widget/l;

    iget-object v1, p0, Landroid/support/v7/widget/j;->y:Landroid/support/v7/widget/l;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/l;->a(Landroid/view/View;)V

    iget-object v0, p0, Landroid/support/v7/widget/j;->y:Landroid/support/v7/widget/l;

    invoke-virtual {v0}, Landroid/support/v7/widget/l;->a()V

    invoke-super {p0, p1}, Landroid/support/v7/view/menu/d;->a(Landroid/support/v7/view/menu/aa;)Z

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public a(Landroid/view/ViewGroup;I)Z
    .locals 2

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v7/view/menu/d;->a(Landroid/view/ViewGroup;I)Z

    move-result v0

    goto :goto_0
.end method

.method public b(Z)V
    .locals 6

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    invoke-static {v0}, Landroid/support/v7/e/a;->a(Landroid/view/ViewGroup;)V

    :cond_0
    invoke-super {p0, p1}, Landroid/support/v7/view/menu/d;->b(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/g;->j()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v3, v2

    :goto_0
    if-ge v3, v5, :cond_2

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/view/menu/j;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/j;->a()Landroid/support/v4/g/n;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0, p0}, Landroid/support/v4/g/n;->a(Landroid/support/v4/g/o;)V

    :cond_1
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    if-eqz v0, :cond_7

    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/g;->k()Ljava/util/ArrayList;

    move-result-object v0

    :goto_1
    iget-boolean v3, p0, Landroid/support/v7/widget/j;->l:Z

    if-eqz v3, :cond_3

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v3, v1, :cond_9

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/view/menu/j;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/j;->isActionViewExpanded()Z

    move-result v0

    if-nez v0, :cond_8

    move v0, v1

    :goto_2
    move v2, v0

    :cond_3
    :goto_3
    if-eqz v2, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    if-nez v0, :cond_4

    new-instance v0, Landroid/support/v7/widget/o;

    iget-object v1, p0, Landroid/support/v7/widget/j;->a:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/o;-><init>(Landroid/support/v7/widget/j;Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    :cond_4
    iget-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    invoke-virtual {v0}, Landroid/support/v7/widget/o;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    if-eq v0, v1, :cond_6

    if-eqz v0, :cond_5

    iget-object v1, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_5
    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    check-cast v0, Landroid/support/v7/widget/ActionMenuView;

    iget-object v1, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuView;->b()Landroid/support/v7/widget/v;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/ActionMenuView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_6
    :goto_4
    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    check-cast v0, Landroid/support/v7/widget/ActionMenuView;

    iget-boolean v1, p0, Landroid/support/v7/widget/j;->l:Z

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionMenuView;->setOverflowReserved(Z)V

    return-void

    :cond_7
    const/4 v0, 0x0

    goto :goto_1

    :cond_8
    move v0, v2

    goto :goto_2

    :cond_9
    if-lez v3, :cond_a

    :goto_5
    move v2, v1

    goto :goto_3

    :cond_a
    move v1, v2

    goto :goto_5

    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    if-eqz v0, :cond_6

    iget-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    invoke-virtual {v0}, Landroid/support/v7/widget/o;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_4
.end method

.method public b()Z
    .locals 21

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    invoke-virtual {v2}, Landroid/support/v7/view/menu/g;->h()Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v14

    move-object/from16 v0, p0

    iget v7, v0, Landroid/support/v7/widget/j;->p:I

    move-object/from16 v0, p0

    iget v9, v0, Landroid/support/v7/widget/j;->o:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v15

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    check-cast v2, Landroid/view/ViewGroup;

    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x0

    move v10, v3

    :goto_0
    if-ge v10, v14, :cond_2

    invoke-virtual {v13, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/view/menu/j;

    invoke-virtual {v3}, Landroid/support/v7/view/menu/j;->l()Z

    move-result v11

    if-eqz v11, :cond_0

    add-int/lit8 v6, v6, 0x1

    :goto_1
    move-object/from16 v0, p0

    iget-boolean v11, v0, Landroid/support/v7/widget/j;->t:Z

    if-eqz v11, :cond_1e

    invoke-virtual {v3}, Landroid/support/v7/view/menu/j;->isActionViewExpanded()Z

    move-result v3

    if-eqz v3, :cond_1e

    const/4 v3, 0x0

    :goto_2
    add-int/lit8 v7, v10, 0x1

    move v10, v7

    move v7, v3

    goto :goto_0

    :cond_0
    invoke-virtual {v3}, Landroid/support/v7/view/menu/j;->k()Z

    move-result v11

    if-eqz v11, :cond_1

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_1
    const/4 v4, 0x1

    goto :goto_1

    :cond_2
    move-object/from16 v0, p0

    iget-boolean v3, v0, Landroid/support/v7/widget/j;->l:Z

    if-eqz v3, :cond_4

    if-nez v4, :cond_3

    add-int v3, v6, v5

    if-le v3, v7, :cond_4

    :cond_3
    add-int/lit8 v7, v7, -0x1

    :cond_4
    sub-int v10, v7, v6

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/j;->v:Landroid/util/SparseBooleanArray;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/util/SparseBooleanArray;->clear()V

    const/4 v4, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-boolean v5, v0, Landroid/support/v7/widget/j;->r:Z

    if-eqz v5, :cond_1d

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/v7/widget/j;->u:I

    div-int v3, v9, v3

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/j;->u:I

    rem-int v4, v9, v4

    move-object/from16 v0, p0

    iget v5, v0, Landroid/support/v7/widget/j;->u:I

    div-int/2addr v4, v3

    add-int/2addr v4, v5

    move v5, v4

    :goto_3
    const/4 v4, 0x0

    move v12, v4

    move v7, v8

    move v4, v3

    :goto_4
    if-ge v12, v14, :cond_17

    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/view/menu/j;

    invoke-virtual {v3}, Landroid/support/v7/view/menu/j;->l()Z

    move-result v6

    if-eqz v6, :cond_8

    move-object/from16 v0, p0

    iget-object v6, v0, Landroid/support/v7/widget/j;->w:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v6, v2}, Landroid/support/v7/widget/j;->a(Landroid/support/v7/view/menu/j;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/v7/widget/j;->w:Landroid/view/View;

    if-nez v8, :cond_5

    move-object/from16 v0, p0

    iput-object v6, v0, Landroid/support/v7/widget/j;->w:Landroid/view/View;

    :cond_5
    move-object/from16 v0, p0

    iget-boolean v8, v0, Landroid/support/v7/widget/j;->r:Z

    if-eqz v8, :cond_7

    const/4 v8, 0x0

    invoke-static {v6, v5, v4, v15, v8}, Landroid/support/v7/widget/ActionMenuView;->a(Landroid/view/View;IIII)I

    move-result v8

    sub-int/2addr v4, v8

    :goto_5
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    sub-int v8, v9, v6

    if-nez v7, :cond_1c

    :goto_6
    invoke-virtual {v3}, Landroid/support/v7/view/menu/j;->getGroupId()I

    move-result v7

    if-eqz v7, :cond_6

    const/4 v9, 0x1

    move-object/from16 v0, v16

    invoke-virtual {v0, v7, v9}, Landroid/util/SparseBooleanArray;->put(IZ)V

    :cond_6
    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Landroid/support/v7/view/menu/j;->d(Z)V

    move v3, v8

    move v7, v10

    :goto_7
    add-int/lit8 v8, v12, 0x1

    move v12, v8

    move v9, v3

    move v10, v7

    move v7, v6

    goto :goto_4

    :cond_7
    invoke-virtual {v6, v15, v15}, Landroid/view/View;->measure(II)V

    goto :goto_5

    :cond_8
    invoke-virtual {v3}, Landroid/support/v7/view/menu/j;->k()Z

    move-result v6

    if-eqz v6, :cond_16

    invoke-virtual {v3}, Landroid/support/v7/view/menu/j;->getGroupId()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v18

    if-gtz v10, :cond_9

    if-eqz v18, :cond_e

    :cond_9
    if-lez v9, :cond_e

    move-object/from16 v0, p0

    iget-boolean v6, v0, Landroid/support/v7/widget/j;->r:Z

    if-eqz v6, :cond_a

    if-lez v4, :cond_e

    :cond_a
    const/4 v6, 0x1

    :goto_8
    if-eqz v6, :cond_1b

    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/v7/widget/j;->w:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v8, v2}, Landroid/support/v7/widget/j;->a(Landroid/support/v7/view/menu/j;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/v7/widget/j;->w:Landroid/view/View;

    if-nez v8, :cond_b

    move-object/from16 v0, p0

    iput-object v11, v0, Landroid/support/v7/widget/j;->w:Landroid/view/View;

    :cond_b
    move-object/from16 v0, p0

    iget-boolean v8, v0, Landroid/support/v7/widget/j;->r:Z

    if-eqz v8, :cond_f

    const/4 v8, 0x0

    invoke-static {v11, v5, v4, v15, v8}, Landroid/support/v7/widget/ActionMenuView;->a(Landroid/view/View;IIII)I

    move-result v19

    sub-int v8, v4, v19

    if-nez v19, :cond_1a

    const/4 v4, 0x0

    :goto_9
    move v6, v8

    :goto_a
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    sub-int/2addr v9, v8

    if-nez v7, :cond_c

    move v7, v8

    :cond_c
    move-object/from16 v0, p0

    iget-boolean v8, v0, Landroid/support/v7/widget/j;->r:Z

    if-eqz v8, :cond_11

    if-ltz v9, :cond_10

    const/4 v8, 0x1

    :goto_b
    and-int/2addr v4, v8

    move v11, v4

    move v8, v7

    move v7, v6

    :goto_c
    if-eqz v11, :cond_13

    if-eqz v17, :cond_13

    const/4 v4, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v0, v1, v4}, Landroid/util/SparseBooleanArray;->put(IZ)V

    move v4, v10

    :goto_d
    if-eqz v11, :cond_d

    add-int/lit8 v4, v4, -0x1

    :cond_d
    invoke-virtual {v3, v11}, Landroid/support/v7/view/menu/j;->d(Z)V

    move v6, v8

    move v3, v9

    move/from16 v20, v7

    move v7, v4

    move/from16 v4, v20

    goto :goto_7

    :cond_e
    const/4 v6, 0x0

    goto :goto_8

    :cond_f
    invoke-virtual {v11, v15, v15}, Landroid/view/View;->measure(II)V

    move/from16 v20, v6

    move v6, v4

    move/from16 v4, v20

    goto :goto_a

    :cond_10
    const/4 v8, 0x0

    goto :goto_b

    :cond_11
    add-int v8, v9, v7

    if-lez v8, :cond_12

    const/4 v8, 0x1

    :goto_e
    and-int/2addr v4, v8

    move v11, v4

    move v8, v7

    move v7, v6

    goto :goto_c

    :cond_12
    const/4 v8, 0x0

    goto :goto_e

    :cond_13
    if-eqz v18, :cond_19

    const/4 v4, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v0, v1, v4}, Landroid/util/SparseBooleanArray;->put(IZ)V

    const/4 v4, 0x0

    move v6, v10

    move v10, v4

    :goto_f
    if-ge v10, v12, :cond_18

    invoke-virtual {v13, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/view/menu/j;

    invoke-virtual {v4}, Landroid/support/v7/view/menu/j;->getGroupId()I

    move-result v18

    move/from16 v0, v18

    move/from16 v1, v17

    if-ne v0, v1, :cond_15

    invoke-virtual {v4}, Landroid/support/v7/view/menu/j;->j()Z

    move-result v18

    if-eqz v18, :cond_14

    add-int/lit8 v6, v6, 0x1

    :cond_14
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v4, v0}, Landroid/support/v7/view/menu/j;->d(Z)V

    :cond_15
    add-int/lit8 v4, v10, 0x1

    move v10, v4

    goto :goto_f

    :cond_16
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Landroid/support/v7/view/menu/j;->d(Z)V

    move v6, v7

    move v3, v9

    move v7, v10

    goto/16 :goto_7

    :cond_17
    const/4 v2, 0x1

    return v2

    :cond_18
    move v4, v6

    goto :goto_d

    :cond_19
    move v4, v10

    goto :goto_d

    :cond_1a
    move v4, v6

    goto/16 :goto_9

    :cond_1b
    move v11, v6

    move v8, v7

    move v7, v4

    goto :goto_c

    :cond_1c
    move v6, v7

    goto/16 :goto_6

    :cond_1d
    move v5, v4

    goto/16 :goto_3

    :cond_1e
    move v3, v7

    goto/16 :goto_2
.end method

.method public c()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    invoke-virtual {v0}, Landroid/support/v7/widget/o;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-boolean v0, p0, Landroid/support/v7/widget/j;->k:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/widget/j;->j:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public c(Z)V
    .locals 1

    iput-boolean p1, p0, Landroid/support/v7/widget/j;->l:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/j;->m:Z

    return-void
.end method

.method public d(Z)V
    .locals 0

    iput-boolean p1, p0, Landroid/support/v7/widget/j;->t:Z

    return-void
.end method

.method public d()Z
    .locals 6

    const/4 v5, 0x1

    iget-boolean v0, p0, Landroid/support/v7/widget/j;->l:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/support/v7/widget/j;->h()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/j;->z:Landroid/support/v7/widget/n;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/g;->k()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v7/widget/q;

    iget-object v2, p0, Landroid/support/v7/widget/j;->b:Landroid/content/Context;

    iget-object v3, p0, Landroid/support/v7/widget/j;->c:Landroid/support/v7/view/menu/g;

    iget-object v4, p0, Landroid/support/v7/widget/j;->i:Landroid/support/v7/widget/o;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/widget/q;-><init>(Landroid/support/v7/widget/j;Landroid/content/Context;Landroid/support/v7/view/menu/g;Landroid/view/View;Z)V

    new-instance v1, Landroid/support/v7/widget/n;

    invoke-direct {v1, p0, v0}, Landroid/support/v7/widget/n;-><init>(Landroid/support/v7/widget/j;Landroid/support/v7/widget/q;)V

    iput-object v1, p0, Landroid/support/v7/widget/j;->z:Landroid/support/v7/widget/n;

    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Landroid/support/v7/widget/j;->z:Landroid/support/v7/widget/n;

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    invoke-super {p0, v0}, Landroid/support/v7/view/menu/d;->a(Landroid/support/v7/view/menu/aa;)Z

    :goto_0
    return v5

    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public e()Z
    .locals 3

    const/4 v1, 0x1

    iget-object v0, p0, Landroid/support/v7/widget/j;->z:Landroid/support/v7/widget/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/j;->f:Landroid/support/v7/view/menu/w;

    check-cast v0, Landroid/view/View;

    iget-object v2, p0, Landroid/support/v7/widget/j;->z:Landroid/support/v7/widget/n;

    invoke-virtual {v0, v2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/j;->z:Landroid/support/v7/widget/n;

    move v0, v1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v7/widget/j;->x:Landroid/support/v7/widget/q;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/support/v7/view/menu/s;->e()V

    move v0, v1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public f()Z
    .locals 2

    invoke-virtual {p0}, Landroid/support/v7/widget/j;->e()Z

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/j;->g()Z

    move-result v1

    or-int/2addr v0, v1

    return v0
.end method

.method public g()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->y:Landroid/support/v7/widget/l;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/j;->y:Landroid/support/v7/widget/l;

    invoke-virtual {v0}, Landroid/support/v7/widget/l;->e()V

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public h()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/j;->x:Landroid/support/v7/widget/q;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/j;->x:Landroid/support/v7/widget/q;

    invoke-virtual {v0}, Landroid/support/v7/widget/q;->f()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
