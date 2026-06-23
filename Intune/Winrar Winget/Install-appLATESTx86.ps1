##Install the latest Microsoft SQL Management Studio from Winget repository
##Author: John Bryntze
##Date: 2nd February 2024

##set variables
## zet in deze variable de ID van de app dat je wil installeren, bv $WingetAppID = "Microsoft.SQLServerManagementStudio"
## krijg de ID door "winget list" uit te voeren, neem naam onder "ID"
$WingetAppID = "RARLab.WinRAR"

$basePath = "C:\Program Files\WindowsApps"
$pattern = "Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe"

$latestFolder = Get-ChildItem -Path $basePath -Directory |
    Where-Object { $_.Name -like $pattern } |
    Sort-Object {
        # Extract version part: Microsoft.DesktopAppInstaller_1.21.3621.0_x64__...
        [version]($_.Name -split '_')[1]
    } -Descending |
    Select-Object -First 1

##Help SYSTEM find winget.exe folder
##Set-Location -Path ("$env:ProgramW6432\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe")
Set-Location -Path $latestFolder.FullName



##Install Microsoft SQL Management Studio software with winget.exe
.\winget.exe install -e --id $WingetAppID --silent --accept-package-agreements --accept-source-agreements --force