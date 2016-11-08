.class Landroid/support/v7/widget/cq;
.super Landroid/content/ContextWrapper;


# static fields
.field private static final a:Ljava/util/ArrayList;


# instance fields
.field private b:Landroid/content/res/Resources;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Landroid/support/v7/widget/cq;->a:Ljava/util/ArrayList;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static a(Landroid/content/Context;)Landroid/content/Context;
    .locals 4

    instance-of v0, p0, Landroid/support/v7/widget/cq;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    sget-object v1, Landroid/support/v7/widget/cq;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_3

    sget-object v0, Landroid/support/v7/widget/cq;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/cq;

    :goto_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/support/v7/widget/cq;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    if-ne v3, p0, :cond_2

    move-object p0, v0

    :cond_0
    :goto_2
    return-object p0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_3
    new-instance v0, Landroid/support/v7/widget/cq;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/cq;-><init>(Landroid/content/Context;)V

    sget-object v1, Landroid/support/v7/widget/cq;->a:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object p0, v0

    goto :goto_2
.end method


# virtual methods
.method public getResources()Landroid/content/res/Resources;
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/cq;->b:Landroid/content/res/Resources;

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v7/widget/cs;

    invoke-super {p0}, Landroid/content/ContextWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/cs;-><init>(Landroid/content/Context;Landroid/content/res/Resources;)V

    iput-object v0, p0, Landroid/support/v7/widget/cq;->b:Landroid/content/res/Resources;

    :cond_0
    iget-object v0, p0, Landroid/support/v7/widget/cq;->b:Landroid/content/res/Resources;

    return-object v0
.end method
