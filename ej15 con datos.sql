CREATE database menu15;
USE menu15;
CREATE table menu(
	id int auto_increment,
    num_comensales int, 
    primary key (id)
);
CREATE table plato(
	nombre VARCHAR(20),
    descripcion VARCHAR (300),
    tipo VARCHAR(20),
    primary key (nombre)
);
CREATE table dia(
	fecha date,
    temperatura VARCHAR(20),
    primary key (fecha)
);
CREATE table menu_plato_dia(
	id_menu int,
    fecha date,
    nombre VARCHAR(20),
    cantidad int,
    exitoso VARCHAR(20),
    foreign key (id_menu) REFERENCES menu (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (fecha) REFERENCES dia (fecha)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (nombre) REFERENCES plato (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id_menu, fecha, nombre)
);

/*Inserción de datos*/
insert into menu (id, num_comensales) values (1, 7),
											 (2, 5),
                                             (3, 9),
											 (4, 3),
                                             (5, 8),
											 (6, 2),
                                             (7, 7),
											 (8, 6),
                                             (9, 3),
											 (10, 7);
insert into plato (nombre, descripcion, tipo) values ('Delicias terrarias', 'Lentejas pardina cocidas junto a granos de arroz del mediterráneo y verduras salteadas', 'Vegetariano'),
													('A la vieja escuela', 'Bocadillo de chocolate acompañado de variedad de frutos secos de la temporada', 'Postre'),
                                                    ('Con cucurucho', 'Helado de vainilla hecho con soja y virutas de chocolate con frutos rojos', 'Postre'),
													('BBQ', 'Costillas de cerdo embalsamadas con salsa barbacoa casera y cocidas al horno con acompañamiento de patatas asadas', 'Carne'),
                                                    ('Lluvia de colores', 'Verduritas salteadas y aliñadas con aceite de oliva y albahaca', 'Vegetariano'),
													('Estrellados', 'Huevos estrellados con tocino frito y patatas fritas', 'Carne'),
                                                    ('Ponyo ponyo', 'Sandwitch de salmón vegetal acompañado de salsa mayonesa casera', 'Pescado'),
													('Guau guau', 'Perrito caliente con frankfurt al estilo viena y salsa mayonesa casera', 'Carne'),
                                                    ('Tocado y hundido', 'Pulpo a la gallega con pimentón rojo dulce', 'Pescado'),
													('Jerry', 'Fondie de cinco quesos de origen francés', 'Vegetariano');
												
insert into dia (fecha, temperatura) values ('2022-04-02', 'Viento fuerte, 24º'),
											('2022-04-25', 'Lluvia débil, 20º'),
                                            ('2022-08-18', 'Oleada de calor, 39º'),
											('2022-09-10', 'Sol, 24º'),
                                            ('2022-12-18', 'Lluvia débil, 18º'),
											('2022-01-24', 'Nieve, 2º'),
                                            ('2022-12-05', 'Sol, 15º'),
											('2022-03-13', 'Sol, 23º'),
                                            ('2022-02-07', 'Viento fuerte, 12º'),
											('2022-10-19', 'Fuerte lluvia, 16º');
						
SELECT * FROM plato;

insert into menu_plato_dia (id_menu, fecha, nombre, cantidad, exitoso) values (1, '2022-01-24', 'BBQ', 20, 'BBQ'),
																				(2, '2022-02-07', 'Tocado y hundido', 25, 'Tocado y hundido'),
                                                                                (3, '2022-03-13', 'Delicias terrarias', 17, 'BBQ'),
																				(4, '2022-04-02', 'Lluvia de colores', 15, 'A la vieja escuela'),
                                                                                (5, '2022-04-25', 'A la vieja escuela', 35, 'Ponyo ponyo'),
																				(6, '2022-08-18', 'Con cucurucho', 35, 'Con cucurucho'),
                                                                                (7, '2022-09-10', 'Ponyo ponyo', 21, 'Guau guau'),
																				(8, '2022-10-19', 'Estrellados', 29, 'BBQ'),
                                                                                (9, '2022-12-05', 'Guau guau', 26, 'A la vieja escuela'),
																				(10, '2022-12-18', 'Jerry', 19, 'Tocado y hundido');

                      
UPDATE menu_plato_dia set exitoso = 'Lluvia de colores' WHERE
id_menu = 3;
UPDATE menu_plato_dia set exitoso = 'Delicias terrarias' WHERE
id_menu = 8;   

SELECT * FROM menu_plato_dia;                                          