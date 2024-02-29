# hostnames
Set-Variable -Name rootca_name -Value "zonkosrootca" -Scope Global
Set-Variable -Name subca_name -Value "subca01" -Scope Global
Set-Variable -Name dc01_name -Value "zonkosdc01" -Scope Global

Set-Variable -Name parentdir -Value "c:\allthings"

# domain name
Set-Variable -Name domain_name -Value "zonkos.ict" -Scope Global
Set-Variable -Name dnszone_name -Value "zonkos.ict" -Scope Global

# common ca parameters
Set-Variable -Name keylength -Value "4096" -Scope Global
Set-Variable -Name cryptoprovider -Value "RSA#Microsoft Software Key Storage Provider" -Scope Global
Set-Variable -Name HASHALO -Value "SHA512" -Scope Global

# root ca specific variables
Set-Variable -Name rootcacn -Value "Zonkos Root Authority" -Scope Global
Set-Variable -Name rootcavalidityperiod -Value "10" -Scope Global
Set-Variable -Name rootcaipv4 -Value "192.168.10.125" -Scope Global

# subca
Set-Variable -Name subcaipv4 -Value "192.168.10.105" -Scope Global
Set-Variable -Name subcacn -Value "zonkossca" -Scope Global
Set-Variable -Name subcavalidityperiod -Value "5" -Scope Global


# ad specific variables

Set-Variable -Name dc01ipv4 -Value "192.168.10.100" -Scope Global
Set-Variable -Name forestname -Value "zonkos.ict" -Scope Global
Set-Variable -Name forestmode -Value "WinThreshold" -Scope Global
Set-Variable -Name domainmode -Value "WinThreshold" -Scope Global
Set-Variable -Name netbiosname -Value "zonkos" -Scope Global

# prepare windows


# common network details
Set-Variable -Name labsm -Value "16" -Scope Global
Set-Variable -Name labgw -Value "192.168.0.253" -Scope Global
Set-Variable -Name labdns -Value "192.168.0.253" -Scope Global
Set-Variable -Name addns -Value $dc01ipv4 -Scope Global
