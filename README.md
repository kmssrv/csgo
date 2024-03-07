## CSGO: Continues Security and Guided Operations (ru)
Проект посвящен концепции обеспечения непрерывности процессов информационной безопасности Continues Security and Guided Operations (CSGO). Её суть заключается в том, что на любую детектирующую логику должен быть написан соответствующий тест и этот тест должен выполнятся регулярно и как можно чаще.

![csgo_overview.png](img/csgo_overview.png)
Сейчас за основу взяты следующие компоненты:
1. Проект Atomic Red Team (далее ART). Библиотека тестов, которую можно расширять своими сценариями.
2. Jenkins в качестве оркестратора, который запускает тесты и анализирует алерты на стороне SIEM.

Почему именно они?

**ART**:
1. Предлагает структурированную базу тестов в формате YAML, а также модуль PowerShell для парсинга YAML файлов и запуска тестов. Описание тестов в формате YAML удобно и наглядно по сравнению с хранением готовых "сырых" скриптов. Формат YAML универсален и в случае возникновения ограничений текущего модуля для запуска тестов можно будет разработать свой, например на Python, расширив его необходимыми функциональными возможностями.
2. Проект уже включает огромною базу тестов.

**Jenkins**:
1. Поддержка git. Это позволяет "из коробки" вести удобную разработку тестов, их актуализацию и деплой на защищаемые устройства. В перспективе поддержка git позволит также публиковать и правила корреляции в SIEM, что еще теснее  свяжет совместную разработку тестов и детектирующих логик.
2. Гибкость и универсальность. Можно выполнить любой скрипт, цепочку скриптов. Есть множество плагинов, в том числе поддержка вэбхуков.
3. GUI. Простой графический интерфейс удобен на этапе прототипирования и ускоряет разработку различных сценариев proof of concept.

Выбор данных инструментов не окончательный и будет зависеть от отклика ИБ комьюнити.  
#### Демонстрация работы системы на примере KUMA SIEM (Kaspersky)

![csgo_demo.gif](img/csgo_demo.gif)

#### Требования
- [Jenkins](https://www.jenkins.io/)  версии 2.426 с поддержкой websockets, а также с установленным плагинам [Webhook Step](https://plugins.jenkins.io/webhook-step) .
- Модуль PowerShell [Invoke-AtomicRedTeam](https://github.com/redcanaryco/invoke-atomicredteam).
- SIEM с поддержкой вэбхуков.
#### Содержание
- [Установка и настройка Jenkins](jenkins-install/README.md)
- [Установка модуля Invoke-Atomic на Windows Server](invoke-atomicredteam-install/README.md)
- [Подготовка Windows Server для запуска тестов KUMA atomics](kuma-atomics/readme)
- Настройка SIEM
- [Централизованный запуск тестов и анализ алертов SIEM KUMA (демо)](csgo-kuma-demo/README)
#### Скоро
Что-то будет:)
#### История
27.02.2024 Презентация концепции на KUMA Meetup