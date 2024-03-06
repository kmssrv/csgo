# Define the registry key path
$keyPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

# Retrieve the value of key
$value = (Get-ItemProperty -Path $keyPath).Shell

# Output a message indicating current value
Write-Output "The value of 'Shell' key is '$value'"

# Define the new value for the 'Shell' key (replace "test.exe" with the desired value)
$newValue = "test"

# Set the value of the 'Shell' key to the new value
Set-ItemProperty -Path $keyPath -Name "Shell" -Value $newValue

# Output a message indicating that the key has been modified
Write-Output "The value of 'Shell' key has been modified to '$newValue'."

# Set the value of the 'Shell' key to the old value
Set-ItemProperty -Path $keyPath -Name "Shell" -Value $value

# Retrieve the value of key
$value = (Get-ItemProperty -Path $keyPath).Shell

# Output a message indicating that the key has been modified
Write-Output "The value of 'Shell' key has been modified to '$value'."