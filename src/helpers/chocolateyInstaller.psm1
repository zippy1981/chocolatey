$helpersPath = (Split-Path -parent $MyInvocation.MyCommand.Definition);

$DebugPreference = "SilentlyContinue"
if ($env:ChocolateyEnvironmentDebug -eq 'true') {$DebugPreference = "Continue";}


# grab functions from files
Resolve-Path $helpersPath\functions\*.ps1 | 
    ? { -not ($_.ProviderPath.Contains(".Tests.")) } |
    % { . $_.ProviderPath }

Export-ModuleMember -Function `
    Get-ChocolateyUnzip, 
    Get-ChocolateyWebFile, 
    Install-ChocolateyDesktopLink, 
    Install-ChocolateyEnvironmentVariable, 
    Install-ChocolateyExplorerMenuItem, 
    Install-ChocolateyFileAssociation, 
    Install-ChocolateyInstallPackage, 
    Install-ChocolateyPackage, 
    Install-ChocolateyPath, 
    Install-ChocolateyPinnedTaskBarItem, 
    Install-ChocolateyPowershellCommand,
    Install-ChocolateyTrueTypeFonts,
    Install-ChocolateyVsixPackag,
    Install-ChocolateyZipPackage, 
    Start-ChocolateyProcessAsAdmin, 
    Uninstall-ChocolateyPackage, 
    Update-SessionEnvironment, 
    Write-ChocolateyFailure, 
    Write-ChocolateySuccess, 
    Write-Debug, 
    Write-Error, 
    Write-Host
