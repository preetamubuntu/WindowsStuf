<#
Goals: Create a basic windows machine and update it to the date
e.g. Windows 2022 OS is patched todate
#>

write-host "Lets first install NuGet package...."
Install-PackageProvider -Name NuGet -Force nuget
# !! it keeps asking for confirmation !!.

# install windows update module
write-host "NuGet is installed, now lets install windows update...."
Install-Module -name PSWindowsUpdate -confirm:$false
write-host "scan the packages and install updates......"
Get-WindowsUpdate -Install -AcceptAll -AutoReboot -confirm:$false
