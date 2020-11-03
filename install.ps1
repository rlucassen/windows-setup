# Set windows settings
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0

# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Default utilities
choco install microsoft-edge
choco install googlechrome
choco install dropbox
choco install logitech-options
choco install totalcommander --params "/DefaultFM:explorer"
choco install enpass.install
choco install whatsapp
choco install microsoft-windows-terminal
choco install vscode

# Office
choco install office365business --params '"/productid:O365BusinessRetail /exclude:""Access Groove Lync OneDrive OneNote Publisher"""'

# Downloading
choco install transmission
choco install ipvanish

# Development
choco install git --params "/NoShellIntegration"
choco install sql-server-2019 --skip-virus-check --params="'/SQLSYSADMINACCOUNTS:RobinLucassen /UpdateEnabled:True'"
choco install sql-server-management-studio
choco install visualstudio2019community --params "--add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Component.ClassDesigner"
