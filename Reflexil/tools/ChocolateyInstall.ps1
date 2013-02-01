$package = 'Reflexil'
$destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
$url = Join-Path $destination 'reflexil.1.6.bin.zip'

Install-ChocolateyZipPackage $package -url $url -unzipLocation $destination
