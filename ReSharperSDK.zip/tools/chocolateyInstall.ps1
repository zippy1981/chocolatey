Install-ChocolateyZipPackage 'ReSharper.SDK.zip' `
	'http://download.jetbrains.com/resharper/ReSharperSDK-7.1.96.zip' `
	"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"