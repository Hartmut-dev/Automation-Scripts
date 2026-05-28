# IT Automation Scripts

**Experimenting with IT automation scripts to gain real-world experience.**

This repository serves as a personal sandbox for developing practical scripts to streamline daily IT operations, automate repetitive tasks, and explore system administration concepts using PowerShell and Python.

## Current Scripts

### 1. systemHealthCheck.ps1 (PowerShell)
A diagnostic script designed for Level 1 Helpdesk scenarios. It queries the local machine to generate a clean text-based health report containing:
* Current Operating System version
* Accurate system uptime (to verify user reboots)
* Available disk space on the primary drive
* Current free physical memory

### 2. organizeDownloads.py (Python)
A file system manipulation script that automatically declutters a workspace. It scans a designated directory (defaulting to the user's Downloads folder) and dynamically sorts loose files into categorized subfolders based on their extensions (e.g., Documents, Images, Installers, Scripts).

---

## Work In Progress / Future Roadmap

As part of my ongoing home lab development and IT upskilling, I am actively planning and working on the following scripts:

* **systemHealthCheck v2.0 (PowerShell):** Expanding the current diagnostic script to include network configuration details (IP/DNS), pending Windows Update checks, and fetching the last 5 critical Application Event Logs.
* **adUserProvisioning.ps1 (PowerShell):** A script to automate the creation of Active Directory user accounts in my home lab, including assigning default groups and forcing password resets on first login.
* **networkPingTest.py (Python):** A quick diagnostic tool to ping a predefined list of internal servers and external gateways (e.g., 8.8.8.8) to instantly identify network drops.
* **automatedBackupSync.py (Python):** A scheduled script to compress and securely back up critical user directories to a secondary drive or network location.

## Goals
* Translate theoretical IT and cybersecurity knowledge into practical, executable tools.
* Improve proficiency in OS-level scripting and task automation.
* Maintain clean, documented, and reusable code for enterprise environments.
