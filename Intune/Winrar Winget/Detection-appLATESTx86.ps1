##Purpose: Checking that locally installed Microsoft SQL Management Studio is equal or greater to the latest found online
##Author: John Bryntze
##Date: 2nd February 2024

##set variables
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



##What is the latest version online
$Search = .\winget.exe search -e --id $WingetAppID --accept-source-agreements
$OnlineVersion = (-split $Search[-1])[-2]


##What is the version installed
$LocalSearch = .\winget.exe list -e --id $WingetAppID


#If not installed exit here...
if($LocalSearch[-1] -eq 'No installed package found matching input criteria.')
{
    exit 1
    #no Microsoft SQL Management Studio is installed...
}

##Check if the installed version has a newer version on the web...
$CheckIfAvailavbleExist = (-split $LocalSearch[-3])[-2]
if($CheckIfAvailavbleExist -eq "Available")
{
    $LocalVersion = (-split $LocalSearch[-1])[-3]
}
else
{
    $LocalVersion = (-split $LocalSearch[-1])[-2]
}

if($LocalVersion -ge $OnlineVersion)
{
    Write-Output "The Device got the latest version installed."
 exit 0
 #Detection success
}
else
{
 exit 1
 #Detection failed
}