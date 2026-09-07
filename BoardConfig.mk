LOCAL_PATH := $(call my-dir)

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic

# SoC
TARGET_BOARD_PLATFORM := mt6855

# Boot image
BOARD_BOOT_HEADER_VERSION := 4
BOARD_VENDOR_BOOT_HEADER_VERSION := 4
BOARD_PAGE_SIZE := 4096
BOARD_KERNEL_PAGESIZE := 4096

BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_DTBOIMG_PARTITION_SIZE := 8388608

# Recovery is stored in vendor_boot on this HDR4 device.
BOARD_USES_RECOVERY_AS_BOOT := false
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# The stock boot image contains no ramdisk.
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE :=

# GKI / vendor_boot recovery layout
ifeq ($(FOX_VENDOR_BOOT_RECOVERY),1)
    BOARD_USES_RECOVERY_AS_BOOT :=
    BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE :=
    BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
    BOARD_USES_GENERIC_KERNEL_IMAGE := true
    BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
    BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
endif

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

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

# A/B + Virtual A/B
AB_OTA_UPDATER := true
TARGET_NO_RECOVERY := true

# OTA partition set observed on stock beryl.
AB_OTA_PARTITIONS := \
    boot \
    product \
    system \
    system_ext \
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

# Flash block size used by the beryl reference device tree.
BOARD_FLASH_BLOCK_SIZE := 262144

# Do not build a traditional standalone recovery image.
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
