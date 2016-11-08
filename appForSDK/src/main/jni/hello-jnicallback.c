#include <string.h>
#include <pthread.h>
#include <jni.h>
#include <android/log.h>
#include <assert.h>


#include <stdio.h>
#include <unistd.h>


#include <sys/socket.h>

#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>


// Android log function wrappers
static const char *kTAG = "Jni_cpp";
static const int debug = 1;//0 false; >0 true
#define LOGD(...) \
  ((void)__android_log_print(ANDROID_LOG_DEBUG, kTAG, __VA_ARGS__))
#define LOGI(...) \
  ((void)__android_log_print(ANDROID_LOG_INFO, kTAG, __VA_ARGS__))
#define LOGW(...) \
  ((void)__android_log_print(ANDROID_LOG_WARN, kTAG, __VA_ARGS__))
#define LOGE(...) \
  ((void)__android_log_print(ANDROID_LOG_ERROR, kTAG, __VA_ARGS__))

// processing callback to handler class
typedef struct tick_context {
    JavaVM *javaVM;
//    JNIEnv *env;
    jclass jniHelperClz;
    jobject jniHelperObj;
    jclass mainActivityClz;
    jobject mainActivityObj;
    pthread_mutex_t lock;
    int done;
} TickContext;
TickContext g_ctx;

typedef struct check_file {
    JNIEnv *env;
    jobject instance;
} Check_file;
Check_file g_Check_file;

/* This is a trivial JNI example where we use a native method
 * to return a new VM String. See the corresponding Java source
 * file located at:
 *
 *   apps/samples/hello-jni/project/src/com/example/hellojni/HelloJni.java
 */
jstring
Java_com_example_hello_1jnicallback_MainActivity_stringFromJNI(JNIEnv *env, jobject thiz) {
#if defined(__arm__)
#if defined(__ARM_ARCH_7A__)
#if defined(__ARM_NEON__)
#if defined(__ARM_PCS_VFP)
#define ABI "armeabi-v7a/NEON (hard-float)"
#else
#define ABI "armeabi-v7a/NEON"
#endif
#else
#if defined(__ARM_PCS_VFP)
#define ABI "armeabi-v7a (hard-float)"
#else
#define ABI "armeabi-v7a"
#endif
#endif
#else
#define ABI "armeabi"
#endif
#elif defined(__i386__)
#define ABI "x86"
#elif defined(__x86_64__)
#define ABI "x86_64"
#elif defined(__mips64)  /* mips64el-* toolchain defines __mips__ too */
#define ABI "mips64"
#elif defined(__mips__)
#define ABI "mips"
#elif defined(__aarch64__)
#define ABI "arm64-v8a"
#else
#define ABI "unknown"
#endif
    return (*env)->NewStringUTF(env, "Hello from JNI !  Compiled with ABI " ABI ".");
}

/*
 *  A helper function to show how to call
 *     java static functions JniHelper::getBuildVersion()
 *     java non-static function JniHelper::getRuntimeMemorySize()
 *  The trivial implementation for these functions are inside file
 *     JniHelper.java
 */
void queryRuntimeInfo(JNIEnv *env, jobject instance) {
    // Find out which OS we are running on. It does not matter for this app
    // just to demo how to call static functions.
    // Our java JniHelper class id and instance are initialized when this
    // shared lib got loaded, we just directly use them
    //    static function does not need instance, so we just need to feed
    //    class and method id to JNI
    jmethodID versionFunc = (*env)->GetStaticMethodID(env, g_ctx.jniHelperClz,
                                                      "getBuildVersion", "()Ljava/lang/String;");
    if (!versionFunc) {
        if (debug)
            LOGE("Failed to retrieve getBuildVersion() methodID @ line %d",
                 __LINE__);
        return;
    }
    jstring buildVersion = (*env)->CallStaticObjectMethod(env, g_ctx.jniHelperClz, versionFunc);
    const char *version = (*env)->GetStringUTFChars(env, buildVersion, NULL);
    if (!version) {
        if (debug) LOGE("Unable to get version string @ line %d", __LINE__);
        return;
    }
    if (debug) LOGI("Android Version - %s", version);
    (*env)->ReleaseStringUTFChars(env, buildVersion, version);

    // we are called from JNI_OnLoad, so got to release it to avoid
    // leaking
    (*env)->DeleteLocalRef(env, buildVersion);

    // Query available memory size from a non-static public function
    // we need use an instance of JniHelper class to call JNI
    jmethodID memFunc = (*env)->GetMethodID(env, g_ctx.jniHelperClz,
                                            "getRuntimeMemorySize", "()J");
    if (!memFunc) {
        if (debug)
            LOGE("Failed to retrieve getRuntimeMemorySize() methodID @ line %d",
                 __LINE__);
        return;
    }
    jlong result = (*env)->CallLongMethod(env, instance, memFunc);
    if (debug) LOGI("Runtime free memory size: %lld", result);
    (void) result;  // silence the compiler warning
}

