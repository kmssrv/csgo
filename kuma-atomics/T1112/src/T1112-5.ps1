# Define the registry key path
$keyPath = "HKLM:\SOFTWARE\Classes\Folder\shell\open\command"

New-ItemProperty -Path $keyPath -Name "test" -Value "test" -PropertyType String
Remove-ItemProperty -Path $keyPath -Name "test"
