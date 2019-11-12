$uri = "https://github.com/qz8xTD/soclab/raw/master/guest_additions.zip"

Invoke-WebRequest -Uri $uri  -OutFile ~\Documents\guest_additions.zip
Expand-Archive -Path ~\Documents\guest_additions.zip -DestinationPath ~\Documents\ -Force

Set-Location ~\Documents\guest_additions\cert
.\VBoxCertUtil.exe add-trusted-publisher vbox*.cer --root vbox*.cer

Set-Location ~\Documents\guest_additions
.\VBoxWindowsAdditions-amd64.exe /S

Start-Sleep -Seconds 180