$compname = "zofflinerootca" # change
$ipv4 = "192.168.10.125" # offlinerootca
$sm = "16"
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
$nic | Set-DnsClientServerAddress -ServerAddresses ($ADDNS, $hatchery)

rename-computer -newname $compname
start-sleep -Seconds 30
Restart-Computer

