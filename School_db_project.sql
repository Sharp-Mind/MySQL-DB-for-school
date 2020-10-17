/* Проект предполагает использование базы данных в контексте современного образовательного учреждения, в данном случае - школы, и сайта для него.
 * Так как целостность и достоверность информации лучше достигается, если она хранится в одном месте, то для реализации школьных
 * журнала и дневника отлично подходит web-среда. Учащиеся никогда не забудут что было задано на уроке или каким уроком завтра физика;
 * учителя наглядно посчитают статистику и быстро впишут домашнее задание; родители будут знать об успеваемости детей и будут в курсе школьных
 * событий и мероприятий.
 * 
 * В моём проекте не реализованы такие особенности как учёт пристутствия сотрудников и учащихся по картам (в современных школах такой функционал
 * присутствует), операции с балансом на ней, особенности контрольных работ и начала/окончания года, так как я уделил внимание основным функциям,
 * которые, по моему мнению, должны быть на школьном портале, а так же статистике. 
 */

DROP DATABASE IF EXISTS school_global_db;
CREATE DATABASE school_global_db;
USE school_global_db;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL,
	created_at DATETIME DEFAULT NOW() COMMENT 'Когда создана запись',
    updated_at DATETIME DEFAULT NOW() ON UPDATE NOW() COMMENT 'Когда запись была обновлена в последний раз',
	firstname VARCHAR(50) NOT NULL COMMENT 'Имя пользователя',
	lastname VARCHAR(50) NOT NULL COMMENT 'Фамилия пользователя',
	patronymiс VARCHAR(50) DEFAULT '(нет)' COMMENT 'Отчество пользователя (если есть)', -- отчество
	login VARCHAR(50) NOT NULL COMMENT 'Логин пользователя',
	password_hash VARCHAR(100) NOT NULL COMMENT 'Хеш пароля',
	email VARCHAR(50) UNIQUE COMMENT 'Адрес электронной почты пользователя',
	phone BIGINT UNSIGNED UNIQUE COMMENT 'Номер телефона пользователя',
	
	PRIMARY KEY (id, firstname, lastname, patronymiс),
	CHECK(YEAR(created_at) >= YEAR(updated_at))
	
) COMMENT 'Все пользователи';


INSERT users 
	(id, firstname, lastname, patronymiс, login, password_hash, email, phone)
VALUES
	(1, 'Алёна', 'Краснова', 'Сергеевна', 'krasnovaas', 'sleir7vhw487594', 'Alena_krasa_777@google.com', 89193497223),
	(2, 'Василий', 'Петров', 'Игоревич', 'petroviv', 'fhkfhw45i4yiufy4hi5hd4', 'vpetrov@yandex.ru', 89091233218),
	(3, 'Петр', 'Иванов', 'Васильевич', 'ivanovpv', 'sea47hw7f4975f347', 'ktotam@yandex.ru', 89408570347),
	(4, 'Анастасия', 'Ионова', 'Павловна', 'ionovaap', 'wo4h75049375h0295', 'IonovaA@mail.ru', 89173409254),
	(5, 'Алексей', 'Гжельский', 'Иванович', 'gzhelskiyai', 'i349237d27034fh!', 'alex.gzh.1@bk.ru', 89340958409),
	(6, 'Николай', 'Потапов', 'Евгеньевич', 'potapovne', '2ofjo4375h347f594', 'nikola890@google.com', 89204957341),
	(7, 'Леонид', 'Остапов', 'Иванович', 'ostapovli', 'ow3h8437h98f73h957', 'Ostapov.LI@yandex.ru', 89164569812),
	(8, 'Татьяна', 'Кораблёва', 'Павловна', 'korablevatp', 'ufy6d*^KLn&_HdslfkjLFk8', 'KorablevaT_77@mail.ru', 89992348321),
	(9, 'Антон', 'Конев', 'Антонович', 'konevaa', 'weiorf748752-2341dsa1@', 'konev_antant@google.com', 89878471495),
	(10, 'Егор', 'Дрынский', 'Васильевич', 'drynskiyev', '7c2h95vh49qt675%f8s0f', 'dryn_ev@yandex.ru', 89975492702),
	(11, 'Елена', 'Ломова', 'Николаевна', 'lomovaen', 'a7sd6g9s^fn79+#@fhf2355', 'lena_lomnik@google.com', 891905973498),
	(12, 'Антонина', 'Панкратова', 'Фёдоровна', 'pankratovaap', 'h3k6dr7y$%^vkh#754#', 'panckratova_anf@yandex.ru', 89174132389),
	(13, 'Кирилл', 'Шастов', 'Сергеевич', 'shastovks', 'aysq9387q39812csklfa', 'shastov_ks@yandex.ru', 89992360927),
	(14, 'Андрей', 'Конев', 'Федорович', 'konevak', '8c349kcfjclfa^24-^@3jfa202', 'konvpalto@yandex.ru', 89634082309),
	(15, 'Лиана', 'Петрова', 'Сергеевна', 'petrovals', 'e09h7fp2u3rcf24j9341', 'Petrova_lilya@mail.ru', 89193791041),
	(16, 'Никита', 'Расторгуев', 'Анатольевич', 'rastorguevna', 'c3nfp497vn2eouvn27t3!', 'nikitos007@bk.ru', 89092378643),
	(17, 'Александр', 'Мхов', 'Евгеньевич', 'mhovae', 'ec039r7hv4t3ngp3245', 'alex_meh_15@google.com', 89998403614),
	(18, 'Михаил', 'Пилсудский', 'Иванович', 'pilsudskiymi', 'ry2386h397hdebfc2b4fc', 'mishapil@yandex.ru', 89164569811),
	(19, 'Екатерина', 'Северная', 'Андреевна', 'severnayaea', '385vbc9vrc-e0krc4;xm249t7-t7', 'NordKath01@mail.ru', 89992348322),
	(20, 'Анатолий', 'Раменский', 'Дмитриевич', 'ramenskiyda', 'sakldkcnw83q424c134cbwbc', 'Ramenskiy-DA@google.com', 89878471496),
	(21, 'Павел', 'Николаев', 'Иванович', 'nikolaevpi', '2cn70r375cwm0tg357tbc3', 'pavelnik@yandex.ru', 89975492703),
	(22, 'Татьяна', 'Каминская', 'Анатольевна', 'kaminskayata', 'ydhri24783rhc9248qfgq0h2', 'kaminskayata@google.com', 891905973499),
	(23, 'Антон', 'Королёв', 'Васильевич', 'korolevak', 'weuh8752h0495fh2439jd2', 'korolev_ak@yandex.ru', 89992360928),
	(24, 'Иван', 'Попов', 'Николаевич', 'popovin', 'r6b4765dn2861ds0y8fh29t', 'popovin@yandex.ru', 89634082310), -- не ученик
	(25, 'Марина', 'Полежаева', 'Константиновна', 'polezhaevamk', 'weir64h98r76h2043hr2043', 'polezhaevamk@mail.ru', 89193791042),
	(26, 'Александр', 'Редькин', 'Анатольевич', 'redkinaa', 'r27f34r6f483fh02346h7g203', 'redkinaa@bk.ru', 89092378644),
	(27, 'Константин', 'Задорожный', 'Евгеньевич', 'zadarozhniyke', 't3h94562934hf92436t9', 'zadarozhniyke5@google.com', 89998403615),
	(28, 'Пётр', 'Шароваров', 'Захарович', 'Sharovarovpz', '23rfbruidh27835hd12rh8', 'Sharovarovpz@yandex.ru', 89164569813),
	(29, 'Алия', 'Ахмедова', '(нет)', 'ahmetzia', 'jf2o4fr7h1fht23ft6h923', 'ahmetzia@mail.ru', 89992348324),
	(30, 'Павел', 'Игнатьев', 'Романович', 'ignatievpr', 'yvbrfo34irfh3857h022efdt3', 'ignatievpr@google.com', 89878471498),
	(31, 'Евгений', 'Прокапенко', 'Романович', 'prokapenkoer', 'fyi34urd34ryd43hr2fy3498hyfu', 'prokapenkoer@google.com', 89878471499), 
	(32, 'Антонина', 'Ярова', 'Ивановна', 'yarovaai', 'fy4378rh431ofe234725@24ddxd', 'yarovaai@google.com', 89178471500),
	(33, 'Иван', 'Васильев', 'Борисович', 'vasilievib', '34348js38sdhsjfhn32047wr31s7732d', 'vasilievib@google.com', 89178471512),
	(34, 'Ирина', 'Облесова', 'Константиновна', 'oblesovaik', 'uww97s73sjsxrh1sj04sj19s6356j01s6', 'oblesovaik@mail.ru', 89178471513),
	(35, 'Наталья', 'Равилова', 'Валерьевна', 'ravilovanv', 'sr7h0734230s4j302dhrieuhdf98d9436', 'ravilovanv@google.com', 89178471514),
	(36, 'Александр', 'Стронов', 'Михайлович', 'stronovam', 'xmdu23nds20572mef2cn0r78dn4o2iv08', 'stronovam@bk.ru', 89178471515),
	(37, 'Наталья', 'Попова', 'Павловна', 'popovanp', 'dskyn62304782sne9d3640hxfy0x2306', 'popovanp@google.com', 89178471516),
	(38, 'Михаил', 'Ромбов', 'Петрович', 'rombovmp', 'sdjkyfb9w837s12uedg24965hs792r542', 'rombovmp@yandex.ru', 89178471517),
	(39, 'Валентина', 'Шепеленко', 'Остаповна', 'shepelenkova', 'suiegd3gb236sbfgie2946d2025', 'shepelenkova@yandex.ru', 89198471518),
	(40, 'Анна', 'Харченко', 'Анатольевна', 'kharchenkoaa', 'e46c2b30r8nd24yurdh2056af3q1', 'kharchenkoaa@yandex.ru', 89198471519),
	(41, 'Вадим', 'Снопов', 'Игоревич', 'snopovvi', 'd239780fh24068fh1hdfjgwkjhdwuerg2', 'snopovvi@mail.ru', 89998471520),
	(42, 'Никита', 'Мячиков', 'Николаевич', 'myacikovnn', 'djkfybc24o75h2rnf143frh965fh40356', 'myacikovnn@google.com', 89998471521),
	(43, 'Наталья', 'Харитонова', 'Вячеславовна', 'kharitonovanv', 'dsfu498h230fh24685hf04836f52', 'kharitonovanv@yandex.ru', 89198461522),
	(44, 'Виктория', 'Ракитова', 'Романовна', 'rakitovavr', '4i5f7ejnhc34odwoehbf934yfbh34', 'rakitovavr@google.com', 89198461532),
	(45, 'Марина', 'Романова', 'Ивановна', 'romanovami', 'ifnwiounfjkhfc4q8odnrwueqfb', 'romanovami@yandex.ru', 89198461533),
	(46, 'Наталья', 'Моисеева', 'Михайловна', 'moiseevanm', 'hajrdb2ri364dh28dhwuie79f6', 'moiseevanm@yandex.ru', 89198461534),
	(47, 'Валентина', 'Галкина', 'Аркадьевна', 'galkinava', 'sdjkyh498rncwy283hd29yc293', 'galkinava@mail.ru', 89168462535),
	(48, 'Татьяна', 'Ракшина', 'Анатольевна', 'rakshinata', 'we8h7ryc298rydb2yuer249f62', 'rakshinata@mail.ru', 89998462817),
	(49, 'Кирилл', 'Маляев', 'Валерьевич', 'malyaevkv', 'wiet7246hrd2i4hdr92487fh4837ft', 'malyaevkv@google.com', 89998462818);




-- карты учащихся (по ним сделана система прохода в школу и питания в столовой):
DROP TABLE IF EXISTS cards;
CREATE TABLE cards(
	id SERIAL,
	card_number INT(10) ZEROFILL UNSIGNED NOT NULL  COMMENT 'Номер, напечатанный на карте',
	balance INT UNSIGNED NOT NULL DEFAULT 0  COMMENT 'Баланс денег на карте',
	photo_id BIGINT UNSIGNED COMMENT 'Идентификатор файла из хранилища фотографий'
	
) COMMENT 'Карты учеников и сотрудников';

