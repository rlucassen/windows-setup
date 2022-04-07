# Set windows settings
#   Set dark theme
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Value 0
#   Set to show file extensions in windows explorer
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Value 0
#   Set jump list history (right click application on taskbar) to 20
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'JumpListItems_Maximum' -Value 20
#   Disable Cortana search bar
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -Value 0
#   Show labels on taskbar till full
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarGlomLevel' -Value 1
#   Reinstate windows photo viewer
reg import .\windows_photo_viewer.reg
#   Remove Edit with Paint 3D
Remove-Item -Path 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.jpeg\Shell\3D Edit' -Recurse
Remove-Item -Path 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.jpg\Shell\3D Edit' -Recurse
Remove-Item -Path 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.jpe\Shell\3D Edit' -Recurse
Remove-Item -Path 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.png\Shell\3D Edit' -Recurse
Remove-Item -Path 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.bmp\Shell\3D Edit' -Recurse
Remove-Item -Path 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.gif\Shell\3D Edit' -Recurse
Remove-Item -Path 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.obj\Shell\3D Edit' -Recurse
Remove-Item -Path 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.stl\Shell\3D Edit' -Recurse
Remove-Item -Path 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.tif\Shell\3D Edit' -Recurse
Remove-Item -Path 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.tiff\Shell\3D Edit' -Recurse

# Create Folders
New-Item -ItemType Directory -Path "C:\Work"
New-Item -ItemType Directory -Path "C:\Zooi"

# Set Windows StartLayout
Import-StartLayout -LayoutPath "StartLayout.xml" -MountPath "C:\"

# Restart explorer.exe
Stop-Process -ProcessName explorer

# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Default utilities
choco install googlechrome -y
choco install dropbox -y --params "/s"
choco install logitech-options -y
choco install totalcommander -y --params "/DefaultFM:explorer"
Copy-Item .\wincmd.ini -Destination "C:\Program Files\totalcmd"
choco install enpass.install -y
choco install whatsapp -y
choco install microsoft-windows-terminal -y
Copy-Item .\windows-terminal.settings.json -Destination "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
choco install git -y --params "/NoShellIntegration"
git config --global credential.helper wincred
choco install spotify -y
choco install potplayer -y
choco install nodejs-lts -y
choco install adobereader -y --params "/UpdateMode:3"
choco install microsoft-teams.install -y
choco install procexp -y
choco install windirstat -y

# VS Code
choco install vscode -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.vs-keybindings
code --install-extension esbenp.prettier-vscode

# Office
choco install office365business -y --params '"/productid:O365BusinessRetail /exclude:""Access Groove Lync OneDrive OneNote Publisher"""'
#   Set office to black mode
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Common\' -Name 'UI Theme' -Value 4

# Downloading
choco install transmission -y
choco install expressvpn -y

# Development
choco install sql-server-2019 -y --skip-virus-check --params="'/SQLSYSADMINACCOUNTS:RobinLucassen /UpdateEnabled:True'"
choco install sql-server-management-studio -y
choco install visualstudio2019community -y --params "--add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Component.ClassDesigner"
choco install resharper -y
choco install dotpeek -y