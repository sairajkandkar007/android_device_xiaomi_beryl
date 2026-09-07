LOCAL_PATH := $(call my-dir)

# Device identity
PRODUCT_DEVICE := beryl
PRODUCT_NAME := fox_beryl
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := POCO M7 Pro 5G
PRODUCT_MANUFACTURER := Xiaomi

# Device tree namespace
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B
PRODUCT_PACKAGES += \
    fastbootd

# Stock device properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.product.device=beryl \
    ro.product.name=beryl \
    ro.product.model=POCO\ M7\ Pro\ 5G \
    ro.product.manufacturer=Xiaomi \
    ro.board.platform=mt6855 \
    ro.build.ab_update=true \
    ro.virtual_ab.enabled=true \
    ro.virtual_ab.compression.enabled=true \
    ro.virtual_ab.userspace.snapshots.enabled=true \
    ro.boot.dynamic_partitions=true \
    ro.product.page_size=4096 \
    ro.minui.pixel_format=BGRA_8888

# Recovery USB configuration observed on stock beryl.
PRODUCT_PRODUCT_PROPERTIES += \
    ro.recovery.usb.vid=18D1 \
    ro.recovery.usb.adb.pid=D001 \
    ro.recovery.usb.fastboot.pid=4EE0
