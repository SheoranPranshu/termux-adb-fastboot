#!/data/data/com.termux/files/usr/bin/bash

set -e

R='\033[0;31m'
G='\033[0;32m'
Y='\033[1;33m'
I='\033[0;90m'
N='\033[0m'

run_step() {
    local msg="$1"
    local cmd="$2"
    echo -e "${I}[..]${N} $msg..."
    if eval "$cmd" > /dev/null 2>&1; then
        echo -e "     └─> ${G}[OK]${N}\n"
    else
        echo -e "     └─> ${R}[FAILED]${N}"
        echo -e "${R}$msg failed${N}\n"
        exit 1
    fi
}

echo
echo -e "${Y}This will uninstall termux adb & fastboot and remove all related files${N}\n"

while true; do
    read -p "Are you sure you want to continue? (y/n): " choice
    case "$choice" in
        [Yy]* )
            echo
            break
            ;;
        [Nn]* )
            echo
            echo "Uninstall cancelled"
            echo
            exit 0
            ;;
        * )
            echo "Please answer y or n"
            ;;
    esac
done

if pkg list-installed 2>/dev/null | grep -q "^termux-adb/"; then
    run_step "Removing termux-adb package" \
    "pkg remove termux-adb -y"
else
    echo -e "${I}termux adb-fastboot not installed${N}\n"
fi

if [ -L "$PREFIX/bin/adb" ]; then
    run_step "Removing adb shortcut" \
    "rm -f '$PREFIX/bin/adb'"
fi

if [ -L "$PREFIX/bin/fastboot" ]; then
    run_step "Removing fastboot shortcut" \
    "rm -f '$PREFIX/bin/fastboot'"
fi

if [ -f "$PREFIX/etc/apt/sources.list.d/termux-adb.list" ]; then
    run_step "Removing termux-adb repository" \
    "rm -f '$PREFIX/etc/apt/sources.list.d/termux-adb.list'"
fi

if [ -f "$PREFIX/etc/apt/trusted.gpg.d/nohajc.gpg" ]; then
    run_step "Removing repository key" \
    "rm -f '$PREFIX/etc/apt/trusted.gpg.d/nohajc.gpg'"
fi

run_step "Updating package lists" \
"pkg update"

echo -e "${G}Uninstall complete!${N}\n"

echo -e "${I}termux adb & fastboot has been removed from your device${N}"
echo
