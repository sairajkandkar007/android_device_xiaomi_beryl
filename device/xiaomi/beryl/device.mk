#
# POCO M7 Pro 5G / beryl recovery device
#

LOCAL_PATH := device/xiaomi/beryl

# Recovery device tree does not provide a fabricated boot-control HAL.
# Boot-control implementation must be added only when its real source
# or stock-compatible implementation has been recovered.

# Recovery fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/recovery.fstab
