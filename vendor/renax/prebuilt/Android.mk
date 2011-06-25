
LOCAL_PATH := $(my-dir)

###############################################################################
include $(CLEAR_VARS)

LOCAL_PREBUILT_LIBS := \
        libbattlog.so \
        libsynergy_com.so

include $(BUILD_MULTI_PREBUILT)

###############################################################################
