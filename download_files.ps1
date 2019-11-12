$guest_additions_uri = "https://github.com/qz8xTD/soclab/raw/master/guest_additions.zip"
$preboot_uri = "https://github.com/qz8xTD/soclab/blob/master/dc1_preboot.ps1"
$postreboot_uri = "https://raw.githubusercontent.com/qz8xTD/soclab/master/dc1_postreboot.ps1"


Invoke-WebRequest -Uri $guest_additions_uri  -OutFile 'C:\dc1_setup\guest_additions.zip' -Force
Invoke-WebRequest -Uri $preboot_uri -OutFile 'C:\dc1_setup\dc1_preboot.ps1' -Force
Invoke-WebRequest -Uri $postreboot_uri -OutFile 'C:\dc1_setup\dc1_postreboot.ps1' -Force

Unblock-File 'C:\dc1_setup\dc1_preboot.ps1' -Force
Unblock-File 'C:\dc1_setup\dc1_postreboot.ps1' -Force