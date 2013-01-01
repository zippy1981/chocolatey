$package = 'MongoeVUE'

try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
  $msiid = '{677358AD-5B0B-4395-A235-EC2A23EA4432}'
  Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msIid /qb" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw 
}
