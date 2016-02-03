﻿# encoding: utf-8
# language: ru


@tree

@IgnoreOn82Builds
@IgnoreOnOFBuilds


Функционал: Проверка запуска простого сценария
	Как Разработчик
	Я Хочу чтобы чтобы у меня была возможность проверить запуск простого сценария в Vanessa-Behavoir в режиме TestClient
	Для того чтобы я мог убедиться,что в режиме TestClient данный функционал работает
 
 

	Контекст:
		Дано в Константе "ПутьКVanessaBehavior" указан существующий файл
		Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
		
	Сценарий: Запуск простого сценария

		Когда я открыл форму VanessaBehavoir в TestClient
				Когда В панели разделов я выбираю "Основная"
				И В панели функций я выбираю "Открыть vanessa behavior"
				Тогда открылось окно "* Vanessa behavior"
		
		И установил флаг в  VanessaBehavoir в TestClient ПроверкаРаботыVanessaBehaviorВРежимеTestClient
				И В открытой форме я перехожу к закладке с заголовком "Сервис"
				И В открытой форме я изменяю флаг с заголовком "Проверка работы Vanessa-Behavior в режиме test client"
			
		И в VanessaBehavoir в TestClient я загрузил специальную тестовую фичу "ПростаяФичаДляПроверкиРаботыВыполненияСценария"
				И В открытой форме я перехожу к закладке с заголовком "Служебная"
				И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ПростаяФичаДляПроверкиРаботыВыполненияСценарияTestClient"
			
		И я прервал в VanessaBehavoir в TestClient я нажал на кнопку "ВыполнитьСценарии"
				И В открытой форме я перехожу к закладке с заголовком "Библиотеки"
				И В открытой форме я нажимаю на кнопку с заголовком "Добавить"
				И я добавляю в библиотеки строку с стандартной библиотекой "Пауза"
				И В форме "* Vanessa behavior" в ТЧ "КаталогиБиблиотек" я завершаю редактирование строки
				И В открытой форме я нажимаю на кнопку с заголовком "Перезагрузить"
				И Я делаю паузу 2 секунды		
				И В открытой форме я нажимаю на кнопку с заголовком "Выполнить сценарии"
				И Я делаю паузу 2 секунды		
				
		Тогда в VanessaBehavoir в TestClient выполнился сценарий
			И     таблица формы с именем "ДеревоТестов" стала равной:
			| 'Снипет'               | 'Имя'                                                              | 'Строка реальной процедуры' |
			| ''                     | 'ПростаяФичаДляПроверкиРаботыВыполненияСценарияTestClient.feature' | ''                          |
			| ''                     | 'ПростаяФичаДляПроверкиРаботыВыполненияСценарияTestClient'         | ''                          |
			| ''                     | 'Выполнение простого сценария'                                     | ''                          |
			| 'ЯВыполняюПустойШаг()' | 'Когда я выполняю пустой шаг'                                      | 'ЯВыполняюПустойШаг'        |


