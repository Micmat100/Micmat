$RegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"

# Remove the lock screen image path, URL, and status keys
Remove-ItemProperty -Path $RegKeyPath -Name "LockScreenImagePath" -Force -ErrorAction SilentlyContinue
Remove-ItemProperty -Path $RegKeyPath -Name "LockScreenImageUrl" -Force -ErrorAction SilentlyContinue
Remove-ItemProperty -Path $RegKeyPath -Name "LockScreenImageStatus" -Force -ErrorAction SilentlyContinue

# (Optional) If you also set the policy to prevent changes (the commented-out section)
# $PolicyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
# Remove-ItemProperty -Path $PolicyPath -Name "NoChangingLockScreen" -Force -ErrorAction SilentlyContinue

Write-Host "Lock screen forced settings removed."