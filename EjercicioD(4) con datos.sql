CREATE database ejercicio10;
USE ejercicio10;
CREATE table cajeros(	
	codigo int,
    nom_apels VARCHAR(255),
    primary key (codigo)
);
CREATE table productos(
	codigo_producto int,
    nombre VARCHAR(100),
    precio int,
    primary key (codigo_producto)
);
CREATE table maquinas_registradoras(
	codigo_maquina int,
    piso int,
    primary key (codigo_maquina)
);
CREATE table ventas(
	codigo_cajero int,
    codigo_producto int,
    codigo_maquina int,
    foreign key (codigo_cajero) REFERENCES cajeros (codigo)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (codigo_producto) REFERENCES productos (codigo_producto)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (codigo_maquina) REFERENCES maquinas_registradoras (codigo_maquina)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (codigo_cajero, codigo_producto, codigo_maquina)
);

insert into cajeros (codigo, nom_apels) values (111, 'Jaime Hodges');
insert into cajeros (codigo, nom_apels) values (222, 'Sissie O''Glassane');
insert into cajeros (codigo, nom_apels) values (333, 'Jillian Thies');
insert into cajeros (codigo, nom_apels) values (444, 'Orelle Gatheral');
insert into cajeros (codigo, nom_apels) values (555, 'Lester Szymoni');
insert into cajeros (codigo, nom_apels) values (666, 'Dick Sans');
insert into cajeros (codigo, nom_apels) values (777, 'Brandea Stonary');
insert into cajeros (codigo, nom_apels) values (888, 'Kaye Gore');
insert into cajeros (codigo, nom_apels) values (999, 'Tobin Benbow');
insert into cajeros (codigo, nom_apels) values (101, 'Brade Cammidge');

UPDATE cajeros SET codigo = 100 WHERE codigo = 101;
SELECT * FROM cajeros;

insert into productos (codigo_producto, nombre, precio) values (1, 'Crichton Mathelon', 7);
insert into productos (codigo_producto, nombre, precio) values (2, 'Annamaria Erley', 18);
insert into productos (codigo_producto, nombre, precio) values (3, 'Cathrine Meneur', 9);
insert into productos (codigo_producto, nombre, precio) values (4, 'Farand Syms', 54);
insert into productos (codigo_producto, nombre, precio) values (5, 'Ichabod Mallinar', 47);
insert into productos (codigo_producto, nombre, precio) values (6, 'Allys Houten', 36);
insert into productos (codigo_producto, nombre, precio) values (7, 'Thatch Brixey', 56);
insert into productos (codigo_producto, nombre, precio) values (8, 'Honor Asker', 20);
insert into productos (codigo_producto, nombre, precio) values (9, 'Culley Nolder', 5);
insert into productos (codigo_producto, nombre, precio) values (10, 'Kelcy Flockhart', 38);
insert into productos (codigo_producto, nombre, precio) values (11, 'Calcio', 3);

DELETE FROM productos WHERE codigo_producto = 10;

UPDATE productos SET nombre = 'Cera depilatoria' WHERE codigo_producto = 1;
UPDATE productos SET nombre = 'Set de ambientadores' WHERE codigo_producto = 2;
UPDATE productos SET nombre = 'Crema solar' WHERE codigo_producto = 3;
UPDATE productos SET nombre = 'Pulpo cocido' WHERE codigo_producto = 4;
UPDATE productos SET nombre = 'Set colonia y desodorante' WHERE codigo_producto = 5;
UPDATE productos SET nombre = 'Maletín de maquillaje' WHERE codigo_producto = 6;
UPDATE productos SET nombre = 'Jamón ibérico en lonchas' WHERE codigo_producto = 7;
UPDATE productos SET nombre = 'Neceser Olay' WHERE codigo_producto = 8;
UPDATE productos SET nombre = 'Nutella formato ahorro' WHERE codigo_producto = 9;

SELECT * FROM productos;

insert into maquinas_registradoras (codigo_maquina, piso) values ('0090684516', 1);
insert into maquinas_registradoras (codigo_maquina, piso) values ('0044901909', 2);
insert into maquinas_registradoras (codigo_maquina, piso) values ('0027726511', 3);
insert into maquinas_registradoras (codigo_maquina, piso) values ('0066415048', 4);
insert into maquinas_registradoras (codigo_maquina, piso) values ('0028962728', 5);
insert into maquinas_registradoras (codigo_maquina, piso) values ('0037308275', 6);
insert into maquinas_registradoras (codigo_maquina, piso) values ('0046530187', 7);
insert into maquinas_registradoras (codigo_maquina, piso) values ('0069193317', 8);
insert into maquinas_registradoras (codigo_maquina, piso) values ('0052728860', 9);
insert into maquinas_registradoras (codigo_maquina, piso) values ('0082331067', 0);

SELECT * FROM maquinas_registradoras;

insert into ventas (codigo_cajero, codigo_producto, codigo_maquina) values (111, 1, '0082331067');
insert into ventas (codigo_cajero, codigo_producto, codigo_maquina) values (222, 2, '0069193317');
insert into ventas (codigo_cajero, codigo_producto, codigo_maquina) values (333, 3, '0052728860');
insert into ventas (codigo_cajero, codigo_producto, codigo_maquina) values (444, 4, '0046530187');
insert into ventas (codigo_cajero, codigo_producto, codigo_maquina) values (555, 5, '0037308275');
insert into ventas (codigo_cajero, codigo_producto, codigo_maquina) values (666, 6, '0066415048');
insert into ventas (codigo_cajero, codigo_producto, codigo_maquina) values (777, 7, '0027726511');
insert into ventas (codigo_cajero, codigo_producto, codigo_maquina) values (888, 8, '0028962728');
insert into ventas (codigo_cajero, codigo_producto, codigo_maquina) values (999, 9, '0044901909');
insert into ventas (codigo_cajero, codigo_producto, codigo_maquina) values (100, 11, '0090684516');

SELECT * FROM ventas;
