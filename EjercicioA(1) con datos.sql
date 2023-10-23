CREATE database ejercicio7;
USE ejercicio7;
CREATE table despachos(
	numero int,
    capacidad int,
    primary key (numero)
);
CREATE table directores(
	dni VARCHAR(8),
    nom_apels VARCHAR(255),
    dni_jefe VARCHAR(8),
	num_despacho int,
    primary key (dni),
    foreign key (num_despacho) REFERENCES despachos (numero)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (dni_jefe) REFERENCES directores (dni)
	ON DELETE CASCADE ON UPDATE CASCADE
);

/*Inserción de datos*/

insert into despachos (numero, capacidad) values (1, 4);
insert into despachos (numero, capacidad) values (2, 23);
insert into despachos (numero, capacidad) values (3, 27);
insert into despachos (numero, capacidad) values (4, 16);
insert into despachos (numero, capacidad) values (5, 9);
insert into despachos (numero, capacidad) values (6, 9);
insert into despachos (numero, capacidad) values (7, 17);
insert into despachos (numero, capacidad) values (8, 27);
insert into despachos (numero, capacidad) values (9, 25);
insert into despachos (numero, capacidad) values (10, 8);
insert into despachos (numero, capacidad) values (11, 4);

DELETE FROM despachos WHERE numero = 11;
UPDATE despachos SET capacidad = 15 WHERE numero = 1;

SELECT * FROM despachos;

insert into directores (dni, nom_apels, dni_jefe, num_despacho) values ('7229241K', 'Emmy Flintoff', '7229241K', 1);
insert into directores (dni, nom_apels, dni_jefe, num_despacho) values ('1839787K', 'Alanah Kunisch', '7229241K', 2);
insert into directores (dni, nom_apels, dni_jefe, num_despacho) values ('3196684L', 'Emera Ather', '2682491T', 3);
insert into directores (dni, nom_apels, dni_jefe, num_despacho) values ('4530331U', 'Bab Andrus', '7229241K', 4);
insert into directores (dni, nom_apels, dni_jefe, num_despacho) values ('2682491T', 'Flori Hansed', '2682491T', 5);
insert into directores (dni, nom_apels, dni_jefe, num_despacho) values ('9308890O', 'Maitilde Routh', '2682491T', 6);
insert into directores (dni, nom_apels, dni_jefe, num_despacho) values ('9256479P', 'Cassius Rust', '9256479P', 7);
insert into directores (dni, nom_apels, dni_jefe, num_despacho) values ('9141138A', 'Janelle Leith', '2682491T', 8);
insert into directores (dni, nom_apels, dni_jefe, num_despacho) values ('3812536X', 'Quintin Gwatkins', '9256479P', 9);
insert into directores (dni, nom_apels, dni_jefe, num_despacho) values ('1021623W', 'Sandie Francescone', '9256479P', 10);

SELECT * FROM directores;