jstring *get(JNIEnv *env, jobject instance, const char *key1, const char *key2) {
    if (debug) LOGI("get(), key1 = %s, key2 = %s", key1, key2);
//    jmethodID getId = (*env)->GetStaticMethodID(env, g_ctx.jniHelperClz,
//                                          "specialGet",
//                                          "()Ljava/lang/String;");
    jmethodID getId = (*env)->GetStaticMethodID(env, g_ctx.jniHelperClz,
                                                "specialGet",
                                                "()Ljava/lang/String;");//Ljava/lang/String;Ljava/lang/String;
    if (!getId) {
        if (debug)
            LOGE("Failed to retrieve getBuildVersion() methodID @ line %d",
                 __LINE__);
        return NULL;
    }

    if (debug) LOGI("get() 2");
//    jstring p1 = (*env)->NewStringUTF(env, key1);
//    jstring p2 = (*env)->NewStringUTF(env, key2);
    char *result = (*env)->CallStaticObjectMethod(env, g_ctx.jniHelperClz, getId);
    LOGI("key1 = %s, key2 = %s, result = %s", key1, key2, result);
//    return result;
//    return (*env)->NewStringUTF(env, result);
    return NULL;
}

void *init(void *context) {
    LOGI("init 1");
//    TickContext *pctx = (TickContext *) context;
    LOGI("init 2");
//    JavaVM *javaVM = pctx->javaVM;
    LOGI("init 3");
//    JNIEnv *env;
    LOGI("init 4");
//    jint res = (*g_ctx.javaVM)->GetEnv(g_ctx.javaVM, (void **) &env, JNI_VERSION_1_6);
//    LOGI("init 5 res = %d", res);
//    if (res != JNI_OK) {
//        res = (*g_ctx.javaVM)->AttachCurrentThread(g_ctx.javaVM, &env, NULL);
//        if (JNI_OK != res) {
//            LOGE("Failed to AttachCurrentThread, ErrorCode = %d", res);
//            return NULL;
//        }
//    }

    LOGI("init 6");

//    queryRuntimeInfo(g_ctx.env, g_ctx.jniHelperObj);
//    getPackname(g_ctx.env, g_ctx.jniHelperObj);

//    jstring result = get(g_ctx.env, g_ctx.jniHelperObj, "version", "");
//    LOGI("init, version = %s", result);
}

const char *getPackname(JNIEnv *env, jobject context) {

    //Context的类
    jclass context_clazz = (*env)->GetObjectClass(env, context);

//    // 得到 getPackageManager 方法的 ID
//    jmethodID methodID_getPackageManager = (*env)->GetMethodID(env, context_clazz,
//                                                               "getPackageManager", "()Landroid/content/pm/PackageManager;");

//    // 获得PackageManager对象
//    jobject packageManager = (*env)->CallObjectMethod(env, context,
//                                                      methodID_getPackageManager);
//
//    // 获得 PackageManager 类
//    jclass pm_clazz = (*env)->GetObjectClass(env, packageManager);
//
//    // 得到 getPackageInfo 方法的 ID
//    jmethodID methodID_pm = (*env)->GetMethodID(env, pm_clazz, "getPackageInfo",
//                                                "(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;");

//    //得到 getPackageName 方法的 ID
    jmethodID methodID_pack = (*env)->GetMethodID(env, context_clazz,
                                                  "getPackageName", "()Ljava/lang/String;");
    // 获得当前应用的包名
    jstring application_package = (*env)->CallObjectMethod(env, context,
                                                           methodID_pack);

    const char *str = (*env)->GetStringUTFChars(env, application_package, 0);
    __android_log_print(ANDROID_LOG_DEBUG, "JNI", "packageName: %s\n", str);

    return str;
}

