#!/bin/bash

# Device
export FOX_BUILD_DEVICE=beryl

# A/B configuration
export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1

# HDR4 vendor_boot recovery
export FOX_VENDOR_BOOT_RECOVERY=1
export FOX_INSTALLER_VENDOR_BOOT_RAMDISK_INSTALL=1

# This is an A/B Xiaomi device for which we are initially
# building a non-MIUI-specific recovery environment.
export FOX_VANILLA_BUILD=1

# The exact stock super partition size is known.
# Keep this disabled unless dynamic-partition allocation
# actually requires the override.
#
# export OF_DYNAMIC_FULL_SIZE=9126805504

# Do not force recovery-fstab processing yet.
# Enable only if MTK FBE decryption fails while the
# recovery fstab itself is known to be correct.
#
# export OF_FORCE_USE_RECOVERY_FSTAB=1

# Virtual A/B data handling is intentionally left at the
# OrangeFox default until update_engine/ORS behaviour is tested.
#
# export OF_VAB_ORS_WIPE_DATA_IS_FORMAT=1

# Do not enable stock vendor_boot referencing yet.
# Once the stock vendor_boot is supplied to the build tree,
# this can be enabled with its exact absolute build path.
#
# export FOX_REFERENCE_VENDOR_BOOT_IMAGE="$(gettop)/device/xiaomi/beryl/prebuilt/vendor_boot.img"
