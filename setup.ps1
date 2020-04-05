Set-ExecutionPolicy Bypass -Scope Process -Force;

$env:chocolateyUseWindowsCompression = 'true'

(New-Object System.Net.WebClient).DownloadFile("https://www.7-zip.org/a/7z1805-x64.msi", "$env:userprofile\downloads\7z1805-x64.msi")

Start-Process msiexec.exe -Wait -ArgumentList "/I  $env:userprofile\7z1805-x64.msi /quiet"

iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#packages to install or upgrade
choco upgrade --force choco install docker-compose vscode notepadplusplus composer docker-for-windows postman php7 curl -y
