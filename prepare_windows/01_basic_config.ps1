<#
Goals: Create a basic windows machine and update it to the date
e.g. Windows 2022 OS is patched todate
#>

write-host "Lets first install NuGet package...."
Install-PackageProvider -Name NuGet -Force
# !! it keeps asking for confirmation !!.

# install windows update module
write-host "NuGet is installed, now lets install windows update...."
Install-Module -name PSWindowsUpdate -Force
write-host "scan the packages and install updates......"
Get-WindowsUpdate -Install -AcceptAll -AutoReboot -confirm:$false

# create directory structure
$parentdir = "c:\allthings"
New-Item -Path $parentdir -Type Directory

$folders = (
    "from_rootca",
    "to_rootca",
    "prepare_windows",
    "prepare_ad",
    "prepare_subca",
    "prepare_rootca"

)

$folders | ForEach-Object { New-Item -Path $parentdir -Name $_ -Type Directory }
