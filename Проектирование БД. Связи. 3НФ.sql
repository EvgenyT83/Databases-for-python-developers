-- Создаем пользователя
create user test_user with password '123456';

-- Создание базы
create database the_scheme_for_the_music_service;

-- Указываем владельца БД 
alter database the_scheme_for_the_music_service owner to test_user;

-- Создание таблиц

-- Жанры
create table if not exists Genre
	(
	id serial primary key,
	name varchar(60) not null unique
	);
	
-- Исполнители
create table if not exists Executor
	(
	id serial primary key,
	nickname varchar(100) not null unique
	);
	
-- Жанр_исполнитель 
create table if not exists Genre_Executor
	(
	executor_id integer references Executor(id),
	genre_id integer references Genre(id),
	constraint ex_ge_pk primary key (executor_id, genre_id)
	);
	
-- Альбомы
create table if not exists Album
	(
	id serial primary key,
	name varchar(100) not null unique,
	year integer not null
	);
	
-- Альбом_исполнитель
create table if not exists Album_Executor
	(
	album_id integer references Album(id),
	executor_id integer references Executor(id),
	constraint al_ex_pk primary key (album_id, executor_id)
	);
	
-- Треки
create table if not exists Track
	(
	id serial primary key,
	name varchar(100) not null unique,
	duration time not null,
	album_id integer REFERENCES Album(id)
	);
	
-- Сборники
create table if not exists Сollection
	(
	id serial primary key,
	name varchar(100) not null unique,
	year integer not null
	);
	
-- Сборник_трек
create table if not exists Сollection_Track
	(
	collection_id integer references Сollection(id),
	trek_id integer references Track(id),
	constraint co_tr_pk primary key (collection_id, trek_id)
	);