void *checkDataFile(void *packageName) {


    jint i = 1;
    struct timeval beginTime, curTime, usedTime, leftTime;
    const struct timeval kOneSecond = {
            (__kernel_time_t) 1,
            (__kernel_suseconds_t) 0
    };

    while (i >= 0) {
        LOGI(" 1234 Test, i = %d", i);
        i++;

        gettimeofday(&beginTime, NULL);
        gettimeofday(&curTime, NULL);
        timersub(&curTime, &beginTime, &usedTime);
        timersub(&kOneSecond, &usedTime, &leftTime);
        struct timespec sleepTime;
        sleepTime.tv_sec = leftTime.tv_sec;
        sleepTime.tv_nsec = leftTime.tv_usec * 1000 * 1;
        nanosleep(&sleepTime, NULL);

    }

    return packageName;
}

/*
 * A helper function to wrap java JniHelper::updateStatus(String msg)
 * JNI allow us to call this function via an instance even it is
 * private function.
 */
void sendJavaMsg(JNIEnv *env, jobject instance,
                 jmethodID func, const char *msg) {
    jstring javaMsg = (*env)->NewStringUTF(env, msg);
    (*env)->CallVoidMethod(env, instance, func, javaMsg);
    (*env)->DeleteLocalRef(env, javaMsg);
}

/*
 * Main working thread function. From a pthread,
 *     calling back to MainActivity::updateTimer() to display ticks on UI
 *     calling back to JniHelper::updateStatus(String msg) for msg
 */
void *UpdateTicks(void *context) {
    TickContext *pctx = (TickContext *) context;
    JavaVM *javaVM = pctx->javaVM;
    JNIEnv *env;
    jint res = (*javaVM)->GetEnv(javaVM, (void **) &env, JNI_VERSION_1_6);
    if (res != JNI_OK) {
        res = (*javaVM)->AttachCurrentThread(javaVM, &env, NULL);
        if (JNI_OK != res) {
            LOGE("Failed to AttachCurrentThread, ErrorCode = %d", res);
            return NULL;
        }
    }

    jmethodID statusId = (*env)->GetMethodID(env, pctx->jniHelperClz,
                                             "updateStatus",
                                             "(Ljava/lang/String;)V");
    sendJavaMsg(env, pctx->jniHelperObj, statusId,
                "TickerThread status: initializing...");

    // get mainActivity updateTimer function
    jmethodID timerId = (*env)->GetMethodID(env, pctx->mainActivityClz,
                                            "updateTimer", "()V");

    struct timeval beginTime, curTime, usedTime, leftTime;
    const struct timeval kOneSecond = {
            (__kernel_time_t) 1,
            (__kernel_suseconds_t) 0
    };

    sendJavaMsg(env, pctx->jniHelperObj, statusId,
                "TickerThread status: start ticking ...");
    while (1) {
        gettimeofday(&beginTime, NULL);
        pthread_mutex_lock(&pctx->lock);
        int done = pctx->done;
        if (pctx->done) {
            pctx->done = 0;
        }
        pthread_mutex_unlock(&pctx->lock);
        if (done) {
            break;
        }
        (*env)->CallVoidMethod(env, pctx->mainActivityObj, timerId);

        gettimeofday(&curTime, NULL);
        timersub(&curTime, &beginTime, &usedTime);
        timersub(&kOneSecond, &usedTime, &leftTime);
        struct timespec sleepTime;
        sleepTime.tv_sec = leftTime.tv_sec;
        sleepTime.tv_nsec = leftTime.tv_usec * 1000;

        if (sleepTime.tv_sec <= 1) {
            nanosleep(&sleepTime, NULL);
        } else {
            sendJavaMsg(env, pctx->jniHelperObj, statusId,
                        "TickerThread error: processing too long!");
        }
    }

    sendJavaMsg(env, pctx->jniHelperObj, statusId,
                "TickerThread status: ticking stopped");
    (*javaVM)->DetachCurrentThread(javaVM);
    return context;
}


