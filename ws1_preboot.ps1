$computerName = 'ws1'
$domainName = 'adatum.com'
$timezone = 'Mountain Standard Time'
$ipAddress = '192.168.1.51'
$dnsServer = '192.168.1.11'
$interfaceAlias = "ethernet"
$gateway = '192.168.1.1'
$subnetMask = '24'

Set-TimeZone -Name $timezone
New-NetIPAddress -InterfaceAlias $interfaceAlias -IPAddress $ipAddress -PrefixLength $subnetMask -DefaultGateway $gateway -AddressFamily IPv4
Set-DnsClientServerAddress -InterfaceAlias $interfaceAlias -ServerAddresses $dnsServer
# Causing error because it is not part of a domain yet. Cannot ignore error.
#Enable-PSRemoting -Force
Enable-NetFirewallRule -DisplayGroup 'File and Printer Sharing'
Add-Computer -NewName $computerName -DomainName $domainName -Credential (Get-Credential) -Restart