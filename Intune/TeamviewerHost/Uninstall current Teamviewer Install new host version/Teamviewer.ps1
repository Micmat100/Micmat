# 1. Kill TeamViewer processes
Stop-Process -Name "TeamViewer*" -Force -ErrorAction SilentlyContinue

# 2. Find and Uninstall existing versions
$Paths = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*", 
         "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*",
         "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"

$Apps = Get-ItemProperty $Paths -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like "*TeamViewer*" }

foreach ($App in $Apps) {
    Write-Host "Uninstalling: $($App.DisplayName)" -ForegroundColor Cyan
    $Uninst = $App.UninstallString
    if ($Uninst -match "MsiExec") {
        $Args = $Uninst -replace "MsiExec.exe", "" -replace "/I", "/X"
        Start-Process "msiexec.exe" -ArgumentList "$Args /qn /norestart" -Wait
    } else {
        Start-Process "cmd.exe" -ArgumentList "/c $Uninst /S" -Wait
    }
}

# 3. Install the New Host Version

$MSIPath = Join-Path -Path $PSScriptRoot -ChildPath "InstallFilename.msi"
Write-Host "Installing New TeamViewer Host..." -ForegroundColor Green
$ConfigID = "Insert ConfigID here"
$AssignID = "Insert AssignID here"

Start-Process "msiexec.exe" -ArgumentList "/i `"$MSIPath`" /qn CUSTOMCONFIGID=$ConfigID ASSIGNMENTID=$AssignID" -Wait

Write-Host "Deployment Complete." -ForegroundColor White