/**
 * 返回值 char* 这个代表char数组的首地址
 * Jstring2CStr 把java中的jstring的类型转化成一个c语言中的char 字符串
 */
char *Jstring2CStr(JNIEnv *env, jstring jstr) {
    char *rtn = NULL;
    jclass clsstring = (*env)->FindClass(env, "java/lang/String"); //String
    jstring strencode = (*env)->NewStringUTF(env, "GB2312"); // 得到一个java字符串 "GB2312"
    jmethodID mid = (*env)->GetMethodID(env, clsstring, "getBytes",
                                        "(Ljava/lang/String;)[B"); //[ String.getBytes("gb2312");
    jbyteArray barr = (jbyteArray) (*env)->CallObjectMethod(env, jstr, mid,
                                                            strencode); // String .getByte("GB2312");
    jsize alen = (*env)->GetArrayLength(env, barr); // byte数组的长度
    jbyte *ba = (*env)->GetByteArrayElements(env, barr, JNI_FALSE);
    if (alen > 0) {
        rtn = (char *) malloc(alen + 1); //""
        memcpy(rtn, ba, alen);
        rtn[alen] = 0;
    }
    (*env)->ReleaseByteArrayElements(env, barr, ba, 0); //
    return rtn;
}



/*
 * processing one time initialization:
 *     Cache the javaVM into our context
 *     Find class ID for JniHelper
 *     Create an instance of JniHelper
 *     Make global reference since we are using them from a native thread
 * Note:
 *     All resources allocated here are never released by application
 *     we rely on system to free all global refs when it goes away,
 *     the pairing function JNI_OnUnload() never get called at all.
 */
JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved) {
    JNIEnv *env;
    memset(&g_ctx, 0, sizeof(g_ctx));
    if (debug) LOGI("jni_onload");
    g_ctx.javaVM = vm;
    if ((*vm)->GetEnv(vm, (void **) &env, JNI_VERSION_1_6) != JNI_OK) {
        return JNI_ERR; // JNI version not supported.
    }

    //找类
    jclass clz = (*env)->FindClass(env, "com/bb_sz/jni/Jni");

    //构建全局引用？
    g_ctx.jniHelperClz = (*env)->NewGlobalRef(env, clz);

    //构造函数ID
    jmethodID jniHelperCtor = (*env)->GetMethodID(env, g_ctx.jniHelperClz, "<init>", "()V");

    //new 对象
    jobject handler = (*env)->NewObject(env, g_ctx.jniHelperClz, jniHelperCtor);

    //全局对象
    g_ctx.jniHelperObj = (*env)->NewGlobalRef(env, handler);

    queryRuntimeInfo(env, g_ctx.jniHelperObj);

    g_ctx.done = 0;
    g_ctx.mainActivityObj = NULL;
    return JNI_VERSION_1_6;
}

