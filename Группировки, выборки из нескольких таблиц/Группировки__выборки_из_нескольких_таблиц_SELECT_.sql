-- количество исполнителей в каждом жанре
SELECT Gen.name, COUNT (DISTINCT GE.executor_id) FROM Genre_Executor GE
LEFT JOIN Genre Gen ON GE.genre_id = Gen.id
GROUP BY Gen.name;

-- количество треков, вошедших в альбомы 2019-2020 годов
SELECT COUNT (Tr.id) FROM Track Tr
LEFT JOIN Album Al ON Tr.album_id = Al.id
WHERE Al.year BETWEEN 2019 AND 2020;

-- средняя продолжительность треков по каждому альбому
SELECT Al.name, AVG(Tr.duration) FROM Track Tr 
LEFT JOIN Album Al ON Tr.album_id = Al.id
GROUP BY Al.name;

-- все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT Ex.nickname FROM Album_Executor AE 
LEFT JOIN Album Al ON AE.album_id = Al.id
LEFT JOIN Executor Ex ON AE.executor_id = Ex.id
WHERE Al.year <> 2020;

-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
SELECT DISTINCT Col.name FROM Сollection Col
LEFT JOIN Сollection_Track CT ON Col.id = CT.collection_id
LEFT JOIN Track Tr ON CT.trek_id = Tr.id
LEFT JOIN Album Al ON Tr.album_id = Al.id
LEFT JOIN Album_Executor AE ON Al.id = AE.album_id
LEFT JOIN Executor E ON AE.executor_id = E.id
WHERE E.nickname = 'КИНО';

-- название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT DISTINCT Al.name FROM Album_Executor AE
LEFT JOIN Album Al ON AE.album_id = Al.id
LEFT JOIN Executor Ex ON AE.executor_id = Ex.id
LEFT JOIN (SELECT executor_id, COUNT(genre_id) AS GENRES
		  FROM Genre_Executor
		  GROUP BY executor_id
		  HAVING COUNT(genre_id) > 1) D ON AE.executor_id = D.executor_id
WHERE NOT D.GENRES IS NULL;

-- наименование треков, которые не входят в сборники
SELECT Tr.name FROM Track Tr
WHERE id NOT IN (
	SELECT DISTINCT CT.trek_id FROM Сollection_Track CT
);

-- исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT Ex.nickname FROM Album_Executor AE
LEFT JOIN Executor Ex ON AE.executor_id = Ex.id
LEFT JOIN Album Al ON AE.album_id = Al.id
LEFT JOIN Track Tr ON Al.id = Tr.album_id
GROUP BY Ex.nickname, Tr.duration
HAVING Tr.duration = (SELECT MIN(duration) FROM Track);

-- название альбомов, содержащих наименьшее количество треков
SELECT DISTINCT Al.name, COUNT(Tr.id) FROM Track Tr
LEFT JOIN Album Al ON Tr.album_id = Al.id
GROUP BY Al.name
HAVING COUNT(Tr.id) = (
	SELECT MIN(MY_COUNT) FROM (
		SELECT Al.name, COUNT(Tr.id) MY_COUNT FROM Track Tr
				   			LEFT JOIN Album Al ON Tr.album_id = Al.id
				   			GROUP BY Al.name) UUUH);