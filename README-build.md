# POCO M7 Pro 5G (beryl) — OrangeFox build tree

This is an initial Android 16 / MT6855 / vendor_boot HDR4 device tree.

## Confirmed architecture

- arm64
- MediaTek MT6855
- Android boot header v4
- recovery contained in vendor_boot
- A/B + Virtual A/B
- dynamic partitions
- 9,126,805,504-byte super partition
- stock recovery uses EROFS/ext4 logical partitions and F2FS userdata
- stock vendor_boot contains separate platform and recovery ramdisk entries

## Important

This tree is intentionally conservative. The vendor_boot-as-recovery path is
experimental in OrangeFox. A successful compile does NOT prove that the image
will boot on hardware.

The first milestone is a clean source build and artifact inspection. Hardware
testing should be done only with a known recovery path available.

## Stock reference image

If the build fails because recovery needs stock vendor_boot resources, use
`prebuilt/stock-vendor_boot.img` and enable FOX_REFERENCE_VENDOR_BOOT_IMAGE in
the build environment. Do not add a random vendor_boot from another device or
firmware version.

## Android version / branch

The workflow currently targets the OrangeFox fox_12.1 source branch because
that is the branch documented for the current general OrangeFox build flow.
Android 16 compatibility should be treated as a build-time validation item,
not assumed merely from the device fingerprint.

## Next validation targets

1. Build source tree.
2. Verify the produced recovery/vendor_boot ramdisk artifact.
3. Verify module dependencies, especially touchscreen/display modules.
4. Verify decryption and dynamic-partition mounting.
5. Only then consider hardware testing.

No flashing instructions are included in this repository.
