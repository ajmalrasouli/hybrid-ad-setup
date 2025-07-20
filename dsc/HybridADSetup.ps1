
param (
    [string]$DomainName,
    [string]$SafeModePassword
)

Configuration Hybrid {
    Import-DscResource -ModuleName PSDesiredStateConfiguration, xActiveDirectory

    Node localhost {
        WindowsFeature ADDSInstall {
            Ensure = "Present"
            Name   = "AD-Domain-Services"
        }

        xADDomain FirstDS {
            DomainName           = $DomainName
            DomainAdministratorCredential = (Get-Credential)
            SafemodeAdministratorPassword = (ConvertTo-SecureString $SafeModePassword -AsPlainText -Force)
            DependsOn = "[WindowsFeature]ADDSInstall"
        }
    }
}

Hybrid
