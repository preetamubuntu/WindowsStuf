$domainame = "zonkos.ict"
$adddomaincred = Read-Host -Prompt 'domain admin credentials' -AsSecureString
Add-Computer -DomainName $domainame -Credential $adddomaincred -Restart -Force
