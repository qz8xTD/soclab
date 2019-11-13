$computerName = 'ws1'
$domainName = 'adatum.com'
$timezone = 'Mountain Standard Time'
$ipAddress = '192.168.1.51'
$dnsServer = '192.168.1.11'
$interfaceAlias = "ethernet"
$gateway = '192.168.1.1'
$subnetMask = '24'

#Rename-Computer -NewName $computerName -Force -Confirm:$false
Set-TimeZone -Name $timezone
New-NetIPAddress -InterfaceAlias $interfaceAlias -IPAddress $ipAddress -PrefixLength $subnetMask -DefaultGateway $gateway -AddressFamily IPv4
Set-DnsClientServerAddress -InterfaceAlias $interfaceAlias -ServerAddresses $dnsServer
Enable-PSRemoting -Force
Enable-NetFirewallRule -DisplayGroup 'File and Printer Sharing'
Add-Computer -NewName $computerName -DomainName $domainName -Credential (Get-Credential)