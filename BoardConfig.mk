LOCAL_PATH := $(call my-dir)

# ============================================================
# POCO M7 Pro 5G (beryl)
# MT6855 / Android 16 / API 36
# OrangeFox 14.1
# ============================================================

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi

TARGET_BOARD_PLATFORM := mt6855
TARGET_BOARD_PLATFORM_GPU := mali

# ============================================================
# Bootloader/Recovery
# ============================================================

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := beryl

# ============================================================
# Boot image format
# ============================================================

BOARD_BOOT_HEADER_VERSION := 4
BOARD_VENDOR_BOOT_HEADER_VERSION := 4

BOARD_PAGE_SIZE := 4096
BOARD_KERNEL_PAGESIZE := 4096
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2

BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_DTBOIMG_PARTITION_SIZE := 8388608

# vendor_boot v4 recovery
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := false
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true

# API 36 recovery compatibility
TARGET_RECOVERY_API_VERSION := 36
BOARD_RECOVERY_SUPPORTS_TAR := true
BOARD_RECOVERY_SUPPORTS_OZIP := true

# ============================================================
# A/B + Virtual A/B
# ============================================================

AB_OTA_UPDATER := true
ENABLE_VIRTUAL_AB := true

AB_OTA_PARTITIONS := \
    boot \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    odm_dlkm \
    system_dlkm \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

# ============================================================
# Dynamic partitions
# ============================================================

BOARD_SUPER_PARTITION_SIZE := 9126805504

BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions

BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200

BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor \
    mi_ext \
    system_dlkm \
    vendor_dlkm \
    odm_dlkm

# ============================================================
# Filesystems
# ============================================================

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# ============================================================
# Recovery
# ============================================================

TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888

TARGET_RECOVERY_FSTAB := \
    $(LOCAL_PATH)/recovery.fstab

# ============================================================
# DLKM (Loadable Kernel Modules)
# ============================================================

BOARD_USES_VENDOR_DLKMIMAGE := true
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

BOARD_USES_ODM_DLKMIMAGE := true
TARGET_COPY_OUT_ODM_DLKM := odm_dlkm

BOARD_USES_SYSTEM_DLKMIMAGE := true
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm

# ============================================================
# AVB (Android Verified Boot)
# ============================================================

BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_ARGS := --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS := --flag 2

BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_VENDOR := vendor vendor_dlkm odm_dlkm
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2

# ============================================================
# OrangeFox vendor_boot recovery
# ============================================================

ifeq ($(FOX_VENDOR_BOOT_RECOVERY),1)

BOARD_USES_RECOVERY_AS_BOOT :=

BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true

endif

# ============================================================
# SELinux
# ============================================================

BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

# ============================================================
# Encryption
# ============================================================

BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS := metadata
