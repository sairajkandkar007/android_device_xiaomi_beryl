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

# Vanilla recovery
export FOX_VANILLA_BUILD=1

# OrangeFox utilities
export FOX_USE_BASH_SHELL=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_LZ4_BINARY=1

# AIDL boot control
export OF_USE_AIDL_BOOT_CONTROL=1
