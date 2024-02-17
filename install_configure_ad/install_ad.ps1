
$safeadminpwd = Read-Host -Prompt   'Enter SafeMode Admin Password' -AsSecureString


# install powershell module
Install-WindowsFeature -Name AD-Domain-Services
Install-WindowsFeature RSAT-Role-Tools, RSAT-DNS-Server, GPMC

$createforest = @{
    DomainNetbiosName             = $netbiosname
    InstallDNS                    = $true
    CreateDNSDelegation           = $false
    SysvolPath                    = "k:\SYSVOL"
    DatabasePath                  = "k:\NTDS"
    LogPath                       = "l:\Logs"
    DomainName                    = $forestname
    DomainMode                    = $domainmode
    ForestMode                    = $forestmode
    NoRebootOnCompletion          = $false
    force                         = $true
    SafeModeAdministratorPassword = $safeadminpwd
}
Install-ADDSForest $createforest
write-host "Installation is finished, now sleeping 30 seconds z!!!z!!!z!!!z!!!z"
Get-AdDomain
Start-Sleep -seconds 30
Restart-Computer
