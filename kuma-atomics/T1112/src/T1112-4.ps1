# Define the registry key path
$keyPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost"

New-ItemProperty -Path $keyPath -Name "test" -Value "test" -PropertyType String
Remove-ItemProperty -Path $keyPath -Name "test"
