
$domain = "corp.local"
$user = "corp\\Administrator"
$pass = ConvertTo-SecureString "P@ssw0rd123!" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($user, $pass)

Add-Computer -DomainName $domain -Credential $cred -Restart -Force
