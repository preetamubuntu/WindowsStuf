<#
    Goals:
        - create a CAPoliy.inf file which will change
        key length, validity period and domain_name
#>
$inffile = get-content .\Template_CAPolicy.inf
$inffile1 = $inffile -replace "RenewalKeyLength=4096", "RenewalKeyLength=$keylength"
$inffile2 = $inffile1 -replace "URL=http://crl.becloud.io/pki/cps.txt", `
    "URL=http://crl.$domain_name/pki/cps.txt"
$inffile2 -replace "RenewalValidityPeriodUnits=20", `
    "RenewalValidityPeriodUnits=$rootcavalidityperiod" | `
    set-content CAPolicy.inf -Confirm:$false
