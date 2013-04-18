Add-Type -AssemblyName System.Drawing

function Install-ChocolateyTTFs ([string]$package, [string]$url)
{
  $destination = Join-Path $Env:Temp $package
  Install-ChocolateyZipPackage $package -url $fontUrl -unzipLocation $destination
  
  $shell = New-Object -ComObject Shell.Application
  $fontsFolder = $shell.Namespace(0x14)

  Get-ChildItem $destination -Recurse -Filter *.ttf | % {
#    if ((Test-FontInstalled $_.FullName))
#    {
#      Write-Warning "$($_.Name) is already installed"
#    }
#    else
#    {
      $fontsFolder.CopyHere($_.FullName)
#    }
  }

  Remove-Item $destination -Recurse
  Write-ChocolateySuccess $package
}

function Test-FontInstalled ([string] $path){
  $fontCollection = New-Object System.Drawing.Text.PrivateFontCollection
  $fontCollection.AddFontFile($path)

  [Enum]::GetNames([System.Drawing.FontStyle]) | % {
    if ($fontCollection.Families[0].IsStyleAvailable($_)) {
      $font = New-Object System.Drawing.Font $fontCollection.Families[0].Name, ([single] 12), ([System.Drawing.FontStyle] $_);
      # If the following two lines of code confuse you, see http://stackoverflow.com/questions/7760013/why-does-continue-behave-like-break-in-a-foreach-object
      Write-Output [](0 -eq ([string]::Compare($font.Name, $fontCollection.Families[0].Name, [System.StringComparison]::InvariantCultureIgnoreCase)))
      Write-Warning "Hi $($path)"
    }
  }    
}

try {
  $package = 'RobotoFonts'
  #$fontUrl = 'http://developer.android.com/downloads/design/Roboto_Hinted_20120823.zip'
  $fontUrl = 'C:\Users\JDearing\Downloads\Roboto_Hinted_20120823.zip'
  Install-ChocolateyTTFs $package $fontUrl
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}