# install windows update module
Install-Module -name PSWindowsUpdate -confirm:$false
Get-WindowsUpdate -Install -AcceptAll -AutoReboot -confirm:$false
# prepare choco deployment
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# set execution policy to remote
Set-ExecutionPolicy RemoteSigned -Confirm:$false
# enable remote connection
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -Value 0
# allow RDP
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
