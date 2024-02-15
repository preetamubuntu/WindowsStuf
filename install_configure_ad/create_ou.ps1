<#
Goal: Create a empty OU
#>


$StandardOU = "weasleys"
New-ADOrganizationalUnit -Name $StandardOU
$StandardDN = (Get-ADOrganizationalUnit -Filter 'Name -eq $StandardOU').DistinguishedName
# Standard OU erstellen
New-ADOrganizationalUnit -Name "Users" -Path $StandardDN
New-ADOrganizationalUnit -Name "Groups" -Path $StandardDN
