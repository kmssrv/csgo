@echo off
powershell.exe -command "New-LocalUser -Name 'r061_01_user' -Password (ConvertTo-SecureString 'p@ssW0rd' -AsPlainText -Force) -FullName 'r061_01_user' -Description 'Test account'"