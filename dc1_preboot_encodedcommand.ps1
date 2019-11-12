$command = 'IEX (iwr "https://raw.githubusercontent.com/qz8xTD/soclab/master/dc1_postreboot.ps1")'
$bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
$encodedCommand = [Convert]::ToBase64String($bytes)

Write-Host $encodedCommand