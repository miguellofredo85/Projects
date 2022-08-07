drop database if exists SpotifyClone;

create database SpotifyClone;

create table SpotifyClone.artista(
  artista_id int not null auto_increment,
  nome_artista varchar(50) not null,
  primary key (artista_id)
) engine = InnoDB;

create table SpotifyClone.plano(
  plano_id int primary key auto_increment,
  nome_plano varchar(20) not null,
  valor decimal(3, 2) not null
) engine = InnoDB;

create table SpotifyClone.album(
  album_id int primary key auto_increment,
  nome_album varchar(50) not null,
  ano int not null,
  artista_id  int not null,
  foreign key (artista_id) references SpotifyClone.artista(artista_id)
) engine = InnoDB;

create table SpotifyClone.usuario(
  usuario_id int auto_increment,
  plano_id int not null,
  nome_usuario varchar(50) not null,
  idade int not null,
  data_assinatura datetime not null,
  primary key (usuario_id),
  foreign key (plano_id) references SpotifyClone.plano(plano_id)
) engine = InnoDB;

create table SpotifyClone.seguindo(
  usuario_id int not null,
  artista_id int not null,
  primary key (usuario_id, artista_id),
  foreign key (artista_id) references SpotifyClone.artista(artista_id),
    foreign key (usuario_id) references SpotifyClone.usuario(usuario_id)	
) engine = InnoDB;

create table SpotifyClone.cancoes(
  cancao_id int auto_increment,
  album_id int not null,
  nome_cancao varchar(50) not null,
  segundos int not null,
  primary key (cancao_id),
  foreign key (album_id) references SpotifyClone.album(album_id)
) engine = InnoDB;

create table SpotifyClone.historial(
  usuario_id int not null auto_increment,
  artista_id int not null,
  nome_artista varchar(50) not null,
  primary key (usuario_id, artista_id),
  foreign key (usuario_id) references SpotifyClone.usuario(usuario_id),
  foreign key (artista_id) references SpotifyClone.artista(artista_id)
  ) engine = InnoDB;

  create table SpotifyClone.data_reproducoes (
    usuario_id int not null,
    cancao_id int not null,
    historico_de_reproducoes varchar(100) not null,
    data_reproducao datetime default now(),
    primary key (usuario_id, cancao_id),
    foreign key (usuario_id) references SpotifyClone.usuario(usuario_id),
    foreign key (cancao_id) references SpotifyClone.cancoes(cancao_id)
  ) engine = InnoDB;


insert into SpotifyClone.plano (nome_plano, valor)
values ('gratuito', 0),
  ('familiar', 7.99),
  ('universitario', 5.99),
  ('pessoal', 6.99);

insert into SpotifyClone.usuario (nome_usuario, idade, plano_id, data_assinatura)
values ('Thati',	23,	1,	'2019-10-20'),
('Cintia',	35,	2,	'2017-12-30'),
('Bill',	20,	3,	'2019-06-05'),
('Roger',	45,	4,	'2020-05-13'),
('Norman',	58,	4,	'2017-02-17'),
('Patrick',	33,	2,	'2017-01-06'),
('Vivian',	26,	3,	'2018-01-05'),
('Carol',	19,	3,	'2018-02-14'),
('Angelina',	42,	2,	'2018-04-29'),
('Paul',	46,	2,	'2017-01-17');

insert into SpotifyClone.artista (nome_artista)
values ('Walter Phoenix'),
  ('Freedie Shannon'),
  ('Lance Day'),
  ('Peter Strong'),
  ('Tyler Isle'),
  ('Fog');

insert into SpotifyClone.album (nome_album, artista_id, ano)
values ('Envious',	1,	1990),
  ('Exuberant',	1, 1993),
  ('Hallowed Steam', 4,	1995),
  ('Incandescent',	3,	1998),
  ('Temporary Culture',	2,	2001),
  ('Library of liberty',	2,	2003),
  ('Chained Down',	5,	2007),
  ('Cabinet of fools',	5,	2012),
  ('No guarantees',	5,	2015),
  ('Apparatus',	6,	2015);

