LOCAL_PATH := $(call my-dir)

# Device identity
PRODUCT_DEVICE := beryl
PRODUCT_NAME := fox_beryl
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := POCO M7 Pro 5G
PRODUCT_MANUFACTURER := Xiaomi

# Soong namespace
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# System properties
PRODUCT_SYSTEM_PROPERTIES += \
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
    ro.product.cpu.pagesize.max=16384 \
    ro.minui.pixel_format=BGRA_8888 \
    ro.build.version.release=16 \
    ro.build.version.sdk=36 \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.volume.metadata.enabled=true

# Vendor properties
PRODUCT_VENDOR_PROPERTIES += \
    ro.product.vendor.device=beryl \
    ro.product.vendor.name=beryl \
    ro.product.vendor.model=POCO\ M7\ Pro\ 5G \
    ro.product.vendor.manufacturer=Xiaomi \
    ro.vendor.build.ab_update=true \
    ro.vendor.build.ab_ota_partitions=boot,product,system,vendor
