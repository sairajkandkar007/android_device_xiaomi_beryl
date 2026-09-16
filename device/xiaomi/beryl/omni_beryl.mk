#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from beryl device
$(call inherit-product, device/unknown/beryl/device.mk)

PRODUCT_DEVICE := beryl
PRODUCT_NAME := omni_beryl
PRODUCT_BRAND := Android
PRODUCT_MODEL := GSI on ARM64
PRODUCT_MANUFACTURER := unknown

PRODUCT_GMS_CLIENTID_BASE := android-unknown

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="gsi_arm64-user 12 SGR1.240502.001.B2 12035836 release-keys"

BUILD_FINGERPRINT := Android/gsi_arm64/generic_arm64:12/SGR1.240502.001.B2/12035836:user/release-keys
