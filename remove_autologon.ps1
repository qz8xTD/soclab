$AutoLogonRegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$AutoLogonUsername = ""
$AutoLogonPassword = ""

Set-ItemProperty $AutoLogonRegPath "AutoAdminLogon" -Value "0" -type String
Set-ItemProperty $AutoLogonRegPath "DefaultUsername" -Value "$AutoLogonUsername" -type String
Set-ItemProperty $AutoLogonRegPath "DefaultPassword" -Value "$AutoLogonPassword" -type String