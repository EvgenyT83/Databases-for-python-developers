# для настройки баз данных
import sqlalchemy as sq
# для создания отношений между таблицами
from sqlalchemy.orm import relationship, sessionmaker
# для определения таблицы и модели
from sqlalchemy.ext.declarative import declarative_base

# создание экземпляра declarative_base
Base = declarative_base()

# здесь добавим классы
class Genre(Base):
    __tablename__ = 'genre'

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.String)
    executers = relationship('executer', secondary='genre_executor')

genre_executor = sq.Table('genre_executor', Base.metadata,
sq.Column('executor_id', sq.Integer, sq.ForeignKey('executor_id')),
sq.Column('genre_id', sq.Integer, sq.ForeignKey('genre_id')))

class Executor(Base):
    __tablename__ = 'executer'

    id = sq.Column(sq.Integer, primary_key=True)
    nickname = sq.Column(sq.String)
    genres = relationship(Genre, secondary=genre_executor)

# создает экземпляр create_engine в конце файла
DSN = 'postgresql://postgres:9936@localhost:5432/the_scheme_for_the_music_site'
engine = sq.create_engine(DSN)
Session = sessionmaker(bind=engine)
session = Session()

genre_1 = Genre(name='иностранный рок')
genre_2 = Genre(name='поп')

executer_1 = Executor(nickname='Queen')
executer_2 = Executor(nickname='Adele')

session.add_all([genre_1, genre_2])
session.add_all([executer_1, executer_2])
session.commit()
