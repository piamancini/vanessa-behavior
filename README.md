# vanessa-behavior

[![Открытый чат проекта https://gitter.im/silverbulleters/vanessa-behavoir](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/silverbulleters/vanessa-behavoir?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build Status](http://ci.silverbulleters.org/buildStatus/icon?job=Vanessa-Behavior-Develop)](http://ci.silverbulleters.org/job/Vanessa-Behavior-Develop/)
[![Crowdin](https://d322cqt584bo4o.cloudfront.net/vanessa-services/localized.svg)](https://crowdin.com/project/vanessa-services)
[![OpenCollective](https://opencollective.com/vanessa-behavior/backers/badge.svg)](#backers) 
[![OpenCollective](https://opencollective.com/vanessa-behavior/sponsors/badge.svg)](#sponsors)

## BDD for 1С:Enterprise

Текущий релиз в ветке [Master: 1.0](https://github.com/silverbulleters/vanessa-behavior/tree/master)
Разработка ведется в ветке [Develop](https://github.com/silverbulleters/vanessa-behavior/tree/develop). Эта же ветка является основной.

Проект использует принцип формирования автодокументации в формате Markdown и видео.
* Markdown инструкции лежат [здесь](https://github.com/silverbulleters/vanessa-services/tree/master/ru-RU/behavior/Features) 
* Видео инструкции лежат [здесь](https://www.youtube.com/channel/UC2mJ4LlMG-FF4qkc_kqN_iQ) 
* Прочие инструкции сгруппированы [в этом плейлисте YouTube](https://www.youtube.com/playlist?list=PL2zlgf113YhFG_uRARjDtP1_Obj55UmY4) 
* Также рекомендуется посмотреть вот [этот вебинар](http://infostart.ru/webinars/537546/) 
* Возможно вам поможет [этот FAQ](https://github.com/silverbulleters/vanessa-behavior/blob/develop/F.A.Q.MD)

Чтобы у вас работало создание автовидеоинструкций необходимо установить дополнительный софт. Инструкция [здесь](https://github.com/silverbulleters/vanessa-behavior/blob/develop/MakeAutoVideo.md) 
Также по автовидеоинструкциям есть вот это замечательное [видео](https://www.youtube.com/watch?v=BfXowJH5uP0)

Порядок установки Vanessa-Behavior под Windows:

* [интерпретатор 1Script](http://oscript.io/downloads) - для работы с иходными файлами 1С с помощью проекта precommit1C
* [утилита для формирования отчётов о проверки Allure](http://allure.qatools.ru/)

Все должно быть установлено так, чтобы быть доступным через переменную `%PATH%`

Клонируйте данный репозиторий с помощью **ms-git**

```
git clone https://github.com/silverbulleters/vanessa-behavior.git
```

Или используйте [шаблон работы по проекту 1С](https://github.com/silverbulleters/vanessa-bootstrap)

Инициализируйте подмодули репозитория с помощью **ms-git**

```
git submodule update --init --recursive
```

при использовании `SourceTree` используйте команду `Clone (Клонировать)`

Обязательно ознакомьтесь с:

* руководством контрибьютора [CONTRIBUTING.md](./.github/CONTRIBUTING.md)
* моделью спонсорства [DONATIONS.md](./DONATIONS.md)
* известные проблемы [KNOWN-PROBLEMS.md](./doc/KNOWN-PROBLEMS.md)

## Описание простого использования

* пишем feature файлы в формате Gherkin (обычно используется редактор Notepad++, Sublime IDE (Vanessa Extension) или связанный проект **vanessa-bdd-editor**

```Gherkin

# encoding: utf-8
# language: ru

Функционал: Запуск и получение результатов запуска сценариев
Как любой разработчик продукта
Я хочу иметь возможность запустить проверку сценариев поведения на конфигурации 1С:Предприятие

# Контекст сценария выполняется всегда перед каждым сценарием

Контекст:
Когда существует разрабатываемая мною конфигурация 1С
И существуют требования заказчика к ожидаемому поведения в каталоге ".\features"

# Каждый сценарий состоит из последовательных связанных шагов

Сценарий: Запуск в консольном режиме
Дано Пусть существует файл ".\vb-execute-profile.json"
И в переменную окружения V83PATH установлено значение "C:\Program Files (x86)\1cv8\8.3.6.2151\bin\1cv8.exe"
Когда я запускаю командную строку '%V83PATH% /Execute .\vanessa-behavior.epf /C"StartFeaturePlayer;VBParams=.\vb-execute-profile.json'
Тогда появляется файл с результатами '.\BuildStatus.log'
И в каталоге ".\allurereport" существует HTML отчет о результатах проверки сценариев

Сценарий: Запуск в интерактивном режиме
Дано Пусть я открыл обработку "vanessa-behavior.epf"
Когда Я нажал кнопку "Загрузить фичи из каталога"
И указал каталог с требованиями заказчика равным ".\features"
И затем нажал кнопку "Сгенерировать шаблоны обработок"
Также в каталоге ".\features" возникли epf файлы идентичные имени feature файла
И при нажатии кнопки "Запустить сценарии" я вижу автоматизированный запуск обработок с признаком "pending" (ожидает реализации)
```


### Классический вариант использования (без интерактивного режима)

Фактически классический вариант использования представляет собой следующий рутинный порядок

* зафиксировали требования к информационной системе
* создали автоматизированные сценарии проверки в виде epf файлов
* наполнили шаги сценариев (сниппеты) кодом проверки поведения
* запустили сценарии проверки поведения и убедились, что они НЕ работают
* разработали функционал
* запустили сценарии проверки поведения
* убедились что сценарии проверки работают и отчет о проверки показывает "Зелёный" статус

### Использования в режиме проверки поведения пользовательского интерфейса

для команд уже имеющих функционал, или производящих доработку типовых конфигураций в режиме Taxi действует упрощенный порядок использования

* зафиксировали требования к информационной системе
* создали автоматизированные сценарии проверки в виде epf файлов
* разработали управляемые формы или рабочие столы конфигурации в режиме прототипирования
* запустили запись интерактивных действий пользователя в режиме **менеджера тестирования**
* получившимся кодом наполнили обработки проверки поведения
* дополнили код проверки, кодом проверки данных если это необходимо
* разработали основной функционал
* запустили сценарии проверки поведения
* убедились что сценарии проверки работают и отчет о проверки показывает "Зелёный" статус

## Кто пишет feature файлы ?

Обратите внимание, что фактически feature файлы могут писать все участники команды:

* менеджер проекта - если обнаружил что заказчику необходимо новое поведение
* бизнес или системный аналитик - на основе собранных требований и технических заданий
* ведущий разработки - если обнаружил, что требования недостаточно структурированы
* архитектор или эксперт 1С - если текущие сценарии некорректно спроектированы с точки зрения метаданных

Для редактирования feature файлов используется проект [По автоматизации сбора требований](https://github.com/silverbulleters/vanessa-bdd-editor) - на текущий момент имеет статус *beta*

Если вы не уверены в правильности ожидаемого поведения, используйте для этого системы тэгов, как то:

* "@Draft@"  - черновик требования
* "@Предварительно" - начальные заметки

и подобные им обозначения

## Файл профиля запуска обработки

Для запуска в консольном режиме используется понятие *профиль консольного запуска*. Профиль консольного запуска предназначен для удобной передачи параметров. Профиль запуска представляет собой текстовый файл в формате JSON.

Текущие параметры запуска:

* **Каталог фич** - каталог где собраны требования заказчика описанные на языке Gherkin
* **ВыполнитьСценарии** - признак того, что необходимо запустить выполнение сценариев
* **ДелатьОтчетВФорматеАллюр** - признак того, что необходимо формировать HTML отчёт о результатах проверки
* **КаталогOutputAllureБазовый** - адрес каталога для где будет формироваться HTML отчёт
* **ЗавершитьРаботуСистемы** - признак того, что окончанию работы необходимо завершить работу 1С предприятия
* **ВыгружатьСтатусВыполненияСценариевВФайл** - признак, что необходимо формировать файл с финальным статусом проверки
* **ПутьКФайлуДляВыгрузкиСтатуасВыполненияСценариев** - по данному пути будет сформирован файл со статусом проверки (обычно используется на серверах сборки для автоматизированного указания статуса сборки)
* **СписокТеговИсключение** - массив текстовых тэгов, для исключения из проверки (используется например для черновиков сценариев и требований)
* **СписокТеговОтбор** - массив текстовых тэгов для запуска проверки поведения по сценариям, содержащим любой из указанных тэгов

Пример подобного JSON файла профиля:

```
{
"КаталогФич": "C:\vanessa-behavior\features",
"ВыполнитьСценарии": "Истина",
"ДелатьОтчетВФорматеАллюр": "Истина",
"КаталогOutputAllureБазовый": "C:\allurereport",
"ЗавершитьРаботуСистемы": "Истина",
"ВыгружатьСтатусВыполненияСценариевВФайл": "Истина",
"ПутьКФайлуДляВыгрузкиСтатусаВыполненияСценариев": "C:\BuildStatus.log",
"СписокТеговИсключение":[
"IgnoreOnCIMainBuild",
"Draft"
]
}
```

Профиль запуска предназначен для простого консольного запуска, пример подобной командной строки выглядит так:

```
%V83PATH% /Execute C:\vanessa-behavior\vanessa-behavior.epf /C"StartFeaturePlayer;VBParams=C:\VBParams.json"
```

примеры запуска можно увидеть в соседнем репозитории [Vanessa Runner](https://github.com/silverbulleters/vanessa-runner/blob/master/tools/vanessa.bat)

## Создается при финансовой поддержке

как попасть в этот раздел ? смотри [DONATIONS.md](./DONATIONS.md)

## Замечания:

* в процессе подготовки редакции 1.0 идут активные изменения, вследствие чего обратная совместимость с редакциями ниже 1.0 может не соблюдаться
* пожелания к использованию можно фиксировать в виде Github Issues
* структура каталогов проекта соответствует шаблону https://github.com/silverbulleters/vanessa-bootstrap

## Известные публикации

* [Первичная публикация](http://habrahabr.ru/post/252473/)
* [Пример отчета Allure на основе тестов](http://youtu.be/982gF1wY8sM)

## Вдохновение черпается

* [Огурец](https://cukes.info/)
* [Автоматизированное тестирование 1С](http://v8.1c.ru/overview/Term_000000816.htm)
* [Yandex Allure](http://allure.qatools.ru/)
* [Silenium](http://docs.seleniumhq.org/)
* [ТРИЗ](https://ru.wikipedia.org/wiki/Теория_решения_изобретательских_задач)
* [Дэн Норт](http://en.wikipedia.org/wiki/Acceptance_test-driven_development)

## Заметки для желающих поучаствовать в доработке

* мы используем подход git-flow для реализации функциональности
* мы используем precommit1c для фиксации исходников Epf обработки в git
* мы используем принцип самопроверки через feature файлы, поэтому перед разработкой новой функциональности мы также - разрабатываем feature файлы, генерируем шаблоны сценариев и наполняем их кодом для проверки. Поэтому к доработкам без feature файлов мы относимся "холодно".

более подробно в файле [CONTRIBUTING.md](https://github.com/silverbulleters/vanessa-behavior/blob/develop/CONTRIBUTING.md)

## Лицензии

* основная лицензия продукта - BSD v3
* лицензии стороннего кода - Apache License, GitHub CLA, Freeware, etc

## Поддержка OpenSource команды

* мы используем https://salt.bountysource.com/checkout/amount?team=silverbulleters

## FAQ

* **Q: много ли команд используют такой подход ?**
* **A:** из известных нам - 63 команды

* **Q: можно ли тестировать производительность с помощью BDD ?**
* **A:** для этого существует другой закрытый инструментарий, который использует vanessa-behavior как клиента тестирования - используется в Enterprise проектах.

* **Q: Что вы думаете о сценарном тестировании ?**
* **A:** сценарное тестирование слишком дорого по савокупной стоимости владения, поэтому пусть живет своей жизнью вместе с СППР, обратите внимание, что учебный центр №1 думает провести подготовку слушателей [по функционалу тестирования в 1С:Предприятии (ссылка на Facebook](https://www.facebook.com/1631718833760014/posts/1715544585377438/) - если Вас интересует функционал сценарного тестирования, возможно стоит записаться именно на этот курс, а не ходить по GitHub ссылкам.

## Enterprise Support

платная подддержка содержит в себе

* обучение навыкам работы с BDD при разработке на 1С
* обучение навыкам написания на языке Gherkin
* обучение навыкам написания сценариев проверки поведения

для заказа платной поддержки необходимо отравить заявку на адрес education@silverbulleters.org 
или 
по телефону +7-(499)-346-70-19.

[![ZenHub] (https://raw.githubusercontent.com/ZenHubIO/support/master/zenhub-badge.png)] (https://zenhub.io)

Контура сборки предоставлены

[![DOcean] (https://www.digitalocean.com/assets/media/logos-badges/png/DO_Logo_Horizontal_Blue-3db19536.png)](https://m.do.co/c/2a3a0769ac84)

This is for your open collective backers and sponsors to appear directly on your README. 
see how it'll look [here](https://github.com/apex/apex#backers)
[More info](https://github.com/opencollective/opencollective/wiki/Github-banner)

Also add badges on top.
## Backers
Support us with a monthly donation and help us continue our activities. [[Become a backer](https://opencollective.com/vanessa-behavior#backer)]

<a href="https://opencollective.com/vanessa-behavior/backer/0/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/0/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/1/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/1/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/2/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/2/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/3/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/3/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/4/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/4/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/5/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/5/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/6/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/6/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/7/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/7/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/8/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/8/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/9/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/9/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/10/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/10/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/11/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/11/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/12/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/12/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/13/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/13/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/14/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/14/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/15/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/15/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/16/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/16/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/17/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/17/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/18/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/18/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/19/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/19/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/20/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/20/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/21/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/21/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/22/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/22/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/23/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/23/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/24/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/24/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/25/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/25/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/26/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/26/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/27/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/27/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/28/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/28/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/backer/29/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/backer/29/avatar.svg"></a>


## Sponsors
Become a sponsor and get your logo on our README on Github with a link to your site. [[Become a sponsor](https://opencollective.com/vanessa-behavior#sponsor)]
<a href="https://opencollective.com/vanessa-behavior/sponsor/0/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/0/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/1/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/1/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/2/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/2/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/3/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/3/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/4/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/4/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/5/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/5/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/6/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/6/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/7/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/7/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/8/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/8/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/9/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/9/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/10/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/10/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/11/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/11/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/12/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/12/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/13/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/13/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/14/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/14/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/15/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/15/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/16/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/16/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/17/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/17/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/18/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/18/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/19/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/19/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/20/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/20/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/21/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/21/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/22/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/22/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/23/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/23/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/24/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/24/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/25/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/25/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/26/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/26/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/27/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/27/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/28/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/28/avatar.svg"></a>
<a href="https://opencollective.com/vanessa-behavior/sponsor/29/website" target="_blank"><img src="https://opencollective.com/vanessa-behavior/sponsor/29/avatar.svg"></a>
