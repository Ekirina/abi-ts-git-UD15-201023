CREATE database capital3;
USE capital3;

CREATE table comunidad_autonoma(
	nombre VARCHAR(20) NOT NULL,
    poblacion int NOT NULL,
    superficie double NOT NULL,
	primary key (nombre)
    );    
CREATE table provincia(
	codigo_postal int,
    nombre VARCHAR (20) NOT NULL,
    poblacion int NOT NULL,
    superficie double NOT NULL,
    nombre_comunidad VARCHAR (20),
    foreign key (nombre_comunidad) REFERENCES comunidad_autonoma (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (codigo_postal)
	);
CREATE table localidad(
    nombre VARCHAR(30),
    poblacion int NOT NULL,
    codigo_postal int NOT NULL,
    cod_provincia_capital int UNIQUE,
    nombre_comunidad VARCHAR (20) UNIQUE,
	primary key (nombre),
    foreign key (codigo_postal) REFERENCES provincia(codigo_postal)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (cod_provincia_capital) REFERENCES provincia (codigo_postal)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (nombre_comunidad) REFERENCES comunidad_autonoma (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE
    );

/*Inserción de datos*/
insert into comunidad_autonoma (nombre, poblacion, superficie) values ('Andalucía', '8500187', '87599'),
																	('Cataluña', '7792611', '32113'),
                                                                    ('Comunidad de Madrid', '6750336', '8028'),
																	('Galicia', '2690464', '29575'),
                                                                    ('Castilla y León', '2372640', '94224'),
																	('País Vasco', '2208174', '7234'),
                                                                    ('Aragón', '1326315', '47720'),
																	('Extremadura', '1054776', '41634'),
                                                                    ('Cantabria', '585402', '5321'),
																	('La Rioja', '319892', '5045');
                                                                    
insert into provincia (codigo_postal, nombre, poblacion, superficie, nombre_comunidad) values (08, 'Barcelona', '5704697', '7726.36', 'Cataluña'),
																										(14, 'Córdoba', '781451', '13771', 'Andalucia'),
                                                                                                        (20, 'Guipúzcoa', '726033', '1997', 'País Vasco'),
																										(22, 'Huesca', '225456 ', '15626', 'Aragón'),
                                                                                                        (26, 'La Rioja', '319485', '5045', 'La Rioja'),
																										(28, 'Madrid', '6751251', '8028', 'Comunidad de Madrid'),
                                                                                                        (39, 'Cantabria', '585222', '5321', 'Cantabria'),
																										(47, 'Valladolid', '519361', '8111', 'Castilla y León'),
                                                                                                        (27, 'Lugo', '326013', '9856', 'Galicia'),
																										(10, 'Cáceres', '389558', '19868', 'Extremadura');
                                                                                                        

insert into localidad (nombre, poblacion, codigo_postal, cod_provincia_capital, nombre_comunidad) values ('Rincón de Soto', 3942, 26678, 26, 'La Rioja'),
																										('Logroño', 150020, 26786, 26, 'La Rioja'),
																										('Córdoba', 319515, 14098, 14, 'Córdoba'),
																										('Lamasón', 258, 39654, 39, 'Cantabria'),
																										('Aceituna', 588, 10324, 10, 'Cáceres'),
																										('Castejón de Sos', 805, 22878, 22, 'Huesca'),
																										('San Sebastián', 187849, 20098, 20, 'Guipúzcoa'),
																										('Fuenterrabía', 16904, 20897, 20, 'Guipúzcoa'),
																										('Lugo', 97211, 27980, 27, 'Lugo'),
																										('Madrid', 3280782, 28765, 28, 'Comunidad de Madrid');
SELECT * FROM provincia;