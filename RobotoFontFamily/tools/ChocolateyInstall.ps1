Add-Type -AssemblyName System.Drawing

function Install-ChocolateyTTFs ([string]$package, [string]$url)
{
  $chocTempDir = Join-Path $env:TEMP 'chocolatey'
  $tempDir = Join-Path $chocTempDir $package
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
  $file = Join-Path $tempDir "$($packageName).fonts.zip"
  Get-ChocolateyWebFile $package $file -url $url
  Get-ChocolateyUnzip $file $tempDir -packageName $package

  $shell = New-Object -ComObject Shell.Application
  $fontsFolder = $shell.Namespace(0x14)

  Get-ChildItem $tempDir -Recurse -Filter *.ttf | % { $fontsFolder.CopyHere($_.FullName) }
  Remove-Item -Recurse  $tempDir
  Write-ChocolateySuccess $package
}

try {
  $package = 'RobotoFonts'
  $fontUrl = 'http://developer.android.com/downloads/design/Roboto_Hinted_20120823.zip'
  Install-ChocolateyTTFs $package $fontUrl
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}