LOCAL_PATH := $(call my-dir)

# Device-tree build definitions are provided through the
# standard OrangeFox/AOSP recovery build system.

include $(CLEAR_VARS)

LOCAL_MODULE := beryl_device_tree
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := README.md
LOCAL_MODULE_PATH := $(TARGET_OUT_RECOVERY)

include $(BUILD_PREBUILT)
