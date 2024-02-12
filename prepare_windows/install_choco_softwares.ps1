write-host "install choco"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# set execution policy to remote
write-host "set the execution policy back to remote signed"
Set-ExecutionPolicy RemoteSigned -Confirm:$false
# enable remote connection
write-host "enable RDP"
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -Value 0
# allow RDP
write-host "open firewall for RDP"
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
# add deutsch Keyboard
write-host "Add German keyboard"
$keyboardlang = "0409:00000407"
$lang = Get-WinUserLanguageList
$lang[0].InputMethodTips.Add($keyboardlang) # set deutsch keyboard
Set-WinUserLanguageList -LanguageList $lang
Set-WinDefaultInputMethodOverride -InputTip $keyboardlang

write-host "Install list of basic softwares"

choco install dotnetfx -y
choco install vscode -y
choco install putty -y
choco install winscp -y
choco install googlechrome -y
choco install firefox -y
choco install mobaxterm -y
choco install git -y
choco install postman -y
