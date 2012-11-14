#if(-not (test-path "hklm:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319\SKUs\.NETFramework,Version=v4.5")) {
Install-ChocolateyPackage `
	'VS2012SDK' 'exe' "/Passive /NoRestart /Log $($env:temp)\VS2012SQK.log" `
	'http://download.microsoft.com/download/8/3/8/8387A8E1-E422-4DD5-B586-F1F2EC778817/vssdk_full.exe'
#}
#else {
#     Write-Host "Microsoft Access 2010 Redistributable is already installed on your machine."
# } 
