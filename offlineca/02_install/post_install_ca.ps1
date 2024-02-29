
$crllist = Get-CACrlDistributionPoint; foreach ($crl in $crllist) { Remove-CACrlDistributionPoint $crl.uri -Force };
Add-CACRLDistributionPoint -Uri C:\Windows\System32\CertSrv\CertEnroll\%3%8.crl -PublishToServer -Force
Add-CACRLDistributionPoint -Uri http://crl.$domain_name/pki/%3%8.crl -AddToCertificateCDP -AddToFreshestCrl -Force
Get-CAAuthorityInformationAccess | Where-Object { $_.Uri -like '*ldap*' -or $_.Uri -like '*http*' -or $_.Uri -like '*file*' } | Remove-CAAuthorityInformationAccess -Force


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
# create a directory and store the file to the folder.
New-Item -ItemType Directory C:\allthings\from_rootca -Verbose
Copy-Item C:\Windows\System32\CertSrv\CertEnroll\*.* C:\Allthings\from_rootca -Verbose
Get-ChildItem C:\Allthings\from_rootca\ -Verbose


# new-smbshare -name ca_files C:\ca_files -FullAccess "offlrootca\certadmin"



