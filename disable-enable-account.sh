#!/bin/bash
# Multi-OS User Account Manager (Disable/Enable)
# Author: Security Team
# Requirements: sudo/root privileges

echo "🔐 User Account"
read -rp "🧑 Enter username: " USERNAME

if [[ -z "$USERNAME" ]]; then
  echo "[!] Username cannot be empty. Aborting."
  exit 1
fi

read -rp "🛠 Do you want to disable or enable the account? (disable/enable): " ACTION
ACTION=${ACTION,,}  # convert to lowercase

if [[ "$ACTION" != "disable" && "$ACTION" != "enable" ]]; then
  echo "[!] Invalid action. Choose either 'disable' or 'enable'."
  exit 1
fi

OS_TYPE=$(uname)

echo "💻 Detected OS: $OS_TYPE"

# macOS Section
if [[ "$OS_TYPE" == "Darwin" ]]; then
  echo "🔍 macOS - Processing user '$USERNAME'..."

  if [[ "$ACTION" == "disable" ]]; then
    sudo pwpolicy -u "$USERNAME" -disableuser
    sudo dscl . -create /Users/"$USERNAME" UserShell /usr/bin/false
    sudo dscl . -create /Users/"$USERNAME" IsHidden 1
    echo "[✓] User '$USERNAME' disabled on macOS."
  else
    sudo pwpolicy -u "$USERNAME" -enableuser
    sudo dscl . -create /Users/"$USERNAME" UserShell /bin/zsh
    sudo dscl . -delete /Users/"$USERNAME" IsHidden
    echo "[✓] User '$USERNAME' enabled on macOS."
  fi

# Linux Section
elif [[ "$OS_TYPE" == "Linux" ]]; then
  echo "🔍 Linux - Processing user '$USERNAME'..."

  if [[ "$ACTION" == "disable" ]]; then
    sudo usermod -L "$USERNAME"
    sudo usermod -s /usr/sbin/nologin "$USERNAME"
    sudo passwd -l "$USERNAME"
    echo "[✓] User '$USERNAME' disabled on Linux."
  else
    sudo usermod -U "$USERNAME"
    sudo usermod -s /bin/bash "$USERNAME"
    sudo passwd -u "$USERNAME"
    echo "[✓] User '$USERNAME' enabled on Linux."
  fi

# Unsupported OS
else
  echo "[!] Unsupported OS: $OS_TYPE"
  exit 1
fi