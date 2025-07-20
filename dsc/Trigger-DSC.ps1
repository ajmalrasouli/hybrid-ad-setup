
param (
    [string]$Role
)

if ($Role -eq "DC") {
    Write-Host "🟡 Configuring Domain Controller..."
    .\HybridADSetup.ps1 -DomainName "corp.local" -SafeModePassword "P@ssw0rd123!"
    Start-DscConfiguration -Path "C:\DSC\Hybrid" -Wait -Verbose -Force
}
elseif ($Role -eq "AAD") {
    Write-Host "🟡 Configuring Azure AD Connect..."
    .\DomainJoin.ps1
}
else {
    Write-Error "❌ Invalid Role!"
}
