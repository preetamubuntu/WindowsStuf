# install windows update module
Install-Module -name PSWindowsUpdate -confirm:$false
Get-WindowsUpdate -Install -AcceptAll -AutoReboot -confirm:$false

