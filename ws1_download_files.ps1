mkdir 'C:\ws1_setup' -ErrorAction SilentlyContinue

$guest_additions_uri = "https://raw.githubusercontent.com/qz8xTD/soclab/master/ws1_guest_additions.ps1"
$guest_additions_zip_uri = "https://github.com/qz8xTD/soclab/raw/master/ws1_guest_additions.zip"


Invoke-WebRequest -Uri $guest_additions_uri -OutFile 'C:\ws1_setup\guest_additions.ps1'
Invoke-WebRequest -Uri $guest_additions_zip_uri  -OutFile 'C:\ws1_setup\guest_additions.zip'


Unblock-File "C:\ws1_setup\*"

Set-Location -Path 'C:\ws1_setup'
.\guest_additions.ps1

Set-Location -Path 'C:\ws1_setup'
.\ws1_preboot.ps1