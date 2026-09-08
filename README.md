# OrangeFox Recovery Device Tree — Xiaomi POCO M7 Pro 5G (beryl)

![OrangeFox](https://img.shields.io/badge/Recovery-OrangeFox-FF6B00?style=flat-square)
![Android](https://img.shields.io/badge/Android-16-1F8254?style=flat-square)
![Platform](https://img.shields.io/badge/Platform-MediaTek%20MT6855-0066CC?style=flat-square)
![Status](https://img.shields.io/badge/Status-Experimental-FF9900?style=flat-square)
![License](https://img.shields.io/badge/License-Apache%202.0-blue?style=flat-square)

⚠️ **WARNING:** This is an experimental vendor_boot v4 recovery implementation. Only flash if you understand the risks. Always maintain backups before flashing custom recovery images.

## Table of Contents
- [Overview](#overview)
- [Device Specifications](#device-specifications)
- [Supported Features](#supported-features)
- [Prerequisites](#prerequisites)
- [Building OrangeFox Recovery](#building-orangefox-recovery)
- [Building Flashable Installer](#building-flashable-installer)
- [Installation Instructions](#installation-instructions)
- [Troubleshooting](#troubleshooting)
- [Known Issues](#known-issues)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

This is a complete device tree implementation for building OrangeFox Recovery on the Xiaomi POCO M7 Pro 5G (codename: **beryl**). The tree includes optimizations for:

- **Modern partition layout:** A/B partitions with Virtual A/B and dynamic partitions support
- **Vendor boot recovery:** Experimental vendor_boot v4 recovery ramdisk architecture
- **Device-specific hardware:** FocalTech touchscreen, F2FS filesystem, full encryption support
- **Binary blobs:** Pre-extracted DTB/DTBO and vendor_dlkm modules from stock firmware
- **Automated builds:** GitHub Actions CI/CD for continuous recovery builds

Device specifications and configurations were derived from official Xiaomi stock firmware and validated against TWRP device tree implementations.

---

## Device Specifications

| Specification | Value |
|---------------|-------|
| **Device Name** | Xiaomi POCO M7 Pro 5G |
| **Codename** | beryl |
| **SoC** | MediaTek Helio G99 Ultra (MT6855) |
| **RAM** | 12GB LPDDR5 |
| **Storage** | 256GB/512GB UFS 3.1 |
| **Display** | 6.67" AMOLED, 2400×1080, 120Hz |
| **Touchscreen** | FocalTech TS |
| **OS** | Android 16 (MIUI 16) |
| **Partition Layout** | A/B + Virtual A/B + Dynamic Partitions |
| **Recovery** | vendor_boot v4 (Experimental) |

---

## Supported Features

### ✅ Verified Working
- [x] **Display & Touch** — AMOLED panel with FocalTech touchscreen support
- [x] **Storage** — UFS, F2FS filesystem, full-disk encryption (FDE)
- [x] **Partitions** — A/B, Virtual A/B, dynamic partition mounting
- [x] **Fastboot** — Device tree binary flashing via fastbootd
- [x] **USB OTG** — Sideload, adb communication
- [x] **Vendor modules** — vendor_dlkm support for mediatek drivers
- [x] **DTB/DTBO** — Device tree blob extraction and patching

### ⚠️ Experimental
- **Vendor Boot Recovery** — New v4 recovery ramdisk architecture; not widely tested
- **GitHub Actions CI** — Automated builds; may require keystore setup

### ❌ Not Supported
- Stock MIUI/HyperOS recovery features (not applicable to custom recovery)
- Fastboot over Wi-Fi (requires HyperOS baseline)

---

## Prerequisites

### System Requirements
- **OS:** Linux (Ubuntu 18.04+, Fedora 30+) or macOS with Linux VM
- **Disk Space:** 80–150 GB free (OrangeFox + dependencies)
- **RAM:** 16 GB recommended (4 GB minimum)
- **Build Time:** 45–120 minutes (depending on hardware)

### Software Dependencies

#### Ubuntu/Debian
```bash
sudo apt-get update && sudo apt-get install -y \
  git repo python3 python3-pip python3-mako python-is-python3 \
  openjdk-11-jdk android-sdk-platform-tools android-sdk-build-tools \
  build-essential curl wget openssh-client ssh expect schedtool \
  bison flex bc libffi-dev libc6-dev zlib1g-dev ccache \
  fontconfig libx11-6 libxrender1 libxext6 libffi7 \
  pigz zip unzip time cmake gcc-9 g++-9 gcc-arm-linux-gnueabihf
```

#### macOS (via Homebrew)
```bash
brew install git repo python@3.11 openjdk@11 android-platform-tools \
  ccache make curl wget bison flex gettext gnu-tar coreutils
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
```

### Android Build System
```bash
# Install depot_tools for repo sync
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod +x ~/bin/repo
export PATH=~/bin:$PATH
```

---

## Building OrangeFox Recovery

### Step 1: Initialize OrangeFox Manifest

```bash
# Create working directory
mkdir -p ~/OrangeFox/beryl
cd ~/OrangeFox/beryl

# Initialize repo with OrangeFox manifest
repo init -u https://gitlab.com/OrangeFox/Manifest.git -b fox_16.1 --depth 1

# OR for specific OrangeFox version:
# repo init -u https://gitlab.com/OrangeFox/Manifest.git -b fox_16.0 --depth 1
```

### Step 2: Clone This Device Tree

```bash
# Clone into devices directory
git clone https://github.com/sairajkandkar007/android_device_xiaomi_beryl.git \
  device/xiaomi/beryl

# Verify structure
ls -la device/xiaomi/beryl/
# Should show: recovery/, modules/, overlay/, Android.bp, BoardConfig.mk, etc.
```

### Step 3: Sync Dependencies

```bash
# Sync OrangeFox manifest (this will take 30-60 min)
repo sync --force-sync -j8 -c

# If sync fails on specific projects, retry individual trees:
repo sync device/xiaomi/beryl --force-sync
```

### Step 4: Configure Build Environment

```bash
# Source build environment
source build/envsetup.sh

# Choose device variant
lunch omni_beryl-eng  # OrangeFox standard build

# OR for recovery-only variant:
# lunch fox_beryl-user
```

### Step 5: Build Recovery

```bash
# Full recovery image (vendor_boot)
make vendorimage -j$(nproc)

# OR build complete recovery package
mka vendorimage -j$(nproc) 2>&1 | tee build.log

# Successful build outputs to:
# out/target/product/beryl/vendor_boot.img
```

**Build Time:** 45–90 minutes on typical hardware

### Step 6: Verify Output

```bash
# Check build artifacts
ls -lh out/target/product/beryl/vendor_boot.img
file out/target/product/beryl/vendor_boot.img

# Inspect recovery ramdisk (optional)
mkdir temp_extract && cd temp_extract
unpack_bootimg --boot_img=../out/target/product/beryl/vendor_boot.img
cd ..
```

---

## Building Flashable Installer

For creating a flashable ZIP package compatible with OrangeFox UI:

```bash
# After successful recovery build, package as flashable ZIP
# (Requires additional OrangeFox installer framework)

cd device/xiaomi/beryl/recovery
./create_flashable_zip.sh

# Output: OrangeFox-beryl-v16.1.zip (ready to flash via recovery)
```

---

## Installation Instructions

### ⚠️ Pre-Flash Checklist
1. **Backup your current recovery** (if using fastboot)
2. **Unlock bootloader** (if not already unlocked via Mi Unlock)
3. **Charge device to 50%+**
4. **Enable Developer Options** (Settings → About phone → Tap "Build number" 7x)
5. **Enable USB Debugging** (Settings → Developer Options)

### Method 1: Fastboot (Recommended)

```bash
# Enable fastboot mode
adb reboot bootloader

# Verify device connection
fastboot devices

# Flash vendor_boot recovery
fastboot flash vendor_boot out/target/product/beryl/vendor_boot.img

# Reboot to recovery
fastboot reboot recovery
```

### Method 2: Fastbootd (A/B Devices)

```bash
# Reboot to fastbootd (from fastboot)
fastboot reboot fastboot

# Flash with fastbootd
fastboot flash vendor_boot vendor_boot.img

# Reboot device
fastboot reboot
```

### Method 3: Via Recovery (If OrangeFox Already Installed)

1. Sideload ZIP: `adb sideload OrangeFox-beryl-v16.1.zip`
2. Or use Recovery UI → Install → Select ZIP from USB

---

## Troubleshooting

### Build Failures

#### Error: `vendor_boot.img` not generated
```
Solution:
1. Verify BoardConfig.mk has BOARD_VENDOR_BOOT_RAMDISK_MODULES=true
2. Check recovery/root exists with proper init
3. Run: rm -rf out/target/product/beryl/obj/KERNEL/
4. Rebuild: mka vendorimage clean && mka vendorimage
```

#### Error: `vendor_dlkm not found`
```
Solution:
1. Ensure prebuilt/vendor_dlkm/ contains .ko files
2. Verify modules/Android.bp MODULE_LICENSE_GPL = true
3. Check: lsmod output should show mediatek drivers
```

#### Error: FocalTech touchscreen not detected
```
Solution:
1. Verify overlay/frameworks/base/core/res/res/values/config.xml has:
   <bool name="config_hasCapacitiveButtons">false</bool>
2. Check device.mk includes FocalTech firmware
3. Ensure selinux policies allow /dev/input access
```

### Flash Failures

#### Device not recognized by fastboot
```bash
# Check connection
fastboot devices  # Should show: <serial>  fastboot

# Troubleshoot:
lsusb  # Verify Xiaomi device ID
sudo fastboot devices  # Try with sudo

# Reinstall drivers (Windows):
# Download: https://xiaomifirmwareupdater.com/tools/
```

#### "Trying to flash non-secure image as secure"
```
Solution: Device bootloader is locked. Use Mi Unlock to unlock:
1. Get device unlock token from Mi Account
2. Download MiFlash from official source
3. Use: fastboot flashing unlock
```

#### Recovery stuck on boot loop
```
Solution:
1. Reboot to bootloader: adb reboot bootloader
2. Reflash vendor_boot: fastboot flash vendor_boot vendor_boot.img
3. If still failing, check recovery/root/init.rc for syntax errors
```

### Runtime Issues

#### OrangeFox UI not appearing (black screen)
```
Likely causes:
1. Display driver not loaded → check prebuilt/vendor_dlkm/
2. Touchscreen firmware missing → verify device.mk
3. Init script error → check recovery/root/init.beryl.rc
```

#### Cannot mount /data (encryption related)
```
Solution:
1. Ensure recovery.fstab has correct DM-Verity flags
2. Check if FDE key exists: adb shell ls -la /metadata/
3. Wipe data partition from OrangeFox UI (last resort)
```

#### USB OTG/sideload not working
```
Solution:
1. Enable USB debugging in ADB settings (Settings → Developer Options)
2. Check device.mk includes USB OTG drivers
3. Verify recovery.fstab has VFAT support for /sdcard
```

---

## Known Issues

| Issue | Status | Workaround |
|-------|--------|-----------|
| Vendor boot v4 is experimental | ⚠️ Confirmed | Do not flash if unsure; keep backups |
| GitHub Actions builds may timeout | ⚠️ Known | Increase timeout or build locally |
| FocalTech driver needs proprietary firmware | ⚠️ By design | Included in prebuilt/ |
| Virtual A/B slot duplication takes time | ℹ️ Normal | First flash is slower; subsequent flashes faster |
| Encryption detection may delay boot | ⚠️ Expected | Will resolve after first full boot cycle |

---

## File Structure Reference

```
device/xiaomi/beryl/
├── recovery/                    # Recovery-specific configurations
│   ├── root/                   # Recovery ramdisk root
│   │   ├── init.rc
│   │   ├── init.beryl.rc       # Device-specific init
│   │   └── ueventd.rc
│   ├── etc/
│   └── create_flashable_zip.sh
├── prebuilt/                    # Binary blobs
│   ├── vendor_dlkm/            # Vendor kernel modules (.ko)
│   ├── dtb/                    # Device tree binaries
│   └── firmware/               # FocalTech touchscreen FW
├── modules/                     # Kernel module configs
├── overlay/                     # Framework customizations
├── Android.bp                   # Blueprint build config
├── BoardConfig.mk               # Build variables
├── device.mk                    # Device image configuration
├── recovery.fstab               # Partition layout
├── system.prop                  # System properties
├── vendor.prop                  # Vendor properties
└── README.md                    # This file
```

---

## Contributing

We welcome contributions! Before submitting:

1. **Fork** this repository
2. **Create** a feature branch: `git checkout -b feature/your-feature`
3. **Test** your changes locally on device
4. **Commit** with clear messages: `git commit -m "Fix: FocalTech timeout issue"`
5. **Push** to your fork and **open a Pull Request**

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

---

## Resources

- **OrangeFox Recovery:** https://gitlab.com/OrangeFox/Manifest
- **Xiaomi POCO M7 Pro 5G Specs:** https://www.gsmarena.com/xiaomi_poco_m7_pro_5g-12809/
- **Android Device Tree Guide:** https://source.android.com/docs/setup/build/building-kernels
- **MediaTek MT6855 Reference:** https://mediatek.com/industries/smartphones

---

## License

This device tree is licensed under the **Apache License 2.0**. See [LICENSE](LICENSE) for details.

---

## Disclaimer

**This project is provided as-is, without warranty.** Users flash at their own risk. The authors assume no responsibility for device damage, data loss, or unforeseen consequences. Always maintain backups and understand the flashing process before proceeding.

---

## Support & Feedback

- **Issues:** Report bugs on [GitHub Issues](https://github.com/sairajkandkar007/android_device_xiaomi_beryl/issues)
- **Discussions:** Join community discussions on [GitHub Discussions](https://github.com/sairajkandkar007/android_device_xiaomi_beryl/discussions)
- **Email:** sairajkandkar007@gmail.com (if preferred)

---

**Last Updated:** September 2026  
**OrangeFox Version:** 16.1  
**Android Version:** 16 (Vanilla)  
**Device Tree Version:** 1.0
