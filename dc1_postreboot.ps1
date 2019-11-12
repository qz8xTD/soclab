$AutoLogonRegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$AutoLogonUsername = ""
$AutoLogonPassword = ""

Set-ItemProperty $AutoLogonRegPath "AutoAdminLogon" -Value "0" -type String
Set-ItemProperty $AutoLogonRegPath "DefaultUsername" -Value "$AutoLogonUsername" -type String
Set-ItemProperty $AutoLogonRegPath "DefaultPassword" -Value "$AutoLogonPassword" -type String

Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
$Params = @{
    CreateDnsDelegation = $false
    DatabasePath = 'C:\Windows\NTDS'
    DomainMode = 'WinThreshold'
    DomainName = 'adatum.com'
    DomainNetbiosName = 'AD'
    ForestMode = 'WinThreshold'
    InstallDns = $true
    LogPath = 'C:\Windows\NTDS'
    NoRebootOnCompletion = $false
    SafeModeAdministratorPassword = "Password1" | ConvertTo-SecureString -AsPlainText -Force
    SysvolPath = 'C:\Windows\SYSVOL'
    Force = $true
}
Install-ADDSForest @Params