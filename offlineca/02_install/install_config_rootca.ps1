$filename = "CAPolicy.inf"
$cacommonname = "Zonko Root CA"
$keylength = "4096" #should match with CA file
$validityperiod = "10" # should match with CAPolicy file, keeping it 10 years for lab
$cryptoprovider = "RSA#Microsoft Software Key Storage Provider" # in case you wish to change this
$HASHALO = 256


Copy-Item $filename $env:windir

# install CA Authority
if (test-path $env:windir\$filename) {
    write-host "file is present, installing....CA"
    Add-WindowsFeature Adcs-Cert-Authority -IncludeManagementTools
    Install-AdcsCertificationAuthority -CAType StandaloneRootCA `
        -CACommonName $cacommonname `
        -KeyLength $keylength -HashAlgorithm $HASHALO `
        -ValidityPeriod Years -ValidityPeriodUnits $validityperiod `
        -CryptoProviderName  $cryptoprovider
}

<#
CACommonName:  This is what will show on all certificates and can be seen publicly.  Change it to something that better fits your environment.
KeyLength:  Verify that your hardware is capable of 4096, such as smart cards, smart card readers, phones, and other devices.  If not, use 2048.
HashAlgorithm:  If you can use SHA256, do that.  If not, you can use SHA1, which is less secure.
CryptoProviderName: The CSP or KSP used. Keep this as it is unless you have a specific reason to use anything else. You will know if you need to.
ValidityPeriod: The length of time (days, weeks, months, years), in this case, the RootCA’s certificate will be valid.
ValidityPeriodUnits: The actual length of time the RootCA’s certificate will be valid, until you must manually renew it.
Generally, you can set this high, such as 20 years.
The RootCA will be turned off and secured, so there isn’t really a reason to set it lower, unless you want to reevaluate the certificate properties sooner and feel you may want to make changes.
Plan for that now… perhaps SHA256 will be compromised in 10 years, and you’ll want to switch to SHA512.
Perhaps not, but you get my point.
#>
