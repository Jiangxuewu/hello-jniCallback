//
// Created by Administrator on 2016/10/17.
//

#include <android/log.h>

#ifndef HELLO_JNICALLBACK_UTIL_H
#define HELLO_JNICALLBACK_UTIL_H
static const char *kTAG = "SKY_Ndk";
#define LOGI(...) \
  ((void)__android_log_print(ANDROID_LOG_INFO, kTAG, __VA_ARGS__))
#define LOGE(...) \
  ((void)__android_log_print(ANDROID_LOG_ERROR, kTAG, __VA_ARGS__))

//int tempLen;
#endif //HELLO_JNICALLBACK_UTIL_H
