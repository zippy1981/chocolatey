Install-ChocolateyPackage `
	'VS2012SDK' 'exe' "/Passive /NoRestart /Log $($env:temp)\VS2012SDK.log" `
	'http://download.microsoft.com/download/8/3/8/8387A8E1-E422-4DD5-B586-F1F2EC778817/vssdk_full.exe'