INSERT cards 
	(card_number)
VALUES
	(0001236541),
	(0000234515),
	(0001244243),
	(0032340864),
	(0008604235),
	(0071468640),
	(0075492346),
	(0004271941),
	(0009836467),
	(0001340346),
	(0005234802),
	(0003416034),
	(0001396473),
	(0003667997),
	(0037183679),
	(0009836764),
	(0012824797),
	(0011237236),
	(0011223787),
	(0011223347),
	(0011245797),
	(0011223349),
	(0011223350),
	(0011223351),
	(0011223352),
	(0011223353),
	(0011223354),
	(0011223355),
	(0011223356),
	(0011223357),
	(0011223358),
	(0011223359),
	(0011223360),
	(0011223361),
	(0011223362),
	(0011223363),
	(0011223364),
	(0011223365),
	(0011223366),
	(0011223367),
	(0011223368),
	(0011223369),
	(0011223370),
	(0011223371),
	(0011223373),
	(0011223374),
	(0011223375),
	(0011223376),
	(0011223377);


-- таблица учебных предметов:
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
	id SERIAL,
	name VARCHAR(50) NOT NULL COMMENT 'Название предмета',	
	is_actual BIT DEFAULT 1 NOT NULL COMMENT 'Ведётся ли предмет в школе',
	category ENUM('Естественные науки', 'Гумманитарные науки', 'Точные науки', 'Физический труд', 'Разное') NOT NULL COMMENT 'Категория предмета',

	PRIMARY KEY (id)
	 
) COMMENT 'Учебные предметы';


INSERT subjects 
	(name, category)
VALUES
	('Русский язык', 'Гумманитарные науки'),
	('Литература', 'Гумманитарные науки'),
	('МХК', 'Гумманитарные науки'),
	('История', 'Гумманитарные науки'),
	('Биология', 'Естественные науки'),
	('Физика', 'Естественные науки'),
	('Алгебра', 'Точные науки'),
	('Геометрия', 'Точные науки'),
	('Черчение', 'Разное'),
	('Физическая культура', 'Физический труд'),
	('Труд', 'Физический труд');

INSERT subjects 
	(name, is_actual, category)
VALUES
	('Основы религиозной этики', 0, 'Разное');

INSERT subjects 
	(name, category)
VALUES
	('ИЗО', 'Гумманитарные науки'),
	('Математика', 'Точные науки'),
	('Естествознание', 'Естественные науки'),
	('Начальное образование', 'Разное');





DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id BIGINT UNSIGNED NOT NULL UNIQUE COMMENT 'ID из таблицы users',
	gender ENUM('f', 'm') NOT NULL COMMENT 'Пол пользователя', -- пол
	birthday DATE NOT NULL COMMENT 'Дата рождения пользователя',
	photo_id BIGINT UNSIGNED COMMENT 'ID файла из хранилища фотографий',
    created_at DATETIME DEFAULT NOW() COMMENT 'Когда создана запись',
    updated_at DATETIME DEFAULT NOW() ON UPDATE NOW() COMMENT 'Когда запись в последний раз обновлена',
    -- id электронной карты:
    card_id BIGINT UNSIGNED UNIQUE COMMENT 'ID карты', -- нет параметра NOT NULL так как при поступлении могут не сразу выдать карту
    `role` ENUM ('Учащийся', 'Учитель', 'Завуч', 'Директор', 'Уборщик', 'Рабочий по зданию', 'Библиотекарь', 'Охранник') NOT NULL DEFAULT 'Учащийся' COMMENT 'Роль пользователя', 
    actual BIT NOT NULL DEFAULT 1 COMMENT 'Работает/учится ли пользователь в школе ',
    
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (card_id) REFERENCES cards(id)     
) COMMENT 'Профили пользователей';


INSERT profiles 
	(user_id, gender, birthday, created_at, card_id, `role`)
VALUES
	(1, 'f', '2005-05-15', '2012-06-10', 1, 'Учащийся'),
	(2, 'm', '1988-08-07', '2010-05-07', 2, 'Учитель'),
	(3, 'm', '2007-09-25', '2014-07-01', 3, 'Учащийся'),
	(4, 'f', '1990-04-19', '2015-10-18', 4, 'Учитель'),
	(5, 'm', '2010-03-03', '2007-06-19', 5, 'Учащийся'),
	(6, 'm', '2012-02-28', '2011-07-03', 6, 'Учащийся'),
	(7, 'm', '1987-11-14', '2013-11-04', 7, 'Директор'),
	(8, 'f', '1975-03-11', '2009-05-25', 8, 'Учитель'),
	(9, 'm', '2010-07-19', '2013-11-04', 9, 'Учащийся'),
	(10, 'm', '2009-04-10', '2013-11-04', 10, 'Учащийся'),
	(11, 'f', '2008-01-14', '2013-10-14', 11, 'Учащийся'),
	(12, 'f', '2010-06-16', '2007-06-10', 12, 'Учащийся'),
	(13, 'm', '1978-09-27', '2010-05-07', 13, 'Учитель'),
	(14, 'm', '2008-10-12', '2015-07-02', 14, 'Учащийся'),
	(15, 'f', '1989-04-08', '2017-07-13', 15, 'Учитель'),
	(16, 'm', '2011-04-20', '2018-06-10', 16, 'Учащийся'),
	(17, 'm', '2004-02-18', '2011-07-13', 17, 'Учащийся'),
	(18, 'm', '1987-11-14', '2013-11-04', 18, 'Завуч'),
	(19, 'f', '1975-03-11', '2009-05-25', 19, 'Учитель'),
	(20, 'm', '2009-12-01', '2016-05-29', 20, 'Учащийся'),
	(21, 'm', '2009-04-21', '2013-11-05', 21, 'Учащийся'),
	(22, 'f', '2010-05-06', '2007-06-10', 22, 'Учащийся'),
	(23, 'm', '1977-10-27', '2010-05-07', 23, 'Учитель'),
	(24, 'm', '2008-11-11', '2015-07-02', 24, 'Учащийся'),
	(25, 'f', '1988-03-09', '2017-07-13', 25, 'Учитель'),
	(26, 'm', '2010-02-21', '2018-06-10', 26, 'Учащийся'),
	(27, 'm', '2005-08-18', '2011-07-13', 27, 'Учащийся'),
	(28, 'm', '1987-12-14', '2013-11-04', 28, 'Завуч'),
	(29, 'f', '1975-03-22', '2009-05-25', 29, 'Учитель'),
	(30, 'm', '2009-10-01', '2016-05-29', 30, 'Учащийся'),
	(31, 'm', '1976-05-12', '2019-05-25', 31, 'Учитель'),
	(32, 'f', '1982-10-08', '2005-08-14', 32, 'Учитель'),
	(33, 'm', '1989-09-12', '2010-07-20', 33, 'Учитель'),
	(34, 'f', '1977-04-16', '2017-02-11', 34, 'Учитель'),
	(35, 'f', '1995-05-19', '2018-07-14', 35, 'Учитель'),
	(36, 'm', '1986-08-02', '2010-04-05', 36, 'Учитель'),
	(37, 'f', '1990-07-27', '2009-06-17', 37, 'Учитель'),
	(38, 'm', '1988-01-30', '2018-10-05', 38, 'Учитель'),
	(39, 'f', '1969-05-12', '2005-05-25', 39, 'Учитель'),
	(40, 'f', '1991-06-06', '2016-03-11', 40, 'Учитель'),
	(41, 'm', '1979-08-22', '2019-06-15', 41, 'Учитель'),
	(42, 'm', '1987-11-02', '2015-03-30', 42, 'Учитель'),
	(43, 'f', '1988-08-14', '2013-10-01', 43, 'Учитель'),
	(44, 'f', '1995-11-12', '2019-06-10', 44, 'Учитель'),
	(45, 'f', '1994-01-30', '2015-03-09', 45, 'Учитель'),
	(46, 'f', '1996-10-17', '2016-07-14', 46, 'Учитель'),
	(47, 'f', '1989-12-12', '2011-09-11', 47, 'Учитель'),
	(48, 'f', '1990-05-28', '2018-07-14', 48, 'Учитель'),
	(49, 'm', '2005-04-14', '2012-06-11', 49, 'Учащийся');



-- таблица зданий:
DROP TABLE IF EXISTS buildings;
CREATE TABLE buildings(
	id SERIAL,
	address VARCHAR(255) COMMENT 'Адрес здания',
	floors TINYINT(1) COMMENT 'Количество этажей в здании',
	-- branch_num TINYINT UNSIGNED NOT NULL UNIQUE, -- номер подразделения в сети школы
	is_main BIT DEFAULT 0 NOT NULL COMMENT 'Главное ли здание из всех',
	official_name VARCHAR(255) DEFAULT 'ГБОУ Школа №999' COMMENT 'Официальное полное название школы',	
	manager_id BIGINT UNSIGNED NOT NULL UNIQUE COMMENT 'ID управляющего корпусом',
	
	FOREIGN KEY (manager_id) REFERENCES users(id)	
) COMMENT 'Список корпусов';


INSERT buildings 
	(id, address, floors, is_main, manager_id)
VALUES
	(1, '540831, Москва, Новая ул., дом 301', 4, 1, 7),
	(2, '235346, Москва, 2-я Новая ул., дом 502', 4,  0, 4);



DROP TABLE IF EXISTS cabinet_assignment;
CREATE TABLE cabinet_assignment(
	id SERIAL,
	`assignment` VARCHAR(100) NOT NULL, -- назначение кабинета: ИЗО, Русский язык, Физика, Химия, кладовка
	
	PRIMARY KEY (id)
	
) COMMENT 'Назначения кабинетов и помещений';


INSERT cabinet_assignment 
	(`assignment`)
VALUES
	('Кладовая'),
	('Начальные классы'),
	('Русский язык'),
	('Математика'),
	('Физика'),
	('Химия'),
	('Литература'),
	('ИЗО'),
	('МХК'),
	('Кабинет трудов'),
	('Черчение'),
	('Иностранный язык'),
	('История'),
	('Физическая культура'),
	('Библиотека'),
	('Информатика'),
	('Столовая'),
	('Кабинет директора'),
	('Бухгалтерия'),
	('Кабинет психолога'),
	('Кабинет компьютерной техподдержки'),
	('Раздевалка'),
	('Подсобное помещение'),
	('Кабинет завуча');

-- SELECT * FROM cabinet_assignment

-- таблица кабинетов (всех, по всем зданиям):
DROP TABLE IF EXISTS cabinets;
CREATE TABLE cabinets(
	id SERIAL,
	building_id BIGINT UNSIGNED NOT NULL COMMENT 'ID здания',
	cabinet_number INT UNSIGNED NOT NULL COMMENT 'Номер кабинета',
	`floor` TINYINT UNSIGNED NOT NULL COMMENT 'Этаж расположения', -- этаж	
	assignment_id BIGINT UNSIGNED NOT NULL COMMENT 'ID назначения кабинета', -- назначение кабинета: ИЗО, Русский язык, Физика, Химия, кладовка
	
	PRIMARY KEY (id, building_id, cabinet_number),
	FOREIGN KEY (building_id) REFERENCES buildings(id),
	FOREIGN KEY (assignment_id) REFERENCES cabinet_assignment(id)	
	
) COMMENT 'Кабинеты';

INSERT cabinets 
	(building_id, cabinet_number, `floor`, assignment_id)
