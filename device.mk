LOCAL_PATH := $(call my-dir)

PRODUCT_DEVICE := beryl
PRODUCT_NAME := fox_beryl
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := POCO M7 Pro 5G
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_PRODUCT_PROPERTIES += \
    ro.product.device=beryl \
    ro.product.name=fox_beryl \
    ro.product.brand=Xiaomi \
    ro.product.manufacturer=Xiaomi \
    ro.product.model=POCO\ M7\ Pro\ 5G

PRODUCT_PRODUCT_PROPERTIES += \
    ro.build.version.release=16 \
    ro.build.version.sdk=36

PRODUCT_PRODUCT_PROPERTIES += \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.volume.metadata.enabled=true
