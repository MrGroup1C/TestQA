﻿#language: ru

@tree

Функционал: Создание документа Поступление товаров

Как Менеджер по закупкам я хочу
создать документ Поступление товаров 
чтобы поставить товаров на учет   

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание документа Поступление товаров
* Открытие формы документа Поступление товаров
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	Тогда элемент формы с именем "Склад" стал равен 'Малый'	
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'       |
		| '000000013' | 'Магазин "Продукты"' |
* Заполнение товаровной части документа
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '65,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '55,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыСумма' я ввожу текст '7 777,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я добавляю строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыТовар"
	И в таблице "Товары" я отменяю редактирование строки
* Проверка заполнения ТЧ
	Тогда таблица "Товары" содержит строки:
		| 'Товар'     | 'Артикул' | 'Цена'  | 'Количество' | 'Сумма'    |
		| 'Босоножки' | '*' | '65,00' | '55,00'      | '7 777,00' |
	И я нажимаю на кнопку "Записать"
* Запоминаем номер документа
	И я запоминаю значение поля "Номер" как "Номер"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка созданного документа по номеру
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$' |
	
Сценарий: Проверка наличия в справочнике номенклатура элемента Торт
И В командном интерфейсе я выбираю 'Продажи' 'Товары'
Тогда открылось окно 'Товары'
И я нажимаю на кнопку с именем 'ФормаСписок'
И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Торт' |