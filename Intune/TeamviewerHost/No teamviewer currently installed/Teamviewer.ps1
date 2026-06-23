# 3. Install the New Host Version

$MSIPath = Join-Path -Path $PSScriptRoot -ChildPath "InstallFilename.msi"
Write-Host "Installing New TeamViewer Host..." -ForegroundColor Green
$ConfigID = "Insert ConfigID here"
$AssignID = "Insert AssignID here"

Start-Process "msiexec.exe" -ArgumentList "/i `"$MSIPath`" /qn CUSTOMCONFIGID=$ConfigID ASSIGNMENTID=$AssignID" -Wait

Write-Host "Deployment Complete." -ForegroundColor White