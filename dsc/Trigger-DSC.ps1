
param (
    [string]$Role
)

if ($Role -eq "DC") {
    Start-DscConfiguration -Path ./ADDSConfig -Wait -Verbose -Force
}
elseif ($Role -eq "AAD") {
    Start-DscConfiguration -Path ./AADConnectConfig -Wait -Verbose -Force
}
