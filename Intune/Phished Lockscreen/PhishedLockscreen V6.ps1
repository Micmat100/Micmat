# Get the directory of the currently running script (Intune's source folder)
$SourcePath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Define the final destination path for the image
$DestinationPath = "C:\Users\Public"
$ImageFile = "PhishedLockscreen.png"
$ImagePath = "$DestinationPath\$ImageFile"

# Create the destination directory if it doesn't exist
if (-not (Test-Path $DestinationPath)) {
    New-Item -Path $DestinationPath -ItemType Directory -Force | Out-Null
}

# CRITICAL STEP: Copy the image from the source to the destination
Copy-Item -Path "$SourcePath\$ImageFile" -Destination $DestinationPath -Force

# --- Registry Modification (Your original script starts here) ---

$RegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"
$StatusValue = 1 # Set to 1 to activate the image

# Create the key path if it doesn't exist
if (-not (Test-Path $RegKeyPath)) {
    New-Item -Path $RegKeyPath -Force | Out-Null
}

# Set the image path (which is now confirmed to be in the correct location)
New-ItemProperty -Path $RegKeyPath -Name "LockScreenImagePath" -Value $ImagePath -PropertyType String -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name "LockScreenImageUrl" -Value $ImagePath -PropertyType String -Force | Out-Null

# Set the status (activates the image)
New-ItemProperty -Path $RegKeyPath -Name "LockScreenImageStatus" -Value $StatusValue -PropertyType DWORD -Force | Out-Null