insert into SpotifyClone.cancoes (nome_cancao, segundos, album_id)
values ("Soul For Us",	200,	1),
("Reflections Of Magic",	163,	1),
("Dance With Her Own",	116,	1),
("Troubles Of My Inner Fire",	203,	2),
("Time Fireworks",	152,	2),
("Magic Circus",	105,	3),
("Honey, So Do I",	207,	3),
("Sweetie, Let's Go Wild",	139,	3),
("She Knows",	244,	3),
("Fantasy For Me",	100,	4),
("Celebration Of More",	146,	4),
("Rock His Everything",	223,	4),
("Home Forever",	231,	4),
("Diamond Power",	241,	4),
("Let's Be Silly",	132,	4),
("Without My Streets",	176,	5),
("Words Of Her Life",	185,	5),
("Thang Of Thunder",	240,	5),
("Young And Father",	197,	6),
("Walking And Game",	123,	6),
("Without My Love",	111,	6),
("History Of My Roses",	222,	6),
("Need Of The Evening",	190,	6),
("Honey, I'm A Lone Wolf",	150,	7),
("Hard And Time",	135,	7),
("Walking And Man",	229,	7),
("Finding My Traditions",	179,	7),
("She Thinks I Won't Stay Tonight",	166,	8),
("He Heard You're Bad For Me",	154,	8),
("He Hopes We Can't Stay",	210,	8),
("I Know I Know",	117,	8),
("He's Walking Away",	159,	9),
("He's Trouble",	138,	9),
("I Heard I Want To Bo Alone",	120,	9),
("I Ride Alone",	151,	9),
("Honey",	79,	10),
("You Cheated On Me",	95,	10),
("Wouldn't It Be Nice",	213,	10),
("Baby",	136,	10),
("You Make Me Feel So..",	83,	10);


insert into SpotifyClone.data_reproducoes (usuario_id, historico_de_reproducoes, data_reproducao, cancao_id)
values (1,	"Honey",	"2020-02-28 10:45:55", 36),
(1,	"Walking And Man",	"2020-05-02 05:30:35", 26),
(1,	"Young and Father",	"2020-03-06 11:22:33", 19),
(1,	"Diamond Power",	"2020-08-05 08:05:17", 14),
(1,	"Let's Be Silly",	"2020-09-14 16:32:22", 15),
(2,	"I Heard I Want To Bo Alone",	"2020-01-02 07:40:33", 34),
(2,	"Finding My Traditions",	"2020-05-16 06:16:22", 27),
(2,	"Without My Love",	"2020-10-09 12:27:48", 21),
(2,	"Baby",	"2020-09-21 13:14:46", 39),
(3,	"Magic Circus",	"2020-11-13 16:55:13", 6),
(3,	"Dance With Her Own",	"2020-12-05 18:38:30", 3),
(3,	"Hard And Time",	"2020-07-30 10:00:00", 25),
(4,	"Reflections Of Magic",	"2021-08-15 17:10:10", 2),
(4,	"I Ride Alone",	"2021-07-10 15:20:30", 35),
(4,	"Honey, I'm A Lone Wolf",	"2021-01-09 01:44:33", 24),
(5,	"Honey, So Do I",	"2020-07-03 19:33:28", 7),
(5,	"Rock His Everything",	"2017-02-24 21:14:22", 12),
(5,	"Diamond Power",	"2020-08-06 15:23:43", 14),
(5,	"Soul For Us",	"2020-11-10 13:52:27", 1),
(6,	"Wouldn't It Be Nice",	"2019-02-07 20:33:48", 38),
(6,	"He Heard You're Bad For Me",	"2017-01-24 00:31:17", 29),
(6,	"He Hopes We Can't Stay",	"2017-10-12 12:35:20", 30),
(6,	"Walking And Game",	"2018-05-29 14:56:41", 20),
(7,	"Time Fireworks",	"2018-05-09 22:30:49", 5),
(7,	"Troubles Of My Inner Fire",	"2020-07-27 12:52:58", 4),
(7,	"Celebration Of More",	"2018-01-16 18:40:43", 11),
(8,	"He's Trouble",	"2018-03-21 16:56:40", 33),
(8,	"He's Walking Away",	"2020-10-18 13:38:05", 32),
(8,	"You Make Me Feel So..",	"2019-05-25 08:14:03", 40),
(8,	"Baby",	"2021-08-15 21:37:09", 39),
(9,	"She Knows",	"2021-05-24 17:23:45", 9),
(9,	"Thang Of Thunder",	"2018-12-07 22:48:52", 18),
(9,	"Sweetie, Let's Go Wild",	"2021-03-14 06:14:26", 8),
(9,	"Words Of Her Life",	"2020-04-01 03:36:00", 17),
(10,	"Home Forever",	"2017-02-06 08:21:34", 13),
(10,	"Rock His Everything",	"2017-12-04 05:33:43", 12),
(10,	"Without My Love",	"2017-07-27 05:24:49", 21),
(10,	"History Of My Roses",	"2017-12-25 01:03:57", 22);

insert into SpotifyClone.historial (usuario_id, artista_id, nome_artista)
values (1,	1,	"Walter Phoenix"),
(2,	2,	"Freedie Shannon"),
(3,	3,	"Lance Day"),
(4,	4,	"Peter Strong"),
(5,	5,	"Tyler Isle"),
(6,	6,	"Fog");

insert into SpotifyClone.seguindo (usuario_id, artista_id)
values (1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 3),
(6, 1),
(7, 2),
(7, 5),
(8, 1),
(8, 5),
(9, 6),
(9, 4),
(9, 3),
(10, 2),
(10, 6);