VALUES
	(1, 101, 1, 18),
	(1, 102, 1, 2),
	(1, 103, 1, 2),
	(1, 104, 1, 2),
	(1, 105, 1, 2),
	(1, 106, 1, 2),
	(1, 107, 1, 24),
	(1, 108, 1, 19),
	(1, 109, 1, 2),
	(1, 110, 1, 17),
	(1, 111, 1, 1),
	(1, 112, 1, 23),
	(1, 113, 1, 10),
	(1, 201, 2, 3),
	(1, 202, 2, 7),
	(1, 203, 2, 8),
	(1, 204, 2, 9),
	(1, 205, 2, 1),
	(1, 206, 2, 3),
	(1, 208, 2, 7),
	(1, 209, 2, 6),
	(1, 210, 2, 5),
	(1, 211, 2, 1),
	(1, 212, 2, 5),
	(1, 213, 2, 13),
	(1, 301, 3, 4),
	(1, 302, 3, 4),
	(1, 303, 3, 4),
	(1, 304, 3, 11),
	(1, 305, 3, 1),
	(1, 306, 3, 16),
	(1, 307, 3, 16),
	(1, 308, 3, 4),
	(1, 309, 3, 20),
	(1, 310, 3, 24),
	(1, 311, 3, 1),
	(1, 312, 3, 21),
	-- второе здание:
	(2, 101, 1, 18),
	(2, 102, 1, 2),
	(2, 103, 1, 2),
	(2, 104, 1, 2),
	(2, 105, 1, 2),
	(2, 106, 1, 2),
	(2, 107, 1, 24),
	(2, 108, 1, 19),
	(2, 109, 1, 2),
	(2, 110, 1, 17),
	(2, 111, 1, 1),
	(2, 112, 1, 23),
	(2, 113, 1, 10),
	(2, 201, 2, 3),
	(2, 202, 2, 7),
	(2, 203, 2, 8),
	(2, 204, 2, 9),
	(2, 205, 2, 1),
	(2, 206, 2, 3),
	(2, 208, 2, 7),
	(2, 209, 2, 6),
	(2, 210, 2, 5),
	(2, 211, 2, 1),
	(2, 212, 2, 5),
	(2, 213, 2, 13),
	(2, 301, 3, 4),
	(2, 302, 3, 4),
	(2, 303, 3, 4),
	(2, 304, 3, 11),
	(2, 305, 3, 1),
	(2, 306, 3, 16),
	(2, 307, 3, 16),
	(2, 308, 3, 4),
	(2, 309, 3, 20),
	(2, 310, 3, 24),
	(2, 311, 3, 1),
	(2, 312, 3, 21);



-- перечень классов в школе:
DROP TABLE IF EXISTS classes;
CREATE TABLE classes(
	id SERIAL,
	num ENUM ('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11') NOT NULL DEFAULT '1' COMMENT 'Номер класса',
	letter CHAR(1) NOT NULL COMMENT 'Буква класса',
	building_id BIGINT UNSIGNED NOT NULL COMMENT 'ID здания, в котором располагается класс',
	classmanager_id BIGINT UNSIGNED NOT NULL COMMENT 'ID классного руководителя',
	cabinet_id BIGINT UNSIGNED NOT NULL COMMENT 'ID кабинета, в котором располагается класс',
	-- добавить:
	is_actual BIT DEFAULT 1 NOT NULL COMMENT 'Архивирован ли класс', -- есть ли класс в школе, или он архивный
	
	PRIMARY KEY (id, num, letter),	
	FOREIGN KEY (building_id) REFERENCES buildings(id),
	FOREIGN KEY (cabinet_id) REFERENCES cabinets(id)	
) COMMENT 'Учебные классы';

INSERT classes 
	(num, letter, building_id, classmanager_id, cabinet_id)
VALUES
	('1', 'a', 1, 45, 1),
	('2', 'a', 1, 46, 2),
	('3', 'a', 1, 47, 3),
	('4', 'a', 1, 48, 4),
	('1', 'б', 1, 13, 5),
	('2', 'б', 1, 13, 6),
	('3', 'б', 1, 13, 9),
	('4', 'б', 1, 13, 39),
	('1', 'в', 1, 13, 40),
	('2', 'в', 1, 13, 41),
	('3', 'в', 1, 13, 42),
	('4', 'в', 1, 13, 43),
	('5', 'a', 1, 13, 14),
	('6', 'a', 1, 13, 19),
	('7', 'a', 1, 13, 51),
	('8', 'a', 1, 13, 56),
	('5', 'б', 1, 13, 26),
	('6', 'б', 1, 13, 27),
	('7', 'б', 1, 13, 28),
	('8', 'б', 1, 13, 33),
	('5', 'в', 1, 13, 63),
	('6', 'в', 1, 13, 64),
	('7', 'в', 1, 13, 65),
	('8', 'в', 1, 13, 70),
	('1', 'г', 2, 19, 22),
	('2', 'г', 2, 19, 24),
	('3', 'г', 2, 19, 59),
	('4', 'г', 2, 19, 61),
	('1', 'д', 2, 19, 21),
	('2', 'д', 2, 19, 58),
	('3', 'д', 2, 19, 15),
	('4', 'д', 2, 19, 20),
	('1', 'е', 2, 19, 52),
	('2', 'е', 2, 19, 57),
	('3', 'е', 2, 19, 16),
	('4', 'е', 2, 19, 17),
	('5', 'г', 2, 19, 25),
	('6', 'г', 2, 19, 62),
	('7', 'г', 2, 19, 31),
	('8', 'г', 2, 19, 32),
	('5', 'д', 2, 19, 68),
	('6', 'д', 2, 19, 69),
	('7', 'д', 2, 19, 53),
	('8', 'д', 2, 19, 13),
	('5', 'е', 2, 19, 50),
	('6', 'е', 2, 19, 29),
	('7', 'е', 2, 19, 66),
	('8', 'е', 2, 19, 25),
	('11', 'a', 2, 19, 25);


