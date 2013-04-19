function Install-ChocolateyTrueTypeFonts{
<#
.SYNOPSIS
Downloads and unzips a font package

.DESCRIPTION
This will download a file from a url and install all the True Type Fonts in it.

.PARAMETER PackageName
The name of the package we want to download - this is arbitrary, call it whatever you want.
It's recommended you call it the same as your nuget package id.

.PARAMETER Url
This is the url to download the file from. 

.OUTPUTS
None

.NOTES
This helper reduces the number of lines one would have to write to download and unzip a file to 1 line.
This method has error handling built into it.

.LINK
  Get-ChocolateyWebFile
  Get-ChocolateyUnzip
#>
  param(
    [string]$packageName,
    [string]$url
  )
  try {
    $chocTempDir = Join-Path $env:TEMP 'chocolatey'
    $tempDir = Join-Path $chocTempDir $packageName
    $tempDir = Join-Path $tempDir 'fonts-unzipped'
    if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
    Install-ChocolateyZipPackage $packageName $url $tempDir -SupressSuccessMessage
 
    $shell = New-Object -ComObject Shell.Application
    $fontsFolder = $shell.Namespace(0x14)
    Get-ChildItem $tempDir -Recurse -Filter *.ttf | % { $fontsFolder.CopyHere($_.FullName) }
    
    Remove-Item -Recurse  $tempDir
    Write-ChocolateySuccess $packageName
  } catch {
    Write-ChocolateyFailure $packageNameName $($_.Exception.Message)
    throw 
  }
}