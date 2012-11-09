#if(-not (test-path "hklm:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319\SKUs\.NETFramework,Version=v4.5")) {
Install-ChocolateyPackage `
	'VS2012SDK' 'exe' "/Passive /NoRestart /Log $($env:temp)\VS2012SQK.log" `
	'http://www.microsoft.com/en-us/download/confirmation.aspx?id=30668'
#}
#else {
#     Write-Host "Microsoft Access 2010 Redistributable is already installed on your machine."
# } 