JNIEXPORT void JNICALL
Java_com_example_hello_1jnicallback_MainActivity_uninstall(JNIEnv *env, jobject instance,
                                                           jstring packageDir,
                                                           jint sdkVersion) {
    // 1，将传递过来的java的包名转为c的字符串
    char *pd = Jstring2CStr(env, packageDir);

    LOGD("uninstall pd = %s", pd);

    // 2，创建当前进程的克隆进程
    pid_t pid = fork();

    // 3，根据返回值的不同做不同的操作,<0,>0,=0
    if (pid < 0) {
        // 说明克隆进程失败
        LOGD("current crate process failure");
    } else if (pid > 0) {
        // 说明克隆进程成功，而且该代码运行在父进程中
        LOGD("crate process success,current parent 父 pid = %d", pid);
    } else {
        // 说明克隆进程成功，而且代码运行在子进程中
        LOGD("crate process success,current child 子 pid = %d", pid);

        // 子进程注册目录监听器
//        jint fileDescriptor = inotify_init();
//        if (fileDescriptor < 0) {
//            LOGD("子进程注册目录监听器 失败 code = %d", fileDescriptor);
//            exit(1);
//        }
//
//        int watchDescriptor;
//        watchDescriptor = inotify_add_watch(fileDescriptor,
//                                            (*env)->GetStringUTFChars(env, path, NULL), IN_DELETE);
//        if (watchDescriptor < 0) {
//            LOG_DEBUG((*env)->GetStringUTFChars(env, tag, &b_IS_COPY),
//                      (*env)->GetStringUTFChars(env, (*env)->NewStringUTF(env, inotify_add_watch failed !!!), &b_IS_COPY));
//
//            exit(1);
//        }



        // 4，在子进程中监视/data/data/包名这个目录
        while (JNI_TRUE) {
            FILE *file = fopen(pd, "rt");

            if (file == NULL) {
                // 应用被卸载了，通知系统打开用户反馈的网页
                LOGE("app uninstall,current sdkversion = %d", sdkVersion);
                if (sdkVersion >= 17) {
                    // Android4.2系统之后支持多用户操作，所以得指定用户
//                    execlp("am", "am", "start", "--user", "0", "-a",
//                           "android.intent.action.VIEW", "-d",
//                           "http://www.baidu.com", (char*) NULL);
                } else {
                    // Android4.2以前的版本无需指定用户
//                    execlp("am", "am", "start", "-a",
//                           "android.intent.action.VIEW", "-d",
//                           "http://www.baidu.com", (char*) NULL);
                }
            } else {
                // 应用没有被卸载
                LOGE("app run normal");
            }
            sleep(1);
        }
    }
}
/*
 * Interface to Java side to start ticks, caller is from onResume()
 */
JNIEXPORT void JNICALL
Java_com_example_hello_1jnicallback_MainActivity_checkProcess(JNIEnv *env, jobject instance) {

    const char *packageName = getPackname(env, instance);
    LOGI(packageName);

//    (*env)->fock();

    pthread_t threadInfo_;
    pthread_attr_t threadAttr_;

    pthread_attr_init(&threadAttr_);
    pthread_attr_setdetachstate(&threadAttr_, PTHREAD_CREATE_DETACHED);

    g_Check_file.env = env;
    g_Check_file.instance = instance;
    int result = pthread_create(&threadInfo_, &threadAttr_, checkDataFile, &packageName);
    assert(result == 0);
    (void) result;

//    checkDataFile(env, instance);

//    const char *pathname = getPackname(env, instance);
//    jint flags = 0;
//    jint mode = 0;
//    jint file =  (*env)->open( pathname,flags, mode);
}

JNIEXPORT void JNICALL
Java_com_example_hello_1jnicallback_MainActivity_startTicks(JNIEnv *env, jobject instance) {
    pthread_t threadInfo_;
    pthread_attr_t threadAttr_;

    pthread_attr_init(&threadAttr_);
    pthread_attr_setdetachstate(&threadAttr_, PTHREAD_CREATE_DETACHED);

    pthread_mutex_init(&g_ctx.lock, NULL);

    jclass clz = (*env)->GetObjectClass(env, instance);
    g_ctx.mainActivityClz = (*env)->NewGlobalRef(env, clz);
    g_ctx.mainActivityObj = (*env)->NewGlobalRef(env, instance);

    int result = pthread_create(&threadInfo_, &threadAttr_, UpdateTicks, &g_ctx);
    assert(result == 0);
    (void) result;
}

/*
 * Interface to Java side to stop ticks:
 *    we need to hold and make sure our native thread has finished before return
 *    for a clean shutdown. The caller is from onPause
 */
JNIEXPORT void JNICALL
Java_com_example_hello_1jnicallback_MainActivity_StopTicks(JNIEnv *env, jobject instance) {
    pthread_mutex_lock(&g_ctx.lock);
    g_ctx.done = 1;
    pthread_mutex_unlock(&g_ctx.lock);

    // waiting for ticking thread to flip the done flag
    struct timespec sleepTime;
    memset(&sleepTime, 0, sizeof(sleepTime));
    sleepTime.tv_nsec = 100000000;
    while (g_ctx.done) {
        nanosleep(&sleepTime, NULL);
    }

    // release object we allocated from StartTicks() function
    (*env)->DeleteGlobalRef(env, g_ctx.mainActivityClz);
    (*env)->DeleteGlobalRef(env, g_ctx.mainActivityObj);
    g_ctx.mainActivityObj = NULL;
    g_ctx.mainActivityClz = NULL;

    pthread_mutex_destroy(&g_ctx.lock);
}

