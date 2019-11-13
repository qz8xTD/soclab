$RunOnceKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
Set-ItemProperty $RunOnceKey "NextRun" "C:\Windows\System32\WindowsPowerShell\v1.0\Powershell.exe -ExecutionPolicy Bypass -File C:\dc1_setup\user_creation.ps1"

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