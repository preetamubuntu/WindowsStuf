<#
    Goal: Create a users based on csv file
    very limited variables are changed e.g. only firstname, lastname and department
    you can change almost everything by updating csv file
#>

$domain_name = "zonkos.ict"
$users = (Get-ADOrganizationalUnit -Filter 'Name -eq "Users"').DistinguishedName
# $groups = (Get-ADOrganizationalUnit -Filter 'Name -eq "Groups"').DistinguishedName
$userinfo = Import-Csv .\list_of_users.csv

foreach ($user in $userinfo) {
    write-host $user.Firstname
    $firstname = $user.Firstname
    $lastname = $user.LastName
    $dept = $user.Department
    $samname = $firstname.ToLower()
    $empno = Get-Random -Maximum 1000 -Minimum 100
    # generate a random number for fun and print it.
    write-host "Auto generated empolyee number for $firstname $lastname is $empno"

    New-ADUser `
        -Name "$firstname $lastname" `
        -GivenName $firstname `
        -Surname $lastname `
        -SamAccountName $samname `
        -AccountPassword (ConvertTo-SecureString "VMware1!2303" -AsPlainText -Force) `
        -Path $users `
        -ChangePAsswordAtLogon 0 `
        -Company "Zonkos" `
        -Title "Super Cloud Admin" `
        -State "London" `
        -City "Hogsmeade Village" `
        -Description "IT Super Admins" `
        -EmployeeNumber $empno `
        -Department $dept `
        -DisplayName "$firstname $lastname" `
        -Country "GB" `
        -PostalCode "940001" `
        -Enabled $True `
        -UserPrincipalName "$samname@$domain_name"
    write-host "Adding $firstname to Domain Admin Groups"
    Add-ADGroupMember -Identity "domain admins" -Members $firstname

    if ($firstname -eq "Fred") {
        Add-ADGroupMember -Identity "Enterprise Admins" -Members $firstname
        write-host "Added $firstname to Enterprise Admins group"
    }
}
