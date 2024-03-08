# Установка модуля Invoke-Atomic на Windows Server
Для запуска тестов в формате YAML, разработанных командой Atomic Red Team, а также своих собственных тестов, необходимо установить модуль PowerShell модуль Invoke-AtomicRedTeam. [Документация по работе с модулем](https://github.com/redcanaryco/invoke-atomicredteam/wiki).

Простейший способ установки - из галереи PowerShell:
1. Опционально, в зависимости от окружения Windows Server выбрать использование TLS1.2 и установить пакетный менеджер NuGet
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-PackageProvider -Name NuGet
```
2. Установить модули invoke-atomicredteam и powershell-yaml
```
Install-Module -Name invoke-atomicredteam,powershell-yaml -Scope AllUsers
```

Загрузка библиотеки тестов Atomic Red Team (по умолчанию в C:\AtomicRedTeam)
```
IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicsfolder.ps1' -UseBasicParsing)
Install-AtomicsFolder
```

Проверка работоспособности:
```
Invoke-AtomicTest T1070.001 -TestNumbers 1 -ShowDetails

```
Вывод:
```
PathToAtomicsFolder = C:\AtomicRedTeam\atomics

[********BEGIN TEST*******]
Technique: Indicator Removal on Host: Clear Windows Event Logs T1070.001
Atomic Test Name: Clear Logs
Atomic Test Number: 1
Atomic Test GUID: e6abb60e-26b8-41da-8aae-0c35174b0967
Description: Upon execution this test will clear Windows Event Logs. Open the System.evtx logs at C:\Windows\System32\winevt\Logs and verify that it is now empty.

Attack Commands:
Executor: command_prompt
ElevationRequired: True
Command:
wevtutil cl #{log_name}
Command (with inputs):
wevtutil cl System
[!!!!!!!!END TEST!!!!!!!]
```