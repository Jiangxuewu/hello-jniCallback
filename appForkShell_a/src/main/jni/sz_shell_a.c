#include <string.h>
#include "reflex.h"
#include "log.h"
#include "shell.h"
#include "check.h"
#include "http.h"


JNIEXPORT void JNICALL
Java_com_bb_1sz_ndk_App_jniCreate(JNIEnv *env, jclass type) {
    if (debug) LOGI("[x] jniCreate start");
    setApplication(env);
    if (debug) LOGI("[x] jniCreate end");

}

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved) {
    if (debug) LOGI("[x] JNI_Onload start");
    JNIEnv *env;
    (*vm)->AttachCurrentThread(vm, &env, 0);
    addShell(env);
    if (debug) LOGI("[x] JNI_Onload end");
    initCheck(vm, env);
    return JNI_VERSION_1_6;
}


JNIEXPORT void JNICALL
Java_com_bb_1sz_ndk_App_post(JNIEnv *env, jclass type, jstring host_, jint post, jstring content_) {
    const char *host = (*env)->GetStringUTFChars(env, host_, 0);
    const char *content = (*env)->GetStringUTFChars(env, content_, 0);

    // TODO
    char *res = _httpReq(content, host, post);
    if (res != NULL) {
        free(res);
    }

    (*env)->ReleaseStringUTFChars(env, host_, host);
    (*env)->ReleaseStringUTFChars(env, content_, content);
}


JNIEXPORT jbyteArray JNICALL
Java_com_bb_1sz_ndk_App_http(JNIEnv *env, jclass type, jstring host_, jint port, jstring content_) {
    const char *host = (*env)->GetStringUTFChars(env, host_, 0);
    const char *content = (*env)->GetStringUTFChars(env, content_, 0);

    // TODO
    jbyteArray bytes = httpReq(env, content, host, port);

    (*env)->ReleaseStringUTFChars(env, host_, host);
    (*env)->ReleaseStringUTFChars(env, content_, content);

    return bytes;
}

