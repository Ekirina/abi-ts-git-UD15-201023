create database proyecto12;
use proyecto12;

create table Empresa(
cod_interno int auto_increment primary key,
CIF varchar(9),
nombre varchar(40),
direccion varchar(60),
telefono varchar(9)
);

create table Proyecto(
id int auto_increment primary key,
fecha_inicio date,
fecha_prevista date,
fecha_final date,
cod_empresa int,
foreign key (cod_empresa) references Empresa(cod_interno)
on delete cascade on update cascade

);

create table Trabajador(
cod_trabajador int auto_increment primary key,
nombre varchar(40),
apellido varchar(80),
dni varchar(9)
);

create table Profesion(
cod_profesion int auto_increment primary key,
nombre varchar(40)
);

create table proyecto_profesion_trabajo(
id_proyecto int,
cod_trabajador int,
cod_profesion int,
primary key (id_proyecto, cod_trabajador, cod_profesion),
foreign key (id_proyecto) references Proyecto(id)
on delete cascade on update cascade,
foreign key (cod_trabajador) references Trabajador(cod_trabajador)
on delete cascade on update cascade,
foreign key (cod_profesion) references Profesion(cod_profesion)
on delete cascade on update cascade

);

/*Inserción de datos*/

insert into Empresa (cod_interno, CIF, nombre, direccion, telefono) values (1, 'H07886292', 'Weissnat-Von', '954 Gina Parkway', '698552781');
insert into Empresa (cod_interno, CIF, nombre, direccion, telefono) values (2, 'J74522847', 'Mann-Feeney', '42 Debra Point', '625657413');
insert into Empresa (cod_interno, CIF, nombre, direccion, telefono) values (3, 'O97400601', 'Schmeler LLC', '0371 Lien Terrace', '610975426');
insert into Empresa (cod_interno, CIF, nombre, direccion, telefono) values (4, 'P85791990', 'Thompson-Collier', '157 Melody Trail', '697394953');
insert into Empresa (cod_interno, CIF, nombre, direccion, telefono) values (5, 'L54835282', 'Bergnaum-Beier', '539 4th Crossing', '600568625');
insert into Empresa (cod_interno, CIF, nombre, direccion, telefono) values (6, 'K62561706', 'Franecki-Anderson', '725 Aberg Plaza', '657599114');
insert into Empresa (cod_interno, CIF, nombre, direccion, telefono) values (7, 'P47824610', 'Moore, Hirthe and Casper', '9162 Gale Park', '671319540');
insert into Empresa (cod_interno, CIF, nombre, direccion, telefono) values (8, 'U82830121', 'Casper-Klein', '83 Fair Oaks Way', '618428812');
insert into Empresa (cod_interno, CIF, nombre, direccion, telefono) values (9, 'E35171020', 'Hane, Blick and Cartwright', '349 Fairview Point', '627800846');
insert into Empresa (cod_interno, CIF, nombre, direccion, telefono) values (10, 'T94436544', 'Wilkinson-Walter', '40853 Pearson Terrace', '602237716');

SELECT * FROM Empresa;

insert into Proyecto (id, fecha_inicio, fecha_prevista, fecha_final, cod_empresa) values (1, '2023-06-17', '2023-08-24', '2023-08-25', 1);
insert into Proyecto (id, fecha_inicio, fecha_prevista, fecha_final, cod_empresa) values (2, '2022-05-09', '2022-07-15', '2022-07-07', 2);
insert into Proyecto (id, fecha_inicio, fecha_prevista, fecha_final, cod_empresa) values (3, '2022-07-14', '2022-12-27', '2022-12-20', 3);
insert into Proyecto (id, fecha_inicio, fecha_prevista, fecha_final, cod_empresa) values (4, '2022-03-23', '2022-12-26', '2023-01-11', 4);
insert into Proyecto (id, fecha_inicio, fecha_prevista, fecha_final, cod_empresa) values (5, '2022-08-16', '2022-12-05', '2022-12-05', 5);
insert into Proyecto (id, fecha_inicio, fecha_prevista, fecha_final, cod_empresa) values (6, '2022-08-10', '2022-12-29', '2023-01-20', 6);
insert into Proyecto (id, fecha_inicio, fecha_prevista, fecha_final, cod_empresa) values (7, '2022-08-02', '2022-12-23', '2023-01-21', 7);
insert into Proyecto (id, fecha_inicio, fecha_prevista, fecha_final, cod_empresa) values (8, '2023-08-20', '2023-11-04', '2023-11-28', 8);
insert into Proyecto (id, fecha_inicio, fecha_prevista, fecha_final, cod_empresa) values (9, '2022-01-09', '2022-12-23', '2023-01-25', 9);
insert into Proyecto (id, fecha_inicio, fecha_prevista, fecha_final, cod_empresa) values (10, '2023-06-01', '2023-10-25', '2023-10-11', 10);

