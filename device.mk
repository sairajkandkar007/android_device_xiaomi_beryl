LOCAL_PATH := $(call my-dir)

# ============================================================
# POCO M7 Pro 5G (beryl)
# Android 16 / API 36
# ============================================================

PRODUCT_DEVICE := beryl
PRODUCT_NAME := fox_beryl
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := POCO M7 Pro 5G
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# ============================================================
# Dynamic partitions
# ============================================================

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# ============================================================
# A/B + Virtual A/B
# ============================================================

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
    ro.boot.dynamic_partitions=true

# ============================================================
# Android 16 / API 36
# ============================================================

PRODUCT_SYSTEM_PROPERTIES += \
    ro.build.version.release=16 \
    ro.build.version.sdk=36

# ============================================================
# Recovery display
# ============================================================

PRODUCT_SYSTEM_PROPERTIES += \
    ro.minui.pixel_format=BGRA_8888 \
    ro.product.page_size=4096 \
    ro.product.cpu.pagesize.max=16384

# ============================================================
# Encryption / FBE
# ============================================================

PRODUCT_SYSTEM_PROPERTIES += \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.volume.metadata.enabled=true

# ============================================================
# Vendor identity
# ============================================================

PRODUCT_VENDOR_PROPERTIES += \
    ro.product.vendor.device=beryl \
    ro.product.vendor.name=beryl \
    ro.product.vendor.model=POCO\ M7\ Pro\ 5G \
    ro.product.vendor.manufacturer=Xiaomi \
    ro.vendor.build.ab_update=true

# ============================================================
# Recovery / security configuration
# ============================================================

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6855.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6855.rc \
    $(LOCAL_PATH)/recovery/root/tee-supplicant.rc:$(TARGET_COPY_OUT_RECOVERY)/root/tee-supplicant.rc

# ============================================================
# Stock-derived recovery root
# ============================================================

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,$(TARGET_COPY_OUT_RECOVERY)/root)

# ============================================================
# AIDL boot control
# ============================================================

PRODUCT_PACKAGES += \
    android.hardware.boot-service.default

# ============================================================
# Recovery utilities
# ============================================================

PRODUCT_PACKAGES += \
    e2fsck \
    fsck.f2fs \
    resize2fs \
    tune2fs

# ============================================================
# Do NOT add vendor security services here until their exact
# stock binaries + VINTF + SELinux integration are validated.
# ============================================================
