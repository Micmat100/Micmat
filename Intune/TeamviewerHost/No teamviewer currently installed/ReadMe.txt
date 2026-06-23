Install command
%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe -executionpolicy bypass -command .\Teamviewer.ps1

Uninstall command
msiexec /x "{4EF9D50A-4674-4136-BFC6-CDEB7E11CE2A}" /qn

Detection Rule
Rules format
Manually configure detection rules
Detection rules
Registry Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{856F256B-BB38-492A-A879-0BB4BDA853E6}


Place the Teamviewer.ps1 and your own hostMSI file togheter and make a .intunewin file
You can download your own created MSi file on the Teamviewer Portal

Things to change in the Teamviewer.ps1:
Ajust MSI file name to your own
Insert your own ConfigID
Insert your own AssignID

Some more info on things you have to configure on the teamviewer portal can be found in the word file "Teamviewer x Intune Word Without sensitive info.docx"
It is in Dutch tho, happy translating!