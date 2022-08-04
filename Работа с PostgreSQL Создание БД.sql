-- Создание таблиц

-- Жанры
create table if not exists Genres (
	ID serial primary key,
	Name varchar(50) not null unique
	);
	
-- Исполнители
create table if not exists Executor (
	ID serial primary key,
	Nickname varchar(100) not null unique,
	GenreID integer REFERENCES Genres(ID)
	);	

-- Альбомы
create table if not exists Album (
	ID serial primary key,
	Name varchar(100) not null unique,
	Year varchar(10) not null,
	ExecutorID integer REFERENCES Executor(ID)
	);
	
-- Песни
	create table if not exists Track (
	ID serial primary key,
	Name varchar(500) not null unique,
	Duration time not null,
	AlbumID integer REFERENCES Album(ID)
	);
	
-- Показ данных

-- SELECT * FROM Genres;
-- SELECT * FROM Executor;
-- SELECT * FROM Album;
-- SELECT * FROM Track;

-- Добавление данных(??? не разобрался как добавлять из связанных таблиц)

-- INSERT INTO Genres(Name)
-- VALUES('Русский рок');

-- INSERT INTO Executor(Nickname, GenreID)
-- VALUES('Кино', 1);

-- INSERT INTO Album(Name, Year, ExecutorID)
-- VALUES('Группа крови', '1988', 1), ('Звезда по имени Солнце', '1989', 1);

-- INSERT INTO Track(Name, Duration, AlbumID)
-- VALUES('Группа крови', '00:04:43', 1), ('Песня без слов', '00:05:07', 2), ('Невесёлая песня', '00:04:15', 2);