void _szhttp(const char *param, const char *host, int port) {
    if (debug)LOGI("httpReq start:");
    int socket_handle = socket(AF_INET, SOCK_STREAM, 0);
    if (socket_handle < 0) {
        if (debug) LOGE("httpReq end.建立socket()出错...%s", strerror(errno));
    } else {
        if (debug) LOGI("httpReq end.建立socket()成功");
        struct sockaddr_in loc_addr;//本机地址
        loc_addr.sin_family = AF_INET;//协议
        loc_addr.sin_addr.s_addr = htons(INADDR_ANY);
        loc_addr.sin_port = htons(INADDR_ANY);
        if (bind(socket_handle, (struct sockaddr *) &loc_addr, sizeof(struct sockaddr_in)) < 0) {
            if (debug) LOGI("httpReq end.bind()出错...%s", strerror(errno));
        } else {
            if (debug) LOGI("httpReq end.bind()成功.");
            struct hostent *serHost = gethostbyname(host);
            char ipbd[32] = {0};
            inet_ntop(serHost->h_addrtype, *serHost->h_addr_list, ipbd, sizeof(ipbd));

            if (debug) LOGI("httpReq end.ip:%s", ipbd);

            struct sockaddr_in serv_add;//服务器地址
            serv_add.sin_family = AF_INET;
            serv_add.sin_addr.s_addr = inet_addr(ipbd);
            serv_add.sin_port = htons(port);
            if (connect(socket_handle, (struct sockaddr *) &serv_add, sizeof(struct sockaddr_in)) <
                0) {
                if (debug) LOGI("httpReq end.connect()出错...%s", strerror(errno));
            } else {
                if (debug) LOGI("httpReq end.connect()成功.");
                if (send(socket_handle, param, strlen(param), 0) < 0) { //发送头部
                    if (debug) LOGI("httpReq end.send()出错...%s", strerror(errno));
                } else {
                    if (debug) LOGI("httpReq end.send()成功.");
                    char *result = (char *) malloc(sizeof(char));
                    char *temp_result = (char *) malloc(sizeof(char));;
                    size_t SIZE = sizeof(char) * 1024;
                    char *cache = (char *) malloc(SIZE);
                    ssize_t len = 0;
                    memset(result, 0x00, sizeof(char));
                    memset(temp_result, 0x00, sizeof(char));
                    memset(cache, 0x00, SIZE);
                    if (debug) LOGI("httpReq end. 开始接收服务器返回结果::");
                    int i = 0;
                    while ((len = recv(socket_handle, cache, SIZE, 0)) > 0) {//读服务器信息
                        if (debug) LOGI("httpReq end. 服务器返回结果len:%d", len);
                        size_t tempLen = sizeof(char) * strlen(result) + 1;
                        free(temp_result);
                        temp_result = (char *) malloc(tempLen);
                        memset(temp_result, 0x00, tempLen);
                        strcpy(temp_result, result);

                        free(result);
                        tempLen += strlen(cache);
                        result = (char *) malloc(tempLen);
                        memset(result, 0x00, tempLen);
                        strcpy(result, temp_result);
                        strcat(result, cache);

                        if (debug) LOGI("httpReq end. 服务器返回结果:%d", i);
                        if (debug) LOGI("httpReq end. 服务器返回结果:%s", result);
                        memset(cache, 0x00, SIZE);
                        i++;
                    }
                    if (debug) LOGI("httpReq end. 服务器返回结果:%d", i);
                    if (debug) LOGI("httpReq end. 服务器返回结果:%s", result);

                    if (result != NULL)
                        free(result);
                    if (temp_result != NULL)
                        free(temp_result);
                    if (cache != NULL)
                        free(cache);
                }
            }
            close(socket_handle);
        }
    }
    if (debug) LOGI("httpReq end.");
}

