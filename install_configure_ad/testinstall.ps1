# Purpose: To install one domain controller in single forest
Install-WindowsFeature RSAT-Role-Tools, RSAT-DNS-Server, GPMC
$forestname = "zonkos.ict" # your forest name
$forestmode = "WinThreshold" # Windows Server 2016
$domainmode = "WinThreshold" # Windows Server 2016
$NetbiosName = "zonkos"
$safeadminpwd = Read-Host -Prompt   'Enter SafeMode Admin Password' -AsSecureString

$createforest = @{
    DomainNetbiosName             = $NetbiosName
    InstallDNS                    = $true
    CreateDNSDelegation           = $false
    #   SysvolPath           = "d:\SYSVOL" not applicable for lab
    #   DatabasePath         = "d:\NTDS" not applicable for lab
    #   LogPath              = "e:\Logs" not applicable for lab
    DomainName                    = $forestname
    DomainMode                    = $domainmode
    ForestMode                    = $forestmode
    NoRebootOnCompletion          = $false
    force                         = $true
    SafeModeAdministratorPassword = $safeadminpwd
}
Install-ADDSForest @createforest
Start-Sleep -seconds 30
Get-AdDomain
Restart-Computer
