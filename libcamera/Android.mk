LOCAL_PATH := $(call my-dir)

####### LIBCAMERA #######

# When zero we link against libmmcamera; when 1, we dlopen libmmcamera.
DLOPEN_LIBMMCAMERA:=0

include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false

LOCAL_SRC_FILES:= QualcommCameraHardware.cpp

LOCAL_MODULE_TAGS:= optional

LOCAL_CFLAGS:= -DDLOPEN_LIBMMCAMERA=$(DLOPEN_LIBMMCAMERA)

# Can be raised to 6 to improve framerate, at the cost of allocating
# more ADSP memory. Use 0xa68000 as pool size in kernel to test
LOCAL_CFLAGS += -DNUM_PREVIEW_BUFFERS=3 -D_ANDROID_

LOCAL_C_INCLUDES+= \
    $(TARGET_OUT_HEADERS)/mm-camera \
    $(TARGET_OUT_HEADERS)/mm-still/jpeg \

LOCAL_SHARED_LIBRARIES:= libutils libui libcamera_client liblog libcutils

LOCAL_SHARED_LIBRARIES+= libbinder
ifneq ($(DLOPEN_LIBMMCAMERA),1)
LOCAL_SHARED_LIBRARIES+= liboemcamera
else
LOCAL_SHARED_LIBRARIES+= libdl
endif

LOCAL_MODULE:= libcamera
include $(BUILD_SHARED_LIBRARY)

####### CAMERA HAL #######

include $(CLEAR_VARS)

ifeq ($(TARGET_BOARD_PLATFORM),msm7x27)

LOCAL_C_FLAGS          += -O3
LOCAL_MODULE_TAGS      := optional
LOCAL_MODULE_PATH      := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE           := camera.$(TARGET_BOARD_PLATFORM)

LOCAL_SRC_FILES        := QcomCamera.cpp

LOCAL_SHARED_LIBRARIES := liblog libdl libutils libcamera_client libbinder \
                          libcutils libhardware libui libcamera

LOCAL_C_INCLUDES       := frameworks/base/services \
                          frameworks/base/include \
                          hardware/libhardware/include
ifneq ($(TARGET_BOARD_PLATFORM),msm7x27)
LOCAL_C_INCLUDES       += hardware/libhardware/modules/gralloc
LOCAL_CFLAGS           := -DPREVIEW_MSM7K
else
LOCAL_C_INCLUDES       += hardware/qcom/display/libgralloc
endif

LOCAL_PRELINK_MODULE   := false

include $(BUILD_SHARED_LIBRARY)

endif
