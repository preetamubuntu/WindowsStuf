$keylength = 4096
$domain = "zonkos.ict"
$renewalperiod = 10
# $OID = "1.2.3.4.1455.67.89.5"

$inffile = get-content .\Template_CAPolicy.inf

$inffile1 = $inffile -replace "RenewalKeyLength=4096", "RenewalKeyLength=$keylength"
#, "becloud.io", $domain, "20", $renewalperiod
$inffile2 = $inffile1 -replace "URL=http://crl.becloud.io/pki/cps.txt", "URL=http://crl.$domain/pki/cps.txt"
$inffile2 -replace "RenewalValidityPeriodUnits=20", "RenewalValidityPeriodUnits=$renewalperiod" | set-content CAPolicy.inf -Confirm:$false
