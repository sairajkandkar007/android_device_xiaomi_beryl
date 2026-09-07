LOCAL_PATH := $(call my-dir)

PRODUCT_DEVICE := beryl
PRODUCT_NAME := fox_beryl
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := POCO M7 Pro 5G
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Stock beryl is A/B, Virtual A/B and uses dynamic partitions.
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Properties observed in the stock beryl Android 16 recovery environment.
PRODUCT_PRODUCT_PROPERTIES += \
    ro.product.device=beryl \
    ro.product.name=beryl \
    ro.product.model=POCO M7 Pro 5G \
    ro.product.manufacturer=Xiaomi \
    ro.board.platform=mt6855 \
    ro.build.ab_update=true \
    ro.virtual_ab.enabled=true \
    ro.virtual_ab.compression.enabled=true