DROP TABLE IF EXISTS users_classes;
CREATE TABLE users_classes (
	user_id BIGINT UNSIGNED NOT NULL COMMENT 'ID ученика',
	class_id BIGINT UNSIGNED NOT NULL COMMENT 'ID класса, в который зачислен ученик',
	
	PRIMARY KEY (user_id, class_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (class_id) REFERENCES classes(id)
) COMMENT 'Ученики в классах';

INSERT users_classes 
	(user_id, class_id)
VALUES
	(1, 49),
	(3, 19),
	(5, 3),
	(6, 2),
	(9, 3),
	(10, 4),
	(11, 4),
	(12, 3),
	(14, 13),
	(16, 2),
	(17, 49),
	(20, 4),
	(21, 4),
	(22, 3),
	(24, 13),
	(26, 3),
	(27, 16),
	(30, 4),
	(49, 49);

-- таблица по назначению учителям учебных предметов:
DROP TABLE IF EXISTS users_subjects;
CREATE TABLE users_subjects(
	user_id BIGINT UNSIGNED NOT NULL COMMENT 'ID учителя',
	subject_id BIGINT UNSIGNED NOT NULL COMMENT 'ID учебного предмета',
	
	PRIMARY KEY (user_id, subject_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (subject_id) REFERENCES subjects(id)
) COMMENT 'Назначение предметов учителям';

INSERT users_subjects 
	(user_id, subject_id)
VALUES
	(2, 6),
	(4, 1),
	(8, 2),
	(13, 6),
	(15, 1),
	(19, 2),
	(23, 6),
	(25, 1),
	(29, 2),
	(45, 16),
	(46, 16),
	(47, 16),
	(48, 16),
	(31, 1),
	(32, 2),
	(33, 3),
	(34, 4),
	(35, 5),
	(36, 6),
	(37, 7),
	(38, 8),
	(39, 9),
	(40, 10),
	(41, 10),
	(42, 11),
	(43, 11),
	(44, 13);


-- Периоды учебных четвертей/триместров
DROP TABLE IF EXISTS education_pedriods;
CREATE TABLE education_pedriods (	
	id SERIAL,
	period_name VARCHAR(25) COMMENT 'Название учебного периода',
	period_start DATE NOT NULL COMMENT 'Дата начала учебного периода',
	period_end DATE NOT NULL COMMENT 'Дата окончания учебного периода',
	
	PRIMARY KEY (id),
	CHECK (period_start <> period_end)
) COMMENT 'Периоды учебных четвертей/триместров';


INSERT education_pedriods
	(period_name, period_start, period_end)
VALUES
	('Первая четверть', '2020-09-01', '2020-10-30'),
	('Вторая четверть', '2020-11-02', '2020-12-29'),
	('Третья четверть', '2021-01-11', '2021-03-19'),
	('Четвёртая четверть', '2021-03-29', '2021-05-30');

-- вермя начала уроков:
DROP TABLE IF EXISTS intervalues;
CREATE TABLE intervalues (	
	id TINYINT UNSIGNED NOT NULL UNIQUE, -- в таблице должно быть ровно такое количество записей, сколько уроков предполагается.
	start_time TIME NOT NULL  COMMENT 'Время начала урока',
	intervalue TIME NOT NULL DEFAULT '00:45:00' COMMENT 'Длительность урока',
	end_time TIME COMMENT 'Время окончания урока',
	
	PRIMARY KEY (id)	
) COMMENT 'Вермя начала и конца уроков';

INSERT intervalues 
	(id, start_time)
VALUES
	(1, '8:30'),
	(2, '9:25'),
	(3, '10:20'),
	(4, '11:25'),
	(5, '12:20'),
	(6, '13:15'),
	(7, '14:10');


-- общее расписание уроков:
DROP TABLE IF EXISTS timetable;
CREATE TABLE timetable(
	id SERIAL,
	class_id BIGINT UNSIGNED NOT NULL COMMENT 'ID учебного класса',
	subject_id BIGINT UNSIGNED NOT NULL COMMENT 'ID учебного предмета',
	`date` DATE NOT NULL COMMENT 'Дата проводимого урока',
	intervalues_id TINYINT UNSIGNED NOT NULL COMMENT 'Номер урока в день по счёту',
	teacher_id BIGINT UNSIGNED NOT NULL COMMENT 'ID учителя, ведушего урок',
	
	PRIMARY KEY (class_id, subject_id, `date`, teacher_id, intervalues_id), -- для уникальности значений "в какой день урок" и "какой по счёту в день урок"
	FOREIGN KEY (intervalues_id) REFERENCES intervalues(id),
	FOREIGN KEY (class_id) REFERENCES classes(id),
	FOREIGN KEY (subject_id) REFERENCES subjects(id)
	
) COMMENT 'Расписание уроков';

CREATE INDEX data_when ON timetable (`date`); -- для создания первичного ключа


INSERT timetable 
	(class_id, subject_id, `date`, intervalues_id, teacher_id)
VALUES
	-- 2а
	(2, 1, '2020-09-07', 1, 45),
	(2, 14, '2020-09-07', 2, 45),
	(2, 13, '2020-09-07', 3, 45),
	(2, 15, '2020-09-08', 1, 45),
	(2, 14, '2020-09-08', 2, 45),
	(2, 3, '2020-09-08', 3, 45),
	(2, 1, '2020-09-09', 1, 45),
	(2, 14, '2020-09-09', 2, 45),
	(2, 13, '2020-09-09', 3, 45),
	(2, 14, '2019-09-10', 1, 45),
	(2, 11, '2019-09-10', 2, 45),
	(2, 15, '2019-09-10', 3, 45),
	(2, 1, '2019-09-11', 1, 45),
	(2, 14, '2019-09-11', 2, 45),
	(2, 10, '2019-09-11', 3, 19), 
	
	-- 3а
	(3, 14, '2020-09-07', 1, 46),
	(3, 15, '2020-09-07', 2, 46),
	(3, 1, '2020-09-07', 3, 46),
	(3, 14, '2020-09-08', 1, 46),
	(3, 1, '2020-09-08', 2, 46),
	(3, 10, '2020-09-08', 3, 19),
	(3, 1, '2020-09-09', 1, 46),
	(3, 14, '2020-09-09', 2, 46),
	(3, 13, '2020-09-09', 3, 46),
	(3, 1, '2020-09-10', 1, 46),
	(3, 14, '2020-09-10', 2, 46),
	(3, 15, '2020-09-10', 3, 46),
	(3, 3, '2020-09-11', 1, 46),
	(3, 1, '2020-09-11', 2, 46),
	(3, 13, '2020-09-11', 3, 46),
	
	-- 4а
	(4, 1, '2020-09-07', 1, 48),
	(4, 14, '2020-09-07', 2, 48),
	(4, 3, '2020-09-07', 3, 48),
	(4, 13, '2020-09-07', 4, 48),
	(4, 5, '2020-09-08', 1, 48),
	(4, 1, '2020-09-08', 2, 48),
	(4, 15, '2020-09-08', 3, 48),
	(4, 10, '2020-09-08', 4, 19),
	(4, 1, '2020-09-09', 1, 48),
	(4, 14, '2020-09-09', 2, 48),
	(4, 3, '2020-09-09', 3, 48),
	(4, 13, '2020-09-09', 4, 48),
	(4, 1, '2020-09-10', 1, 48),
	(4, 3, '2020-09-10', 2, 48),
	(4, 4, '2020-09-10', 3, 48),
	(4, 5, '2020-09-10', 4, 48),
	(4, 1, '2020-09-11', 1, 48),
	(4, 15, '2020-09-11', 2, 48),
	(4, 3, '2020-09-11', 3, 48),
	(4, 14, '2020-09-11', 4, 48),
	
	-- 5а
	(13, 7, '2020-09-07', 1, 37),
	(13, 1, '2020-09-07', 2, 4),
	(13, 4, '2020-09-07', 3, 34),
	(13, 5, '2020-09-07', 4, 35),
	(13, 3, '2020-09-07', 5, 33),
	(13, 1, '2020-09-08', 1, 4),
	(13, 2, '2020-09-08', 2, 32),
	(13, 3, '2020-09-08', 3, 33),
	(13, 8, '2020-09-08', 4, 38),
	(13, 6, '2020-09-08', 5, 36),
	(13, 8, '2020-09-09', 1, 38),
	(13, 7, '2020-09-09', 2, 37),
	(13, 4, '2020-09-09', 3, 34),
	(13, 2, '2020-09-09', 4, 32),
	(13, 10, '2020-09-09', 5, 19),
	(13, 5, '2020-09-10', 1, 35),
	(13, 6, '2020-09-10', 2, 36),
	(13, 1, '2020-09-10', 3, 4),
	(13, 7, '2020-09-10', 4, 37),
	(13, 11, '2020-09-10', 5, 42),
	(13, 1, '2020-09-11', 1, 4),
	(13, 2, '2020-09-11', 2, 32),
	(13, 3, '2020-09-11', 3, 33),
	(13, 8, '2020-09-11', 4, 38),
	(13, 6, '2020-09-11', 5, 36),
	
	
	-- 8а
	(16, 6, '2020-09-07', 1, 36),
	(16, 7, '2020-09-07', 2, 37),
	(16, 1, '2020-09-07', 3, 4),
	(16, 2, '2020-09-07', 4, 32),
	(16, 4, '2020-09-07', 5, 34),
	(16, 10, '2020-09-07', 6, 41),
	(16, 7, '2020-09-08', 1, 37),
	(16, 8, '2020-09-08', 2, 38),
	(16, 9, '2020-09-08', 3, 39),
	(16, 1, '2020-09-08', 4, 4),
	(16, 2, '2020-09-08', 5, 32),
	(16, 11, '2020-09-08', 6, 42),
	(16, 1, '2020-09-09', 1, 4),
	(16, 3, '2020-09-09', 2, 33),
	(16, 2, '2020-09-09', 3, 32),
	(16, 7, '2020-09-09', 4, 37),
	(16, 4, '2020-09-09', 5, 34),
	(16, 7, '2020-09-10', 1, 37),
	(16, 8, '2020-09-10', 2, 38),
	(16, 9, '2020-09-10', 3, 39),
	(16, 1, '2020-09-10', 4, 4),
	(16, 2, '2020-09-10', 5, 32),
	(16, 11, '2020-09-10', 6, 42),
	(16, 1, '2020-09-11', 1, 4),
	(16, 2, '2020-09-11', 2, 32),
	(16, 3, '2020-09-11', 3, 33),
	(16, 7, '2020-09-11', 4, 37),
	(16, 8, '2020-09-11', 5, 38),
	(16, 11, '2020-09-11', 6, 42),
	
	-- 7б
	(19, 6, '2020-09-07', 1, 36),
	(19, 4, '2020-09-07', 2, 34),
	(19, 5, '2020-09-07', 3, 35),
	(19, 7, '2020-09-07', 4, 37),
	(19, 3, '2020-09-07', 5, 33),
	(19, 4, '2020-09-08', 1, 34),
	(19, 3, '2020-09-08', 2, 33),
	(19, 1, '2020-09-08', 3, 4),
	(19, 2, '2020-09-08', 4, 32),
	(19, 11, '2020-09-08', 5, 42),
	(19, 11, '2020-09-08', 6, 42),
	(19, 7, '2020-09-09', 1, 37),
	(19, 8, '2020-09-09', 2, 38),
	(19, 6, '2020-09-09', 3, 36),
	(19, 1, '2020-09-09', 4, 4),
	(19, 2, '2020-09-09', 5, 32),
	(19, 10, '2020-09-09', 6, 41),
	(19, 4, '2020-09-10', 1, 34),
	(19, 5, '2020-09-10', 2, 35),
	(19, 3, '2020-09-10', 3, 33),
	(19, 1, '2020-09-10', 4, 4),
	(19, 2, '2020-09-10', 5, 32),
	(19, 2, '2020-09-10', 6, 32),	
	(19, 6, '2020-09-11', 1, 36),
	(19, 7, '2020-09-11', 2, 37),
	(19, 8, '2020-09-11', 3, 38),
	(19, 3, '2020-09-11', 4, 33),
	(19, 5, '2020-09-11', 5, 35),
	
	-- 11а
	(49, 1, '2020-09-07', 1, 15),
	(49, 2, '2020-09-07', 2, 32),
	(49, 7, '2020-09-07', 3, 37),
	(49, 7, '2020-09-07', 4, 37),
	(49, 8, '2020-09-07', 5, 38),
	(49, 5, '2020-09-07', 6, 35),
	(49, 7, '2020-09-08', 1, 37),
	(49, 7, '2020-09-08', 2, 37),
	(49, 8, '2020-09-08', 3, 38),
	(49, 4, '2020-09-08', 4, 34),
	(49, 9, '2020-09-08', 5, 39),
	(49, 9, '2020-09-08', 6, 39),
	(49, 6, '2020-09-09', 1, 36),
	(49, 6, '2020-09-09', 2, 36),
	(49, 1, '2020-09-09', 3, 15),
	(49, 1, '2020-09-09', 4, 15),
	(49, 8, '2020-09-09', 5, 38),
	(49, 10, '2020-09-09', 6, 41),
	(49, 1, '2020-09-10', 1, 15),
	(49, 2, '2020-09-10', 2, 32),
	(49, 7, '2020-09-10', 3, 37),
	(49, 7, '2020-09-10', 4, 37),
	(49, 8, '2020-09-10', 5, 38),
	(49, 5, '2020-09-10', 6, 35),
	(49, 1, '2020-09-11', 1, 15),
	(49, 2, '2020-09-11', 2, 32),
	(49, 1, '2020-09-11', 3, 4),
	(49, 7, '2020-09-11', 4, 37),
	(49, 8, '2020-09-11', 5, 38),
	(49, 5, '2020-09-11', 6, 35);



DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
	id SERIAL,
	student_id BIGINT UNSIGNED NOT NULL COMMENT 'ID ученика',
	timetable_id BIGINT UNSIGNED NOT NULL COMMENT 'ID урока в расписании', -- за ним подтянется учитель и предмет
	grade_type ENUM ('Работа на уроке', 'Домашнее задание', 'Контрольная работа', 'Иное') NOT NULL DEFAULT 'Работа на уроке' COMMENT 'Тип оцениваемой работы',
	`comment` VARCHAR(255) DEFAULT NULL COMMENT 'Комментарий',
	grade ENUM('1', '2', '3', '4', '5', 'зачтено', 'не зачтено') NOT NULL,

	FOREIGN KEY (student_id) REFERENCES users(id),
	FOREIGN KEY (timetable_id) REFERENCES timetable(id)		
) COMMENT 'Оценки по предметам';


INSERT grades 
	(student_id, timetable_id, grade_type, `comment`, grade)
VALUES
	(6, 1, 'Работа на уроке', NULL, '5'),
	(6, 7, 'Работа на уроке', NULL, '4'),
	(6, 10, 'Работа на уроке', NULL, '4'),
	(9, 16, 'Работа на уроке', NULL, '4'),
	(9, 24, 'Работа на уроке', NULL, '5'),
	(22, 16, 'Работа на уроке', NULL, '5'),
	(22, 17, 'Иное', NULL, '3'),-- 3а
	(10, 35, 'Работа на уроке', NULL, '4'),
	(10, 39, 'Работа на уроке', NULL, '5'),
	(11, 42, 'Работа на уроке', NULL, '5'),
	(11, 43, 'Домашнее задание', NULL, '5'),
	(21, 46, 'Работа на уроке', NULL, '5'),
	(21, 47, 'Работа на уроке', NULL, '3'),
	(27, 150, 'Работа на уроке', NULL, '5'),
	(27, 151, 'Домашнее задание', NULL, '4'),
	(3, 102, 'Работа на уроке', NULL, '4'),
	(3, 97, 'Работа на уроке', NULL, '5'),
	(1, 133, 'Работа на уроке', NULL, '5'),
	(1, 135, 'Работа на уроке', NULL, '4'),
	(1, 144, 'Работа на уроке', NULL, '5'),
	(1, 146, 'Домашнее задание', NULL, '5'),
	(1, 147, 'Работа на уроке', NULL, '5'),
	(17, 135, 'Работа на уроке', NULL, '4'),
	(17, 144, 'Работа на уроке', NULL, '4'),
	(17, 146, 'Домашнее задание', NULL, '4'),
	(17, 147, 'Иное', NULL, '4'),
	(17, 153, 'Работа на уроке', NULL, '4'),
	(49, 153, 'Работа на уроке', NULL, '5'),
	(49, 147, 'Работа на уроке', NULL, '4'),
	(49, 146, 'Иное', NULL, '3');


-- таблица с домашними заданиями:
DROP TABLE IF EXISTS homeworks;
CREATE TABLE homeworks (
	id SERIAL,
	homework VARCHAR(255) DEFAULT '(нет) 'COMMENT 'Описание задания',		
	teacher_id BIGINT UNSIGNED NOT NULL COMMENT 'ID учителя, кто задал задание',	
	timetable_id BIGINT UNSIGNED NOT NULL COMMENT 'ID записи из таблицы расписания',
	
	PRIMARY KEY (id),
	FOREIGN KEY (teacher_id) REFERENCES users(id),
	FOREIGN KEY (timetable_id) REFERENCES timetable(id)	
	
) COMMENT 'Домашние задания';

INSERT homeworks
	/* teacher_id оставил здесь, чтобы знать кто задал дз, так как
	 дз могут задавать учителя, замещающие основных */
	(homework, timetable_id, teacher_id)
VALUES
	('Прочитать главу 1', 12, 46),
	('Выполнить упражнение 2', 6, 46),
	('Выполнить упражнение 4', 8, 47),
	('Прочитать параграф 2', 27, 47),
	('Выполнить упражнение 5', 29, 47),
	('Выполнить упражнение 3', 29, 48),
	('Прочитать главу 3', 35, 48),
	('Выучить правила 1,3,8', 56, 4),
	('Прочитать рассказ', 72, 32),
	('Прочитать главу 2, решить задачи 1,2', 67, 36),
	('Прочитать параграф 4, выучить правила 1,3', 85, 4),
	('Прочитать главу 3, выучить даты', 92, 34),
	('Задачи №№ 3, 6', 93, 37),
	('Прочитать главу №1', 112, 38),
	('Прочитать параграф про грибы', 123, 32),
	('Задачи №№ 2, 3', 116, 37),
	('Прочитать параграф №1', 147, 15),
	('Прочитать рассказ', 152, 32),
	('Прочитать главу 2; задача № 3', 145, 36),
	('Задачи №№ 7, 8', 161, 38);






/* --- Запросы --- */


-- оценки конкретного ученика по конкретному предмету:
SELECT 
	CONCAT(u.firstname, ' ',u.lastname) AS 'Имя, фамилия',
	t.`date` AS 'Дата',
	s.name AS 'Урок',
	g.grade AS 'Оценка',
	g.grade_type AS 'Тип оцениваемой работы', 
	g.comment AS 'Комментарий'
FROM grades g 
JOIN users u 
	ON g.student_id = u.id 
JOIN timetable t
	ON t.id = g.timetable_id
JOIN subjects s
	ON s.id = t.subject_id
WHERE 
	s.id = (SELECT id FROM subjects WHERE name = 'Алгебра')
	AND u.id = 17;


-- все оценки по всем предметам конкретного ученика:
SELECT 
	CONCAT(u.firstname, ' ',u.lastname) AS 'Имя, Фамилия',
	t.`date` AS 'Дата',
	s.name AS 'Предмет',
	g.grade AS 'Оценка',
	g.grade_type AS 'Оценка за',
	g.comment AS 'Комментарии'
FROM grades g 
JOIN users u 
	ON g.student_id = u.id 
JOIN timetable t
	ON t.id = g.timetable_id
JOIN subjects s
	ON s.id = t.subject_id
-- присоединение таблицы profiles для определения актуальности профиля:
JOIN profiles p
	ON p.user_id = 17 -- ID ученика
WHERE u.id = 17 AND -- ID ученика
	p.actual = 1 AND s.is_actual = 1; -- указатель актуального профиля и предмета



/* --- Представления ---  */

-- представление всех учеников школы по классам:
CREATE OR REPLACE VIEW view_all_students AS 
SELECT 
	CONCAT(u.firstname, ' ', u.lastname) AS student,
	CONCAT(c.num, ' ', c.letter) AS class
FROM users u 
JOIN classes c 
JOIN users_classes uc
	ON uc.user_id = u.id AND c.id = uc.class_id;

-- SELECT * FROM view_all_students;


-- представление для просмотра какой учитель что ведёт:
CREATE OR REPLACE VIEW teachers_subjects AS
SELECT 
	CONCAT(u.firstname, ' ', u.lastname) AS 'Учитель', 
	s.name AS 'Предмет'	
FROM users u
JOIN users_subjects us
	ON us.user_id = u.id
JOIN subjects s 
	ON s.id = us.subject_id;
	
-- SELECT * FROM teachers_subjects;	


-- представление для просмотра классных руководителей:
CREATE OR REPLACE VIEW classmanagers AS
SELECT 
	CONCAT(c.num, ' ',UPPER(c.letter)) AS 'Класс',
	CONCAT(u.firstname, ' ', u.lastname) AS 'Имя, фамилия'
	
FROM classes c 
JOIN users u 
	ON c.classmanager_id = u.id;		

-- SELECT * FROM classmanagers;


-- представление всех предметов в школе:
CREATE OR REPLACE VIEW subjects_view AS 
SELECT 
	id, 
	name AS 'Предмет',
	-- is_actual AS 'Актуальность',
	CASE
		WHEN is_actual = 1
			THEN 'Ведётся'
		WHEN is_actual = 0
			THEN 'Не ведётся'
	END AS 'Актуальность', 
	category AS 'Категория' 
FROM subjects;



-- представление кабинетов для первого здания:
CREATE OR REPLACE VIEW first_bulding_cabinets AS
SELECT 
	cabinet_number AS 'Номер кабинета', 
	`assignment` AS 'Назначение кабинета', 
	`floor` AS 'Этаж' 
FROM
	cabinets c
JOIN 
	cabinet_assignment ca 
ON 
	c.assignment_id = ca.id
WHERE 
	building_id = 1;
	


-- представление кабинетов для второго здания:
CREATE OR REPLACE VIEW second_bulding_cabinets AS
SELECT 
	cabinet_number AS 'Номер кабинета', 
	`assignment` AS 'Назначение кабинета', 
	`floor` AS 'Этаж' 
FROM
	cabinets c
JOIN 
	cabinet_assignment ca 
ON 
	c.assignment_id = ca.id
WHERE 
	building_id = 2;
	


-- представление расписания звонков:
CREATE OR REPLACE VIEW rings_time AS
SELECT 
	i.id, 
	i.start_time, 
	(ADDTIME(i.start_time, i.intervalue)) AS end_time
FROM 
	intervalues i;




/* представление расписания уроков всех учеников
 * (используется в дальнейшем для дневника учеников
 *  и расписания учителей): 
 */
CREATE OR REPLACE VIEW student_timetable AS
SELECT 
	t.id, t.class_id, 
	s.name, 
	t.`date`, 
	DAYNAME(t.`date`), 
	t.intervalues_id
FROM subjects s 
JOIN timetable t 
	ON t.subject_id = s.id 
ORDER BY DAYNAME(t.`date`);




/* расписание уроков для всех учителей
 * (используется далее для расписания конкретного учителя):
 */
CREATE OR REPLACE VIEW teacher_timetable AS 
SELECT 
	t.`date`, 
	DAYNAME(t.`date`) AS day_name, 
	-- t.class_id,
	CONCAT(c.num,c.letter) AS class,
	t.intervalues_id,
	t.teacher_id 
FROM timetable t
JOIN classes c
	ON c.id = t.class_id
ORDER BY t.`date`, t.intervalues_id;



-- представление на все оценки по всем предметам конкретного ученика:
CREATE OR REPLACE VIEW view_one_stud_grades AS
SELECT 
	CONCAT(u.firstname, ' ',u.lastname) AS 'Имя, Фамилия',
	t.`date` AS 'Дата',
	s.name AS 'Предмет',
	g.grade AS 'Оценка',
	g.grade_type AS 'Оценка за',
	g.comment AS 'Комментарии'
FROM grades g 
JOIN users u 
	ON g.student_id = u.id 
JOIN timetable t
	ON t.id = g.timetable_id
JOIN subjects s
	ON s.id = t.subject_id
-- присоединение таблицы profiles для определения актуальности профиля:
JOIN profiles p
	ON p.user_id = 17 -- ID ученика
WHERE u.id = 17 AND -- ID ученика
	p.actual = 1 AND s.is_actual = 1; -- указатель актуальности профиля пользователя и предмета

	


-- средняя оценка конкретного ученика по конкретному предмету:
CREATE OR REPLACE VIEW average_grade AS
SELECT 
	SUM(g.grade)/COUNT(g.grade)
FROM grades g 
JOIN users u 
	ON g.student_id = u.id
JOIN timetable t
	ON t.id = g.timetable_id
JOIN subjects s
	ON s.id = t.subject_id
-- присоединение таблицы profiles для определения актуальности профиля:
JOIN profiles p
WHERE s.id = 7 
	AND u.id = 17 
	AND p.actual = 1 AND s.is_actual = 1; -- указатель актуальности профиля пользователя и предмета



	
-- представление по оценкам определённого класса по определённому предмету:
CREATE OR REPLACE VIEW view_class_by_subject AS 
SELECT 
	CONCAT(u.firstname, ' ', u.lastname) AS student,
	g.grade,
	t.`date`,
	s.name 
FROM users_classes uc
JOIN users u 
	ON uc.user_id = u.id
JOIN timetable t
	ON t.class_id = uc.class_id
JOIN grades g
	ON g.student_id = u.id AND g.timetable_id = t.id
JOIN subjects s
	ON s.id = t.subject_id 
WHERE t.class_id = 49 AND t.subject_id = 7; -- ID класса и предмета





/* --- Триггеры --- */



DELIMITER //

-- проверка на актуальность вставляемой в таблицу user-classes информации:
DROP TRIGGER IF EXISTS tg_check_actual_student_class//
CREATE TRIGGER `tg_check_actual_student_class` BEFORE INSERT ON `users_classes` FOR EACH ROW

	IF 
		NEW.user_id IN (SELECT user_id FROM profiles WHERE actual = 0)
	THEN 
		SIGNAL SQLSTATE '45059'
			SET MESSAGE_TEXT = 'Невозможно добавить неактуального пользователя!';
	ELSE
		IF 
			NEW.class_id IN (SELECT id FROM classes WHERE is_actual = 0)
		THEN 
			SIGNAL SQLSTATE '45060'
				SET MESSAGE_TEXT = 'Невозможно добавить пользователя в неактуальный класс!';
		END IF;
	END IF;	
//


-- проверка на актуальность вставляемой в таблицу users_subjects информации:
DROP TRIGGER IF EXISTS tg_check_actual_teacher_subj//
CREATE TRIGGER `tg_check_actual_teacher_subj` BEFORE INSERT ON `users_subjects` FOR EACH ROW

	IF 
		NEW.user_id IN (SELECT user_id FROM profiles WHERE actual = 0)
	THEN 
		SIGNAL SQLSTATE '45059'
			SET MESSAGE_TEXT = 'Невозможно добавить неактуального пользователя!';
	ELSE
		IF 
			NEW.subject_id IN (SELECT id FROM subjects WHERE is_actual = 0)
		THEN 
			SIGNAL SQLSTATE '45061'
				SET MESSAGE_TEXT = 'Невозможно добавить неактуальный предмет!';
		END IF;
	END IF;	
//


-- триггер на проверку, чтобы классным руководителем мог быть только учитель, завучи или директор:
-- на вставку данных:
DROP TRIGGER IF EXISTS school_global_db.tg_classmngr_role_ins//
CREATE TRIGGER `tg_classmngr_role_ins` BEFORE INSERT ON `classes`FOR EACH ROW 
	IF 
		(SELECT p.`role` FROM profiles p WHERE p.user_id = NEW.classmanager_id) NOT IN ('Учитель', 'Завуч', 'Директор')
	THEN 
		SIGNAL SQLSTATE '45047'
				SET MESSAGE_TEXT = 'Только директор или учитель может быть классным руководителем!';
	ELSE
		IF
			NEW.classmanager_id IN (SELECT user_id FROM profiles WHERE actual = 0)
		THEN 
			SIGNAL SQLSTATE '45059'
				SET MESSAGE_TEXT = 'Невозможно назначить классным руководителем неактуального пользователя!';
		END IF;
	END IF;
//

-- на обновление данных:
DROP TRIGGER IF EXISTS school_global_db.tg_classmngr_role_upd//
CREATE TRIGGER `tg_classmngr_role_upd` BEFORE UPDATE ON `classes`FOR EACH ROW 
	IF 
		(SELECT p.`role` FROM profiles p WHERE p.user_id = NEW.classmanager_id) NOT IN ('Учитель', 'Завуч', 'Директор')
	THEN 
		SIGNAL SQLSTATE '45047'
				SET MESSAGE_TEXT = 'Только директор или учитель может быть классным руководителем!';
	ELSE
		IF
			NEW.classmanager_id IN (SELECT user_id FROM profiles WHERE actual = 0)
		THEN 
			SIGNAL SQLSTATE '45059'
				SET MESSAGE_TEXT = 'Невозможно назначить классным руководителем неактуального пользователя!';
		END IF;
	END IF;
//


-- триггер, проверяющий добавление оценки пользователю с ролью "Учащийся":
DROP TRIGGER IF EXISTS tg_check_student_for_grade//
CREATE TRIGGER tg_check_student_for_grade
BEFORE INSERT
ON grades FOR EACH ROW
	
	IF 
		grades.student_id NOT IN (SELECT u.id FROM users u WHERE `role` = 'Учащийся')
	THEN
		SIGNAL SQLSTATE '45050'
				SET MESSAGE_TEXT = 'Невозможно добавить оценку: выбранный пользователь не ученик!';
	ELSE
		IF 
			grades.student_id IN (SELECT p.user_id FROM profiles p WHERE p.actual = 0)
		THEN
			SIGNAL SQLSTATE '45049'
					SET MESSAGE_TEXT = 'Невозможно добавить оценку неактуальному ученику!';
		END IF;
	END IF;	
//	


-- триггер, запрещающий добавлять больше одного главного здания:
DROP TRIGGER IF EXISTS tg_one_main_buildng//
CREATE TRIGGER tg_one_main_buildng 
BEFORE INSERT ON buildings FOR EACH ROW 

BEGIN	
	
	IF 
		NEW.is_main = 1 AND		
		(SELECT b.is_main FROM buildings b WHERE b.is_main = 1) = 1
		
	THEN		
		SIGNAL SQLSTATE '45048'
			SET MESSAGE_TEXT = 'Невозможно добавить ещё одно главное здание!';
	END IF;

END//



-- триггер на проверку размещения кабинета на существующем этаже:
-- на добавление:
DROP TRIGGER IF EXISTS tg_check_floor_ins//
DELIMITER //
CREATE TRIGGER tg_check_floor_ins
BEFORE INSERT
ON cabinets FOR EACH ROW
	IF 
		NEW.`floor` > (SELECT b.floors FROM buildings b WHERE NEW.building_id = b.id)
	THEN 
		SIGNAL SQLSTATE '45058'
			SET MESSAGE_TEXT = 'Невозможно указать этаж больше существующего в здании!';
	END IF;
//

-- на обновление:
DROP TRIGGER IF EXISTS tg_check_floor_upd//
CREATE TRIGGER tg_check_floor_upd
BEFORE UPDATE
ON cabinets FOR EACH ROW
	IF 
		NEW.`floor` > (SELECT b.floors FROM buildings b WHERE NEW.building_id = b.id)
	THEN 
		SIGNAL SQLSTATE '45058'
			SET MESSAGE_TEXT = 'Невозможно указать этаж больше существующего в здании!';
	END IF;
//



-- триггер на проверку добавления предмета учителю, а не ученику:
DROP TRIGGER IF EXISTS tg_student_not_teacher//
CREATE TRIGGER tg_student_not_teacher 
BEFORE INSERT ON users_subjects FOR EACH ROW 

BEGIN		
	-- если выбран id ученика:
	IF
		NEW.user_id IN (SELECT user_id FROM profiles WHERE `role` = 'Учащийся')
	THEN
		SIGNAL SQLSTATE '45045'
			SET MESSAGE_TEXT = 'Невозможно назначить ученику вести предмет!';
	END IF;

END//


-- триггер на проверку добавления ученика (а не учителя) в класс
DROP TRIGGER IF EXISTS tg_teacher_not_student//
CREATE TRIGGER tg_teacher_not_student 
BEFORE INSERT ON users_classes FOR EACH ROW 	
	-- если выбран id не ученика:
	IF
		NEW.user_id NOT IN (SELECT user_id FROM profiles WHERE `role` = 'Учащийся')
	THEN
		SIGNAL SQLSTATE '45045'
			SET MESSAGE_TEXT = 'Выбран ID несуществующего пользователя, или пользователя не являющегося учеником!';		
	END IF;
//

-- триггер на проверку вставки ID актуального пользователя в таблицу с оценками:
DROP TRIGGER IF EXISTS tg_check_actual_student_for_grades_ins//
CREATE TRIGGER `tg_check_actual_student_for_grades_ins` BEFORE INSERT ON `grades` FOR EACH ROW 
	IF 
		NEW.student_id IN (SELECT user_id FROM profiles WHERE actual = 0)
	THEN 
		SIGNAL SQLSTATE '45059'
			SET MESSAGE_TEXT = 'Невозможно добавить неактуального пользователя!';
	END IF;
//

-- триггер на проверку вставки ID актуального пользователя в таблицу с оценками во время обновления:
DROP TRIGGER IF EXISTS tg_check_actual_student_for_grades_upd//
CREATE TRIGGER `tg_check_actual_student_for_grades_upd` BEFORE UPDATE ON `grades` FOR EACH ROW 
	IF 
		NEW.student_id IN (SELECT user_id FROM profiles WHERE actual = 0)
	THEN 
		SIGNAL SQLSTATE '45059'
			SET MESSAGE_TEXT = 'Невозможно добавить неактуального пользователя!';
	END IF;
//
DELIMITER ;


/* --- Процедуры --- */


DELIMITER //


-- процедура на добавление пользователя:
DROP PROCEDURE IF EXISTS school_global_db.sp_add_user//
CREATE PROCEDURE school_global_db.sp_add_user(
	var_fname VARCHAR(50), var_lname VARCHAR(50),
	var_pnymic VARCHAR(50), var_login VARCHAR(50),
	var_phash VARCHAR(100), var_email VARCHAR(50), var_phone BIGINT UNSIGNED,
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
BEGIN
	
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0;
	DECLARE err_code VARCHAR(100);
	DECLARE err_string VARCHAR(150);
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := concat('Error occured. Code: ', code, '. Text: ', error_string);
    END;
   	
   	IF 
		var_pnymic IS NULL
	THEN
		SET var_pnymic = '(нет)';
	END IF;
   
	START TRANSACTION;
	
	-- вставка данных:
	INSERT users 
		(firstname, lastname, patronymiс, login, password_hash, email, phone)
	VALUES
		(var_fname, var_lname, var_pnymic, var_login, var_phash, var_email, var_phone);
	
	-- результат транзакции:
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;	

END//

/*
  пример вставляемых данных:
  CALL sp_add_user('Алексей', 'Пупкин', 'Петрович', 'pupkinap', 'wif5c29rh926h54926hfr926495', 'pupkinap@mail.ru', '89068789032', @tr_result);
  SELECT (@tr_result);
 */ 


-- процедура на добавление пользователя, карты пользователя и профиля пользователя с проверкой и откатом:	
DROP PROCEDURE IF EXISTS school_global_db.sp_full_add_user_profile//
CREATE PROCEDURE school_global_db.sp_full_add_user_profile(
	-- переменные для таблицы users:
	var_fname VARCHAR(50), var_lname VARCHAR(50),
	var_pnymic VARCHAR(50), var_login VARCHAR(50),
	var_phash VARCHAR(100), var_email VARCHAR(50), var_phone BIGINT UNSIGNED,
	-- переменные для таблицы profiles:
	var_gender CHAR(1),	var_birthday DATE,
	var_role VARCHAR(25), var_card_num BIGINT,
	-- переменная для вывода результата транзакции:
	OUT tr_result VARCHAR(200))
	
BEGIN
	
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	
	-- переменные вычисления id пользователя и его карты для дальнейшей вставки:
	DECLARE uid BIGINT UNSIGNED;
	DECLARE card_id BIGINT UNSIGNED;
	
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;
   
	-- если отчества нет, вместо него пишется "(нет)":
   	IF 
		var_pnymic IS NULL
	THEN
		SET var_pnymic = '(нет)';
	END IF;
   
	START TRANSACTION;
	
	-- вставка пользователя:
	INSERT users 
		(firstname, lastname, patronymiс, login, password_hash, email, phone)
	VALUES
		(var_fname, var_lname, var_pnymic, var_login, var_phash, var_email, var_phone);
	
	-- вычисление id пользователя для вставки в таблицу profiles:
	SET uid = (SELECT u.id FROM users u WHERE u.login = var_login AND u.password_hash = var_phash);
	
	-- вставка номера карты пользователя:
	INSERT cards
		(card_number)
	VALUES
		(var_card_num);
	
	-- вычисление id карты пользователя для вставки в таблицу profiles:
	SET card_id = (SELECT c.id FROM cards c WHERE c.card_number = var_card_num);

	-- вставка профиля:
	INSERT profiles
		(user_id, gender, birthday, card_id, `role`)
	VALUES
		(uid, var_gender, var_birthday, card_id, var_role);
	
	-- результат транзакции:
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;

END//


/* пример вставляемых данных: 
	CALL sp_full_add_user_profile(
		'Марина', 'Антонова', 'Павловна', 'antonovamp', '437h9843r24hdr928h943', 'antonovamp@google.com', 
		'89084722309', 'f', '2016-07-11', 'Учащийся', 0011223378, @tr_result);
	-- вывод результата:
	SELECT @tr_result;
*/


-- процедура на добавление карты в таблицу:
DROP PROCEDURE IF EXISTS sp_add_card//
CREATE PROCEDURE sp_add_card(
	var_cardnum BIGINT UNSIGNED,
	OUT tr_result VARCHAR(200))
BEGIN
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0;
	DECLARE err_code VARCHAR(100);
	DECLARE err_string VARCHAR(150);
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := concat('Error occured. Code: ', code, '. Text: ', error_string);
    END;   	
   
	START TRANSACTION;
	
	-- вставка данных:
	INSERT cards 
		(card_number)
	VALUES
		(var_cardnum);
	
	-- результат транзакции:
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;	

END//

/*
	-- пример использования процедуры:
	CALL sp_add_card(0034723492, @y);
	SELECT @y;
*/



-- функция на просмотр баланса карты:
DROP FUNCTION IF EXISTS sf_show_card_balance//
CREATE FUNCTION school_global_db.sf_show_card_balance(
	var_cardnum BIGINT UNSIGNED)
RETURNS INT
DETERMINISTIC
BEGIN	
	RETURN (
		SELECT balance 
		FROM cards 
		WHERE card_number = var_cardnum);
END//
/*
	-- пример использования функции:
	SELECT sf_show_card_balance(0034723492);
*/





-- процедура на добавление ученика в класс:
DROP PROCEDURE IF EXISTS sp_add_student_to_class//
CREATE PROCEDURE sp_add_student_to_class(
	var_uid BIGINT UNSIGNED, var_cid BIGINT UNSIGNED,
	OUT tr_result VARCHAR(250))  -- переменная на вывод результата транзакции
BEGIN
	
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки	
	
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;	
   
   	START TRANSACTION;
   
	-- "зачисление" ученика в класс:
    INSERT users_classes
		(user_id, class_id)
	VALUES
		(var_uid, var_сid);	
	
	-- результат транзакции
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;	
END//



-- процедура на назначение классного руководителя:
DROP PROCEDURE IF EXISTS school_global_db.sp_classmanager//
CREATE PROCEDURE school_global_db.sp_set_classmanager(
	var_uid BIGINT UNSIGNED, var_cid BIGINT UNSIGNED, -- переменные ID пользователя и класса
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
BEGIN
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;		
   		
   	START TRANSACTION;   
   
   	IF
   		-- проверка введённого ID класса на корректность:
   		var_cid IN (SELECT c.id FROM classes c)
   	THEN
   		/* замена классного руководителя, если он был назначен классу
		   (нет проверки на наличие классного руководства у пользователя,
		   так как у учителя может быть больше одного класса):
		*/
		UPDATE classes
		SET
			classmanager_id = var_uid
	   	WHERE
	   		id = var_cid;
	ELSE
		SIGNAL SQLSTATE '45069'
			SET MESSAGE_TEXT = 'Выбран неверный ID класса!'; 	
	END IF;
	   
  	-- результат транзакции:
    IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;	
   
END//



DELIMITER //

-- создание процедуры на привязку учителю предмета:
DROP PROCEDURE IF EXISTS sp_add_teach_subj//
CREATE PROCEDURE sp_add_teach_subj(
	var_user_id BIGINT UNSIGNED, var_subject_id BIGINT UNSIGNED,	
	OUT tr_result VARCHAR(200))	 -- переменная на вывод результата транзакции
BEGIN
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	
	-- действие в случае возникновения исключения:	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;  	   
   	
	START TRANSACTION;
	
	-- вставка в таблицу users_subjects данных:
	INSERT users_subjects 
		(user_id, subject_id)
	VALUES 
		(var_user_id, var_subject_id);
	
	-- результат транзакции:
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;	

END//

DELIMITER ;

/*
	-- пример использования функции:
	CALL sp_add_teach_subj(1, 7, @tr_res);
	SELECT @tr_res;
*/


-- процедура на добавление учителя (добавить пользователя, его профиль, карту и назначить предмет):
DROP PROCEDURE IF EXISTS sp_add_teacher;
DELIMITER //
CREATE PROCEDURE school_global_db.sp_add_teacher(

	var_fname VARCHAR(50), var_lname VARCHAR(50),
	var_pnymic VARCHAR(50), var_login VARCHAR(50),
	var_phash VARCHAR(100), var_email VARCHAR(50), var_phone BIGINT UNSIGNED,
	
	var_gender CHAR(1),	var_birthday DATE,
	var_role VARCHAR(25), var_card_num BIGINT,
	
	var_subject_id BIGINT UNSIGNED,
	
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
	
BEGIN
	
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	
	-- переменные вычисления id пользователя и его карты для дальнейшей вставки:
	DECLARE uid BIGINT UNSIGNED;
	DECLARE card_id BIGINT UNSIGNED;
	
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;
   
	-- если отчества нет, вместо него пишется "(нет)":
   	IF 
		var_pnymic IS NULL
	THEN
		SET var_pnymic = '(нет)';
	END IF;

	START TRANSACTION;
	-- все проверки актуальности пользователя и предмета заложены в триггере.	

	-- вставка пользователя:
	INSERT users 
		(firstname, lastname, patronymiс, login, password_hash, email, phone)
	VALUES
		(var_fname, var_lname, var_pnymic, var_login, var_phash, var_email, var_phone);
	
	-- вычисление id пользователя для вставки в таблицу profiles:
	SET uid = (SELECT u.id FROM users u WHERE u.login = var_login AND u.password_hash = var_phash);
	
	-- вставка номера карты пользователя:
	INSERT cards
		(card_number)
	VALUES
		(var_card_num);
	
	-- вычисление id карты пользователя для вставки в таблицу profiles:
	SET card_id = (SELECT c.id FROM cards c WHERE c.card_number = var_card_num);

	-- вставка профиля:
	INSERT profiles
		(user_id, gender, birthday, card_id, `role`)
	VALUES
		(uid, var_gender, var_birthday, card_id, var_role);
	
	-- вставка в таблицу users_subjects данных (назначение предмета):
	INSERT users_subjects 
		(user_id, subject_id)
	VALUES 
		(uid, var_subject_id);
	
	-- результат транзакции:
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;

END//

/*
	-- пример вставляемых данных:
	CALL sp_add_teacher(
			'Антон', 'Дмитриев', 'Васильевич', 'dmitrievav', 'fybv7436rbc4736r794dr9',
			'dmitrievav@yandex.ru', '89037820312', 'm', '1977-01-25', 'Учитель', 00433854283, 7, @tr_res);
	SELECT @tr_res AS 'Result';
*/


-- процедура на добавление ученика (добавить пользователя, его профиль, карту и назначить класс):
DROP PROCEDURE IF EXISTS sp_add_student;
DELIMITER //
CREATE PROCEDURE school_global_db.sp_add_student(
	var_fname VARCHAR(50), var_lname VARCHAR(50),
	var_pnymic VARCHAR(50), var_login VARCHAR(50),
	var_phash VARCHAR(100), var_email VARCHAR(50), var_phone BIGINT UNSIGNED,
	
	var_gender CHAR(1),	var_birthday DATE,
	var_card_num BIGINT,
	
	var_class_id BIGINT UNSIGNED,
	
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
	
BEGIN
	
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	
	-- переменные вычисления id пользователя и его карты для дальнейшей вставки:
	DECLARE uid BIGINT UNSIGNED;
	DECLARE card_id BIGINT UNSIGNED;
	
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := concat('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;
   
	-- если отчества нет, вместо него пишется "(нет)":
   	IF 
		var_pnymic IS NULL
	THEN
		SET var_pnymic = '(нет)';
	END IF;
   
	START TRANSACTION;
	
	-- вставка пользователя:
	INSERT users 
		(firstname, lastname, patronymiс, login, password_hash, email, phone)
	VALUES
		(var_fname, var_lname, var_pnymic, var_login, var_phash, var_email, var_phone);
	
	-- вычисление id пользователя для вставки в таблицу profiles:
	SET uid = (SELECT u.id FROM users u WHERE u.login = var_login AND u.password_hash = var_phash);
	
	-- вставка номера карты пользователя:
	INSERT cards
		(card_number)
	VALUES
		(var_card_num);
	
	-- вычисление id карты пользователя для вставки в таблицу profiles:
	SET card_id = (SELECT c.id FROM cards c WHERE c.card_number = var_card_num);

	-- вставка профиля:
	INSERT profiles
		(user_id, gender, birthday, card_id, `role`)
	VALUES
		(uid, var_gender, var_birthday, card_id, 'Учащийся'); -- здесь роль записана принудительно, т.к. нам она известна

	-- вставка в таблицу users_classes данных (зачисление в класс):
	INSERT users_classes 
		(user_id, class_id)
	VALUES 
		(uid, var_class_id);
	
	-- результат транзакции:
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;

END//
/*
	-- пример вставляемых данных:
	CALL sp_add_student(
		'Мария', 'Черкасова', 'Анатольевна', 'cherkasovama', 'dyb2478d6rgh782dhr84tgdf673', 
		'cherkasovama@gmail.com', '89095567234', 'f', '2010-10-07', 00236120873, 3, @tr_res);
	SELECT @tr_res;
*/

delimiter //
-- создание процедуры на обновление номера класса (по окончанию учебного года):
DROP PROCEDURE IF EXISTS school_global_db.sp_update_class//
CREATE PROCEDURE school_global_db.sp_update_class(
	var_class_id BIGINT UNSIGNED,	
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
BEGIN
	
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки

	-- переменные, определяющие текущий и новый номер класса:
	DECLARE class_num TINYINT(2) DEFAULT (SELECT c.num FROM classes c WHERE c.id = var_class_id);
	DECLARE new_class_num TINYINT(2) DEFAULT class_num + 1;
	
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;
   
	
   	START TRANSACTION;   

	IF
		class_num = 4 OR 11
	THEN
		/* перевод класс в неактуальные, так как при переходе в 5-й класс, группа учеников формируется заново,
		   а после 11-го класса обучение в школе заканчивается */
		UPDATE classes
			SET is_actual = 0
			WHERE num = class_num;	
			
	ELSE
		-- увеличение номера класса на 1:
		UPDATE classes
			SET class_num = new_class_num
			WHERE id = var_class_id;
	END IF;
		
	
	-- результат транзакции:
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;	
END//



-- процедура на вывод расписания учителя:
DROP PROCEDURE IF EXISTS `sp_teacher_timetable`;
DELIMITER //

CREATE PROCEDURE `sp_teacher_timetable`(
	var_teacher_id BIGINT, var_mode CHAR(1))
BEGIN
		
	DECLARE var_date_start DATE;
	DECLARE var_date_end DATE;
		
	IF
		var_mode NOT IN ('c', 'a', '1', '2', '3', '4')
	THEN
		SET var_mode = 'с';  -- current, актуальное расписание
	END IF;
	
	IF
		var_mode = 'a' -- all, всё расписание с 1-го сентября
	THEN
		-- вычисление 1-го сентября:
		IF
			MONTH(NOW()) < 9
		THEN
			SET var_date_start = CONCAT((YEAR(NOW()) - 1),'-09-01');
		ELSE
			SET var_date_start = CONCAT(YEAR(NOW()),'-09-01');
		END IF;
	
	-- прибавление 10 месяцев для вычисления длины учебного года:
	SET var_date_end = ADDDATE(var_date_start, INTERVAL 10 MONTH);
			ELSE
		IF
			-- если var_mode = 'c'
			var_mode = 'c'
		THEN
			IF 
				-- условие вычисления текущего учебного периода по текущему времени:
				(SELECT (NOW() BETWEEN ep.period_start AND ep.period_end) FROM education_pedriods ep) = 1			
			THEN
				-- назначение границ даты равным границ учебных периодов:
				SET var_date_start = (SELECT ep.period_start FROM education_pedriods ep WHERE (NOW() BETWEEN ep.period_start AND ep.period_end) = 1);
				SET var_date_end = (SELECT ep.period_end FROM education_pedriods ep WHERE (NOW() BETWEEN ep.period_start AND ep.period_end) = 1);					
			END IF;
		END IF;
	END IF;
		
	IF 
		-- проверка, что выбран существующий id или id пользователя-учителя:
		(SELECT p.`role` FROM profiles p WHERE p.user_id = var_teacher_id) IN ('Учитель', 'Директор', 'Завуч')
	THEN
	
		SELECT
			tt.`date`AS 'Дата', 
			tt.day_name AS 'День недели',	
			tt.class AS 'Класс',
			tt.intervalues_id AS 'Номер урока' 
		FROM teacher_timetable tt
		WHERE
			tt.teacher_id = var_teacher_id AND -- вставка id учителя
			tt.`date` >= var_date_start AND -- подстановка дат начала и конца интервала
			tt.`date` BETWEEN var_date_start AND var_date_end 
		ORDER BY tt.`date`;
		
		/*
		-- выборка расписания без представления 'teacher_timetable' (вместо верхнего запроса):
		SELECT 
			t.`date` AS 'Дата', 
			DAYNAME(t.`date`) AS 'День недели',			
			CONCAT(c.num,UPPER(c.letter)) AS 'Класс',
			t.intervalues_id AS 'Номер урока'
		FROM timetable t
		JOIN classes c
			ON c.id = t.class_id		
		WHERE
			t.teacher_id = var_teacher_id AND -- вставка id учителя
			t.`date` >= var_date_start AND 
			t.`date` BETWEEN var_date_start AND var_date_end
		ORDER BY t.`date`;
		*/
	ELSE
		-- предупреждение:
		SELECT 'Выберите корректный id' AS 'Caution';
	END IF;	
	
END//
/*
	-- пример использования процедуры:
	CALL sp_teacher_timetable(19,'a');
*/


-- процедура на выборку расписания конкретного класса:
DROP PROCEDURE IF EXISTS sp_show_classtimetable//
CREATE PROCEDURE sp_show_classtimetable(
	var_class_id BIGINT UNSIGNED)
BEGIN
	SELECT 
		st.`date`, DAYNAME(st.`date`), st.name, st.intervalues_id
	FROM student_timetable st
	WHERE st.class_id = var_class_id
	ORDER BY st.`date`, st.intervalues_id;
END//
/*
	-- вызов процедуры:
	CALL sp_show_classtimetable(49);
*/




-- процедура на деактуализацию пользователя:
DROP PROCEDURE IF EXISTS school_global_db.sp_deactuate_user//
CREATE PROCEDURE school_global_db.sp_deactuate_user(
	var_userid BIGINT UNSIGNED,	
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
BEGIN
	
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;
   
   	IF 
   		var_userid NOT IN (SELECT p.user_id FROM profiles p WHERE p.actual = 1)
   	THEN 
   		SIGNAL SQLSTATE '45056'
			SET MESSAGE_TEXT = 'Указан неверный id пользователя!';
	END IF;
	
   	START TRANSACTION;
   
	-- изменение значения актуальности: 
	UPDATE profiles
	SET 
		actual = 0
	WHERE 
		user_id = var_userid;
	
	-- результат транзакции:
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;
END//


-- процедура на актуализацию пользователя:
DROP PROCEDURE IF EXISTS school_global_db.sp_actuate_user//
CREATE PROCEDURE school_global_db.sp_actuate_user(
	var_userid BIGINT UNSIGNED,	
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
BEGIN
	
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := concat('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;
	
	-- действие при вводе несуществующего id или id актуального пользователя:
   	IF 
   		var_userid NOT IN (SELECT p.user_id FROM profiles p WHERE p.actual = 0)
   	THEN 
   		SIGNAL SQLSTATE '45056'
			SET MESSAGE_TEXT = 'Указан неверный id пользователя!';
	END IF;


   	START TRANSACTION;
   
   -- обновление параметра актуальности:
	UPDATE profiles
	SET 
		actual = 1
	WHERE 
		user_id = var_userid;	
	
	-- результат транзакции:
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;
END//


-- процедура на деактуализацию учебного предмета:
DROP PROCEDURE IF EXISTS school_global_db.sp_deactuate_subject//
CREATE PROCEDURE school_global_db.sp_deactuate_subject(
	var_subjectid BIGINT UNSIGNED,	
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
BEGIN
	
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;
	
	-- действие при выборе id не актуального или несуществующего предмета:
   	IF 
   		var_subjectid NOT IN (SELECT s.id FROM subjects s WHERE s.is_actual = 1)
   	THEN 
   		SIGNAL SQLSTATE '45055'
			SET MESSAGE_TEXT = 'Неверно указан id предмета!';
	END IF;
   
   	START TRANSACTION;
   
	-- обновление параметра актуальности:
    UPDATE subjects
	SET 
		is_actual = 0
	WHERE 
		id = var_subjectid;
	
	-- результат транзакции:
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;
END//

-- процедура на актуализацию учебного предмета:
DROP PROCEDURE IF EXISTS school_global_db.sp_actuate_subject//
CREATE PROCEDURE school_global_db.sp_actuate_subject(
	var_subjectid BIGINT UNSIGNED,	
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
BEGIN
	
	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;
	
    -- действие при выборе id актуального или несуществующего предмета:
   	IF 
   		var_subjectid NOT IN (SELECT s.id FROM subjects s WHERE s.is_actual = 0)
   	THEN 
   		SIGNAL SQLSTATE '45055'
			SET MESSAGE_TEXT = 'Указан неверный id предмета!';
	END IF;
   
   	START TRANSACTION;
   	
   	-- обновление параметра актуальности:
	UPDATE subjects
	SET 
		is_actual = 1
	WHERE 
		id = var_subjectid;
	
	-- результат транзакции:
	IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;
END//



-- процедура на показ средней оценки ученика (с проверкой актуальности предмета и пользователя):
DROP PROCEDURE IF EXISTS school_global_db.sp_average_grade//
CREATE PROCEDURE school_global_db.sp_average_grade(
	var_user_id BIGINT, var_subj_id BIGINT)
BEGIN
		
	IF
		(SELECT p.`role` FROM profiles p WHERE p.user_id = var_user_id) IN ('Учитель', 'Директор', 'Завуч') 
	THEN
		SIGNAL SQLSTATE '45050'
				SET MESSAGE_TEXT = 'Необходимо ввести id ученика!';		
	ELSE
		IF
			var_subj_id IN (SELECT s.id FROM subjects s WHERE s.is_actual = 0)
		THEN 
			SIGNAL SQLSTATE '45051'
				SET MESSAGE_TEXT = 'Выбран неактуальный предмет!';
		ELSE
			IF
				var_user_id IN (SELECT p.user_id FROM profiles p WHERE p.actual = 0)
			THEN 
				SIGNAL SQLSTATE '45052'
					SET MESSAGE_TEXT = 'Выбран неактуальный пользователь!';
			ELSE
				IF
					var_subj_id IN (SELECT s.id FROM subjects s)
				THEN	
					(SELECT 
					CONCAT(u.firstname, ' ',u.lastname) AS 'Имя, фамилия',
					t.`date` ,
					s.name,
					g.grade, g.grade_type, g.comment
					FROM grades g 
					JOIN users u 
						ON g.student_id = u.id 
					JOIN timetable t
						ON t.id = g.timetable_id
					JOIN subjects s
						ON s.id = t.subject_id
					WHERE s.id = var_subj_id 
						AND u.id = var_user_id)
					UNION 
					(SELECT
						'Средняя оценка:', 
						DATE(NOW()), 
						s2.name, 
						ag.`SUM(g.grade)/COUNT(g.grade)`, 
						'балла(ов)', 
						NULL 
					FROM average_grade ag 
					JOIN subjects s2 
						ON s2.id = var_subj_id);
				ELSE
					SIGNAL SQLSTATE '45053'
						SET MESSAGE_TEXT = 'Выбран неверный id предмета!';
				END IF;
			END IF;
		END IF;
	END IF;
END//
/*
	-- пример работы процедуры:
	CALL sp_average_grade(17,7);
*/


-- процедура на вывод дневника ученика:
DROP PROCEDURE IF EXISTS school_global_db.sp_student_diary//
CREATE PROCEDURE school_global_db.sp_student_diary(
	var_user_id BIGINT, var_edperiod_id TINYINT)	
BEGIN
	
	DECLARE 
		var_class_id BIGINT 
	DEFAULT 
		(SELECT class_id 
		FROM users_classes 
		WHERE user_id = var_user_id);

	-- объявление переменных для границ даты:
	DECLARE 
		start_d DATE 
	DEFAULT 
		(SELECT ep.period_start 
		FROM education_pedriods AS ep 
		WHERE ep.id = var_edperiod_id);

	DECLARE 
		end_d DATE 
	DEFAULT 
		(SELECT ep.period_end 
		FROM education_pedriods AS ep 
		WHERE ep.id = var_edperiod_id);
	
	IF
		-- если пользователь ученик:
		var_user_id IN (SELECT p.user_id FROM profiles p WHERE p.`role` = 'Учащийся')
	THEN 
		IF 
			-- если пользователь актуален:
			var_user_id IN (SELECT p.user_id FROM profiles p WHERE p.actual = 1)
		THEN 
			-- выборка:
			(SELECT 
				st.`date`, DAYNAME(st.`date`) AS `dayname`, st.name AS subject,
					
				CASE			
					WHEN 
						(h.timetable_id = st.id) = 1
					THEN 
						h.homework
				END AS hw,
				
				-- три типа оценок:
				g.grade AS gradetype_lessonwork,
				g2.grade AS gradetype_homework, 
				g3.grade AS gradetype_other
				
			FROM student_timetable st
			
			LEFT JOIN homeworks h
			ON 
				h.timetable_id = st.id AND 
				st.class_id = var_class_id AND 
				h.timetable_id IN (
					SELECT st2.id 
					FROM student_timetable st2 
					WHERE st2.class_id = var_class_id)
				
			LEFT JOIN grades g
			ON 
				g.timetable_id = st.id AND 
				g.student_id = var_user_id AND 
				g.grade_type = 'Работа на уроке'
				
			LEFT JOIN grades g2
			ON 
				g2.timetable_id = st.id AND 
				g2.student_id = var_user_id AND 
				g2.grade_type = 'Домашнее задание'
				
			LEFT JOIN grades g3
			ON 
				g3.timetable_id = st.id AND 
				g3.student_id = var_user_id AND 
				g3.grade_type = 'Иное'
				
			WHERE
				st.class_id = var_class_id AND 
				st.`date` BETWEEN start_d AND end_d
			GROUP BY st.id, h.timetable_id 
			ORDER BY st.`date`, st.intervalues_id);			
			
		ELSE
			SELECT 'Выбран неактуальный пользователь!';
		END IF;
	ELSE
		SELECT 'Необходимо ввести id учника!';
	END IF;

END//
/*
	-- просмотр дневника конкретного ученика за конкретную четверть
	CALL sp_student_diary(17, 1); 
*/



-- процедура для вывода оценок конкретного класса по конкретному предмету за конкретный период:
DROP PROCEDURE IF EXISTS school_global_db.sp_class_grades_by_subj//
CREATE PROCEDURE school_global_db.sp_class_grades_by_subj(
	var_class_id BIGINT, var_subj_id BIGINT, var_edperiod_id BIGINT)
BEGIN
	
	-- объявление переменных для границ даты и их вычисление из таблицы по введённому пользователем в процедуру индексу:	
	DECLARE 
		start_d DATE 
	DEFAULT 
		(SELECT ep.period_start 
		FROM education_pedriods AS ep 
		WHERE ep.id = var_edperiod_id);

	DECLARE 
		end_d DATE 
	DEFAULT 
		(SELECT ep.period_end 
		FROM education_pedriods AS ep 
		WHERE ep.id = var_edperiod_id);		
	
	-- тело выборки:
	SELECT
		CONCAT(c.num, UPPER(c.letter)) AS class,		
		CONCAT(u.firstname, ' ', u.lastname) AS student, -- имя и фамилия из таблицы пользователей		
		g.grade AS lessonwork, -- оценки из таблицы оценок по типам
		g2.grade AS homework, 
		g3.grade AS other, 	
		t.`date` AS lesson_date, -- дата из таблицы расписания уроков
		t.intervalues_id AS lesson_num,
		s.name AS subject -- название предмета из таблицы всех предметов
	FROM users_classes uc
	JOIN users u 
		-- сопоставление id пользователей из таблицы users и users_classes:
		ON uc.user_id = u.id 
	JOIN timetable t
		-- сопоставление id учебных классов из таблицы classes и users_classes:
		ON t.class_id = uc.class_id	
	LEFT JOIN grades g
		-- cопоставление id учеников в таблицах оценок и пользователей и id урока в таблицах оценок и расписания:
		ON g.student_id = u.id AND g.timetable_id = t.id  AND g.grade_type = 'Работа на уроке'
	
	LEFT JOIN grades g2
		ON g2.student_id = u.id AND g2.timetable_id = t.id AND g2.grade_type = 'Домашнее задание'
		
	LEFT JOIN grades g3
		ON g3.student_id = u.id AND g3.timetable_id = t.id AND g3.grade_type = 'Иное'
	
	JOIN subjects s
		-- сопоставление id предметов из таблиц предметов и расписания:
		ON s.id = t.subject_id 
	JOIN student_timetable st 
		ON st.id = t.id
	JOIN classes c
		ON c.id = uc.class_id
	WHERE
		-- условия конечной выборки:
		t.class_id = var_class_id AND 
		t.subject_id = var_subj_id AND 
		t.`date` BETWEEN start_d AND end_d
	GROUP BY 
		student, t.id, t.`date`, subject
	ORDER BY 
		t.`date`, t.intervalues_id, student;				
	
END//

/*
-- пример вывода оценок учеников 11А класса по предмету "Русский язык":
CALL sp_class_grades_by_subj(49, 1, 1);
*/



-- процедура на добавление домашнего задания:
DROP PROCEDURE IF EXISTS sp_homework_ins//
CREATE PROCEDURE sp_homework_ins(
	var_teacher_id BIGINT, var_tt_id BIGINT, var_homehork VARCHAR(255),
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
BEGIN

-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;		
   		
   	START TRANSACTION;   
   
   	INSERT homeworks
   		(homework, teacher_id, timetable_id)
   	VALUES
   		(var_homework, var_teacher_id, var_tt_id);	
	   
  	-- результат транзакции:
    IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;	
END//



-- процедура на обновление домашнего задания:
DROP PROCEDURE IF EXISTS sp_homework_upd//
CREATE PROCEDURE sp_homework_upd(
	var_teacher_id BIGINT, var_tt_id BIGINT, var_homehork VARCHAR(255),
	OUT tr_result VARCHAR(200))
BEGIN

	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;		
   		
   	START TRANSACTION;   
   
   	UPDATE homeworks   		
   	SET 
   		homework = var_homework
   	WHERE 
   		teacher_id = var_teacher_id AND 
   		timetable_id = var_tt_id;	
	   
  	-- результат транзакции:
    IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;	
END//



-- процедура на добавление оценки:
DROP PROCEDURE IF EXISTS sp_grade_ins//
CREATE PROCEDURE sp_grade_ins(
	var_stud_id BIGINT, var_tt_id BIGINT, var_homehork VARCHAR(255),
	var_grade_type VARCHAR(30), var_grade TINYINT(1), var_comment VARCHAR(130), 
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
BEGIN

	-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;		
   		
   	START TRANSACTION;   
   
   	INSERT grades
   		(student_id, timetable_id, grade_type, `comment`, grade)
   	VALUES
   		(var_stud_id, var_tt_id, var_grade_type, var_comment, var_grade);
	   
  	-- результат транзакции:
    IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;	
END//



-- процедура на обновление оценки:
DROP PROCEDURE IF EXISTS sp_grade_ins//
CREATE PROCEDURE sp_grade_ins(
	var_stud_id BIGINT, var_tt_id BIGINT, var_homehork VARCHAR(255),
	var_grade_type VARCHAR(30), var_grade TINYINT(1), var_comment VARCHAR(130), 
	OUT tr_result VARCHAR(200))  -- переменная на вывод результата транзакции
BEGIN

-- переменные для записи и вывода кода и сообщения об ошибке:
	DECLARE stop_tr BIT DEFAULT 0; -- обозначение факта ошибки транзакции
	DECLARE err_code VARCHAR(100); -- код ошибки
	DECLARE err_string VARCHAR(150); -- текст ошибки
	
	-- флаг определения ошибки:
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
	    SET stop_tr = 1;
		GET stacked DIAGNOSTICS CONDITION 1
	         err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
	    	SET tr_result := CONCAT('Error occured. Code: ', err_code, '. Text: ', err_string);
    END;		
   		
   	START TRANSACTION;   
   
   	UPDATE grades
   	SET 
   		grade = var_grade,
   		grade_type = var_grade_type,
   		`comment` = var_comment
   	WHERE 
   		student_id = var_stud_id AND 
   		timetable_id = var_tt_id;
	   
  	-- результат транзакции:
    IF
		stop_tr = 1
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
		SET tr_result = 'Transaction successfully completed.';
	END IF;	
END//
