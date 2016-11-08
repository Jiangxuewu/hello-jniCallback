.class Landroid/support/v4/g/bh;
.super Landroid/support/v4/g/bf;


# static fields
.field static b:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-boolean v0, Landroid/support/v4/g/bh;->b:Z

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/g/bf;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Landroid/support/v4/g/a;)V
    .locals 1

    if-nez p2, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {p1, v0}, Landroid/support/v4/g/bs;->a(Landroid/view/View;Ljava/lang/Object;)V

    return-void

    :cond_0
    invoke-virtual {p2}, Landroid/support/v4/g/a;->a()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public h(Landroid/view/View;)Landroid/support/v4/g/cl;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/g/bh;->a:Ljava/util/WeakHashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Landroid/support/v4/g/bh;->a:Ljava/util/WeakHashMap;

    :cond_0
    iget-object v0, p0, Landroid/support/v4/g/bh;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/g/cl;

    if-nez v0, :cond_1

    new-instance v0, Landroid/support/v4/g/cl;

    invoke-direct {v0, p1}, Landroid/support/v4/g/cl;-><init>(Landroid/view/View;)V

    iget-object v1, p0, Landroid/support/v4/g/bh;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object v0
.end method
