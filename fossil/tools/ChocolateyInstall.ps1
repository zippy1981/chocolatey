try {
  $package = 'fossil'
  $url = 'http://www.fossil-scm.org/download/fossil-w32-20121022124804.zip'
  $destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

  Install-ChocolateyZipPackage $package -url $url -unzipLocation $destination
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}