UPDATE Proyecto SET fecha_inicio = '2023-06-21' WHERE id = 10;
SELECT * FROM Proyecto;

insert into Trabajador (cod_trabajador, nombre, apellido, dni) values (1, 'Rosy', 'Rabbitt', '29286488P');
insert into Trabajador (cod_trabajador, nombre, apellido, dni) values (2, 'Germayne', 'Heaphy', '86003816T');
insert into Trabajador (cod_trabajador, nombre, apellido, dni) values (3, 'Virginia', 'Lippett', '71863408U');
insert into Trabajador (cod_trabajador, nombre, apellido, dni) values (4, 'Flori', 'Iashvili', '44072920L');
insert into Trabajador (cod_trabajador, nombre, apellido, dni) values (5, 'Inigo', 'Gabbot', '81539280U');
insert into Trabajador (cod_trabajador, nombre, apellido, dni) values (6, 'Cayla', 'Lowthian', '68788956T');
insert into Trabajador (cod_trabajador, nombre, apellido, dni) values (7, 'Orel', 'Harridge', '45043994S');
insert into Trabajador (cod_trabajador, nombre, apellido, dni) values (8, 'Eldon', 'Linner', '72526318A');
insert into Trabajador (cod_trabajador, nombre, apellido, dni) values (9, 'Rozella', 'Horbath', '30998601E');
insert into Trabajador (cod_trabajador, nombre, apellido, dni) values (10, 'Mandel', 'Arnhold', '31725944B');
insert into Trabajador (cod_trabajador, nombre, apellido, dni) values (11, 'Mandel', 'Arnhold', '31725944B');

DELETE FROM Trabajador WHERE cod_trabajador = 11;

insert into Profesion (cod_profesion, nombre) values (1, 'General Manager');
insert into Profesion (cod_profesion, nombre) values (2, 'Mechanical Systems Engineer');
insert into Profesion (cod_profesion, nombre) values (3, 'Database Administrator IV');
insert into Profesion (cod_profesion, nombre) values (4, 'Paralegal');
insert into Profesion (cod_profesion, nombre) values (5, 'Office Assistant III');
insert into Profesion (cod_profesion, nombre) values (6, 'Marketing Assistant');
insert into Profesion (cod_profesion, nombre) values (7, 'Actuary');
insert into Profesion (cod_profesion, nombre) values (8, 'Editor');
insert into Profesion (cod_profesion, nombre) values (9, 'Dental Hygienist');
insert into Profesion (cod_profesion, nombre) values (10, 'Product Engineer'); 

insert into proyecto_profesion_trabajo (id_proyecto, cod_trabajador, cod_profesion) values (1, 9, 5);
insert into proyecto_profesion_trabajo (id_proyecto, cod_trabajador, cod_profesion) values (2, 5, 10);
insert into proyecto_profesion_trabajo (id_proyecto, cod_trabajador, cod_profesion) values (3, 7, 7);
insert into proyecto_profesion_trabajo (id_proyecto, cod_trabajador, cod_profesion) values (4, 8, 2);
insert into proyecto_profesion_trabajo (id_proyecto, cod_trabajador, cod_profesion) values (5, 8, 6);
insert into proyecto_profesion_trabajo (id_proyecto, cod_trabajador, cod_profesion) values (6, 3, 1);
insert into proyecto_profesion_trabajo (id_proyecto, cod_trabajador, cod_profesion) values (7, 4, 4);
insert into proyecto_profesion_trabajo (id_proyecto, cod_trabajador, cod_profesion) values (8, 10, 4);
insert into proyecto_profesion_trabajo (id_proyecto, cod_trabajador, cod_profesion) values (9, 7, 1);
insert into proyecto_profesion_trabajo (id_proyecto, cod_trabajador, cod_profesion) values (10, 5, 6);