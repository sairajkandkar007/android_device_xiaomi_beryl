# OrangeFox Recovery Device Tree — Xiaomi POCO M7 Pro 5G

Device tree for the Xiaomi POCO M7 Pro 5G (`beryl`).

## Status

**Experimental / development**

This repository contains a device tree for investigating and building an
OrangeFox recovery environment using the stock Android 16 / MT6855 software
environment.

A successful build does not imply that every hardware or security feature has
been validated on-device.

## Device

| Property | Value |
|---|---|
| Device | POCO M7 Pro 5G |
| Codename | beryl |
| SoC | MediaTek MT6855 |
| Architecture | arm64 |
| Android | 16 / API 36 |
| Recovery | vendor_boot v4 |
| Partition scheme | A/B |
| Virtual A/B | Yes |
| Dynamic partitions | Yes |
| System filesystem | EROFS |
| Userdata filesystem | F2FS |
| Metadata filesystem | ext4 |
| Touch controller | FocalTech |

## Recovery architecture

The device uses a vendor_boot v4 recovery layout.

The device configuration therefore uses:

- `TARGET_NO_RECOVERY`
- `BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT`
- `BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT`
- `BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE`

The stock boot/kernel/DTB resources in this repository are intended to match the
stock device environment.

## Encryption

Stock userdata was identified as Android FBE v2 using:

- fscrypt
- AES-256-XTS content encryption
- AES-256-CTS filename encryption
- inline encryption
- `inlinecrypt_optimized`
- metadata encryption
- fsverity
- `/metadata/vold/metadata_encryption` as the key directory

The presence of these components in the device tree does **not** mean FBE
decryption is already verified in OrangeFox.

The recovery FBE implementation still requires runtime validation of:

- vold
- keystore2
- Gatekeeper
- KeyMint
- TEE / tee-supplicant
- MITEE services
- SELinux policy
- linker namespaces
- VINTF declarations
- kernel/device support

## Stock security environment

The stock firmware analysis identified:

```text
/system/bin/vold
/system/bin/keystore2
/system/bin/gatekeeperd
/system/bin/vold_prepare_subdirs

/vendor/bin/tee
/vendor/bin/tee-supplicant

/vendor/bin/hw/android.hardware.security.keymint@4.0-service.mitee
/vendor/bin/hw/android.hardware.gatekeeper-service.mitee

/vendor/mitee/
