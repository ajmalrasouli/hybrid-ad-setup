
Configuration AADConnectConfig {
    Node localhost {
        Script InstallAADConnect {
            GetScript = { @{ Result = "Installed" } }
            SetScript = {
                Start-Process -FilePath "AADConnect.msi" -ArgumentList "/quiet" -Wait
            }
            TestScript = {
                Test-Path "C:\Program Files\Microsoft Azure AD Connect\AzureADConnect.exe"
            }
        }
    }
}
AADConnectConfig
