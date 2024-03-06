# Define the registry key path
$keyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"

New-ItemProperty -Path $keyPath -Name "test" -Value "test" -PropertyType String
Remove-ItemProperty -Path $keyPath -Name "test"