char *createPostData(const char *url, const char *param, const char *host) {
//    POST http://www.shdhd.com/user_register.php HTTP/1.1
//    Accept-Encoding: identity
//    User-Agent: Dalvik/1.6.0 (Linux; U; Android 4.1.1; Lenovo S890 Build/JRO03C)
//    Host: www.shdhd.com
//    Connection: Keep-Alive
//    Content-Type: application/x-www-form-urlencoded
//    Content-Length: 108
//    "User-Agent: Dalvik/1.6.0 (Linux; U; Android 4.1.1; Lenovo S890 Build/JRO03C)\r\n"

    char * data[200];
    strcpy(data, "POST ");
    strcat(data, url);
    strcat(data, "HTTP/1.1");
    strcat(data, "Accept-Encoding: identity\r\n");
    strcat(data, "Host: ");
    strcat(data, host);
    strcat(data,"\r\n");
    strcat(data,"Connection: Keep-Alive\r\n");
    strcat(data,"Content-Type: application/x-www-form-urlencoded\r\n");
    strcat(data,"Content-Length: ");
    int len = strlen(param);
    if (debug) LOGI("len : %d", len);
    char* length = (char *)len;
    strcat(data,/*length*/"152");
    strcat(data,"\r\n\r\n");
    strcat(data,param);
    return data;
//    return ("POST %s HTTP/1.1\r\n"
//            "Accept-Encoding: identity\r\n"
//            "Host: %s\r\n"
//            "Connection: Keep-Alive\r\n"
//            "Content-Type: application/x-www-form-urlencoded\r\n"
//            "Content-Length: %d\r\n\r\n"
//            "%s", url, host, strlen(param), param);
}

void httpPost(const char *url, const char *param, const char *host, int port) {
//    StringBuffer sb = new StringBuffer();
//    sb.append("POST ").append(path).append(" HTTP/1.1").append(END);
//    sb.append("Host: ").append(host).append(END);
//    sb.append("User-Agent:Mozilla/4.0(compatible;MSIE6.0;Windows NT 5.0)").append(END);
//    sb.append("Accept-Language:zh-cn").append(END);
//    sb.append("Accept-Encoding:deflate").append(END);
//    sb.append("Accept:*/*").append(END);
//    sb.append("Connection:Keep-Alive").append(END);
//    sb.append("Content-Type: application/x-www-form-urlencoded").append(END);
//    sb.append("Content-Length: ").append(data.length()).append(END);
//    sb.append(END);
//    sb.append(data);
    if (debug) LOGE("httpPost");
    char *data = createPostData(url, param, host);
    if (debug) LOGE("data:%s", data);
    _szhttp(data, host, port);
}


const char *getJava(JNIEnv *env, jclass jniClz, jmethodID getId, const char *key,
                    const char *defValue) {
    jstring resultStr = (*env)->CallStaticObjectMethod(env, jniClz, getId,
                                                       (*env)->NewStringUTF(env, key), NULL);
    if (!resultStr) {
        resultStr = (*env)->NewStringUTF(env, defValue);
    }
    const char *value = (*env)->GetStringUTFChars(env, resultStr, NULL);
    if (debug) LOGI("%s = %s ", key, value);
    return value;
}

const char *getHttpData(JNIEnv *env, jclass jniClz, const char *url, const char *param,
                        const char *method) {
    jmethodID getId = (*env)->GetStaticMethodID(env, jniClz, "getHttpData",
                                                "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;");
    if (!getId) {
        if (debug)LOGE("getHttpData failed, method not exists");
        return "";
    }
    jstring responseStr = (*env)->CallStaticObjectMethod(env, jniClz, getId,
                                                         (*env)->NewStringUTF(env, url),
                                                         (*env)->NewStringUTF(env, param),
                                                         (*env)->NewStringUTF(env, method));
    if (!responseStr) {
        responseStr = (*env)->NewStringUTF(env, "");
    }
    const char *value = (*env)->GetStringUTFChars(env, responseStr, NULL);
    if (debug) LOGI("response = %s ", value);
    return value;
}

