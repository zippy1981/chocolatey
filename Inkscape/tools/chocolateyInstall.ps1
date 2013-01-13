try {
  if (Test-Path HKLM:SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Inkscape) {
    $installedVersion = [Version] (Get-ItemProperty HKLM:SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Inkscape DisplayVersion).DisplayVersion
  }
  if ($installedVersion -eq [Version] '0.48.4.0') {
    Write-ChocolateySuccess 'inkscape' 'Inkscape is already installed. Updating the chococolatey database.'
  }
  elseif ($installedVersion -gt [Version] '0.48.4.0') {
    Write-ChocolateyFailure 'inkscape' "A newer version of inkscape [$($installedVersion)] is already installed. Updating the chococolatey database."
  }
  else {
    Install-ChocolateyPackage 'inkscape' 'exe' '/S' 'https://downloads.sourceforge.net/project/inkscape/inkscape/0.48.4/inkscape-0.48.4-1-win32.exe?use_mirror=switch'
  }
} catch {
  Write-ChocolateyFailure 'inkscape' "$($_.Exception.Message)"
  throw 
}
