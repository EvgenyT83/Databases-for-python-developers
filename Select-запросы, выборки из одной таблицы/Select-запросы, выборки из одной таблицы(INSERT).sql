INSERT INTO Genre(name)
	VALUES('иностранный рок'),
	('поп'),
	('русский рок'),
	('электроника'),
	('танцевальная музыка');
	
INSERT INTO Executor(nickname)
	VALUES('Queen'),
	('Adele'),
	('КИНО'),
	('PPK'),
	('Nautilus Pompilius'),
	('Tove Lo'),
	('Shouse'),
	('Regard'),
	('Imagine Dragons'),
	('Tiësto');
	
INSERT INTO Genre_Executor(executor_id, genre_id)
	VALUES(1, 1),
	(2,2),
	(3,3),
	(4,4),
	(5,3),
	(6,2),
	(7,5),
	(8,5),
	(9,1),
	(10,5);
	
INSERT INTO Album(name, year)
	VALUES('Innuendo', 1991),
	('Rolling in the Deep', 2011),
	('Звезда по имени Солнце', 1989),
	('ResuRection', 2002),
	('Ни кому ни кабельность', 1994),
	('Из сериала «Эйфория»', 2022),
	('Won-t Forget You', 2022),
	('Years & Years', 2022),
	('Bones', 2022),
	('The Motto', 2021),
	('Группа крови', 1988),
	('Последний герой', 1989);
	
INSERT INTO Album_Executor(album_id, executor_id)
	VALUES(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,9),
	(10,10);

INSERT INTO Track(name, duration, album_id)
	VALUES('The Show Must Go On', '00:04:31', 1),
	('Rolling In The Deep', '00:03:48', 2),
	('Пачка сигарет', '00:04:28', 3),
	('Resurection', '00:03:16', 4),
	('Я хочу быть с тобой', '00:04:13', 5),
	('How Long', '00:03:19', 6),
	('Won-t Forget You', '00:06:36', 7),
	('Hallucination', '00:02:54', 8),
	('Bones', '00:02:45', 9),
	('The Motto', '00:02:44', 10),
	('Группа крови', '00:04:43', 11),
	('Перемен', '00:04:55', 12),
	('Звезда по имени Солнце', '00:03:45', 3),
	('Последний герой', '00:03:06', 12),
	('В наших глазах', '00:03:45', 11);

INSERT INTO Сollection(name, year)
	VALUES('Вечные хиты', 2021),
	('Хиты FM', 2022),
	('Громкие новинки месяца', 2022),
	('Популярно в Екатеринбурге', 2022),
	('Лучшие песни русского рока', 2021),
	('100 танцевальных хитов', 2022),
	('100 суперхитов', 2022),
	('Эрон-дон-дон', 2021);

INSERT INTO Сollection_Track(collection_id, trek_id)
	VALUES(1,1),
	(1,2),
	(1,3),
	(1,4),
	(1,5),
	(2,6),
	(2,7),
	(2,8),
	(2,9),
	(2,10),
	(5,11),
	(5,12),
	(5,13),
	(5,14),
	(5,15);
	
