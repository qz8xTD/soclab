function Create-SOCLabUsers {

    # set common user attributes
    $user_path = 'CN=Users,DC=adatum,DC=com'

    # user csv
    $users = Import-Csv C:\dc1_setup\users.csv

    foreach($user in $users){

        # set user parameters
        $user_params = @{
                    Name = $user.DisplayName
                    Surname = $user.Surname
                    GivenName = $user.GivenName
                    SamAccountName = $user.SamAccountName
                    DisplayName = $user.DisplayName
                    AccountPassword = (ConvertTo-SecureString -AsPlainText $user.Password -Force)
                    Enabled = $true
                    PasswordNeverExpires = $true
                    Path = $user_path
                }

        # create user account
        New-ADUser @user_params -Verbose
        # add user to protected group
        Add-ADGroupMember -Identity $user.Group -Members $user.SamAccountName -Verbose
    }    

}

function Create-SOCLabGroups {

    # create group to be nested under da
    $group_name = 'Corp Admins'
    try{New-ADGroup -Name $group_name -GroupCategory Security -GroupScope Global}
    catch [System.UnauthorizedAccessException]{Write-Host 'Access denied'}
    catch {Write-Host 'Group already exists'}

    # nest group under da
    Add-ADGroupMember -Identity 'Domain Admins' -Members $group_name -Verbose

}
# Added sleep to allow some time for AD to load, otherwise would fail
Start-Sleep -Seconds 60;Create-SOCLabGroups;Create-SOCLabUsers