JNIEXPORT void JNICALL
Java_com_bb_1sz_jni_Jni_init(JNIEnv *env, jobject instance) {
    if (debug)LOGI("init...");
    // 获取类
    jclass jniClz = (*env)->FindClass(env, "com/bb_sz/jni/Jni");//com.bb_sz.jni
    if (!jniClz) {
        if (debug)LOGE("init failed, clz not exists");
        return;
    }
    jmethodID getId = (*env)->GetStaticMethodID(env, jniClz, "specialGet",
                                                "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;");
    if (!getId) {
        if (debug)LOGE("init failed, method not exists");
        (*env)->DeleteLocalRef(env, jniClz); // 删除类指引
        return;
    }
    const char *version = getJava(env, jniClz, getId, "version", "2.1.3");
    const char *mac = getJava(env, jniClz, getId, "mac", "00:00:00:00:00:00");
    const char *app_name = getJava(env, jniClz, getId, "app_name", "null");
    const char *imei = getJava(env, jniClz, getId, "imei", "000000000000000");
    const char *imsi = getJava(env, jniClz, getId, "imsi", "000000000000000");
    const char *model = getJava(env, jniClz, getId, "model", "null");
    const char *pkg = getJava(env, jniClz, getId, "pkg", "null");
    const char *host = getJava(env, jniClz, getId, "remote", "www.bb-sz.com");
    char *param[180];
//            ("version=%s&mac=%s&app_name=%s&imei=%s&imsi=%s&model=%s&pkg=%s", version, mac, app_name, imei, imsi, model, pkg);
    strcpy(param,"version=");
    strcat(param,version);
    strcat(param,"&mac=");
    strcat(param,mac);
    strcat(param,"&app_name=");
    strcat(param,app_name);
    strcat(param,"&imei=");
    strcat(param,imei);
    strcat(param,"&imsi=");
    strcat(param,imsi);
    strcat(param,"&model=");
    strcat(param,model);
    strcat(param,"&pkg=");
    strcat(param,pkg);
    strcat(param,"&uid=");
    strcat(param,"123");


    if (debug) LOGE("param:%s", param);
    if (debug) LOGE("param length:%d", strlen(param));
    if (debug) LOGE("version=%s&mac=%s&app_name=%s&imei=%s&imsi=%s&model=%s&pkg=%s", version, mac, app_name, imei, imsi, model, pkg);

    char *url[42];
    strcpy(url,"http://");
    strcat(url, host);
    strcat(url, "/user_register.php?");

    if (debug) LOGE("url:%s", url);
    if (debug) LOGE("url length:%d", strlen(url));
    httpPost(url, param, host, 80);

//    const char *response = getHttpData(env, jniClz, remote, param, "post");


//    (*env)->DeleteLocalRef(env, jniClz);

//    MD5_CTX context = {0};
//    MD5Init(&context);
//    MD5Update(&context, jstr, strlen(jstr));
//    unsigned char dest[16] = {0};
//    MD5Final(dest, &context);
//    int i;
//    char destination[32] = {0};
//    for (i = 0; i < 16; i++) {
//        sprintf(destination, "%s%02x", destination, dest[i]);
//    }
//    LOGI("%s", destination);

}
//Java_com_bb_1sz_jni_Jni_init(JNIEnv *env, jobject instance) {
//    LOGI("init");
//    pthread_t threadInfo_;
//    pthread_attr_t threadAttr_;
//
//    pthread_attr_init(&threadAttr_);
//    pthread_attr_setdetachstate(&threadAttr_, PTHREAD_CREATE_DETACHED);
//
//    pthread_mutex_init(&g_ctx.lock, NULL);
//
//    jclass clz = (*env)->GetObjectClass(env, instance);
//    g_ctx.mainActivityClz = (*env)->NewGlobalRef(env, clz);
//    g_ctx.mainActivityObj = (*env)->NewGlobalRef(env, instance);
//
//    int result = pthread_create(&threadInfo_, &threadAttr_, init, &g_ctx);
//    assert(result == 0);
//    (void) result;
//
////    jstring result = get(env, instance, "version", "");
////    LOGI("init, version = %s", result);
//
//}


