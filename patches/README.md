# OrangeFox 14.1 API 36 Patches for POCO M7 Pro 5G

This directory contains patches for OrangeFox 14.1 recovery to ensure full API 36 compatibility on the POCO M7 Pro 5G (beryl) device.

## Patches

### API36_COMPATIBILITY.patch

**Purpose:** Ensures OrangeFox 14.1 recovery builds correctly with Android 16 / API 36 prebuilts.

**Changes:**
- Adds `TARGET_RECOVERY_API_VERSION := 36` to BoardConfig.mk
- Enables TAR and OZIP support in recovery
- Adds API 36 specific OrangeFox flags (OF_ADD_API_V36_PREBUILTS, OF_SUPPORT_ALL_BLOCK_OTA_UPDATES, OF_SUPPORT_OZIP_DECRYPTION)
- Ensures security patch date is properly set
- Includes additional recovery utilities (parted, sgdisk) for complete partition management

**Application:**
```bash
cd /path/to/device/tree
git apply patches/API36_COMPATIBILITY.patch
```

## Key Features for API 36 Support

1. **Recovery API Version**: Set to 36 for full compatibility
2. **OrangeFox Prebuilts**: API 36 specific prebuilt binaries included
3. **Block OTA Updates**: Full support for block-based OTA updates
4. **OZIP Decryption**: Support for encrypted OTA packages
5. **Dynamic Partitions**: Complete A/B Virtual A/B support
6. **F2FS Filesystem**: Full F2FS formatting and recovery support
7. **AIDL Boot Control**: Modern boot control interface

## Device Information

- **Device**: POCO M7 Pro 5G (beryl)
- **Chipset**: MediaTek MT6855
- **Android Version**: 16
- **API Level**: 36
- **Recovery**: OrangeFox 14.1 with vendor_boot v4 architecture
- **Partition Scheme**: A/B + Virtual A/B with dynamic partitions

## Build Instructions

```bash
# Source the OrangeFox environment
source build/envsetup.sh

# Apply patches if not using patched version
# git apply patches/API36_COMPATIBILITY.patch

# Setup the device build
lunch fox_beryl-user

# Build recovery
make recoveryimage -j$(nproc)
```

## Verification

After building, verify the recovery supports API 36:

```bash
# Check recovery version
file out/target/product/beryl/recovery.img

# Check device properties
adb shell getprop ro.build.version.sdk
adb shell getprop ro.recovery_api_version
```

## Support

For issues or questions regarding OrangeFox 14.1 and API 36 compatibility, please visit:
- OrangeFox Recovery: https://github.com/OrangeFoxRecovery
- Device Repository: https://github.com/sairajkandkar007/android_device_xiaomi_beryl
