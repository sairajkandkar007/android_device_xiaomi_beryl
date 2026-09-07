LOCAL_PATH := $(call my-dir)

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic

# SoC
TARGET_BOARD_PLATFORM := mt6855

# Boot image format
BOARD_BOOT_HEADER_VERSION := 4
BOARD_VENDOR_BOOT_HEADER_VERSION := 4

BOARD_PAGE_SIZE := 4096
BOARD_KERNEL_PAGESIZE := 4096

# Stock partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_DTBOIMG_PARTITION_SIZE := 8388608

# Recovery is contained in vendor_boot.
BOARD_USES_RECOVERY_AS_BOOT := false
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true

# A/B
AB_OTA_UPDATER := true
TARGET_NO_RECOVERY := true

# Dynamic partitions
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

# OTA partitions
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

# Filesystems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery display
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888

# Flash block size
BOARD_FLASH_BLOCK_SIZE := 262144

# HDR4 vendor_boot recovery configuration
ifeq ($(FOX_VENDOR_BOOT_RECOVERY),1)

    BOARD_USES_RECOVERY_AS_BOOT :=
    BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE :=

    BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
    BOARD_USES_GENERIC_KERNEL_IMAGE := true
    BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

    BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true

endif
