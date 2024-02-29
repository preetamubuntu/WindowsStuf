<#
Goals : Now before you do anything you must take a snapshot
because after this OS is completely customized as per your needs
#>

$nic = get-netadapter # assuming it one. keeping it simple
$ipdetails = $nic | Get-NetIPConfiguration
# remove allocated ip address
if ($ipdetails.IPv4Address.IPAddress) {
    $nic | Remove-NetIPAddress -AddressFamily IPv4 -Confirm:$false
}
# remove allocated ip gateway
if ($ipdetails.IPv4DefaultGateway) {
    $nic | Remove-NetRoute -AddressFamily IPv4 -Confirm:$false
}

# allocated IP
$nic | New-NetIPAddress -AddressFamily IPv4 -IPAddress $subcaipv4 -PrefixLength $labsm -DefaultGateway $labgw
# set dns
$nic | Set-DnsClientServerAddress -ServerAddresses ($addns, $labdns) # ADDNS is put on priority for AD based resolution

# changing computer name
write-host "Changing the name of the computer"
rename-computer -newname $subca_name
write-host "restarting in 15 seconds"
start-sleep -Seconds 15
Restart-Computer
