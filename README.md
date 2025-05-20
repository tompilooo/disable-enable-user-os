# User Account Management Scripts (macOS, Linux, Windows)

This project provides cross-platform scripts for enabling or disabling user accounts on macOS, Linux, and Windows systems.

## Contents

* `disable-enable-account.sh` — Interactive shell script for macOS and Linux.
* `disable-enable-account.ps1` — PowerShell script for Windows.

---

## 🔧 disable-enable-account.sh (macOS & Linux)

### ✅ Features

* Prompt-based interface
* Detects OS (macOS or Linux)
* Allows enabling or disabling a specified user account
* Includes shell restoration and visibility settings for macOS

### ▶ Usage

```bash
chmod +x disable-enable-account.sh
sudo ./disable-enable-account.sh
```

Follow the prompts to:

* Enter the username
* Choose to `disable` or `enable` the account

---

## 🔧 disable-enable-account.ps1 (Windows)

### ✅ Features

* Accepts parameters for username and action
* Supports `disable` or `enable` via PowerShell
* Uses `Disable-LocalUser` and `Enable-LocalUser` cmdlets

### ▶ Usage

```powershell
.\disable-enable-account.ps1 -Username "john" -Action disable
.\disable-enable-account.ps1 -Username "john" -Action enable
```

> Note: Must be run as Administrator in PowerShell

---

## 🛡️ Use Cases

* Incident response: isolate or restore access to compromised accounts
* Administrative maintenance of local user accounts
* Endpoint security hardening procedures

---

## ⚠️ Requirements

* `sudo` access on macOS/Linux
* Windows PowerShell 5.1+ with administrative privileges

---

## 📁 License

MIT License (or internal use only)

---

For improvements or automation extensions (e.g., bulk account handling, logging), contributions or requests are welcome
