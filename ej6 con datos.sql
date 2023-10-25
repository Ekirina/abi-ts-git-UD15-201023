drop database if exists biblioteca6;
CREATE database biblioteca6;
USE biblioteca6;

CREATE table autor(
	id_autor int auto_increment,
    nombre VARCHAR(20),
    primary key (id_autor)
);

CREATE table articulo(
	id int auto_increment,
    nombre VARCHAR(50),
    resumen text,
    anyo VARCHAR(4),
    pais VARCHAR(20),
    deteriorado boolean,
    comentario_deteriorado VARCHAR(300),
    primary key (id)
);

CREATE table socio(
	codigo int auto_increment,
    dni VARCHAR(9),
    nombre VARCHAR(20),
    apellidos VARCHAR(40),
    direccion VARCHAR(40),
    primary key (codigo)
);

CREATE table telefono(
	num_telefono VARCHAR(20),
    codigo_socio int,
    foreign key (codigo_socio) REFERENCES socio (codigo)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (num_telefono)
);

CREATE table libro(
	id int,
    num_pagina int,
    foreign key (id) REFERENCES articulo (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id)    
);

CREATE table pelicula(
	id int,
    duracion int,
    foreign key (id) REFERENCES articulo (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id)
);

CREATE table cd(
	id int,
    num_canciones int,
    foreign key (id) REFERENCES articulo (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id)
);

CREATE table autor_articulo(
	id int,
    id_autor int,
    foreign key (id) REFERENCES articulo (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (id_autor) REFERENCES autor (id_autor)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id, id_autor)
);	

