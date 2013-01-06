try {
  $package = 'hobocopy'
  $destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

  if ([Environment]::OSVersion.Version.Major -le 5) {
    $url = 'https://github.com/downloads/candera/hobocopy/HoboCopy-1.0.0.0-XP-32bit-Release.zip'
    Install-ChocolateyZipPackage $package -url $url -unzipLocation $destination
  }
  else {
    $url = 'https://github.com/downloads/candera/hobocopy/HoboCopy-1.0.0.0-W2K3-Vista-32bit-Release.zip'
    $url64bit = 'https://github.com/downloads/candera/hobocopy/hobocopy-1.0.0.0-W2K3-Vista-x64-Release.zip'
    Install-ChocolateyZipPackage $package -url $url -url64bit $url64bit -unzipLocation $destination
  }
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}