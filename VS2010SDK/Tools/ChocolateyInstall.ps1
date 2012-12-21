# methodology taken from: http://blogs.msdn.com/b/astebner/archive/2008/06/20/8627241.aspx?Redirected=true
$setupExtractDir = Join-Path $($env:temp) 'vssdk2010_setup'

Install-ChocolateyPackage `
	'VS2010SDK' 'exe' " /x:$($setupExtractDir) /q" `
	'http://download.microsoft.com/download/8/E/D/8ED90A2C-8172-4FCA-B17B-C29C3F0A9732/VsSDK_sfx.exe'
Install-ChocolateyInstallPackage 'VS2010SDK-msi' 'msi' '/quiet' "$($setupExtractDir)\vssdk.msi"
