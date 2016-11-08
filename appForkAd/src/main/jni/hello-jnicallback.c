#include <string.h>
#include <pthread.h>
#include <jni.h>
#include <android/log.h>


#include <stdio.h>
#include <unistd.h>

#include <sys/socket.h>

#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

#include <assert.h>

static const char *kTAG = "fork-ad-jni";
#define JNIREG_CLASS "com/example/testregisternatives/MainActivity"

#define LOGI(...) \
  ((void)__android_log_print(ANDROID_LOG_INFO, kTAG, __VA_ARGS__))
//static JNINativeMethod gMethods[] = {
//        {"native_printf", "()Ljava/lang/String;", (void*)native_printf},
//};

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

JNIEXPORT void JNICALL
Java_com_bb_1sz_ndk_JNI_httpReq(JNIEnv *env, jobject instance,
                                                         jobject context,
                                                         jstring contentStr,
                                                         jstring hostStr,
                                                         jint post) {
    char *content = Jstring2CStr(env, contentStr);
    char *host = Jstring2CStr(env, hostStr);
    httpPost(content, host, post);
}

void httpPost(char *content, char *host, int port) {
    LOGI("httpReq start:");
    int socket_handle = socket(AF_INET, SOCK_STREAM, 0);
    if (socket_handle < 0) {
        LOGI("httpReq end.建立socket()出错...%s", strerror(errno));
    } else {
        LOGI("httpReq end.建立socket()成功");
        struct sockaddr_in loc_addr;//本机地址
        loc_addr.sin_family = AF_INET;//协议
        loc_addr.sin_addr.s_addr = htons(INADDR_ANY);
        loc_addr.sin_port = htons(INADDR_ANY);
        if (bind(socket_handle, (struct sockaddr *) &loc_addr, sizeof(struct sockaddr_in)) < 0) {
            LOGI("httpReq end.bind()出错...%s", strerror(errno));
        } else {
            LOGI("httpReq end.bind()成功.");
            struct  hostent *serHost = gethostbyname(host);
            char ipbd[32]={0};
            inet_ntop(serHost->h_addrtype, *serHost->h_addr_list,ipbd, sizeof(ipbd));

            LOGI("httpReq end.ip:%s", ipbd);

            struct sockaddr_in serv_add;//服务器地址
            serv_add.sin_family = AF_INET;
            serv_add.sin_addr.s_addr = inet_addr(ipbd);
            serv_add.sin_port = htons(port);
            if (connect(socket_handle, (struct sockaddr *) &serv_add, sizeof(struct sockaddr_in)) < 0) {
                LOGI("httpReq end.connect()出错...%s", strerror(errno));
            } else {
                LOGI("httpReq end.connect()成功.");
                if (send(socket_handle, content, strlen(content), 0) < 0) { //发送头部
                    LOGI("httpReq end.send()出错...%s", strerror(errno));
                } else {
                    LOGI("httpReq end.send()成功.");
                    char *result = (char *) malloc(sizeof(char));
                    char *temp_result = (char *) malloc(sizeof(char));;
                    int SIZE = sizeof(char) * 1024;
                    char *cache = (char *) malloc(SIZE);
                    int len = 0;
                    memset(result, 0x00, sizeof(char));
                    memset(temp_result, 0x00, sizeof(char));
                    memset(cache, 0x00, SIZE);
                    LOGI("httpReq end. 开始接收服务器返回结果::");
                    int i =0;
                    while ((len = recv(socket_handle, cache, SIZE, 0)) > 0) {//读服务器信息
                        LOGI("httpReq end. 服务器返回结果len:%d", len);
                        int tempLen = sizeof(char) * strlen(result) + 1;
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

                        LOGI("httpReq end. 服务器返回结果:%d", i);
                        LOGI("httpReq end. 服务器返回结果:%s", result);
                        memset(cache, 0x00, SIZE);
                        i++;
                    }
                    LOGI("httpReq end. 服务器返回结果:%d", i);
                    LOGI("httpReq end. 服务器返回结果:%s", result);

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

    LOGI("httpReq end.");
}


