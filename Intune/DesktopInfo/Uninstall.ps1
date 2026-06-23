Get-Process DesktopInfo -ErrorAction SilentlyContinue | Stop-Process -Force
Remove-Item `
 "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\DesktopInfo.lnk" `
 -Force -ErrorAction SilentlyContinue
Remove-Item "C:\DesktopInfo" -Recurse -Force -ErrorAction SilentlyContinue