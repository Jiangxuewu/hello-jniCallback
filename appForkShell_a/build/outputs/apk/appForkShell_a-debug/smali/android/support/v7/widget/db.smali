.class final Landroid/support/v7/widget/db;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/os/Parcel;)Landroid/support/v7/widget/da;
    .locals 1

    new-instance v0, Landroid/support/v7/widget/da;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/da;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public a(I)[Landroid/support/v7/widget/da;
    .locals 1

    new-array v0, p1, [Landroid/support/v7/widget/da;

    return-object v0
.end method

.method public synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/db;->a(Landroid/os/Parcel;)Landroid/support/v7/widget/da;

    move-result-object v0

    return-object v0
.end method

.method public synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/db;->a(I)[Landroid/support/v7/widget/da;

    move-result-object v0

    return-object v0
.end method
