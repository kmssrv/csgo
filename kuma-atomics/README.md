# KUMA Atomics
Раздел содержит тесты, покрывающие соответствующие правила корреляции SIEM KUMA. Тесты написаны в формате YAML Atomic Red Team. Их можно запускать:
1. как отдельные самостоятельные сущности с использованием PowerShell модуля Invoke-AtomicRedTeam;
2. централизовано с использованием Jenkins в качестве оркестратора. Для этого в директории каждого теста содержится конфигурация пайплайна Jenkins.
## Подготовка
Сохранить тесты в директорию C:\kuma-atomics.
## Проверка
Выполнить команду в PowerShell
```
Invoke-AtomicTest T9001 -PathToAtomicsFolder "C:\kuma-atomics" -TestNumbers 1 -ShowDetails
```
Вывод:
```
PathToAtomicsFolder = C:\kuma-atomics

[********BEGIN TEST*******]
Technique: Using known malware tools T9001
Atomic Test Name: R077_02_KSC. ÐžÐ±Ð½Ð°Ñ€ÑƒÐ¶ÐµÐ½Ð¾ Ð²Ñ€ÐµÐ´Ð¾Ð½Ð¾ÑÐ½Ð¾Ðµ ÐŸÐž
Atomic Test Number: 1
Atomic Test GUID: ba5fa5cf-22e7-4565-9678-5f0594db356d
Description: Generate EICAR file using powershell one time

Attack Commands:
Executor: powershell
ElevationRequired: False
Command:
[System.IO.File]::WriteAllLines('#{path}eicar.com', 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H
*', [System.Text.UTF8Encoding]($False))
Command (with inputs):
[System.IO.File]::WriteAllLines('C:\malware-samples\eicar.com', 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TE
ST-FILE!$H+H*', [System.Text.UTF8Encoding]($False))

Cleanup Commands:
Command:
Remove-Item -Path "#{path}eicar.com" -Force
Command (with inputs):
Remove-Item -Path "C:\malware-samples\eicar.com" -Force
[!!!!!!!!END TEST!!!!!!!]

```
Хост готов к централизованному запуску тестов с помощью Jenkins.