-- название и год выхода альбомов, вышедших в 2022 году
SELECT name,year FROM Album
	WHERE year = 2022;
    
-- название и продолжительность самого длительного трека
SELECT name, duration FROM Track
	ORDER BY duration DESC
	LIMIT 1;
	
-- название треков, продолжительность которых не менее 3,5 минуты
SELECT name FROM Track
	WHERE duration >= '00:03:30';
   
-- названия сборников, вышедших в период с 2020 по 2021 год включительно
SELECT name FROM Сollection
	WHERE year BETWEEN '2020' AND '2021';
   
-- исполнители, чье имя состоит из 1 слова;
SELECT nickname FROM Executor
	WHERE nickname NOT LIKE '%% %%';
    
-- название треков, которые содержат слово "по"/"In"
SELECT name FROM Track
	WHERE name LIKE '%%по%%' OR name LIKE '%%In%%';