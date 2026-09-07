#!/bin/bash

export FOX_BUILD_DEVICE=beryl
export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1
export FOX_VENDOR_BOOT_RECOVERY=1
export FOX_INSTALLER_VENDOR_BOOT_RAMDISK_INSTALL=1

# This device is an A/B + Virtual A/B Xiaomi Android 16 device.
# Keep MIUI-specific patching disabled for the initial non-MIUI recovery build.
export FOX_VANILLA_BUILD=1

# Stock vendor_boot contains the platform/recovery ramdisk fragments and DTB.
# Do not reference the stock image until it has been copied into the device
# tree by the developer; see prebuilt/README.md.
