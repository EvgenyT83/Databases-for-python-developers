import sqlalchemy
import psycopg2

db = "postgresql://postgres:9936@localhost:5432/the_scheme_for_the_music_service"
engine = sqlalchemy.create_engine(db)
con = engine.connect()

# название и год выхода альбомов, вышедших в 2022 году
print(con.execute(
    """
    SELECT name,year FROM Album
        WHERE year = 2022;
    """
).fetchall())

# название и продолжительность самого длительного трека
print(con.execute(
    """
    SELECT name, duration FROM Track
        ORDER BY duration DESC;
    """
).fetchone())

# название треков, продолжительность которых не менее 3,5 минуты
print(con.execute(
    """
    SELECT name FROM Track
        WHERE duration >= '00:03:30';
    """
).fetchall())

# названия сборников, вышедших в период с 2020 по 2021 год включительно
print(con.execute(
    """
    SELECT name FROM Сollection
        WHERE year BETWEEN '2020' AND '2021';
    """
).fetchall())

# исполнители, чье имя состоит из 1 слова
print(con.execute(
    """
    SELECT nickname FROM Executor
        WHERE nickname NOT LIKE '%% %%';
    """
).fetchall())

# название треков, которые содержат слово "по"/"In"
print(con.execute(
    """
    SELECT name FROM Track
        WHERE name LIKE '%%по%%' OR name LIKE '%%In%%';
    """
).fetchall())
