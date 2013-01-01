try {
  $package = 'MongoVUE'

  if (Test-Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{677358AD-5B0B-4395-A235-EC2A23EA4432}") {
    Write-Host "MongoVUE is already installed! Adding to chocolatey database"
  }
  else {

    $url = 'http://www.mongovue.com/Installer-1.5.3.zip'
    $destination = Join-Path $Env:Temp 'MongoVue'
    $msiPath = Join-Path $destination 'Installer.msi'

    Install-ChocolateyZipPackage $package -url $url -unzipLocation $destination
    Install-ChocolateyPackage $package 'msi' '/quiet' $msiPath

    Remove-Item $destination -Recurse
  }
  Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}