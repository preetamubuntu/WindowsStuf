$username = "administrator"
$compname = "zofflinerootca" # change the name
$ipv4 = "192.168.10.100" # change ip
$sm = "24"
$gw = "192.168.0.253"
$hatchery = "192.168.0.253"

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
$nic | New-NetIPAddress -AddressFamily IPv4 -IPAddress $ipv4 -PrefixLength $sm -DefaultGateway $gw
# set dns
$nic | Set-DnsClientServerAddress -ServerAddresses ($hatchery, $ADDNS)

# enable remote connection
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -Value 0
# allow RDP
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# rename-computer -newname $compname -localcredential $username -restart
