
$safeadminpwd = Read-Host -Prompt   'Enter SafeMode Admin Password' -AsSecureString


# install powershell module
Install-WindowsFeature -Name AD-Domain-Services
Install-WindowsFeature RSAT-Role-Tools, RSAT-DNS-Server, GPMC

Install-ADDSForest -DomainName $forestname `
    -SafeModeAdministratorPassword $safeadminpwd `
    -CreateDnsDelegation:$false `
    -DatabasePath "k:\NTDS" `
    -DomainMode $domainmode `
    -DomainNetbiosName $netbiosname `
    -ForestMode $forestmode `
    -InstallDns:$true `
    -LogPath "l:\Logs" `
    -NoRebootOnCompletion:$true `
    -SysvolPath "k:\SYSVOL" `
    -Force


####
# $createforest = @{
#     DomainNetbiosName             = $netbiosname
#     InstallDNS                    = $true
#     CreateDNSDelegation           = $false
#     SysvolPath                    = "k:\SYSVOL"
#     DatabasePath                  = "k:\NTDS"
#     LogPath                       = "l:\Logs"
#     DomainName                    = $forestname
#     DomainMode                    = $domainmode
#     ForestMode                    = $forestmode
#     NoRebootOnCompletion          = $false
#     force                         = $true
#     SafeModeAdministratorPassword = $safeadminpwd
# }
# Install-ADDSForest $createforest
