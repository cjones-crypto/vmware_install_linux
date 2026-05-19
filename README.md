# vmware_install_linux
An automated bash script to streamline the deployment of VMware Workstation Pro 26H1 on a Kali Linux host. This tool handles essential prerequisite parsing, system kernel headers syncing, core hypervisor deployment, and kernel module (`vmmon` / `vmnet`) compilation.
# Kali Linux VMware Workstation Pro Installer (26H1)

An automated bash script to streamline the deployment of VMware Workstation Pro 26H1 on a Kali Linux host. This tool handles essential prerequisite parsing, system kernel headers syncing, core hypervisor deployment, and kernel module (`vmmon` / `vmnet`) compilation.

## 🚀 Purpose & Context
When operating an offensive security or penetration testing lab directly on a bare-metal Kali Linux host, running virtualized target environments efficiently is critical. Broadcom's **VMware Workstation Pro 26H1** offers enterprise-grade hypervisor capabilities completely free for personal use. 

Because Kali Linux runs on a aggressive rolling-release kernel schedule, manual kernel compilation can break. This script ensures the system satisfies all dependencies, matching your running kernel version precisely before attempting execution.

## 🛠 Prerequisites
Due to portal restrictions, you must download the official hypervisor package manually prior to running the automation:
1. Log into the **Broadcom Support Portal**.
2. Download the Linux installer bundle for **VMware Workstation Pro for Personal Use (26H1)**.
3. Place the downloaded `.bundle` file directly into this repository folder.

## 💻 Installation & Execution

Clone the repository and move your downloaded installer package into the directory, then run:

```bash
# Make the automated script executable
chmod +x install.sh

# Execute the deployment with elevated privileges
sudo ./install.sh
