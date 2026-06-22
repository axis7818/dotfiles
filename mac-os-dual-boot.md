# MacOS Dual Boot

## Prevent macOS from Seeing other Data Volumes

The easiest way to prevent each macOS installation from seeing the other's data volume is to **remove the automatic mount points**. On each macOS installation, you can tell the OS not to auto-mount the other volume by adding an entry to `/etc/fstab`.

1. First, find the UUID of the volume you want to hide. In **Terminal**, run:
   ```bash
   diskutil info /Volumes/OtherVolumeName | grep "Volume UUID"
   ```

2. Then edit fstab safely using:
   ```bash
   sudo vifs
   ```

3. Add a line like this (using the UUID you found):
   ```
   UUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX none apfs rw,noauto
   ```
   The `noauto` flag prevents it from being auto-mounted at boot.

4. Repeat this on the **other** macOS installation for its counterpart volume.

## Important Notes

- **APFS Volume Groups**: macOS automatically pairs a System volume with a Data volume in an APFS Volume Group. The *other* OS's system volume will still try to surface its paired data volume. The `fstab` approach is the cleanest fix.
- **Do this on both installs**: Each macOS needs its own `fstab` entry to ignore the other's data volume — they each have their own `/etc/fstab`.
- The `noauto` entry won't encrypt or truly block access if someone manually mounts the volume — for real isolation, consider **FileVault** on each volume, which would require a password to mount.

The `fstab` + `noauto` approach is what most dual-boot Mac users use for this exact scenario.
