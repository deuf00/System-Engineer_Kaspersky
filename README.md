# System Information Report Script

## Функциональность

Скрипт выполняет последовательный сбор данных и записывает их в один текстовый файл, разбитый на логические блоки:

| Раздел | Содержимое |
| --- | --- |
| **PC Information** | Имя компьютера, версия ОС, список логических дисков с размером, свободным местом и процентом использования |
| **RAM Information** | Топ-5 процессов по объёму занимаемой памяти, WorkingSet64/PrivateMemorySize64 и общая/свободная/используемая RAM в процентах |
| **Service Information** | Список остановленных служб с типом запуска `Automatic` |

## Формирование имени файла

Имя файла строится по шаблону:

~~~
yyyy-MM-dd_HH-mm-ss_<ComputerName>.txt
~~~

Пример:

~~~
2026-11-02_14-35-12_DESKTOP-GIJVLQL.txt
~~~

## Путь сохранения

~~~
C:\Users\*User*\Desktop\System-Engineer_Kaspersky\Reports\<имя_файла>.txt
~~~

## Пример вывода отчёта

~~~text
------------- PC Information -------------
PC Name -> DESKTOP-GIJVLQL
OS Version -> Windows 11 Pro

ID Size (Gb) Free Space (Gb) Free Space Percent
-- --------- --------------- ------------------
C:    475,92           17,94               3,77


------------- RAM Information -------------

ProcessName        Memory(MB) Private Memory(MB)
-----------        ---------- ------------------
Memory Compression      708,6               1,73
Code                   398,07             436,91
SearchHost             316,45             223,41
MsMpEng                279,71             485,05
chrome                 258,16             201,57



Total (GB) Free (GB) Used (GB) Percent Used (%)
---------- --------- --------- ----------------
     15,73      7,69      8,04            51,11


------------- Service Information -------------

Service                                    Status Start Type
-------                                    ------ ----------
DoSvc                                     Stopped  Automatic
edgeupdate                                Stopped  Automatic
GoogleUpdaterInternalService157.0.8089.0  Stopped  Automatic
GoogleUpdaterService157.0.8089.0          Stopped  Automatic
gpsvc                                     Stopped  Automatic
Intel(R) Platform License Manager Service Stopped  Automatic
MapsBroker                                Stopped  Automatic
sppsvc                                    Stopped  Automatic
WbioSrvc                                  Stopped  Automatic


------------- CPU Information -------------

Name                                 Cores Logical Processors Max Clock (MHz) Load (%)
----                                 ----- ------------------ --------------- --------
12th Gen Intel(R) Core(TM) i5-12450H     8                 12            2000        2
~~~

## Технические решения

Добавил немного своего, чуть больше информации чем было нужно в задании.
- Добавил помимо Топ-5 процессов еще и общее количество памяти, свободную память и занятую память вместо с процентной оценкой
- Добавил информацию о процессоре

## Структура проекта

~~~
System-Engineer_Kaspersky/
│
├── reports_script.ps1      # Основной скрипт
├── Reports/                 # Каталог для отчётов
│   └── 2026-11-02_14-35-12_DESKTOP-GIJVLQL.txt
└── README.md                 # Описание проекта
~~~

