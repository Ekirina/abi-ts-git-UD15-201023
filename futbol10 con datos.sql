CREATE database futbol10;
USE futbol10;

CREATE table equipo(
	id_equipo int auto_increment,
    nombre varchar (50) NOT NULL,
    escudo varchar(200),
    primary key (id_equipo)
);
CREATE table persona(
	dni varchar(9),
    nombre varchar(20) NOT NULL,
    apellidos varchar(50) NOT NULL,
    primary key (dni)
);
CREATE table jugador(
	dni varchar(9),
    alineacion varchar(20) NOT NULL,
    numero int,
    id_equipo int,
    foreign key (dni) REFERENCES persona(dni)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (id_equipo) REFERENCES equipo(id_equipo)
	ON DELETE SET NULL ON UPDATE CASCADE,
    primary key (dni)
);
CREATE table entrenador(
	dni VARCHAR(9),
    rango VARCHAR(20),
    isojeador boolean,
    id_equipo int UNIQUE,
    foreign key (id_equipo) REFERENCES equipo(id_equipo),
	primary key (dni),
    foreign key (dni) REFERENCES persona(dni)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE table liga(
	id_liga int auto_increment,
    nombre VARCHAR(20) NOT NULL,
    temporada VARCHAR(9) NOT NULL,
    primary key (id_liga)
);
CREATE table partido(
	id_partido int auto_increment,
    fecha datetime NOT NULL,
    resultado VARCHAR (5),
    id_liga int,
    foreign key (id_liga) REFERENCES liga(id_liga),
    primary key(id_partido)
);
CREATE table equipo_partido(
	id_equipo1 int,
    id_equipo2 int,
    id_partido int,
    foreign key (id_equipo1) REFERENCES equipo(id_equipo)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (id_equipo2) REFERENCES equipo(id_equipo)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (id_partido) REFERENCES partido(id_partido)
    ON DELETE CASCADE ON UPDATE CASCADE
);
SELECT * FROM equipo;

/*Inserción de datos*/
insert into equipo (id_equipo, nombre, escudo) VALUES (1, 'FC Augsburgo', 'https://assets-es.imgfoot.com/media/cache/60x60/club/augsbourg.png'),
													(2, 'Bayern de Múnich', 'https://assets-es.imgfoot.com/media/cache/60x60/club/bayern-munich.png'),
                                                    (3, 'Stuttgart', 'https://assets-es.imgfoot.com/media/cache/60x60/club/vfb-stuttgart-3245013313760848492.png'),
                                                    (4, 'Polvorín', 'https://assets-es.imgfoot.com/media/cache/60x60/club/polvorin.png'),
                                                    (5, 'Pisa', 'https://assets-es.imgfoot.com/media/cache/60x60/pise-6117eda218839.png'),
                                                    (6, 'Real Sociedad', 'https://assets-es.imgfoot.com/media/cache/60x60/club/real-sociedad.png'),
                                                    (7, 'Arsenal', 'https://assets-es.imgfoot.com/media/cache/60x60/arsenal-660.png'),
                                                    (8, 'Fulham', 'https://assets-es.imgfoot.com/media/cache/60x60/club/fulham.png'),
                                                    (9, 'Chelsea', 'https://assets-es.imgfoot.com/media/cache/60x60/club/chelsea-fc.png'),
                                                    (10, 'Valencia', 'https://assets-es.imgfoot.com/media/cache/60x60/club/valence.png'),
                                                    (11, 'Inter de Milán', 'https://assets-es.imgfoot.com/media/cache/60x60/inter-milan.png'),
                                                    (12, 'Roma', 'https://assets-es.imgfoot.com/media/cache/60x60/club/as-rome.png'),
                                                    (13, 'Tarragona', 'https://assets-es.imgfoot.com/media/cache/60x60/club/gimnastic-tarragone.png'),
                                                    (14, 'Como', 'https://assets-es.imgfoot.com/media/cache/60x60/como.png'),
                                                    (15, 'Leicester', 'https://assets-es.imgfoot.com/media/cache/60x60/club/leicester-city-fc.png');
SELECT * FROM equipo;

insert into persona (dni, nombre, apellidos) values ('55328590E', 'Lawry', 'Bodycomb Fynn');
insert into persona (dni, nombre, apellidos) values ('20179345S', 'Averil', 'Shawl Domaschke');
insert into persona (dni, nombre, apellidos) values ('22713840S', 'Yehudi', 'Kew Tutton');
insert into persona (dni, nombre, apellidos) values ('48696055L', 'Bax', 'Dimitrov Bonsey');
insert into persona (dni, nombre, apellidos) values ('12187274A', 'Morgun', 'Shoesmith Housaman');
insert into persona (dni, nombre, apellidos) values ('23217086V', 'Sal', 'Slater Lemmertz');
insert into persona (dni, nombre, apellidos) values ('94648424V', 'Thacher', 'Fley McGlashan');
insert into persona (dni, nombre, apellidos) values ('46951783C', 'Leonid', 'Ferran Shallcrass');
insert into persona (dni, nombre, apellidos) values ('75139905X', 'Mendie', 'Jaqueminet Duiged');
insert into persona (dni, nombre, apellidos) values ('44017055B', 'Fonzie', 'Camplen Eddis');
insert into persona (dni, nombre, apellidos) values ('73616934R', 'Terri', 'Episcopi Lendrem');
insert into persona (dni, nombre, apellidos) values ('35920031A', 'Webb', 'Kunzel Gowler');
insert into persona (dni, nombre, apellidos) values ('41540318Q', 'Vern', 'Castro Pochet');
insert into persona (dni, nombre, apellidos) values ('19050534W', 'Corby', 'Foister Pieters');
insert into persona (dni, nombre, apellidos) values ('65797029M', 'Aubert', 'Ghidini Frankowski');
insert into persona (dni, nombre, apellidos) values ('65738278C', 'Horace', 'MacGaughey Dondon');
insert into persona (dni, nombre, apellidos) values ('59067142Z', 'Hobard', 'Extil Chicchelli');
insert into persona (dni, nombre, apellidos) values ('90513922R', 'Westbrook', 'Clifford Gaudin');
insert into persona (dni, nombre, apellidos) values ('60412871U', 'Roberto', 'Blaxill Kulicke');
insert into persona (dni, nombre, apellidos) values ('47922549J', 'Angeli', 'Moniker Houltham');

UPDATE persona SET nombre = 'Martin' WHERE dni = '35920031A';
SELECT * FROM persona;

insert into jugador (dni, alineacion, numero, id_equipo) values ('35920031A', 'portero', 21, 1);
insert into jugador (dni, alineacion, numero, id_equipo) values ('65797029M', 'centrocampista', 68, 2);
insert into jugador (dni, alineacion, numero, id_equipo) values ('46951783C', 'delantero', 20, 3);
insert into jugador (dni, alineacion, numero, id_equipo) values ('48696055L', 'portero', 22, 4);
insert into jugador (dni, alineacion, numero, id_equipo) values ('94648424V', 'delantero', 67, 14);
insert into jugador (dni, alineacion, numero, id_equipo) values ('55328590E', 'centrocampista', 70, 6);
insert into jugador (dni, alineacion, numero, id_equipo) values ('90513922R', 'defensa', 16, 7);
insert into jugador (dni, alineacion, numero, id_equipo) values ('60412871U', 'centrocampista', 58, 13);
insert into jugador (dni, alineacion, numero, id_equipo) values ('47922549J', 'delantero', 52, 9);
insert into jugador (dni, alineacion, numero, id_equipo) values ('75139905X', 'portero', 1, 10);
insert into jugador (dni, alineacion, numero, id_equipo) values ('20179345S', 'delantero', 37, 6);
insert into jugador (dni, alineacion, numero, id_equipo) values ('59067142Z', 'defensa', 32, 6);
insert into jugador (dni, alineacion, numero, id_equipo) values ('65738278C', 'defensa', 69, 11);
insert into jugador (dni, alineacion, numero, id_equipo) values ('44017055B', 'defensa', 94, 4);
insert into jugador (dni, alineacion, numero, id_equipo) values ('41540318Q', 'delantero', 96, 5);

insert into entrenador (dni, rango, isojeador, id_equipo) values ('22713840S', 'C', false, 1);
insert into entrenador (dni, rango, isojeador, id_equipo) values ('12187274A', 'B', true, 6);
insert into entrenador (dni, rango, isojeador, id_equipo) values ('23217086V', 'Pro', false, 10);
insert into entrenador (dni, rango, isojeador, id_equipo) values ('73616934R', 'A', true, 2);
insert into entrenador (dni, rango, isojeador, id_equipo) values ('19050534W', 'B', true, 8);

insert into liga (id_liga, nombre, temporada) values (1, 'EA Sports', '2023-2024');
insert into liga (id_liga, nombre, temporada) values (2, 'Hypermotion', '2023-2024');
insert into liga (id_liga, nombre, temporada) values (3, 'Premier League', '2021-2022');
insert into liga (id_liga, nombre, temporada) values (4, 'Bundesliga', '2021-2022');
insert into liga (id_liga, nombre, temporada) values (5, 'Serie A', '2019-2020');
insert into liga (id_liga, nombre, temporada) values (6, 'Serie B', '2020-2021');
insert into liga (id_liga, nombre, temporada) values (7, '2. Bundesliga', '20020-2021');
insert into liga (id_liga, nombre, temporada) values (8, 'EFL Championship', '2021-2022');
insert into liga (id_liga, nombre, temporada) values (9, 'EFL League One', '2023-2024');
insert into liga (id_liga, nombre, temporada) values (10, 'RFEF 3', '2023-2024');

SELECT * FROM liga;

insert into partido (id_partido, fecha, resultado, id_liga) values (1, '2022-06-20 18:00:40', '5-3', 6);
insert into partido (id_partido, fecha, resultado, id_liga) values (2, '2022-07-19 20:15:37', '3-1', 6);
insert into partido (id_partido, fecha, resultado, id_liga) values (3, '2022-06-11 23:32:42', '6-4', 2);
insert into partido (id_partido, fecha, resultado, id_liga) values (4, '2022-08-29 22:16:11', '2-0', 3);
insert into partido (id_partido, fecha, resultado, id_liga) values (5, '2022-07-06 23:00:10', '3-0', 4);
insert into partido (id_partido, fecha, resultado, id_liga) values (6, '2022-09-03 16:19:04', '1-3', 4);
insert into partido (id_partido, fecha, resultado, id_liga) values (7, '2022-08-17 15:36:13', '6-5', 1);
insert into partido (id_partido, fecha, resultado, id_liga) values (8, '2022-07-03 17:05:25', '4-2', 1);
insert into partido (id_partido, fecha, resultado, id_liga) values (9, '2022-06-05 19:45:53', '1-4', 2);
insert into partido (id_partido, fecha, resultado, id_liga) values (10, '2022-06-04 17:16:06', '3-3', 3);


UPDATE partido SET fecha = '2022-01-19 20:15:37' WHERE id_partido = 2;
UPDATE partido SET fecha = '2022-03-29 22:16:11' WHERE id_partido = 4;
UPDATE partido SET fecha = '2022-09-13 16:19:04' WHERE id_partido = 6;
UPDATE partido SET fecha = '2022-12-17 15:36:13' WHERE id_partido = 7;
UPDATE partido SET fecha = '2022-05-05 19:45:53' WHERE id_partido = 9;

SELECT * FROM partido;
insert into equipo_partido (id_equipo1, id_equipo2, id_partido) values (14, 5, 1);
insert into equipo_partido (id_equipo1, id_equipo2, id_partido) values (5, 14, 2);
insert into equipo_partido (id_equipo1, id_equipo2, id_partido) values (13, 4, 3);
insert into equipo_partido (id_equipo1, id_equipo2, id_partido) values (7, 9, 4);
insert into equipo_partido (id_equipo1, id_equipo2, id_partido) values (3, 2, 5);
insert into equipo_partido (id_equipo1, id_equipo2, id_partido) values (2, 1, 6);
insert into equipo_partido (id_equipo1, id_equipo2, id_partido) values (10, 6, 7);
insert into equipo_partido (id_equipo1, id_equipo2, id_partido) values (6, 10, 8);
insert into equipo_partido (id_equipo1, id_equipo2, id_partido) values (4, 13, 9);
insert into equipo_partido (id_equipo1, id_equipo2, id_partido) values (9, 7, 10);

SELECT * FROM equipo_partido;

SELECT ep.id_equipo1, ep.id_equipo2, ep.id_partido, p.resultado, p.fecha FROM 
equipo_partido AS ep, partido AS p 
WHERE p.id_partido = ep.id_partido;


SHOW FULL TABLES FROM futbol10;

