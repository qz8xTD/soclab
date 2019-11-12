Expand-Archive -Path 'C:\dc1_setup\guest_additions.zip' -DestinationPath 'C:\dc1_setup\' -Force

Set-Location 'C:\dc1_setup\guest_additions\cert'
.\VBoxCertUtil.exe add-trusted-publisher vbox*.cer --root vbox*.cer

Set-Location 'C:\dc1_setup\guest_additions'
.\VBoxWindowsAdditions-amd64.exe /S

Start-Sleep -Seconds 180