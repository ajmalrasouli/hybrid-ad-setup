
Configuration ADDSConfig {
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName xActiveDirectory

    Node localhost {
        WindowsFeature ADDSInstall {
            Ensure = "Present"
            Name = "AD-Domain-Services"
        }

        xADDomain FirstDomain {
            DomainName = "corp.local"
            DomainAdministratorCredential = Get-Credential -UserName "Administrator" -Message "Enter domain admin credentials"
            SafemodeAdministratorPassword = Get-Credential -Message "Enter DSRM password"
            DependsOn = "[WindowsFeature]ADDSInstall"
        }
    }
}
ADDSConfig
