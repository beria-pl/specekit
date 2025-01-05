# SpeceKIT

## Overview
**SpeceKIT** is a PowerShell script designed to streamline the setup of a development environment. It ensures the installation and configuration of essential tools, including:
- Git
- GitHub Desktop
- Visual Studio Code
- PowerShell extensions for VS Code

This script is perfect for developers who want a quick and consistent setup across different machines.

---

## Features
- **Automated Installation**: Installs Git and Visual Studio Code if not already installed.
- **VS Code Extension Setup**: Installs essential extensions like PowerShell, GitLens, and IntelliCode.
- **Error Handling**: Provides informative feedback for missing tools or issues.

---

## Usage

Run the script directly from GitHub using PowerShell:

```powershell
irm https://raw.githubusercontent.com/beria-pl/specekit/refs/heads/main/specekit_setup.ps1 | iex
