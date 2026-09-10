#!/bin/bash

# ============================================================
# POCO M7 Pro 5G (beryl)
# OrangeFox 14.1
# Android 16 / API 36
# ============================================================

export FOX_BUILD_DEVICE=beryl

# A/B
export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1

# vendor_boot v4 recovery
export FOX_VENDOR_BOOT_RECOVERY=1
export FOX_INSTALLER_VENDOR_BOOT_RAMDISK_INSTALL=1

# Android 16 / API 36
export FOX_ADD_API_V36_PREBUILTS=1
export FOX_SUPPORT_ALL_BLOCK_OTA_UPDATES=1

# Vanilla recovery
export FOX_VANILLA_BUILD=1

# OrangeFox utilities
export FOX_USE_BASH_SHELL=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_LZ4_BINARY=1
export FOX_USE_BUSYBOX=1

# AIDL boot control
export OF_USE_AIDL_BOOT_CONTROL=1

# Dynamic partitions
export OF_ENABLE_LPTOOLS=1
export OF_USE_DMCTL=1

# F2FS support
export OF_SUPPORT_F2FS=1
export OF_FORMAT_F2FS=1

# Display
export OF_SCREEN_WIDTH=2400
export OF_STATUS_INDENT=100

# Recovery features
export OF_SUPPORT_OZIP_DECRYPTION=1
export FOX_SUPPORT_OZIP_DECRYPTION=1
