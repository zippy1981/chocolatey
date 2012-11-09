# The installer doesn't properly kill ditto
Get-Process | Where { $_.name -eq 'ditto' } | Stop-Process
Install-ChocolateyPackage 'ditto' 'exe' '/sp- /silent /norestart' `
	'https://sourceforge.net/projects/ditto-cp/files/Ditto/3.18.46.0/DittoSetup_3_18_46_0.exe/download' `
	'https://sourceforge.net/projects/ditto-cp/files/Ditto/3.18.46.0/DittoSetup_64bit_3_18_46_0.exe/download'
Set-ItemProperty -Path HKCU:\Software\Ditto\CopyStrings -name 'powershell.exe' -value '% {{Delay100}ey'
Set-ItemProperty -Path HKCU:\Software\Ditto\PasteStrings -name 'powershell.exe' -value '% {{Delay100}ep'
# It also doesn't start the process
start (Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Run).Ditto