Install-ChocolateyZipPackage 'ReSharper.SDK.tool' `
	'http://download.jetbrains.com/resharper/ReSharperSDK-7.1.96.zip' `
	"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"