#!/bin/bash

# Ensure the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "[-] Please run this script as root (sudo)."
  exit 1
fi

echo "[+] Updating package lists..."
apt update -y

echo "[+] Installing required build dependencies and kernel headers..."
apt install -y build-essential linux-headers-$(uname -r) dkms

# Find the VMware .bundle file in the current directory
VMWARE_BUNDLE=$(ls VMware-Workstation-Full-*.bundle 2>/dev/null | head -n 1)

if [ -z "$VMWARE_BUNDLE" ]; then
  echo "[-] Error: No VMware-Workstation-Full-*.bundle file found in the current directory."
  echo "[-] Please download it from Broadcom and place it in this folder."
  exit 1
fi

echo "[+] Making $VMWARE_BUNDLE executable..."
chmod +x "$VMWARE_BUNDLE"

echo "[+] Executing VMware Installer..."
./"$VMWARE_BUNDLE" --console --required --eulas-agreed

echo "[+] Building and loading VMware kernel modules..."
vmware-modconfig --console --install-all

# Verify if modules loaded successfully
if lsmod | grep -qE "vmmon|vmnet"; then
  echo "[+] Success! VMware kernel modules compiled and loaded perfectly."
  echo "[+] You can now launch VMware Workstation Pro from your applications menu or type 'vmware' in the terminal."
else
  echo "[!] Warning: Modules did not load automatically. Trying to manually force start..."
  systemctl restart vmware
fi
