$domain = "zonkos.ict"

$crllist = Get-CACrlDistributionPoint; foreach ($crl in $crllist) { Remove-CACrlDistributionPoint $crl.uri -Force };
Add-CACRLDistributionPoint -Uri C:\Windows\System32\CertSrv\CertEnroll\%3%8.crl -PublishToServer -Force
Add-CACRLDistributionPoint -Uri http://crl.$domain/pki/%3%8.crl -AddToCertificateCDP -AddToFreshestCrl -Force
Get-CAAuthorityInformationAccess | Where-Object { $_.Uri -like '*ldap*' -or $_.Uri -like '*http*' -or $_.Uri -like '*file*' } | Remove-CAAuthorityInformationAccess -Force
# Add-CAAuthorityInformationAccess -AddToCertificateAia http://pki.bedrock.domain/pki/BEDROCK-ROOT%3%4.crt -Force


certutil.exe -setreg CA\CRLPeriodUnits 10 # need to understand these values
certutil.exe -setreg CA\CRLPeriod "Years"
certutil.exe -setreg CA\CRLOverlapPeriodUnits 3
certutil.exe -setreg CA\CRLOverlapPeriod "Weeks"
certutil.exe -setreg CA\ValidityPeriodUnits 10  # need to understand these values
certutil.exe -setreg CA\ValidityPeriod "Years"
certutil.exe -setreg CA\AuditFilter 127
Restart-Service certsvc -Verbose

# Verify that two and only two CRL distribution points are configured.
Get-CACRLDistributionPoint | format-list

New-Item -ItemType Directory C:\Allthings\to_subca
Copy-Item C:\Windows\System32\CertSrv\CertEnroll\*.* C:\Allthings\to_subca
Get-ChildItem C:\Allthings\to_subca\


# new-smbshare -name ca_files C:\ca_files -FullAccess "offlrootca\certadmin"



