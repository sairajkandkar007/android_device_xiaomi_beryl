$(call inherit-product, device/xiaomi/beryl/device.mk)

# ============================================================
# OrangeFox 14.1
# POCO M7 Pro 5G (beryl)
# Android 16 / API 36
# ============================================================

PRODUCT_DEVICE := beryl
PRODUCT_NAME := fox_beryl
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := POCO M7 Pro 5G
PRODUCT_MANUFACTURER := Xiaomi

# ============================================================
# OrangeFox identity
# ============================================================

OF_MAINTAINER := beryl
OF_DEVICE_WITHOUT_BASEBAND := 1

# Screen
OF_SCREEN_WIDTH := 2400
OF_SCREEN_HEIGHT := 1080
OF_STATUS_INDENT := 100

# ============================================================
# A/B + Virtual A/B
# ============================================================

OF_USE_AIDL_BOOT_CONTROL := 1
OF_AB_DEVICE := 1
OF_VIRTUAL_AB_DEVICE := 1

# ============================================================
# Dynamic partitions
# ============================================================

OF_ENABLE_LPTOOLS := 1
OF_USE_DMCTL := 1

# ============================================================
# Filesystem support
# ============================================================

OF_USE_LZ4_COMPRESSION := 1

OF_SUPPORT_F2FS := 1
OF_FORMAT_F2FS := 1
OF_WIPE_METADATA_AFTER_DATAFORMAT := 1

# ============================================================
# Recovery tools
# ============================================================

OF_USE_BUSYBOX := 1
OF_USE_TAR_BINARY := 1
OF_USE_NANO_EDITOR := 1
OF_USE_BASH_SHELL := 1

# ============================================================
# API 36 Support
# ============================================================

OF_ADD_API_V36_PREBUILTS := 1
OF_SUPPORT_ALL_BLOCK_OTA_UPDATES := 1
OF_SUPPORT_OZIP_DECRYPTION := 1

# ============================================================
# OrangeFox Display Configuration
# ============================================================

OF_CLOCK_POS := 1
OF_RTC_OFFSET := -18000

# ============================================================
# Build fingerprint
# ============================================================

BUILD_FINGERPRINT := Xiaomi/beryl/beryl:16/$(PLATFORM_SECURITY_PATCH_TIMESTAMP):user/release-keys

# ============================================================
# Safety and Recovery Options
# ============================================================

# Do not force FBE behaviour until actual recovery testing.
# OF_FORCE_USE_RECOVERY_FSTAB := 1

# Do not force a reference vendor_boot image yet.
# OF_REFERENCE_VENDOR_BOOT_IMAGE := ...

# Disable DM-Verity for recovery (optional, uncomment if needed)
# OF_DISABLE_DM_VERITY := 1
