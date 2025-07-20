
$aadInstaller = "https://go.microsoft.com/fwlink/?LinkId=615771"
$path = "C:\Temp\AADConnect.msi"
Invoke-WebRequest -Uri $aadInstaller -OutFile $path
Start-Process msiexec.exe -ArgumentList "/i `"$path`" /quiet /norestart" -Wait
