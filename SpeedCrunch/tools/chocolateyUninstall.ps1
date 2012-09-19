Switch ([Runtime.InterOpServices.Marshal]::SizeOf([IntPtr])) {
	4 { cmd /c (Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\SpeedCrunch_is1 -Name QuietUninstallString).QuietUninstallstring }
	8 { cmd /c (Get-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\SpeedCrunch_is1 -Name QuietUninstallString).QuietUninstallstring }
}
