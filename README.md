# Termux ADB & Fastboot

Use ADB and Fastboot on your Android device without root access.

## Requirements

- [Termux](https://f-droid.org/packages/com.termux/)
- [Termux:API](https://f-droid.org/packages/com.termux.api/)
- Storage access: Run `termux-setup-storage` before installation

## Installation

```bash
curl -sS https://raw.githubusercontent.com/nullPointer1101/termux-adb-fastboot/refs/heads/main/install.sh | bash
```

The installer will:
- Set up the termux-adb repository
- Install ADB and Fastboot
- Create command shortcuts (if android-tools isn't installed)

## Usage

After installation, use these commands:

```bash
adb help
fastboot help
```

Or if you kept android-tools installed:

```bash
termux-adb help
termux-fastboot help
```

## Uninstall/Revert Changes

```bash
curl -sS https://raw.githubusercontent.com/nullPointer1101/termux-adb-fastboot/refs/heads/main/uninstall.sh | bash
```

## Credits

[**nohajc**](https://github.com/nohajc) - for his work on ADB and Fastboot for Termux
