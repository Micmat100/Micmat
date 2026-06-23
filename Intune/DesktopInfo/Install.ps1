$DestinationFolder = "C:\DesktopInfo"
# Create folder
if (!(Test-Path $DestinationFolder)) {
   New-Item -Path $DestinationFolder -ItemType Directory -Force | Out-Null
}
# Get script source folder (Intune-safe)
$source = $PSScriptRoot
# Copy all files from package source
Copy-Item -Path "$source\*" -Destination $DestinationFolder -Recurse -Force
# Create startup shortcut
$StartupFolder = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$StartupFolder\DesktopInfo.lnk")
$Shortcut.TargetPath = "$DestinationFolder\DesktopInfo.exe"
$Shortcut.WorkingDirectory = $DestinationFolder
$Shortcut.Save()