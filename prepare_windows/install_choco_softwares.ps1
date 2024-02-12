Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# set execution policy to remote
Set-ExecutionPolicy RemoteSigned -Confirm:$false
# enable remote connection
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -Value 0
# allow RDP
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
choco install dotnetfx -y
choco install vscode -y
choco install putty -y
choco install winscp -y
choco install googlechrome -y
choco install firefox -y
choco install mobaxterm -y
choco install git -y
choco install postman -y
