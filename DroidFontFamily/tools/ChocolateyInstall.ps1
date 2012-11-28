try {
  $package = 'DroidFonts'

  $fontUrl = 'http://download.damieng.com/fonts/redistributed/DroidFamily.zip'
  $destination = Join-Path $Env:Temp 'DroidFonts'

  Install-ChocolateyZipPackage $package -url $fontUrl -unzipLocation $destination

  $shell = New-Object -ComObject Shell.Application
  $fontsFolder = $shell.Namespace(0x14)

  Get-ChildItem $destination -Recurse -Filter *.ttf |
    % { $fontsFolder.CopyHere($_.FullName) }

  Remove-Item $destination -Recurse

  Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}