CREATE table articulo_socio(
	codigo int,
    id int,
    fecha_inicio date,
    fecha_limite date,
    fecha_entrega date,
    foreign key (codigo) REFERENCES socio (codigo)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (id) REFERENCES articulo (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (codigo, id)
);

insert into autor(nombre) values('Charles Wukowski');
insert into autor(nombre) values('J.R.R.Tolkien');
insert into autor(nombre) values('J.K.Rowling');
insert into autor(nombre) values('Echiro Oda');
insert into autor(nombre) values('Melendi');
insert into autor(nombre) values('Bruno Mars');
insert into autor(nombre) values('Aitana');
insert into autor(nombre) values('James Cameron');
insert into autor(nombre) values('Martin Scorsese');
insert into autor(nombre) values('Christofer Nolan');

insert into articulo(nombre, resumen, anyo, pais, deteriorado, comentario_deteriorado) values("Manolito Gafotas", 'Manolito Gafotas, como lo conocen todos en su barrio de Carabanchel (Alto), es un niño dicharachero que vive con sus padres, su abuelo Nicolás y su hermano pequeño, el Imbécil, y que siempre está dispuesto a contar su visión de las cosas', 1999, 'España', true, 'tiene la tapa desgastada');
insert into articulo(nombre, resumen, anyo, pais, deteriorado, comentario_deteriorado) values("El señor de los anillos", 'En la adormecida e idílica Comarca, un joven hobbit recibe un encargo: custodiar el Anillo Único y emprender el viaje para su destrucción en la Grieta del Destino. Acompañado por magos, hombres, elfos y enanos, atravesará la Tierra Media y se internará en las sombras de Mordor, perseguido siempre por las huestes de Sauron, el Señor Oscuro, dispuesto a recuperar su creación para establecer el dominio definitivo del Mal.', 1954, 'Reino Unido', false, 'perfecto estado');
insert into articulo(nombre, resumen, anyo, pais, deteriorado, comentario_deteriorado) values("Harry Potter", 'Harry Potter se ha quedado huérfano y vive en casa de sus abominables tíos y el insoportable primo Dudley. Harry se siente muy triste y solo, hasta que un buen día recibe una carta que cambiará su vida para siempre. En ella le comunican que ha sido aceptado como alumno en el Colegio Hogwarts de Magia.', 1997, 'Reino Unido', false, 'perfecto estado');
insert into articulo(nombre, resumen, anyo, pais, deteriorado, comentario_deteriorado) values("One piece vol.1", 'One Piece narra la historia de un joven llamado Monkey D. Luffy, que inspirado por su amigo pirata Shanks, comienza un viaje para alcanzar su sueño, ser el Rey de los piratas, para lo cual deberá encontrar el tesoro One Piece dejado por el anterior rey de los piratas Gol D. Roger.', 1997, 'Japón', false, 'perfecto estado');
insert into articulo(nombre, resumen, anyo, pais, deteriorado, comentario_deteriorado) values('Que el cielo espere sentao', '1-Caminando por la vida 2-Billy el pistolero 3-Como dijo el rey 4-Con tanto héroe 5-Novia a la Fuga 6-Con solo una sonrisa 7-Hasta que la muerte los separe 8-Como se bailaban los tangos 9-Cuestion de prioridades 10-Con tu amor es suficiente 11-Cannabies 12-Que el cielo espere sentado', 2005, 'España', true, 'tiene la tapa desgastada');
insert into articulo(nombre, resumen, anyo, pais, deteriorado, comentario_deteriorado) values('Unorthodox Jukebox', '1-Tresaure 2-When i was your man 3-Locked out of heaven 4-Natalie 5-Show me 6-Young girls 7-Moonshine 8-if I knew 9-Money make her smile 10-Gorilla', 2012, 'EE.UU', true, 'tiene la tapa desgastada');
insert into articulo(nombre, resumen, anyo, pais, deteriorado, comentario_deteriorado) values('11 razones', '1-Menos 2-Más 3-Estupidez 4-Corazón sin vida 5-Cuando te fuiste 6-No te has ido y ya te extraño 7-Igual 8-Si no vas a volver 9-Por 10-Dividido 11-11 razones', 2020, 'España', true, 'tiene la tapa desgastada');
insert into articulo(nombre, resumen, anyo, pais, deteriorado, comentario_deteriorado) values('Avatar', 'Entramos en el mundo Avatar de la mano de Jake Sully, un ex-Marine en silla de ruedas, que ha sido reclutado para viajar a Pandora, donde existe un mineral raro y muy preciado que puede solucionar la crisis energética existente en la Tierra.', 2009, 'EE.UU', false, 'perfecto estado');
insert into articulo(nombre, resumen, anyo, pais, deteriorado, comentario_deteriorado) values('Taxi driver', 'Para sobrellevar el insomnio crónico que sufre desde su regreso de Vietnam, Travis Bickle trabaja como taxista nocturno en Nueva York.', 1976, 'EE.UU', true, 'tiene la tapa desgastada');
insert into articulo(nombre, resumen, anyo, pais, deteriorado, comentario_deteriorado) values('The dark knight', 'Con la ayuda del teniente Jim Gordon y del Fiscal del Distrito Harvey Dent, Batman mantiene a raya el crimen organizado en Gotham. Todo cambia cuando aparece el Joker, un nuevo criminal que desencadena el caos y tiene aterrados a los ciudadanos.', 2008, 'EE.UU', true, 'tiene la tapa desgastada');

insert into socio (dni, nombre, apellidos, direccion) values ('90684331T', 'Emmery', 'Naul', '5 Hazelcrest Center');
insert into socio (dni, nombre, apellidos, direccion) values ('98865762A', 'Delly', 'Minor', '682 Iowa Way');
insert into socio (dni, nombre, apellidos, direccion) values ('56151381F', 'Lucius', 'Tuohy', '06025 Goodland Park');
insert into socio (dni, nombre, apellidos, direccion) values ('13827684S', 'Kora', 'Caccavale', '5 Ridge Oak Road');
insert into socio (dni, nombre, apellidos, direccion) values ('85086809R', 'Brittney', 'MacVay', '0310 Steensland Street');
insert into socio (dni, nombre, apellidos, direccion) values ('41297475G', 'Grace', 'Osgodby', '932 3rd Park');
insert into socio (dni, nombre, apellidos, direccion) values ('21422242H', 'Ulrikaumeko', 'De Witt', '0 Dapin Drive');
insert into socio (dni, nombre, apellidos, direccion) values ('62597423J', 'Gayleen', 'Stepney', '94156 Fair Oaks Terrace');
insert into socio (dni, nombre, apellidos, direccion) values ('12117711L', 'Kristopher', 'Valentine', '0 7th Road');
insert into socio (dni, nombre, apellidos, direccion) values ('15797316K', 'Artur', 'Toffoloni', '088 Superior Circle');


insert into telefono (num_telefono, codigo_socio) values (373703280, 1);
insert into telefono (num_telefono, codigo_socio) values (428143804, 2);
insert into telefono (num_telefono, codigo_socio) values (432118543, 3);
insert into telefono (num_telefono, codigo_socio) values (833295530, 4);
insert into telefono (num_telefono, codigo_socio) values (547191074, 5);
insert into telefono (num_telefono, codigo_socio) values (222941021, 6);
insert into telefono (num_telefono, codigo_socio) values (547205275, 7);
insert into telefono (num_telefono, codigo_socio) values (215639048, 8);
insert into telefono (num_telefono, codigo_socio) values (436174471, 9);
insert into telefono (num_telefono, codigo_socio) values (204949408, 10);

insert into libro values (1, 192);
insert into libro values (2, 576);
insert into libro values (3, 256);
insert into libro values (4, 216);

insert into pelicula values(5,161);
insert into pelicula values(6,114);
insert into pelicula values(7,152);

insert into cd values(8, 12);
insert into cd values(9, 10);
insert into cd values(10, 11);

insert into autor_articulo values(1,1);
insert into autor_articulo values(2,2);
insert into autor_articulo values(3,3);
insert into autor_articulo values(4,4);
insert into autor_articulo values(5,5);
insert into autor_articulo values(6,6);
insert into autor_articulo values(7,7);
insert into autor_articulo values(8,8);
insert into autor_articulo values(9,9);
insert into autor_articulo values(10,10);

insert into articulo_socio values (1,2,20230102,20230202,20230201);
insert into articulo_socio values (2,4,20230312,20230412,20230412);
insert into articulo_socio values (3,6,20230502,20230602,20230601);
insert into articulo_socio values (4,8,20230925,20231025,null);
insert into articulo_socio values (5,10,20230622,20230722,20230625);
insert into articulo_socio values (6,9,20230813,20230913,20230910);
insert into articulo_socio values (7,7,20230202,20230302,20230301);
insert into articulo_socio values (8,5,20230302,20230402,20230401);
insert into articulo_socio values (9,3,20230402,20230502,20230501);
insert into articulo_socio values (10,1,20230502,20230602,20230601);

select * from autor;
select * from articulo;
select * from cd;
select * from libro;
select * from pelicula;
select * from socio;

delete from socio where codigo = 10;

select * from articulo_socio;

update socio set apellidos = "Malfoy" where codigo = 3;

select * from socio where nombre = "Lucius";