Install command
%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "PhishedLockscreen V6.ps1"

Uninstall command
%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "PhishedLockscreen remove.ps1"

Detection Rule
Rules format
Manually configure detection rules
Detection rules
Registry HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP
Value Name
LockScreenImagePath
Value exists