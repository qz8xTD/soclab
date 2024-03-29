$computerName = 'dc1'
$timezone = 'Mountain Standard Time'
$ipAddress = '192.168.1.11'
$dnsServer = '192.168.1.1'
$interfaceAlias = "ethernet"
$gateway = '192.168.1.1'
$subnetMask = '24'
$RunOnceKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"

$AutoLogonRegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$AutoLogonUsername = "Administrator"
$AutoLogonPassword = "Password1"
Set-ItemProperty $AutoLogonRegPath "AutoAdminLogon" -Value "1" -type String
Set-ItemProperty $AutoLogonRegPath "DefaultUsername" -Value "$AutoLogonUsername" -type String
Set-ItemProperty $AutoLogonRegPath "DefaultPassword" -Value "$AutoLogonPassword" -type String

Rename-Computer -NewName $computerName -Force -Confirm:$false
Set-TimeZone -Name $timezone
New-NetIPAddress -InterfaceAlias $interfaceAlias -IPAddress $ipAddress -PrefixLength $subnetMask -DefaultGateway $gateway -AddressFamily IPv4
Set-DnsClientServerAddress -InterfaceAlias $interfaceAlias -ServerAddresses $dnsServer
Enable-PSRemoting -Force
Enable-NetFirewallRule -DisplayGroup 'File and Printer Sharing'
Set-ItemProperty $RunOnceKey "NextRun" "C:\Windows\System32\WindowsPowerShell\v1.0\Powershell.exe -ExecutionPolicy Bypass -File C:\dc1_setup\dc1_postreboot.ps1"
Set-ItemProperty $AutoLogonRegPath "AutoAdminLogon" -Value "1" -type String
Set-ItemProperty $AutoLogonRegPath "DefaultUsername" -Value "$AutoLogonUsername" -type String
Set-ItemProperty $AutoLogonRegPath "DefaultPassword" -Value "$AutoLogonPassword" -type String
Restart-Computer -Force