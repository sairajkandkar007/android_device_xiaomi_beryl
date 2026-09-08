# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial vendor_boot v4 recovery implementation
- Device tree for Xiaomi POCO M7 Pro 5G (beryl)
- Support for MediaTek MT6855 platform
- FocalTech touchscreen driver integration
- F2FS and full-disk encryption support
- GitHub Actions CI/CD for automated builds
- Comprehensive documentation and troubleshooting guides

### Fixed
- (Coming in next release)

### Changed
- (Coming in next release)

### Deprecated
- (Coming in next release)

### Removed
- (Coming in next release)

### Security
- (Coming in next release)

---

## [1.0.0] - 2024-09-08

### Added
- **Initial Release**
- OrangeFox Recovery device tree for Xiaomi POCO M7 Pro 5G
- Complete device configuration for MediaTek MT6855
- Support for Android 16 (Vanilla)
- vendor_boot v4 recovery ramdisk architecture
- A/B and Virtual A/B partition support
- Dynamic partition configuration
- FocalTech touchscreen support
- F2FS filesystem support
- Full-disk encryption (FDE) support
- Vendor DLKM modules (mediatek drivers)
- Device tree binaries (DTB/DTBO) pre-extracted from stock firmware
- GPIO configuration for GPIO LED indicators
- USB OTG mass storage support
- Fastboot mode support for flashing
- Recovery fstab with proper mount flags
- Device-specific init scripts (init.beryl.rc)
- System and vendor property configurations
- GitHub Actions workflows for automated OrangeFox builds
- Comprehensive README with build instructions
- Contributing guidelines
- Apache 2.0 License
- .gitignore for Android projects

### Notes
- **EXPERIMENTAL:** This is an experimental implementation of vendor_boot v4 recovery. Use at your own risk.
- Device specifications derived from stock firmware and TWRP device tree
- Requires OrangeFox manifest branch fox_16.0 or higher
- First-time flashing may take longer due to Virtual A/B slot duplication

---

## Version History Reference

### v1.0.0 (September 2024)
- **Status:** Stable (Experimental Recovery)
- **OrangeFox Version:** 16.1
- **Android Base:** Android 16
- **Kernel:** MediaTek MT6855 kernel
- **Tested Devices:** Xiaomi POCO M7 Pro 5G (beryl)

---

## Migration Guide

### From Stock Recovery to OrangeFox

1. **Backup Stock Recovery**
   ```bash
   adb reboot bootloader
   fastboot getvar partition-type:vendor_boot
   fastboot get_staged out/vendor_boot_stock.img
   ```

2. **Flash OrangeFox Recovery**
   ```bash
   fastboot flash vendor_boot out/target/product/beryl/vendor_boot.img
   fastboot reboot recovery
   ```

3. **Verify Installation**
   - OrangeFox UI should display
   - Check "About" menu for version information

### Reverting to Stock Recovery

```bash
fastboot flash vendor_boot out/vendor_boot_stock.img
fastboot reboot
```

---

## Known Issues by Version

### v1.0.0
- [ ] Vendor boot v4 is experimental (use with caution)
- [ ] GitHub Actions builds may timeout on resource-constrained runners
- [ ] FocalTech firmware requires binary blob (included in prebuilt/)
- [ ] Virtual A/B slot duplication may take 5-10 minutes on first boot
- [ ] Encryption detection may delay boot on first flash

### Fixed in Later Versions
(To be updated as issues are resolved)

---

## Planned Features

### v1.1.0 (Q4 2024)
- [ ] Add TWRP theme support for OrangeFox
- [ ] Implement device-specific decryption
- [ ] Add backup encryption support
- [ ] Create flashable TWRP/OrangeFox comparator tool
- [ ] Add USB-C fast charging info display

### v1.2.0 (Q1 2025)
- [ ] Optimize recovery boot time
- [ ] Add custom color themes
- [ ] Implement device tree patches for kernel 6.1+
- [ ] Add support for MediaTek MT6856 (future variant)

### v2.0.0 (TBD)
- [ ] Upgrade to vendor_boot v5 (when available)
- [ ] Add full kernel source tree
- [ ] Implement modular recovery components
- [ ] Add support for multiple Xiaomi devices with MT6855

---

## Breaking Changes

### v1.0.0
- First release; no previous versions to compare against

### Compatibility Notes
- Requires OrangeFox manifest branch: `fox_16.0` or `fox_16.1`
- Requires Android SDK Platform Tools 34.0.0+
- Requires build host with 80GB+ free disk space

---

## Dependency Updates

### v1.0.0 Dependencies
| Dependency | Version | Required | Notes |
|------------|---------|----------|-------|
| OrangeFox Manifest | 16.1+ | Yes | Core recovery framework |
| Android SDK Tools | 34.0.0+ | Yes | Build and flash tools |
| MediaTek Kernel | Stock | Yes | Device tree target |
| LLVM Compiler | 14+ | Yes | Kernel compilation |
| Device Tree Compiler | 1.6.1+ | Yes | DTB/DTBO compilation |

---

## Release Schedule

| Version | Status | Release Date | Support Ends |
|---------|--------|--------------|--------------|
| 1.0.0 | Stable | Sep 2024 | Sep 2025 |
| 1.1.0 | Planned | Q4 2024 | Q4 2025 |
| 1.2.0 | Planned | Q1 2025 | Q1 2026 |
| 2.0.0 | Planned | TBD | TBD |

---

## How to Report a Bug

Found a bug? Please report it on [GitHub Issues](https://github.com/sairajkandkar007/android_device_xiaomi_beryl/issues) with:

1. **Version affected** (check "About" in OrangeFox)
2. **Device details** (POCO M7 Pro 5G variant)
3. **Steps to reproduce**
4. **Expected vs. actual behavior**
5. **Logs** (recovery.log, kernel dmesg, etc.)

---

## Changelog Conventions

### Sections
- **Added** for new features
- **Fixed** for bug fixes
- **Changed** for changes in existing functionality
- **Deprecated** for soon-to-be removed features
- **Removed** for now removed features
- **Security** for security vulnerability fixes

### Format
- Use consistent date format: YYYY-MM-DD
- Use semantic versioning: MAJOR.MINOR.PATCH
- Link to related issues: Fixes #123
- Use past tense for descriptions
- Keep entries brief but informative

---

## Contributors

### v1.0.0
- **Sairaj Kandkar** - Initial device tree implementation and maintenance

See [CONTRIBUTORS.md](CONTRIBUTORS.md) for the full list.

---

## Acknowledgments

- OrangeFox Recovery team for the recovery framework
- TWRP project for device tree reference
- Xiaomi and MediaTek for device specifications
- Community members for testing and feedback

---

**Stay updated:** Watch this repository for new releases and updates!
