$rootPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage 'slpolicy' `
	'http://www.winsiderss.com/tools/slpolicy.zip' `
	$rootPath;
if ([intptr]::Size -eq 8) {
	$ignorePath  = "$($rootPath)\slpolicy\i386";
}
else {
	$ignorePath  = "$($rootPath)\slpolicy\x64";
}
# We only want a link to the version of slPolicy for our architecture
New-Item -Type File "$($ignorePath)\slpolicy.exe.ignore"