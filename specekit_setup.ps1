<#
.SYNOPSIS
    SpeceKIT Initial Setup Script.
.DESCRIPTION
    This script prepares a developer environment by ensuring key tools are installed and configured:
    - Git
    - Visual Studio Code
    - PowerShell extensions for VS Code
.NOTES
    Author: Piotr Berent (Spece.IT/bericom.pl)
    Date: 2024-12-27
    Version: 0.0.1
.LINK
    https://github.com/beria-pl/SpeceKIT
#>

# Begin script execution
Write-Host "`n=== SpeceKIT Setup Script ===`n" -ForegroundColor Cyan

# Function to check if a command exists
function Test-Command {
    param(
        [string]$Command
    )
    Write-Host "Checking for $Command..." -ForegroundColor Yellow
    if (-Not (Get-Command $Command -ErrorAction SilentlyContinue)) {
        Write-Host "$Command is not installed or not in PATH." -ForegroundColor Red
        return $false
    }
    Write-Host "$Command is installed." -ForegroundColor Green
    return $true
}

# Function to install a tool using winget
function Install-Tool {
    param(
        [string]$ToolId,
        [string]$ToolName
    )
    Write-Host "Installing $ToolName..." -ForegroundColor Cyan
    winget install --id $ToolId -e --source winget
}

# Check for prerequisites
$prerequisites = @(
    @{ Command = "git"; Name = "Git"; WingetId = "Git.Git" },
    @{ Command = "code"; Name = "Visual Studio Code"; WingetId = "Microsoft.VisualStudioCode" }
    @{ Command = "git-desktop"; Name = "GitHub Desktop"; WingetId = "GitHub.GitHubDesktop" }
)

foreach ($prereq in $prerequisites) {
    if (-Not (Test-Command $prereq.Command)) {
        Install-Tool -ToolId $prereq.WingetId -ToolName $prereq.Name
    }
}

# VS Code Extensions Installation
Write-Host "`nInstalling essential VS Code extensions..." -ForegroundColor Cyan
$extensions = @(
    "ms-vscode.powershell",   # PowerShell extension
    "eamodio.gitlens",        # GitLens for Git integration
    "visualstudioexptteam.vscodeintellicode" # IntelliCode for AI assistance
)
foreach ($extension in $extensions) {
    Write-Host "Installing extension: $extension" -ForegroundColor Yellow
    code --install-extension $extension
}

# Final message
Write-Host "`n=== SpeceKIT Setup Complete! ===`n" -ForegroundColor Green
Write-Host "You are ready to start coding with Visual Studio Code, Git, and PowerShell." -ForegroundColor Cyan
Write-Host "Visit the repository for more details: https://github.com/beria-pl/SpeceKIT" -ForegroundColor Cyan
