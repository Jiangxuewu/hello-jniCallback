.class Landroid/support/v4/g/cp;
.super Landroid/support/v4/g/cn;


# instance fields
.field b:Ljava/util/WeakHashMap;


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/g/cn;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/g/cp;->b:Ljava/util/WeakHashMap;

    return-void
.end method


# virtual methods
.method public a(Landroid/support/v4/g/cl;Landroid/view/View;)V
    .locals 0

    invoke-static {p2}, Landroid/support/v4/g/cw;->a(Landroid/view/View;)V

    return-void
.end method

.method public a(Landroid/support/v4/g/cl;Landroid/view/View;F)V
    .locals 0

    invoke-static {p2, p3}, Landroid/support/v4/g/cw;->a(Landroid/view/View;F)V

    return-void
.end method

.method public a(Landroid/support/v4/g/cl;Landroid/view/View;Landroid/support/v4/g/da;)V
    .locals 1

    const/high16 v0, 0x7e000000

    invoke-virtual {p2, v0, p3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    new-instance v0, Landroid/support/v4/g/cq;

    invoke-direct {v0, p1}, Landroid/support/v4/g/cq;-><init>(Landroid/support/v4/g/cl;)V

    invoke-static {p2, v0}, Landroid/support/v4/g/cw;->a(Landroid/view/View;Landroid/support/v4/g/da;)V

    return-void
.end method
