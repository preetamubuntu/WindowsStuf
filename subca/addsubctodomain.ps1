$domainadmin = "zonkos\fred" # change
$adddomaincred = Read-Host -Prompt 'domain admin credentials' -AsSecureString
$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
    -ArgumentList $domainadmin, $adddomaincred
Add-Computer -DomainName $domain_name `
    -Credential $Credential
Restart-Computer
