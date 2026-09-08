# Contributing to android_device_xiaomi_beryl

First off, thank you for considering contributing to this OrangeFox Recovery device tree! It's people like you that make this project such a great tool.

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

### Our Pledge
We are committed to providing a welcoming and inspiring community for all. Please read and abide by our Code of Conduct.

---

## How Can I Contribute?

### 🐛 Reporting Bugs

Before creating bug reports, check the [issue list](https://github.com/sairajkandkar007/android_device_xiaomi_beryl/issues) as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

**Before Submitting a Bug Report:**
- Check the [troubleshooting guide](README.md#troubleshooting)
- Check the existing issues and discussions
- Collect relevant information:
  - Device model and bootloader version
  - OrangeFox version being used
  - Android version
  - Steps to reproduce the issue
  - Expected vs. actual behavior
  - Device logs (adb logcat)

**How to Submit a Good Bug Report:**

1. **Use a clear, descriptive title**
   - Bad: "Recovery doesn't work"
   - Good: "Touchscreen input not detected after boot on beryl with vendor_boot v4"

2. **Provide specific examples to demonstrate the steps**
   ```
   1. Flash vendor_boot.img using: fastboot flash vendor_boot vendor_boot.img
   2. Reboot to recovery
   3. Try to navigate using touchscreen
   
   Expected: Touch input works smoothly
   Actual: Black screen, no response to touch
   ```

3. **Describe the behavior you observed and why**
   - Explain which behavior is wrong and what you expected to see instead

4. **Include screenshots and logs**
   ```bash
   # Capture device logs
   adb logcat > device.log
   
   # Kernel logs
   adb shell dmesg > kernel.log
   
   # Recovery logs
   adb pull /tmp/recovery.log
   ```

5. **Include your environment**
   - Host OS (Ubuntu 20.04, macOS, Windows WSL2, etc.)
   - Build machine specs (RAM, CPU cores)
   - OrangeFox version (e.g., fox_16.1)
   - Device variant (storage capacity if applicable)

6. **Create the issue with label `bug`**

---

### 🆕 Suggesting Enhancements

Enhancement suggestions are tracked as GitHub Issues. When creating an enhancement suggestion, please include:

**Before Submitting an Enhancement Suggestion:**
- Check if there's already a similar enhancement requested
- Research OrangeFox capabilities to ensure feasibility
- Verify device hardware supports the feature

**How to Submit a Good Enhancement Suggestion:**

1. **Use a clear, descriptive title**
   - Bad: "Improve recovery"
   - Good: "Add USB-OTG external storage support for device tree"

2. **Provide a step-by-step description**
   ```
   Currently: Device tree doesn't include USB OTG support
   Proposed: Add USB OTG configuration to device.mk
   Benefit: Users can flash ROMs from USB drives
   ```

3. **Provide specific examples to demonstrate the feature**

4. **Include why this enhancement would be useful**
   - Use cases and benefits

5. **Create the issue with label `enhancement`**

---

### 📝 Pull Requests

**Process for Submitting Pull Requests:**

1. **Fork the repository**
   ```bash
   git clone https://github.com/sairajkandkar007/android_device_xiaomi_beryl.git
   cd android_device_xiaomi_beryl
   git remote add upstream https://github.com/sairajkandkar007/android_device_xiaomi_beryl.git
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or for bugfixes:
   git checkout -b fix/issue-description
   ```

3. **Make your changes**
   - Follow the [coding standards](#coding-standards) below
   - Keep commits atomic and well-documented
   - Test thoroughly on device

4. **Commit with clear messages**
   ```
   git commit -m "Fix: Touchscreen timeout in FocalTech driver
   
   - Increase timeout from 500ms to 1000ms
   - Add debug logging for touch events
   - Tested on beryl with Android 16
   
   Fixes #123"
   ```

5. **Keep your fork up to date**
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

6. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Open a Pull Request**
   - Link related issues
   - Provide testing evidence
   - Describe your changes clearly

8. **Address review feedback**
   - Respond to all comments
   - Request review again when complete

---

## Coding Standards

### Makefile Standards (Android.mk, BoardConfig.mk, etc.)

```makefile
# Use consistent indentation (tabs, not spaces)
ifeq ($(BOARD_VENDOR_KERNEL_MODULES),)
    BOARD_VENDOR_KERNEL_MODULES := \
        $(KERNEL_MODULES_OUT)/mediatek/module.ko
endif

# Add comments for non-obvious configurations
BOARD_RECOVERY_RAMDISK_MODULES := \
    $(KERNEL_MODULES_OUT)/mediatek/module.ko \
    $(KERNEL_MODULES_OUT)/vendor/module.ko

# Group related settings
BOARD_BOOTCONFIG := \
    androidboot.hardware=beryl \
    androidboot.boot_devices=11c00000.ufshci
```

### Device Tree Binary Standards

- Ensure DTB/DTBO files match stock kernel versions
- Document changes with comments in .dts source when available
- Verify compatibility with vendor_boot v4

### Shell Script Standards (.sh files)

```bash
#!/bin/bash

# Set strict error handling
set -euo pipefail

# Add helpful comments
# Function: Extract DTB from kernel image
extract_dtb() {
    local kernel_file="$1"
    local output_file="$2"
    
    # Use meaningful variable names
    local dtb_offset
    dtb_offset=$(od -An -tx4 "$kernel_file" | grep -o '0x[a-f0-9]*' | head -1)
    
    # Add error checking
    if [[ -z "$dtb_offset" ]]; then
        echo "Error: Could not find DTB offset" >&2
        return 1
    fi
}

# Handle errors gracefully
trap 'echo "Error on line $LINENO"' ERR
```

### Documentation Standards

- Use clear, professional language
- Provide step-by-step instructions
- Include command examples with expected output
- Add warnings for risky operations
- Keep formatting consistent

**Documentation Structure:**
```markdown
## Feature Name

### Overview
Brief description of what this does.

### Prerequisites
- Requirement 1
- Requirement 2

### Configuration
```bash
# Example commands
```

### Troubleshooting
Common issues and solutions.
```

### Version Control Standards

**Commit Message Format:**
```
Type: Brief description (50 chars max)

Longer explanation of changes. This should be detailed enough
that someone reading this commit 6 months later understands
what and why.

- Bullet point of specific changes
- Another change
- Related to issue #123

Tested on: Android 16, OrangeFox 16.1
```

**Types:**
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Code style (formatting, etc.)
- `refactor:` Code refactoring
- `perf:` Performance improvements
- `test:` Adding or updating tests
- `chore:` Build process, dependencies

---

## Testing Guidelines

### Before Submitting PR

1. **Build locally**
   ```bash
   source build/envsetup.sh
   lunch omni_beryl-eng
   mka vendorimage -j$(nproc)
   ```

2. **Flash on device**
   ```bash
   adb reboot bootloader
   fastboot flash vendor_boot out/target/product/beryl/vendor_boot.img
   fastboot reboot recovery
   ```

3. **Test functionality**
   - [ ] Display renders correctly
   - [ ] Touchscreen input works
   - [ ] USB OTG functions (if applicable)
   - [ ] Partition mounting works
   - [ ] No unexpected reboots

4. **Collect logs**
   ```bash
   adb logcat -d > recovery_test.log
   adb shell dmesg > kernel_test.log
   adb pull /tmp/recovery.log
   ```

5. **Document results**
   - Include test logs in PR description
   - Screenshot of successful OrangeFox UI
   - Any known issues discovered

### Continuous Integration

- GitHub Actions workflows run automatically
- All CI checks must pass before merge
- Build artifacts available for download

---

## File Structure Guidelines

When adding new files or directories:

```
device/xiaomi/beryl/
├── recovery/               # Recovery-specific files
│   ├── root/              # Ramdisk contents
│   │   ├── init.rc
│   │   └── init.beryl.rc
│   └── etc/
├── prebuilt/              # Binary blobs
│   ├── vendor_dlkm/       # Must include LICENSE
│   ├── dtb/               # DTB files
│   └── firmware/          # Firmware files
└── docs/                  # Additional documentation
    └── DEVICE_TREE.md
```

---

## Review Process

1. **Initial Review**
   - Automatic CI/CD checks run
   - Maintainer reviews code quality
   - Discussion of approach if needed

2. **Feedback and Changes**
   - Address all comments
   - Push updates as new commits
   - Re-request review

3. **Approval and Merge**
   - Requires approval from maintainer
   - Squash commits for clean history
   - Delete branch after merge

---

## Recognition

Contributors will be recognized in:
- `CONTRIBUTORS.md` file
- Release notes for features
- GitHub contributor graph

---

## Questions?

- **Issues & Bugs:** Use GitHub Issues
- **General Questions:** GitHub Discussions
- **Email:** sairajkandkar007@gmail.com

---

## License

By contributing to this project, you agree that your contributions will be licensed under its Apache License 2.0.

---

**Thank you for contributing!** 🎉

We appreciate your effort to improve this OrangeFox Recovery device tree. Your contributions help make custom recovery accessible to more users.
